Fast Memory Manager — Readme
=============================

Este arquivo é um resumo. Para a documentação completa consulte o
[README.md](../README.md).

## Descrição

Um gerenciador de memória rápido e substituto para aplicações Embarcadero
Delphi e C++ Builder que escala bem sob uso multi-threaded, não é propenso a
fragmentação de memória e suporta memória compartilhada sem o uso de arquivos
DLL externos.

## Versão atual

4.994 (SemVer `4.994.0`)

## Uso (Delphi)

Coloque a unit `FastMM4` como a primeira unit na seção `uses` do arquivo .dpr
do seu projeto. Ao compartilhar memória entre uma aplicação e uma DLL (por
exemplo, ao passar uma string longa ou dynamic array para uma função de DLL),
tanto a aplicação principal quanto a DLL devem ser compiladas usando este
gerenciador de memória (com os defines condicionais necessários definidos).

Os defines condicionais estão dentro de `FastMM4Options.inc` e podem ser usados
para ajustar o gerenciador de memória.

## C++ Builder 6

Consulte as instruções dentro de `CPP Builder Support/FastMM4BCB.cpp`.

## Licença

Este trabalho é copyright Professional Software Development / Pierre le Riche.
É lançado sob uma dupla licença, e você pode escolher usá-lo sob a
Mozilla Public License 1.1 (MPL 1.1) ou a GNU Lesser General Public License
2.1 (LGPL 2.1). Consulte o arquivo `LICENSE` e o cabeçalho de `FastMM4.pas` para
o texto completo.

Se você achar o FastMM4 útil ou quiser apoiar o desenvolvimento adicional,
uma doação seria muito apreciada.

## Contato

E-mail: fastmm@leriche.org
Homepage: https://github.com/Rtrevisan20/FastMM4

## Documentação adicional

- `README.md` — documentação completa (instalação, Boss, compatibilidade, etc.)
- `FastMM4_FAQ.txt` — perguntas frequentes
- `CHANGELOG.md` — histórico de versões
- `SECURITY.md` — política de segurança
- `tests/` — suíte de regressão
- `Translations/` — traduções de mensagens
