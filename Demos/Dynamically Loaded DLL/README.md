# Demo: Dynamically Loaded DLL

Este demo demonstra como carregar dinamicamente uma DLL que usa o FastMM4
como gerenciador de memória, compartilhando memória entre a aplicação
principal e a DLL.

## Estrutura

| Arquivo | Descrição |
|---------|-----------|
| `TestApplication.dpr` / `.dproj` | Aplicação principal (VCL) |
| `TestDLL.dpr` / `.dproj` | DLL que compartilha memória com a aplicação |
| `ApplicationForm.pas` / `.dfm` | Formulário principal da aplicação |
| `DLLForm.pas` / `.dfm` | Formulário exibido pela DLL |

## Como construir

1. Adicione o diretório `src/` ao caminho de busca do compilador (`DCC_UnitSearchPath`)
   ou copie os arquivos de `src/` para o diretório do demo.
2. Abra `DynamicallyLoadedDLLDemo.groupproj` no Delphi 12.
3. Compile os projetos `TestApplication` e `TestDLL` para Win32 ou Win64.
4. Execute `TestApplication.exe`.

## Observações

- Ambos (aplicação e DLL) devem usar o FastMM4 com as mesmas opções
  condicionais definidas em `FastMM4Options.inc`.
- Para depuração com `FullDebugMode`, coloque `FastMM_FullDebugMode.dll`
  ao lado do executável e defina `LoadDebugDLLDynamically`.
