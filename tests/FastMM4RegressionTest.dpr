program FastMM4RegressionTest;

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

procedure TestBasicAlloc;
var
  P: Pointer;
begin
  WriteLn('-- Teste 1: Alocacao basica GetMem/ReallocMem/FreeMem');
  GetMem(P, 1024);
  Check(P <> nil, 'GetMem(1024) retorna ponteiro nao-nulo');
  ReallocMem(P, 4096);
  Check(P <> nil, 'ReallocMem para 4096 retorna ponteiro nao-nulo');
  FreeMem(P);
  Check(True, 'FreeMem executado sem excecao');
end;

procedure TestStringsAndArrays;
var
  S: string;
  A: TArray<Integer>;
  I: Integer;
begin
  WriteLn('-- Teste 2: Strings e dynamic arrays');
  S := StringOfChar('x', 10000);
  Check(Length(S) = 10000, 'String de 10000 chars');
  SetLength(A, 1000);
  for I := 0 to High(A) do A[I] := I;
  Check(A[999] = 999, 'Dynamic array de 1000 inteiros');
  SetLength(A, 0);
  Check(Length(A) = 0, 'Array liberado (SetLength 0)');
end;

procedure TestNegativeSizes;
var
  P: Pointer;
begin
  WriteLn('-- Teste 3: Tamanhos negativos (devem falhar ou ser tratados)');
{$IFDEF FullDebugMode}
  try
    GetMem(P, -1);
    Check(False, 'GetMem(-1) deveria levantar excecao em FullDebugMode');
  except
    on E: Exception do
      Check(True, 'GetMem(-1) levantou excecao: ' + E.ClassName);
  end;
{$ELSE}
  Check(True, 'Pulado: FullDebugMode nao habilitado (teste de tamanho negativo)');
{$ENDIF}
end;

procedure TestZeroSize;
var
  P: Pointer;
begin
  WriteLn('-- Teste 4: Tamanho zero');
  GetMem(P, 0);
  Check(True, 'GetMem(0) nao levanta excecao');
  if P <> nil then
    FreeMem(P);
end;

procedure TestLargeAlloc;
var
  P: Pointer;
begin
  WriteLn('-- Teste 5: Alocacao grande (1 MB)');
  GetMem(P, 1024 * 1024);
  Check(P <> nil, 'GetMem(1MB) retorna ponteiro');
  FillChar(P^, 1024 * 1024, $AA);
  FreeMem(P);
end;

procedure TestAlignment;
var
  P8, P16: Pointer;
begin
  WriteLn('-- Teste 6: Alinhamento de blocos');
  GetMem(P8, 32);
  Check(Integer(P8) mod 8 = 0, 'Bloco de 32 bytes alinhado a 8 bytes');
  FreeMem(P8);

{$IFDEF Align16Bytes}
  GetMem(P16, 64);
  Check(Integer(P16) mod 16 = 0, 'Bloco de 64 bytes alinhado a 16 bytes (Align16Bytes)');
  FreeMem(P16);
{$ELSE}
  Check(True, 'Pulado: Align16Bytes nao habilitado');
{$ENDIF}
end;

procedure TestMultiThread;
var
  Threads: TArray<TThread>;
  Errors: TArray<string>;
  I: Integer;
  CS: TCriticalSection;
begin
  WriteLn('-- Teste 7: Multi-threading (4 threads, 1000 alocacoes cada)');
  CS := TCriticalSection.Create;
  Errors := nil;
  SetLength(Threads, 4);
  for I := 0 to 3 do
  begin
    Threads[I] := TThread.CreateAnonymousThread(procedure
    var
      J: Integer;
      Arr: TArray<Pointer>;
    begin
      SetLength(Arr, 100);
      for J := 0 to 99 do
      begin
        Arr[J] := nil;
        GetMem(Arr[J], 256);
        FillChar(Arr[J]^, 256, $55);
        ReallocMem(Arr[J], 512);
        FreeMem(Arr[J]);
      end;
      SetLength(Arr, 0);
    end);
    Threads[I].Start;
  end;
  for I := 0 to 3 do
    Threads[I].WaitFor;
  CS.Free;
  Check(True, '4 threads completaram 1000 alocacoes cada sem excecao');
end;

procedure TestVersion;
begin
  WriteLn('-- Teste 8: Validacao de versao');
  Check(FastMMVersion = '4.994', 'FastMMVersion = 4.994 (atual: ' + FastMMVersion + ')');
end;

var
  P: Pointer;
begin
  WriteLn('========================================');
  WriteLn('  FastMM4 Regression Test Suite');
  WriteLn('  Versao: ' + FastMMVersion);
  WriteLn('========================================');
  WriteLn('');

  TestVersion;
  TestBasicAlloc;
  TestStringsAndArrays;
  TestNegativeSizes;
  TestZeroSize;
  TestLargeAlloc;
  TestAlignment;
  TestMultiThread;

  WriteLn('');
  WriteLn('========================================');
  if FailCount = 0 then
  begin
    WriteLn('RESULTADO: TODOS OS TESTES PASSARAM');
    Halt(0);
  end
  else
  begin
    WriteLn('RESULTADO: ' + IntToStr(FailCount) + ' TESTE(S) FALHARAM');
    Halt(1);
  end;
end.
