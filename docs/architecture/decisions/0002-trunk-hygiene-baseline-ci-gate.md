# ADR 0002 — Trunk hygiene baseline & CI gate forensics

## Status

Accepted (2026-05-02)

## Context

The Premiere roadmap Phase 0 (`docs/planning/PREMIERE_ROADMAP.md`)
documents that compile-broken code reached `main` despite `main.yml`
defining `compileDebugKotlin`, `testDebugUnitTest`,
`jacocoCriticalCoverageVerification`, and `lintDebug` jobs.
Forensic check confirmed that:

- `.github/workflows/main.yml` ran `testDebugUnitTest --continue` with
  `continue-on-error: true`, allowing failures to slip through silently.
- `assembleDebug` and `assembleRelease` carried `--continue` and
  `continue-on-error: true`, weakening the build gate.
- `jacocoCriticalCoverageVerification` enforced a 30% line-coverage
  floor against ~2.5% measured coverage, causing the gate to be either
  permanently red (and ignored) or bypassed.

## Decision

1. Strip `--continue` from compile/test/build steps in `main.yml`.
2. Remove `continue-on-error: true` from compile, unit-tests, debug
   APK build, and release APK build steps. Leave it on the version
   reader and APK signing steps where transient failure should not
   block the workflow.
3. Reset `jacocoCriticalCoverageVerification` `minimum` to `0.025` —
   the present floor — so it functions as a regression gate. Phase 2
   raises it to 0.15, Phase 4 to 0.30, Phase 5 to 0.40.
4. Adopt Detekt under `config/detekt/detekt.yml`. Do **not** baseline
   `complexity` or `style.MagicNumber` so warnings remain visible.
5. Add `app.cash.turbine` to the version catalog as the canonical
   `StateFlow` test helper.

## Consequences

- Compile, test, lint, and coverage failures now block merge.
- Branch protection (separately documented in
  `docs/governance/branch-protection.json`) declares `test`,
  `static-analysis`, and `accessibility-checks` as required checks.
- Solo-maintainer break-glass is documented in
  `docs/governance/break-glass.md`.
- Coverage ratchet means later phases lift the floor without ever
  lowering it.

## Supersedes

None.
