# Status das Traduções — FastMM4

## Resumo

Todas as 18 variantes de tradução em `Translations/` foram validadas em relação ao `FastMM4Messages.pas` raiz (53 constantes). As constantes faltantes (`LockingReportTitle`, `LockingReportHeader` e todo o bloco `ReleaseStackUsage*`) foram adicionadas a todas as traduções em inglês (texto original, pendente de tradução por falantes nativos de cada idioma).

| Tradução | Status | Constantes | Observações |
|----------|--------|------------|-------------|
| Afrikaans | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Belarussian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Chinese (Simplified) | Completo | 53 | `FastMM4Options.inc` defasado (ver abaixo) |
| Czech | Completo | 53 | Tradução parcial, constantes novas em inglês |
| English | Completo | 53 | Tradução de referência (raiz) |
| French | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Indonesian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Italian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Polish | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Portuguese | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Portuguese (Brazil) | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Romanian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Russian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Spanish | Completo | 53 | Tradução parcial, constantes novas em inglês |
| Ukrainian | Completo | 53 | Tradução parcial, constantes novas em inglês |
| German (by Thomas Speck) | Completo | 53 | Tradução parcial, constantes novas em inglês |
| German (by Uwe Queisser) | Completo | 53 | Tradução parcial, constantes novas em inglês |

## Constantes adicionadas (em inglês, pendentes de tradução)

As seguintes constantes foram adicionadas a todas as traduções (texto em inglês, aguardando tradução por colaboradores de cada idioma):

- `LockingReportTitle = 'Locking Report'` (sob `{$ifdef LogLockContention}`)
- `LockingReportHeader = 'Top locking contention sites'` (sob `{$ifdef LogLockContention}`)
- `ReleaseStackUsageHeader = 'Release stack usage statistics'` (sob `{$ifdef UseReleaseStack}` + `{$ifdef DebugReleaseStack}`)
- `ReleaseStackUsageSmallBlocksMsg1 = 'Small blocks ['`
- `ReleaseStackUsageSmallBlocksMsg2 = ']: '`
- `ReleaseStackUsageTotalSmallBlocksMsg = 'Total small blocks: '`
- `ReleaseStackUsageMediumBlocksMsg = 'Medium blocks: '`
- `ReleaseStackUsageLargeBlocksMsg = 'Large blocks: '`
- `ReleaseStackUsageTotalMemoryMsg = 'Total memory: '`
- `ReleaseStackUsageBuffers1Msg = ' in '`
- `ReleaseStackUsageBuffers2Msg = ' buffers ['`

## FastMM4Options.inc (Chinês Simplificado)

O arquivo `Translations/Chinese (Simplified)/FastMM4Options.inc` foi removido do repositório (estava defasado: 13.344 bytes vs 21.672 bytes da versão atual na raiz). As opções de compile-time são garantidas apenas no arquivo `FastMM4Options.inc` raiz (em inglês).

Se você precisa de uma versão traduzida de `FastMM4Options.inc`, contribua com um pull request atualizando-o para espelhar a versão da raiz.

## Traduções não mantidas

Nenhuma tradução é atualmente mantida ativamente. Todas dependem de contribuições da comunidade. Se você deseja manter uma tradução específica, abra uma issue no repositório.

## Como validar

Execute o script de validação (incluído na CI em `.github/workflows/ci.yml`) que compara as constantes de `FastMM4Messages.pas` raiz com cada tradução e falha se alguma constante estiver faltando.
