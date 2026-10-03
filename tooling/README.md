# Tooling

This directory contains build and development automation scripts.

- `tooling/build-scripts/`: Build setup and verification helpers.
- `tooling/scripts/`: Release, maintenance, and utility automation.

When adding new developer automation, place it in `tooling/` instead of creating new top-level script folders.

## Build-log handling policy

Contributor-facing diagnostics should use generated artifacts, not mutable root logs.

- Generate local logs in `archive/development-artifacts/`.
- Include commit SHA + UTC timestamp in filenames.
- Prefer CI workflow artifacts for PR review and debugging handoff.

Recommended command pattern:

```bash
COMMIT_SHA=$(git rev-parse --short HEAD)
TS=$(date -u +%Y%m%dT%H%M%SZ)
./gradlew clean :CleverFerret:assembleDebug --no-daemon --stacktrace \
  | tee "archive/development-artifacts/clean-build-${COMMIT_SHA}-${TS}.log"
```
