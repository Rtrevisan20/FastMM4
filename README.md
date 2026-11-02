# FastMM4

Fast Memory Manager

![FastMM-Title.jpg with title only](images/FastMM-Title.jpg "FastMM-Title.jpg with title only")

**Current version:** 4.994 (SemVer `4.994.0`)

## Description

A fast replacement memory manager for Embarcadero Delphi and C++ Builder
applications that scales well under multi-threaded usage, is not prone to
memory fragmentation, and supports shared memory without the use of external
DLL files.

FastMM4 is the legacy branch. New projects targeting Delphi XE3 or later
should evaluate [FastMM5](https://github.com/pleriche/FastMM5), the official
successor with a new API and better scalability. FastMM4 remains maintained
for compatibility with older compilers (Delphi 4+) and existing projects.

| Quando usar | Recomendação |
|-------------|--------------|
| Projetos novos (Delphi XE3+) | Avalie [FastMM5](https://github.com/pleriche/FastMM5) |
| Projetos existentes com FastMM4 | Continue usando; FastMM4 recebe correções de bugs |
| Compiladores antigos (Delphi 4-7) | FastMM4 é a escolha adequada |
| Windows ARM64EC | FastMM4 4.994+ (sem DLL FullDebugMode pré-compilada ainda) |
| Linux/macOS (Free Pascal) | FastMM4 com FPC (não Delphi Linux64) |

## Advantages

* Fast.
* Low overhead. FastMM is designed for an average of 5% and maximum of 10%
  overhead per block.
* Supports up to 3GB of user mode address space under Windows 32-bit and 4GB
  under Windows 64-bit. Add the `{$SetPEFlags $20}` option to your `.dpr` to
  enable this.
* Highly aligned memory blocks. Can be configured for either 8-byte or 16-byte
  alignment.
* Good scaling under multi-threaded applications.
* Intelligent reallocations. Avoids slow memory move operations through not
  performing unnecessary downsizes and by having a minimum percentage block
  size growth factor when an in-place block upsize is not possible.
* Resistant to address space fragmentation.
* No external DLL required when sharing memory between the application and
  external libraries (provided both use this memory manager).
* Optionally reports memory leaks on program shutdown. This check can be set
  to run only if Delphi is currently running on the machine, so end users are
  not bothered by the error message.

## Compatibility

| Target | Status |
|---|---|
| Delphi 4 and later (Win32) | Supported (legacy compatibility maintained) |
| Delphi 12 Win32 / Win64 | Validated |
| Delphi Windows ARM64EC (LLVM-based compilers) | Supported since 4.994 |
| C++ Builder 4 and later | Supported (see `CPP Builder Support/FastMM4BCB.cpp`) |
| Free Pascal i386 / x86-64 on Linux and macOS | Supported |
| Kylix 3 | Legacy support |
| Delphi Linux64 | Not supported: the POSIX code path is for FPC, not `dcclinux64` |

Notes:

* Precompiled `FastMM_FullDebugMode` libraries are available for Win32,
  Win64 and macOS x86-64 under `FullDebugMode DLL/Precompiled/`. There is no
  precompiled ARM64EC/ARM64 debug library yet. The source code supports
  LLVM-based Delphi compilers (Windows ARM64EC) since 4.994, but the debug
  DLL must be built from source for ARM64EC targets.
* Delphi Linux64 (`dcclinux64`) is NOT supported: the POSIX code path exists
  for Free Pascal (Linux/macOS), not for Delphi's Linux64 compiler. The test
  with `dcclinux64` fails because the unit `Libc` is not found. Use Free
  Pascal for Linux targets.
* For command-line builds with modern Delphi, make sure the Winapi unit scope
  is available (for example, pass `-NSWinapi` to `dcc32`/`dcc64`). IDE
  projects normally configure this automatically.
* The `src/` directory contains the 6 runtime units. Add it to your compiler
  search path or copy its contents to your project.

## Installation

### Manual

1. Add the `src/` directory to your compiler search path, or copy the
   runtime files to your project:
   * `src/FastMM4.pas`
   * `src/FastMM4Messages.pas`
   * `src/FastMM4Options.inc`
2. In the project's `.dpr` file, make `FastMM4` the **first** unit in the
   `uses` clause:

   ```pascal
   uses
     FastMM4,
     System.SysUtils,
     // ...
   ```

3. When sharing memory between an application and a DLL (for example, when
   passing a long string or a dynamic array to a DLL function), both the
   application and the DLL must use FastMM4 with compatible options.

`FastMM4Options.inc` contains the conditional defines used to configure the
memory manager, including `FullDebugMode`, `LogLockContention`,
`UseReleaseStack`, alignment, and leak reporting options.

### Boss

The repository includes a `boss.json` manifest. From a Delphi project that
already uses Boss:

```sh
boss init -q
boss install github.com/Rtrevisan20/FastMM4
```

To pin the major/minor version, add the dependency to the consuming project's
`boss.json` and run `boss install`:

```json
{
  "dependencies": {
    "github.com/Rtrevisan20/FastMM4": "^4.994.0"
  }
}
```

> Boss `3.0.17` has a bug where `boss install <package>@<version>` reports
> "No dependencies to install". Use the plain package name or edit
> `boss.json` directly, as shown above.

The manifest declares `mainsrc: "src"`, so Boss adds only the `src/`
directory (containing the 6 runtime units) to the consumer's unit search
path, without exposing `Demos/`, `Translations/` or the legacy replacement
DLL projects.
A future major release will move the runtime units to `src/`, which is the
documented layout for Boss packages.

Boss creates a `modules/` directory in the consuming project; it is already
ignored by this repository's `.gitignore`.

## FullDebugMode

To use `FullDebugMode`:

1. Enable the option in `FastMM4Options.inc` (or pass `-DFullDebugMode`).
2. Enable `LoadDebugDLLDynamically` and place the appropriate precompiled
   library from `FullDebugMode DLL/Precompiled/` next to the executable, or
   build the debug library from `FullDebugMode DLL/`.
3. Rebuild the application and run it. Leak reports and diagnostics are
   written according to the options in `FastMM4Options.inc`.

See `FastMM4_Readme.txt` and `FastMM4_FAQ.txt` for the legacy documentation
and advanced scenarios. Note that the issue tracker and the source header are
the authoritative places for recent changes.

## C++ Builder

Refer to the instructions in
[`CPP Builder Support/FastMM4BCB.cpp`](CPP%20Builder%20Support/FastMM4BCB.cpp).

## Documentation

* `FastMM4_Readme.txt` — legacy readme and file inventory.
* `FastMM4_FAQ.txt` — frequently asked questions (largely historical).
* `Demos/` — sample projects, including the Usage Tracker and DLL sharing
  examples.
* `Translations/` — translated message units.

## License

FastMM is copyright Professional Software Development / Pierre le Riche and is
released under a dual license. You may choose to use it under either the
Mozilla Public License 1.1 (MPL 1.1) or the GNU Lesser General Public License
2.1 (LGPL 2.1). See the header of `FastMM4.pas` for the full text.

The images in `images/` have separate terms and are not covered by the dual
license.
