# Security Tests — FastMM4

This directory contains security-focused tests ported from
[FastMM4-AVX](https://github.com/maximmasiutin/FastMM4-AVX) and adapted for
FastMM4 4.994.

## Tests

| Test | Protects against | Build requirement |
|------|-----------------|-------------------|
| `IntegerOverflowTest.dpr` | Integer overflow in large block allocation (CVE-2017-17426 class) | Compile with `{$R+} {$Q+}`; run with and without `FullDebugMode` |
| `MediumSafeUnlinkingTest.dpr` | Safe-unlinking protection (Issue #80) | Build with `-dMediumSafeUnlinkingTest` |
| `FpuStackTest.dpr` | FPU stack corruption in 32-bit move routines (Issue #85) | Build with `-dDisable32BitSSE` for the guarded path |

## How to run

### Delphi 12 (Win32/Win64)

```sh
# Integer overflow test (32-bit)
dcc32 -NSWinapi -R+ -Q+ tests\security\IntegerOverflowTest.dpr
tests\Win32\Debug\IntegerOverflowTest.exe

# Integer overflow test (64-bit)
dcc64 -NSWinapi -R+ -Q+ tests\security\IntegerOverflowTest.dpr
tests\Win64\Debug\IntegerOverflowTest.exe

# Safe-unlinking test (requires -DMediumSafeUnlinkingTest)
dcc32 -NSWinapi -DMediumSafeUnlinkingTest tests\security\MediumSafeUnlinkingTest.dpr
tests\Win32\Debug\MediumSafeUnlinkingTest.exe

# FPU stack test (32-bit, with -dDisable32BitSSE)
dcc32 -NSWinapi -dDisable32BitSSE tests\security\FpuStackTest.dpr
tests\Win32\Debug\FpuStackTest.exe
```

### FreePascal (Linux/Windows)

```sh
# Integer overflow test
fpc -Mobjfpc -Sh -Sg -R+ -Q+ -Fi src -o/tmp/int_overflow tests/security/IntegerOverflowTest.dpr
/tmp/int_overflow

# Safe-unlinking test
fpc -Mobjfpc -Sh -Sg -dMediumSafeUnlinkingTest -Fi src -o/tmp/safe_unlink tests/security/MediumSafeUnlinkingTest.dpr
/tmp/safe_unlink

# FPU stack test (32-bit, guarded path)
fpc -B -Mdelphi -Twin32 -Pi386 -Fi src -dDisable32BitSSE tests/security/FpuStackTest.dpr
./FpuStackTest
```

## What each test validates

### IntegerOverflowTest

Verifies that `GetMem`/`ReallocMem` reject sizes near `High(NativeUInt)` that
would cause integer overflow when block overhead is added. This is the
CVE-2017-17426 class vulnerability. Tests cover:

- Normal 1 MB allocation succeeds
- `High(NativeUInt) - $FFFF` is rejected (overflow guard)
- `High(NativeUInt) - $56` is rejected (wraps to near-zero)
- `High(NativeUInt) - $FFFFF` (64-bit) / `$7FFF` (32-bit) is rejected
- `High(NativeUInt)` and `High(NativeUInt) - 1` are rejected
- `High(NativeInt)` is rejected
- FullDebugMode: sizes near the overhead boundary are rejected
- FullDebugMode: reallocation to a wrapping size preserves the original block

### MediumSafeUnlinkingTest

Verifies safe-unlinking protection (Issue #80). The test calls the internal
`FastMMTestMediumSafeUnlinking` entry point (compiled only when
`-dMediumSafeUnlinkingTest` is defined) with corruption modes:

- Mode 1: corrupt previous reciprocal link → must be rejected
- Mode 2: corrupt next reciprocal link → must be rejected
- Mode 3: foreign next pointer ownership → must be rejected
- Mode 4: foreign previous pointer ownership → must be rejected
- Mode 5: readable non-node pointer ownership → must be rejected
- Mode 6: null next pointer ownership → must be rejected
- Mode 7: misaligned previous pointer ownership → must be rejected
- Mode 0: valid list → must be accepted
- Normal medium block traffic → must succeed without corruption

### FpuStackTest

Verifies that 32-bit fixed-size move routines (Move36–Move68) do not corrupt
the x87 FPU stack (Issue #85). Loads seven values on the FPU stack, performs
small-block upsizes through every fixed-size move routine, and checks that:

- The FPU stack pointer is unchanged
- No stack fault or invalid operation is flagged
- Block contents are preserved through upsize
- The FPU control word is restored

## CI integration

The `.github/workflows/ci.yml` workflow compiles and runs
`IntegerOverflowTest` and `MediumSafeUnlinkingTest` with FPC on every
push/pull request.
