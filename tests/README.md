# Suíte de Regressão — FastMM4

## Visão geral

A suíte de regressão está em `tests/` e valida comportamentos críticos do
gerenciador de memória. Pode ser compilada com Delphi 12 (Win32/Win64) ou com
Free Pascal.

## Arquivos

| Arquivo | Descrição |
|---------|-----------|
| `tests/FastMM4RegressionTest.dpr` | Teste de regressão funcional |
| `tests/FastMM4StressTest.dpr` | Teste de stress multi-thread |

## Testes cobertos (Regressão)

| Teste | Descrição |
|-------|-----------|
| Versão | Valida que `FastMMVersion = '4.994'` |
| Alocação básica | `GetMem`/`ReallocMem`/`FreeMem` com blocos pequenos e médios |
| Strings e arrays | `string` e `TArray<Integer>` |
| Tamanhos negativos | `GetMem(-1)` deve falhar em `FullDebugMode` (commit #104) |
| Tamanho zero | `GetMem(0)` não deve levantar exceção |
| Alocação grande | 1 MB com preenchimento e liberação |
| Alinhamento | Blocos alinhados a 8 bytes (e 16 bytes se `Align16Bytes`) |
| Multi-threading | 4 threads, 1000 alocações cada, concorrência |

## Testes cobertos (Stress)

| Teste | Descrição |
|-------|-----------|
| Stress multi-thread | 8 threads, 500 iterações cada, 50 blocos por iteração, realocações concorrentes, strings |

## Como executar (Delphi 12)

```sh
# Win32 - Regressão
dcc32 -NSWinapi tests\FastMM4RegressionTest.dpr
tests\Win32\Debug\FastMM4RegressionTest.exe

# Win64 - Regressão
dcc64 -NSWinapi tests\FastMM4RegressionTest.dpr
tests\Win64\Debug\FastMM4RegressionTest.exe

# Win32 - Stress
dcc32 -NSWinapi tests\FastMM4StressTest.dpr
tests\Win32\Debug\FastMM4StressTest.exe
```

## Como executar com FullDebugMode

```sh
dcc32 -NSWinapi -DFullDebugMode -DLoadDebugDLLDynamically tests\FastMM4RegressionTest.dpr
# Colocar FastMM_FullDebugMode.dll ao lado do executável
tests\Win32\Debug\FastMM4RegressionTest.exe
```

## Como executar com Free Pascal (Linux/Windows)

```sh
fpc -Mobjfpc -Sh -Sg -Fi../src tests\FastMM4RegressionTest.dpr
./FastMM4RegressionTest
```

## Integração com CI

O workflow `.github/workflows/ci.yml` executa os testes com FPC em
Linux (i386 e x86-64) a cada push/pull request.

## Critérios de aceitação

- [ ] Todos os testes passam em Win32 (Delphi 12)
- [ ] Todos os testes passam em Win64 (Delphi 12)
- [ ] `GetMem(-1)` levanta exceção em `FullDebugMode`
- [ ] `FastMMVersion = '4.994'`
- [ ] Teste de stress com 8 threads não apresenta falhas
- [ ] Nenhum vazamento de memória na finalização (verificado com FullDebugMode)
