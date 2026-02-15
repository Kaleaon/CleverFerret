# Android Lint Workflow

This project enforces stricter lint behavior in CI and release-oriented builds while allowing local developer flexibility.

## Policy summary

- `checkReleaseBuilds = true` so release variants are always linted.
- `abortOnError` is enabled by default when:
  - CI is running (`CI=true`), or
  - a release task is requested (task name contains `release`).
- Existing issues are tracked in `CleverFerret/lint-baseline.xml`.
  - Baseline issues are tolerated as legacy debt.
  - New issues fail lint in CI/release.

## Local development

Run lint locally without failing the build:

```bash
./gradlew lintDebug -Plint.abortOnError=false
```

Run lint locally with CI-equivalent strictness:

```bash
./gradlew lintDebug -Plint.abortOnError=true
```

Regenerate baseline intentionally (for debt reconciliation only):

```bash
./gradlew updateLintBaseline
```

## Suppression policy

Before suppressing, prefer fixing the root issue. If suppression is needed:

1. Scope suppression as narrowly as possible (line > file > module).
2. Add a short reason in code (`@SuppressLint`) or `lint.xml` comments.
3. Avoid blanket `all` suppressions unless there is a documented tooling limitation.
4. Do not use baseline updates to hide newly introduced issues in active code paths.

## CI artifacts

CI uploads lint artifacts for review:

- HTML report (`lint-results-*.html`)
- XML report (`lint-results-*.xml`)
- Text report (`lint-results-*.txt`)
- Current `lint-baseline.xml`
