# Guia de Contribuição — FastMM4

## Visão geral

O FastMM4 é um gerenciador de memória legado para Delphi e C++ Builder.
Novos projetos devem avaliar o [FastMM5](https://github.com/pleriche/FastMM5),
o sucessor oficial. O FastMM4 continua recebendo correções de bugs para
compatibilidade com compiladores antigos e projetos existentes.

Antes de contribuir, leia o [Código de Conduta](CODE_OF_CONDUCT.md) (a ser
criado) e a [Política de Segurança](SECURITY.md).

## Como contribuir

### 1. Faça um fork do repositório

O repositório oficial é `pleriche/FastMM4`. Se você não tem acesso de escrita
direto, faça um fork no seu próprio GitHub:

```sh
git remote add upstream https://github.com/pleriche/FastMM4.git
git remote add origin https://github.com/<seu-usuario>/FastMM4.git
```

### 2. Crie uma branch para sua mudança

```sh
git checkout -b feature/sua-melhoria
```

### 3. Faça suas mudanças

- Siga o estilo de código existente (Pascal, indentação de 2 espaços).
- Adicione testes para novas funcionalidades ou correções de bugs.
- Atualize a documentação (`README.md`, `CHANGELOG.md`) quando relevante.
- Não mova arquivos de runtime sem atualizar `boss.json` e `MIGRATION.md`.

### 4. Valide localmente

Antes de enviar um pull request, execute os testes:

```sh
# Delphi 12 Win32
dcc32 -NSWinapi tests\FastMM4RegressionTest.dpr
tests\Win32\Debug\FastMM4RegressionTest.exe

# Delphi 12 Win64
dcc64 -NSWinapi tests\FastMM4RegressionTest.dpr
tests\Win64\Debug\FastMM4RegressionTest.exe

# Teste de stress
dcc32 -NSWinapi tests\FastMM4StressTest.dpr
tests\Win32\Debug\FastMM4StressTest.exe
```

### 5. Envie e abra um pull request

```sh
git add .
git commit -m "Descrição clara da mudança"
git push origin feature/sua-melhoria
```

Abra um pull request no repositório original (ou no seu fork, se não tiver
acesso direto).

## Convenções de commit

Use mensagens no formato:

```
<tipo>: <descrição curta>
```

Tipos: `feat`, `fix`, `docs`, `test`, `chore`, `refactor`, `build`, `ci`.

Exemplo:

```
fix: corrige tamanho negativo em GetMem no modo debug
```

## Versão e tags

O FastMM4 usa [SemVer](https://semver.org/) (`MAJOR.MINOR.PATCH`).
Tags são no formato `v4.994.0`. Não use tags `release_XXXX`.

Ao preparar uma release:

1. Atualize `FastMMVersion` em `src/FastMM4.pas`.
2. Atualize o changelog em `CHANGELOG.md`.
3. Atualize `boss.json` com a nova versão.
4. Crie a tag anotada: `git tag -a v4.994.0 -m "FastMM4 4.994.0"`.
5. Publique a tag e crie uma GitHub Release.

## Estrutura do repositório

| Diretório | Conteúdo |
|-----------|----------|
| `src/` | Arquivos de runtime (6 units) |
| `Demos/` | Projetos de demonstração |
| `Translations/` | Traduções de mensagens |
| `tests/` | Suíte de regressão e stress |
| `FullDebugMode DLL/` | Código e binários do modo debug |
| `Replacement BorlndMM DLL/` | Projetos legacy de substituição |
| `.github/workflows/` | CI e automação de release |

## Diretrizes específicas

### Traduções

Todas as traduções em `Translations/` devem ter as mesmas constantes que
`src/FastMM4Messages.pas`. Constantes faltantes quebram a compilação quando
`LogLockContention` ou `UseReleaseStack` estão habilitados. Antes de enviar
uma tradução, execute a validação:

```sh
# O workflow CI faz isso automaticamente
```

### Binários

Não commit binários (DLL, LIB, etc.) no repositório. Publique-os nas
[GitHub Releases](https://github.com/Rtrevisan20/FastMM4/releases) com
checksums SHA-256.

### Boss

O `boss.json` declara `mainsrc: "src"`. Não mude para `"."` pois isso faria
o Boss varrer todo o repositório e poluir o `DCC_UnitSearchPath` do
consumidor.

## Comunidade

- Issues: https://github.com/Rtrevisan20/FastMM4/issues
- Discussões: https://github.com/Rtrevisan20/FastMM4/discussions
- E-mail: fastmm@leriche.org
