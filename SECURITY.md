# Política de Segurança — FastMM4

## Versões suportadas

| Versão | Status |
|--------|--------|
| 4.994.0 | Suportada (última) |
| 4.993 e anteriores | Não suportadas (sem correções de segurança) |

## Divulgação responsável

FastMM4 é um gerenciador de memória — bugs de tamanho, overflow, double-free
e use-after-free podem ser exploráveis. Se você descobrir um problema de
segurança, reporte-o privadamente antes de divulgá-lo publicamente.

Envie um e-mail para: fastmm@leriche.org

Não abra issues públicas no GitHub para vulnerabilidades de segurança.

## Comportamento esperado para entradas inválidas

As funções `GetMem`, `ReallocMem` e `FreeMem` devem receber ponteiros e
tamanhos válidos. A partir da versão 4.994:

- Tamanhos negativos em `GetMem`/`ReallocMem` são rejeitados no modo debug
  (guardas adicionadas no commit #104).
- Ponteiros inválidos ou já liberados (double-free / use-after-free) podem
  causar corrupção de memória ou falha de segmentação, dependendo da plataforma
  e dos defines de compilação (`FullDebugMode`, `UseReleaseStack`, etc.).

Use `FullDebugMode` para detecção de vazamentos e corrupção de memória em
ambientes de desenvolvimento e teste.

## Histórico de problemas de segurança conhecidos

- **CVE-2017-17426**: classe de problema real em gerenciadores de memória
  (tamanhos/overflow/double-free). Mantenha o FastMM4 atualizado.
- Commit #104 (2026-08-18): guardas para tamanhos negativos em `GetMem` e
  `ReallocMem` no modo debug.

## Testes recomendados

Antes de implantar em produção, valide com:

- Tamanhos extremos (0, 1, valores próximos a `MaxInt`, tamanhos negativos)
- Double-free e use-after-free (em `FullDebugMode`)
- Alinhamento de blocos
- Compartilhamento de MM entre EXE e DLL
- Testes de stress multi-thread

## Contato de segurança

E-mail: fastmm@leriche.org
