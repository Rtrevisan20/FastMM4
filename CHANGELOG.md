# Changelog — FastMM4

## 4.994.0 (2 November 2026)

- Corrigida compatibilidade com Delphi 7 e compiladores mais antigos.
- Corrigido o tipo de dado de `LFileHandle` em `AppendEventLog`.
- Sincronizada fonte e binários pré-compilados do `FastMM_FullDebugMode` com
  o FastMM5.
- Corrigida compilação no Delphi 2007.
- Corrigido possível overflow inteiro no Usage Tracker em 64-bit.
- Clamp da calibração do lock-free stack no intervalo [1, 10000].
- Guardas nos handlers de `GetMem`/`ReallocMem` do modo debug para rejeitar
  tamanhos de bloco negativos (importante porque o Assembly x86
  `System.AllocMem` e `System._ReallocMem` não bloqueiam valores negativos
  como o caminho PurePascal/x64).
- Suporte a compiladores Delphi baseados em LLVM (Windows ARM64EC).

### Consumo via Boss

Este repositório agora inclui `boss.json` (SemVer `4.994.0`) para consumo via
[Boss](https://github.com/HashLoad/boss):

```sh
boss init -q
boss install github.com/Rtrevisan20/FastMM4
```

Para fixar a versão, declare no `boss.json` do seu projeto:

```json
{
  "dependencies": {
    "github.com/Rtrevisan20/FastMM4": "^4.994.0"
  }
}
```

> Nota: o Boss `v3.0.17` tem um bug onde `boss install <pkg>@<versão>` não
> resolve. Use o nome do pacote sem versão ou edite `boss.json` diretamente.

## 4.993 (10 August 2021)

- Adicionado "address space slack" sob FullDebugMode.
- Adicionada a opção `RestrictDebugDLLLoadPath`.
- Melhorias na geração de call stack (obrigado Andreas Hausladen).
- Adicionada arte do FastMM (obrigado Jim McKeeth).
- Adicionada a função `FastMM_GetInstallationState`.

## 4.992 (21 October 2016)

- FullDebugMode para OS X (obrigado Sebastian Zierer).
- Tamanho médio de bloco no log de estado de memória (obrigado Hallvard Vassbotn).
- Suporte para Free Pascal OS X e Linux, i386 e x86-64.
- Opção `LogLockContention` para rastrear contentões de lock.
- Suporte a release stacks (obrigado Primoz Gabrijelcic).

## 4.991 (3 September 2012)

- Chamada `LogMemoryManagerStateToFile`.
- Suporte a OS X (obrigado Sebastian Zierer).
- Compatível com Delphi XE3.

## 4.99 (6 November 2011)

- Correção de crash no código BASM 64-bit com mais de 4GB de memória.
- Correção de alinhamento de registro em 64-bit.
- Correção de erros de compilação em compiladores mais antigos.

Versões anteriores (4.0–4.98) estão documentadas no cabeçalho de
`FastMM4.pas`.
