# Gradle-Integrated Git Pre-Commit Hooks

## Overview

To maintain code quality and prevent avoidable remote CI failures, CleverFerret uses a Gradle-integrated Git hook generator. This tool automatically installs and manages a local `.git/hooks/pre-commit` script with zero external tool dependencies.

---

## Automatic & Manual Installation

- **Automatic Setup:** Running any Gradle build or project sync automatically installs and updates `.git/hooks/pre-commit` if the `.git` repository directory exists.
- **Manual Installation:** You can manually install or regenerate the pre-commit hook at any time by running:
  ```bash
  ./gradlew installGitHooks
  ```

---

## Pre-Commit Checks Executed

When you run `git commit`, `.git/hooks/pre-commit` executes the following static analysis checks on staged changes:

1. **Detekt Static Analysis:**
   - Command: `./gradlew detektMain`
   - Purpose: Enforces Kotlin code quality, style, and complexity rules defined in `config/detekt/detekt.yml`.
   - Rule violations block commits.

2. **Raw Console Usage Guardrail:**
   - Command: `./scripts/check-no-raw-console.sh` (or `./gradlew checkNoRawConsole`)
   - Purpose: Prevents hardcoded `console.log` or raw `println` calls in production source code paths (`CleverFerret/src/main`).

3. **Documentation Link Validation:**
   - Command: `./scripts/ci/check_doc_links.py` (or `./gradlew checkDocLinks`)
   - Purpose: Ensures local markdown documentation links under `docs/` point to valid targets.

---

## Target File Input Filtering & Performance

To keep local commits fast:
- The hook inspects staged files (`git diff --cached --name-only`).
- If no Kotlin (`.kt`/`.kts`) files are staged, Kotlin compilation checks are skipped.
- Executing with a warm Gradle daemon completes within **10 seconds**.
- Checks are read-only and will NOT modify untracked files or corrupt the Git staging index.

---

## Missing Android SDK Handling

In environments where the Android SDK is not installed or configured (e.g., non-Android workstations or documentation-only check environments):
- The hook detects the missing Android SDK environment (`ANDROID_HOME`, `ANDROID_SDK_ROOT`, or `local.properties`).
- It outputs a warning: `⚠️ Android SDK not found. Skipping Detekt compilation check; running non-SDK checks.`
- It continues executing non-SDK checks (`check-no-raw-console.sh` and `check_doc_links.py`).

---

## Direct Gradle Verification Tasks

You can run individual checks directly using Gradle:

```bash
# Run Detekt static analysis
./gradlew detektMain

# Check for raw console usage in production source
./gradlew checkNoRawConsole

# Validate documentation links
./gradlew checkDocLinks

# Run all verification checks
./gradlew checkNoRawConsole checkDocLinks detektMain
```
