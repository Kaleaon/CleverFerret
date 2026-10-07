# Developer and Automated Agent Guidance for CleverFerret

This document provides guidelines and commands for software engineers and automated AI coding agents working on the CleverFerret codebase.

---

## 1. Static Analysis Guardrails (Detekt)

CleverFerret uses [Detekt](https://detekt.dev/) for static code analysis across all Kotlin source files.

### Configuration
* **Rules configuration:** Centralized in `config/detekt/detekt.yml`.
* **Plugin version:** Declared in `gradle/libs.versions.toml` (`1.23.8`) and applied in root `build.gradle.kts`, `CleverFerret/build.gradle.kts`, and `CleverFerretV2/build.gradle.kts`.
* **Governance policy:** Complexity and `style.MagicNumber` rules remain active and non-baselined per team policy.

### Local Execution Commands
* **Run static analysis:**
  ```bash
  ./gradlew detekt
  ```
* **Run static analysis on CleverFerretV2 modules:**
  ```bash
  ./gradlew -p CleverFerretV2 detekt
  ```
* **Regenerate baseline (when authorized):**
  ```bash
  ./gradlew detektBaseline
  ```

### Generated Reports
Running `./gradlew detekt` outputs report artifacts to `CleverFerret/build/reports/detekt/`:
* `detekt.html` - Human-readable HTML summary report.
* `detekt.xml` - Checkstyle XML report.
* `detekt.sarif` - SARIF format report for code scanning tools.

### Continuous Integration (CI)
* The `.github/workflows/static-analysis.yml` pipeline triggers `./gradlew detekt` on every push and pull request.
* Workflow artifacts (`detekt-reports`) containing HTML, XML, and SARIF files are preserved for each run.

---

## 2. Toolchain & CI Pipeline Standards

### Android SDK & Toolchain Versions
* **Android SDK Build-Tools:** Standardized to `34.0.0` across all CI workflows (`main.yml`, `static-analysis.yml`, `accessibility-checks.yml`).
* **Android Compile SDK:** `36` (Android 15).
* **JDK Runtime:** Supported Java runtime range is JDK 17 to JDK 21.

### Concurrency Policy
All PR workflows include top-level concurrency cancellation to terminate superseded runs when new commits arrive:
```yaml
concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true
```

---

## 3. Pre-Commit Checklist

Before opening or updating a Pull Request, verify:
1. Local detekt scan passes: `./gradlew detekt`
2. Local unit tests pass: `./gradlew testDebugUnitTest`
3. Build completes cleanly: `./gradlew assembleDebug`
