# Demo: Replacement borlndmm DLL

Este demo demonstra como substituir o `borlndmm.dll` padrão pelo FastMM4,
permitindo que aplicações legacy usem o FastMM4 sem modificação de código.

## Estrutura

| Arquivo | Descrição |
|---------|-----------|
| `FullDebugModeDemo.dpr` | Demo em FullDebugMode |
| `BorlndMM.dll` | DLL pré-compilada de substituição |
| `FastMM_FullDebugMode.dll` | DLL de debug pré-compilada |

## Como construir

1. Adicione o diretório `src/` ao caminho de busca do compilador
   (`DCC_UnitSearchPath`) ou copie os arquivos de `src/` para o diretório do demo.
2. Abra os projetos no Delphi 12.
3. Compile para Win32 ou Win64.

## Observações

- Os binários pré-compilados (`BorlndMM.dll`, `FastMM_FullDebugMode.dll`)
  estão incluídos para referência. Para uso em produção, recompile a partir
  do código-fonte em `src/`.
- Para FullDebugMode, defina `FullDebugMode` e `LoadDebugDLLDynamically`
  em `FastMM4Options.inc`.
