# Demo: Usage Tracker

Este demo demonstra o `Usage Tracker` do FastMM4, que rastreia alocações
de memória e gera relatórios de uso.

## Estrutura

| Arquivo | Descrição |
|---------|-----------|
| `UsageTrackerDemo.dpr` / `.dproj` | Aplicação de demonstração (VCL) |
| `FastMMUsageTracker.pas` / `.dfm` | Unit do rastreador de uso |
| `DemoForm.pas` / `.dfm` | Formulário principal |

## Como construir

1. Adicione o diretório `src/` ao caminho de busca do compilador
   (`DCC_UnitSearchPath`) ou copie os arquivos de `src/` para o diretório do demo.
2. Abra `UsageTrackerDemo.dproj` no Delphi 12.
3. Compile para Win32 ou Win64.
4. Execute `UsageTrackerDemo.exe`.

## Observações

- O Usage Tracker requer a define `UseReleaseStack` ou `LogLockContention`
  em `FastMM4Options.inc` para funcionar plenamente.
