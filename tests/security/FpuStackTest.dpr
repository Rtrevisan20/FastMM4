program FpuStackTest;

{$IFDEF FPC}
  {$MODE DELPHI}
  {$ASMMODE INTEL}
{$ENDIF}
{$APPTYPE CONSOLE}

{Regression test for the FPU stack corruption fixed in the 32-bit fixed size
 move routines Move36, Move44, Move52, Move60 and Move68 (pleriche/FastMM4
 issue 85). Those routines copied through the x87 stack with fild and fistp.
 A caller that already held values there overflowed the eight register stack,
 which corrupts the caller's values and raises an invalid operation, and the
 fix replaced the sequence with rep movsd, which touches no floating point
 state at all.

 What this checks is the property the fix restored: an upsize of a small
 block leaves the x87 stack exactly as it found it.

 Build with -dDisable32BitSSE for the run that guards the fix:
   fpc -B -Mdelphi -Twin32 -Pi386 -Fu../.. -dDisable32BitSSE FpuStackTest.dpr}

uses
  FastMM4 in '..\..\src\FastMM4.pas',
  FastMM4Messages in '..\..\src\FastMM4Messages.pas';

const
  TEST_PASSED = 0;
  TEST_FAILED = 1;

type
  TByteArray = array[0..32767] of Byte;
  PByteArray = ^TByteArray;

var
  GFailures: Integer = 0;

procedure Say(const AText: string);
begin
  WriteLn(AText);
  Flush(Output);
end;

procedure IntToShortStr(AValue: Integer; var AText: ShortString);
begin
  Str(AValue, AText);
end;

procedure SayValue(const APrefix: ShortString; AValue: Integer);
var
  LDigits: ShortString;
begin
  IntToShortStr(AValue, LDigits);
  WriteLn(APrefix, LDigits);
  Flush(Output);
end;

procedure Check(ACondition: Boolean; const AWhat: string);
begin
  if ACondition then
    Say('  ok    ' + AWhat)
  else
  begin
    Say('  FAIL  ' + AWhat);
    Inc(GFailures);
  end;
end;

{$IFDEF CPU386}

function FpuControlWord: Word; assembler;
asm
  push  eax
  fnstcw word ptr [esp]
  pop   eax
end;

procedure FpuSetControlWord(AValue: Word); assembler;
asm
  push  eax
  fldcw word ptr [esp]
  pop   eax
end;

procedure FpuInitAndPushSeven; assembler;
asm
  fninit
  fldz
  fldz
  fldz
  fldz
  fldz
  fldz
  fldz
  fldz
end;

function FpuStatusWord: Word; assembler;
asm
  fstsw ax
end;

procedure FpuReset; assembler;
asm
  fninit
end;

procedure TestFpuStackAcrossUpsize;
const
  CLowSize = 33;
  CHighSize = 96;
var
  LBlock: Pointer;
  LBytes: PByteArray;
  LSize, LIndex: Integer;
  LDataKept: Boolean;
  LBefore, LAfter: Word;
  LTopBefore, LTopAfter: Integer;
  LSavedControlWord: Word;
  LUpsizeCount: ShortString;
begin
  Say('the x87 stack across a small block upsize');
  LDataKept := True;
  LAfter := 0;
  LSavedControlWord := FpuControlWord;
  FpuInitAndPushSeven;
  LBefore := FpuStatusWord;
  try
    for LSize := CLowSize to CHighSize do
    begin
      GetMem(LBlock, LSize);
      try
        LBytes := LBlock;
        for LIndex := 0 to LSize - 1 do
          LBytes^[LIndex] := Byte((LIndex + LSize) and $FF);
        ReallocMem(LBlock, LSize + 256);
        LBytes := LBlock;
        for LIndex := 0 to LSize - 1 do
          if LBytes^[LIndex] <> Byte((LIndex + LSize) and $FF) then
            LDataKept := False;
      finally
        FreeMem(LBlock);
      end;
    end;
    LAfter := FpuStatusWord;
  finally
    FpuReset;
    FpuSetControlWord(LSavedControlWord);
  end;
  LTopBefore := (LBefore shr 11) and 7;
  LTopAfter := (LAfter shr 11) and 7;
  Check(LTopBefore = 1, 'seven values loaded, so the stack pointer reads one');
  IntToShortStr(CHighSize - CLowSize + 1, LUpsizeCount);
  Check(LTopAfter = LTopBefore, 'the stack pointer is where it was after ' + LUpsizeCount + ' upsizes');
  Check((LAfter and $0040) = 0, 'no stack fault is flagged');
  Check((LAfter and $0001) = 0, 'no invalid operation is flagged');
  Check(LDataKept, 'every upsized block kept its contents');
  Check(FpuControlWord = LSavedControlWord, 'the control word is back as the runtime set it');
end;

{$ENDIF CPU386}

begin
{$IFDEF CPU386}
  Say('FPU stack across the 32-bit fixed size move routines');
  {$IFDEF Disable32BitSSE}
  Say('built with the plain movers, which are the ones the fix repaired');
  {$ELSE}
  Say('note: built with the SSE movers, which never used the x87 stack, so this');
  Say('      run exercises them and does not guard the fix for issue 85;');
  Say('      build with -dDisable32BitSSE for the run that does');
  {$ENDIF}
  TestFpuStackAcrossUpsize;
  if GFailures = 0 then
  begin
    Say('all checks passed');
    ExitCode := TEST_PASSED;
  end
  else
  begin
    SayValue('failures: ', GFailures);
    ExitCode := TEST_FAILED;
  end;
{$ELSE}
  Say('skipped: the move routines that used the x87 stack exist only in the 32-bit code path');
  ExitCode := TEST_PASSED;
{$ENDIF}
end.
