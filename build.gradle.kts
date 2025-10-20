/**
 * Universal Media Library - Root Build Configuration
 * 
 * Top-level build file for project-wide plugin versions and configuration.
 * Individual module configurations are in their respective build.gradle.kts files.
 * 
 * Pinned Versions (per project standards):
 * - Kotlin: 2.0.20
 * - Android Gradle Plugin: 8.13.0
 * - Hilt: 2.52
 * - Gradle: 8.13
 */

plugins {
    id("com.android.application") version "8.13.0" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
    id("com.google.devtools.ksp") version "2.0.20-1.0.25" apply false
    id("com.google.dagger.hilt.android") version "2.52" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.2.20" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.2.20" apply false
}
