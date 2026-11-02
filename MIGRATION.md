# Guia de Migração — FastMM4 4.994.0 (estrutura `src/`)

## O que mudou

A partir da versão 4.994.0, os 6 arquivos de runtime do FastMM4 foram movidos
da raiz do repositório para a pasta `src/`. Essa mudança segue o layout
documentado para pacotes Boss e evita que o consumidor tenha diretórios
desnecessários (`Demos/`, `Translations/`, `Replacement BorlndMM DLL/`)
adicionados ao `DCC_UnitSearchPath`.

### Arquivos movidos

| Arquivo | Antes | Depois |
|---------|-------|--------|
| `FastMM4.pas` | raiz | `src/FastMM4.pas` |
| `FastMM4Messages.pas` | raiz | `src/FastMM4Messages.pas` |
| `FastMM4Options.inc` | raiz | `src/FastMM4Options.inc` |
| `FastMM4DataCollector.pas` | raiz | `src/FastMM4DataCollector.pas` |
| `FastMM4LockFreeStack.pas` | raiz | `src/FastMM4LockFreeStack.pas` |
| `FastMM_OSXUtil.pas` | raiz | `src/FastMM_OSXUtil.pas` |

## Impacto para consumidores

### Instalação manual

Se você adicionava os arquivos da raiz ao search path do compilador, agora
adicione o diretório `src/` em vez disso:

```sh
# Antes (não funciona mais)
DCC_UnitSearchPath=$(DCC_UnitSearchPath);.\

# Depois
DCC_UnitSearchPath=$(DCC_UnitSearchPath);.\src
```

Ou copie os arquivos de `src/` para o seu projeto.

### Uso via Boss

O `boss.json` agora declara `"mainsrc": "src"`. Não é necessário alterar
nada no seu projeto consumidor:

```sh
boss init -q
boss install github.com/Rtrevisan20/FastMM4
```

O `DCC_UnitSearchPath` resultante conterá apenas `modules\...\FastMM4\src`
(mais `.dcp`/`.dcu`), sem poluição de diretórios de demos e traduções.

## Motivação

- **Boss**: com `mainsrc: "."`, o Boss varria recursivamente todo o
  repositório e adicionava `Demos/`, `Translations/` e
  `Replacement BorlndMM DLL/` ao search path do consumidor, causando
  colisões de nomes de unit (ex.: `DemoForm.pas`, `BorlndMM.pas`).
- **Organização**: a raiz do repositório fica dedicada a documentação,
  demos, traduções e scripts, enquanto o runtime fica isolado em `src/`.
- **Manutenção**: fica mais claro quais arquivos são essenciais para
  consumir a biblioteca.

## Versão

Esta é uma mudança quebrável para quem referencia a raiz do repositório.
Por isso, foi implementada na versão `4.994.0` com este guia de migração.
Em uma versão futura maior (`5.x`), a estrutura `src/` será mantida como
padrão definitivo.
