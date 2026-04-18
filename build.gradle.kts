/**
 * Universal Media Library - Root Build Configuration
 *
 * Top-level build file for project-wide plugin versions and configuration.
 * Individual module configurations are in their respective build.gradle.kts files.
 *
 * Canonical toolchain versions:
 * - AGP/Kotlin/KSP/Hilt plugin versions: gradle/libs.versions.toml ([versions] + [plugins])
 * - Gradle runtime version: gradle/wrapper/gradle-wrapper.properties (distributionUrl)
 *
 * Upgrade procedure:
 * 1) Update plugin/tool versions in gradle/libs.versions.toml.
 * 2) Update Gradle wrapper via ./gradlew wrapper --gradle-version <version>.
 * 3) Run ./gradlew --version and ./gradlew help to validate the toolchain.
 * See docs/BUILD_TOOLCHAIN_VERSIONS.md for full details.
 */

plugins {
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.android) apply false
    alias(libs.plugins.ksp) apply false
    alias(libs.plugins.hilt) apply false
    alias(libs.plugins.kotlin.serialization) apply false
    alias(libs.plugins.kotlin.compose) apply false
}

allprojects {
    dependencyLocking {
        lockAllConfigurations()
    }
}
