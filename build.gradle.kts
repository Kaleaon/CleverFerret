/**
 * Universal Media Library - Root Build Configuration
 * 
 * Top-level build file for project-wide plugin versions and configuration.
 * Individual module configurations are in their respective build.gradle.kts files.
 * 
 * Pinned Versions (per project standards):
 * - Kotlin: 2.1.0
 * - Android Gradle Plugin: 8.13.0
 * - Hilt: 2.53
 * - Gradle: 8.13
 */

plugins {
    id("com.android.application") version "8.13.0" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
    id("com.google.devtools.ksp") version "2.1.0-1.0.29" apply false
    id("com.google.dagger.hilt.android") version "2.53" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.1.0" apply false
    id("org.jetbrains.kotlin.plugin.compose") version "2.1.0" apply false
}
