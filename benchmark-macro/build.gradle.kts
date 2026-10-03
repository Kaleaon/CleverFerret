/**
 * :benchmark-macro placeholder.
 *
 * Phase 0 step 8 of docs/planning/PREMIERE_ROADMAP.md scaffolds this
 * module so `./gradlew :benchmark-macro:assemble` succeeds. Real
 * macro-benchmark wiring (com.android.test + androidx.benchmark) is
 * deferred until Phase 1, when cold-start benchmarks land.
 *
 * Until then, this module compiles as an empty Android library with
 * no production code, providing the include path required by tests
 * and CI workflows.
 */

plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.universalmedialibrary.benchmark"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }
}
