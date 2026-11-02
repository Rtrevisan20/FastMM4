program FastMM4StressTest;

{$APPTYPE CONSOLE}

{$IFDEF FullDebugMode}
{$DEFINE DebugBuild}
{$ENDIF}

uses
  FastMM4,
  System.SysUtils,
  System.Classes,
  System.SyncObjs;

var
  FailCount: Integer = 0;
  TotalAllocs: Int64 = 0;
  TotalFrees: Int64 = 0;
  CS: TCriticalSection;

procedure Check(ACondition: Boolean; const AMsg: string);
begin
  if not ACondition then
  begin
    WriteLn('FAIL: ' + AMsg);
    Inc(FailCount);
  end
  else
    WriteLn('OK:   ' + AMsg);
end;

type
  TStressThread = class(TThread)
  private
    FThreadIdx: Integer;
    FIterations: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(AThreadIdx, AIterations: Integer);
  end;

constructor TStressThread.Create(AThreadIdx, AIterations: Integer);
begin
  inherited Create(False);
  FThreadIdx := AThreadIdx;
  FIterations := AIterations;
end;

procedure TStressThread.Execute;
var
  I: Integer;
  Blocks: TArray<Pointer>;
  J: Integer;
  P: Pointer;
  S: string;
begin
  SetLength(Blocks, 50);
  try
    for I := 0 to FIterations - 1 do
    begin
      // Allocate 50 blocks
      for J := 0 to 49 do
      begin
        Blocks[J] := nil;
        GetMem(Blocks[J], 128 + (I mod 1024));
        FillChar(Blocks[J]^, 128 + (I mod 1024), $5A);
      end;

      // Realloc some
      for J := 0 to 24 do
      begin
        if Blocks[J] <> nil then
        begin
          ReallocMem(Blocks[J], 256 + (I mod 2048));
        end;
      end;

      // Free half
      for J := 0 to 49 do
      begin
        if J mod 2 = 0 then
        begin
          if Blocks[J] <> nil then
          begin
            FreeMem(Blocks[J]);
            Blocks[J] := nil;
          end;
        end;
      end;

      // String allocations
      S := StringOfChar('z', 100 + (I mod 500));
      S := S + ' thread ' + IntToStr(FThreadIdx);

      // Free remaining
      for J := 0 to 49 do
      begin
        if Blocks[J] <> nil then
        begin
          FreeMem(Blocks[J]);
          Blocks[J] := nil;
        end;
      end;
    end;
  finally
    SetLength(Blocks, 0);
  end;

  // Atomic counters
  TInterlocked.Add(TotalAllocs, FIterations * 50);
  TInterlocked.Add(TotalFrees, FIterations * 50);
end;

var
  Threads: TArray<TThread>;
  I, ThreadCount, Iterations: Integer;
  StartTime: Int64;
begin
  WriteLn('========================================');
  WriteLn('  FastMM4 Stress Test');
  WriteLn('  Versao: ' + FastMMVersion);
  WriteLn('========================================');
  WriteLn('');

  ThreadCount := 8;
  Iterations := 500;

  WriteLn('Configuracao:');
  WriteLn('  Threads: ' + IntToStr(ThreadCount));
  WriteLn('  Iteracoes por thread: ' + IntToStr(Iterations));
  WriteLn('  Blocos por iteracao: 50');
  WriteLn('  Total de alocacoes esperadas: ' + IntToStr(ThreadCount * Iterations * 50));
  WriteLn('');

  CS := TCriticalSection.Create;
  StartTime := TThread.GetTickCount64;

  SetLength(Threads, ThreadCount);
  for I := 0 to ThreadCount - 1 do
  begin
    Threads[I] := TStressThread.Create(I, Iterations);
  end;

  for I := 0 to ThreadCount - 1 do
    Threads[I].WaitFor;

  for I := 0 to ThreadCount - 1 do
    Threads[I].Free;

  CS.Free;

  WriteLn('');
  WriteLn('Resultado:');
  WriteLn('  Tempo decorrido: ' + IntToStr(TThread.GetTickCount64 - StartTime) + ' ms');
  WriteLn('  Total de alocacoes: ' + IntToStr(TotalAllocs));
  WriteLn('  Total de liberacoes: ' + IntToStr(TotalFrees));
  WriteLn('');

  if FailCount = 0 then
  begin
    WriteLn('RESULTADO: TESTE DE STRESS PASSOU');
    Halt(0);
  end
  else
  begin
    WriteLn('RESULTADO: ' + IntToStr(FailCount) + ' FALHA(S)');
    Halt(1);
  end;
end.
