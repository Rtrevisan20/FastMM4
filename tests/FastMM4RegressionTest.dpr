program FastMM4RegressionTest;

{$APPTYPE CONSOLE}

{$IFDEF FullDebugMode}
{$DEFINE DebugBuild}
{$ENDIF}

uses
  FastMM4,
  System.SysUtils,
  System.Classes;

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
const
  CThreadCount = 4;
  CAllocationsPerThread = 1000;
var
  Threads: TArray<TThread>;
  I: Integer;
begin
  WriteLn('-- Teste 7: Multi-threading (', CThreadCount, ' threads, ',
    CAllocationsPerThread, ' alocacoes cada)');
  SetLength(Threads, CThreadCount);
  for I := 0 to CThreadCount - 1 do
  begin
    Threads[I] := TThread.CreateAnonymousThread(procedure
    var
      J: Integer;
      Arr: TArray<Pointer>;
    begin
      SetLength(Arr, CAllocationsPerThread);
      for J := 0 to CAllocationsPerThread - 1 do
      begin
        Arr[J] := nil;
        GetMem(Arr[J], 256);
        FillChar(Arr[J]^, 256, $55);
        ReallocMem(Arr[J], 512);
        FreeMem(Arr[J]);
      end;
      SetLength(Arr, 0);
    end);
    {CreateAnonymousThread sets FreeOnTerminate, so a finished thread frees
     itself and the reference below becomes dangling. Own the lifetime here
     instead: that keeps every WaitFor valid and makes the leak checker see
     a clean shutdown.}
    Threads[I].FreeOnTerminate := False;
    Threads[I].Start;
  end;
  for I := 0 to CThreadCount - 1 do
  begin
    Threads[I].WaitFor;
    Threads[I].Free;
  end;
  Check(True, IntToStr(CThreadCount) + ' threads completaram ' +
    IntToStr(CAllocationsPerThread) + ' alocacoes cada sem excecao');
end;

procedure TestVersion;
begin
  WriteLn('-- Teste 8: Validacao de versao');
  Check(FastMMVersion = '4.994', 'FastMMVersion = 4.994 (atual: ' + FastMMVersion + ')');
end;

{Confirms that FastMM is the memory manager actually in use, not merely
 compiled in. A build that enables InstallOnlyIfRunningInIDE or UseRTLMM, or
 that lists FastMM4 after another unit in the project uses clause, runs on the
 default memory manager and silently provides no debugging features.}
procedure TestInstallationState;
var
  LState: TFastMM_MemoryManagerInstallationState;
begin
  WriteLn('-- Teste 9: Estado de instalacao do memory manager');
  LState := FastMM_GetInstallationState;
  case LState of
    mmisInstalled:
      Check(True, 'FastMM4 esta instalado como memory manager');
    mmisUsingSharedMemoryManager:
      Check(True, 'FastMM4 partilhado em uso (EXE/DLL)');
    mmisDefaultMemoryManagerInUse:
      Check(False, 'FastMM4 NAO esta instalado: o RTL usa o memory manager padrao ' +
        '(verifique InstallOnlyIfRunningInIDE, UseRTLMM e se FastMM4 e a primeira unit)');
    mmisOtherThirdPartyMemoryManagerInstalled:
      Check(False, 'FastMM4 NAO esta instalado: outro memory manager de terceiros esta ativo');
  else
    Check(False, 'Estado de instalacao desconhecido');
  end;
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
  TestInstallationState;
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
