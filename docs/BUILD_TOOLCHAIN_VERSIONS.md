# Build Toolchain Versions

This document defines the canonical locations for Gradle/Android/Kotlin build toolchain versions.

## Canonical Sources of Truth

- **AGP, Kotlin, KSP, Hilt plugin versions**: `gradle/libs.versions.toml` (`[versions]` + `[plugins]`).
- **Gradle wrapper runtime version**: `gradle/wrapper/gradle-wrapper.properties` (`distributionUrl`).

## Current Toolchain Matrix

| Tool | Version | Source |
| --- | --- | --- |
| Android Gradle Plugin (AGP) | `8.13.1` | `gradle/libs.versions.toml` (`versions.agp`, `plugins.android-application`) |
| Kotlin plugin | `2.1.0` | `gradle/libs.versions.toml` (`versions.kotlin`) |
| KSP plugin | `2.1.0-1.0.29` | `gradle/libs.versions.toml` (`versions.ksp`, `plugins.ksp`) |
| Hilt plugin | `2.53` | `gradle/libs.versions.toml` (`versions.hilt`, `plugins.hilt`) |
| Gradle wrapper | `8.13` | `gradle/wrapper/gradle-wrapper.properties` (`distributionUrl`) |

## Upgrade Procedure

1. Update plugin versions in `gradle/libs.versions.toml`:
   - `versions.agp`, `versions.kotlin`, `versions.ksp`, `versions.hilt`.
   - Keep `[plugins]` using `version.ref` so plugin aliases stay aligned.
2. Update Gradle wrapper:
   ```bash
   ./gradlew wrapper --gradle-version <new-version>
   ```
3. Verify wrapper and catalog consistency:
   - Ensure `versions.gradle-wrapper` matches the wrapper `distributionUrl` version.
4. Validate the toolchain:
   ```bash
   ./gradlew --version
   ./gradlew help
   ```

## Notes

- Do not duplicate pinned tool versions in `build.gradle.kts` comments.
- Use plugin aliases from the version catalog in top-level/module `plugins {}` blocks.

## Android SDK Discovery and `local.properties` Fallback

Builds discover Android SDK locations in the following order:

1. `ANDROID_HOME` or `ANDROID_SDK_ROOT` environment variables (preferred for CI).
2. Existing root `local.properties` (if present).
3. Bundled repository `android-sdk/` directory:
   - When no SDK env vars are set **and** `local.properties` does not exist, `settings.gradle.kts` auto-generates a root `local.properties` with `sdk.dir=<absolute path to android-sdk>`.
   - This file is intended as a local/CI fallback and is gitignored.
4. If none of the above are available, AGP falls back to its standard SDK discovery behavior and the build may fail until SDK is configured.
