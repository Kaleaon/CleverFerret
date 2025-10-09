/**
 * Universal Media Library - Root Build Configuration
 * 
 * Top-level build file for project-wide plugin versions and configuration.
 * Individual module configurations are in their respective build.gradle.kts files.
 * 
 * Pinned Versions (per project standards):
 * - Kotlin: 1.9.23
 * - Android Gradle Plugin: 8.4.1
 * - Hilt: 2.51.1
 * - Gradle: 8.8
 */

plugins {
    id("com.android.application") version "8.13.0" apply false
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
    id("org.jetbrains.kotlin.kapt") version "2.2.20" apply false
    id("com.google.dagger.hilt.android") version "2.51.1" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "2.2.20" apply false
}
