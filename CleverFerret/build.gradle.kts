/**
 * CleverFerret Module Build Configuration
 * 
 * Universal Media Library - Android application module
 * Architecture: Kotlin + Jetpack Compose + Material 3 + Hilt + Room
 */

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("com.google.devtools.ksp")
    id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization")
    id("org.jetbrains.kotlin.plugin.compose")
    id("com.mikepenz.aboutlibraries.plugin") version "12.2.4"
}

configurations.all {
    resolutionStrategy {
        force("org.jetbrains.kotlin:kotlin-stdlib:2.1.0")
        force("org.jetbrains.kotlin:kotlin-stdlib-jdk8:2.1.0")
        force("org.jetbrains.kotlin:kotlin-stdlib-jdk7:2.1.0")
        force("org.jetbrains.kotlin:kotlin-stdlib-common:2.1.0")
    }
}

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 36  // Android 15 (API 36) - Required by androidx.core:core:1.17.0 and other latest dependencies

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26  // Android 8.0+ for broad device compatibility
        targetSdk = 36  // Android 15 (latest)
        versionCode = 9
        versionName = "1.6.5"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
        
        // Enable BuildConfig generation
        buildConfigField("String", "VERSION_NAME", "\"${versionName}\"")
        buildConfigField("int", "VERSION_CODE", "${versionCode}")

        val tasteDiveKey = project.properties["TASTEDIVE_API_KEY"] ?: "1062990-CleverFe-17BF9586"
        buildConfigField("String", "TASTEDIVE_API_KEY", "\"$tasteDiveKey\"")
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        isCoreLibraryDesugaringEnabled = true
    }
    kotlinOptions {
        jvmTarget = "11"
        freeCompilerArgs += listOf(
            "-opt-in=androidx.compose.material3.ExperimentalMaterial3Api"
        )
    }
    buildFeatures {
        compose = true
        buildConfig = true
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
    
    lint {
        abortOnError = false
        checkReleaseBuilds = false
        lintConfig = file("lint.xml")
        htmlReport = true
        xmlReport = true
        textReport = true
        htmlOutput = file("build/reports/lint-results-debug.html")
        xmlOutput = file("build/reports/lint-results-debug.xml")
        textOutput = file("build/reports/lint-results-debug.txt")
    }
}

dependencies {
    // Core library desugaring (required for Readium and other libraries using Java 8+ APIs)
    coreLibraryDesugaring(libs.desugar.jdk.libs)

    // Core Android
    implementation(libs.androidx.core.ktx)
    implementation(libs.androidx.appcompat)
    implementation(libs.androidx.lifecycle.runtime.ktx)
    implementation(libs.androidx.activity.compose)

    // Compose BOM and core components
    implementation(enforcedPlatform(libs.androidx.compose.bom))
    implementation(libs.androidx.compose.ui)
    implementation(libs.androidx.compose.ui.graphics)
    implementation(libs.androidx.compose.ui.tooling.preview)
    implementation(libs.androidx.compose.foundation)
    implementation(libs.androidx.compose.material3)
    implementation(libs.androidx.compose.material.icons.extended)

    // Navigation
    implementation(libs.androidx.navigation.compose)
    implementation(libs.androidx.hilt.navigation.compose)

    // Hilt dependency injection
    implementation(libs.hilt.android)
    ksp(libs.hilt.compiler)

    // ViewModel and LiveData
    implementation(libs.androidx.lifecycle.viewmodel.compose)
    implementation(libs.androidx.lifecycle.livedata.ktx)
    implementation(libs.androidx.lifecycle.runtime.compose)

    // Room database
    implementation(libs.androidx.room.runtime)
    implementation(libs.androidx.room.ktx)
    ksp(libs.androidx.room.compiler)

    // DataStore for settings persistence
    implementation(libs.androidx.datastore.preferences)

    // Networking & serialization
    implementation(libs.retrofit)
    implementation(libs.retrofit.converter.gson)
    implementation(libs.okhttp.logging.interceptor)
    implementation(libs.retrofit.serialization.converter)
    implementation(libs.okhttp)

    // Media server integrations & network storage
    implementation(libs.jellyfin.core)
    implementation(libs.jcifs.ng)

    // Image loading & UI utilities
    implementation(libs.coil.compose)
    implementation(libs.androidx.palette)

    // Media playback
    implementation(libs.androidx.media)
    implementation(libs.androidx.media3.exoplayer)
    implementation(libs.androidx.media3.ui)
    implementation(libs.androidx.media3.session)
    implementation(libs.androidx.media3.exoplayer.midi)

    // File handling & serialization
    implementation(libs.androidx.documentfile)
    implementation(libs.kotlinx.serialization.json)

    // Widgets
    implementation(libs.androidx.glance.appwidget)
    implementation(libs.androidx.glance.material3)

    // Archive formats
    implementation(libs.junrar)
    implementation(libs.commons.compress)
    implementation(libs.xz)

    // Parsing & data utilities
    implementation(libs.jsoup)
    implementation(libs.kotlin.csv)

    // Security & authentication
    implementation(libs.androidx.security.crypto)
    implementation(libs.androidx.biometric)

    // Background work
    implementation(libs.androidx.work.runtime.ktx)

    // User experience helpers
    implementation(libs.customactivityoncrash)
    implementation(libs.swipe)
    implementation(libs.taptargetcompose)
    implementation(libs.aboutlibraries.core)
    implementation(libs.aboutlibraries.compose.m3)

    // Embedded HTTP server
    implementation(libs.nanohttpd)

    // Google Cast SDK
    implementation(libs.google.cast.framework)
    implementation(libs.androidx.media3.cast)

    // Barcode scanning
    implementation(libs.journeyapps.zxing.android.embedded)
    implementation(libs.google.zxing.core)

    // Charts
    implementation(libs.mpandroidchart)

    // Generative AI
    implementation(libs.gemini.ai)

    // Media metadata extraction
    implementation(libs.ffmpegmediametadataretriever.core)
    implementation(libs.ffmpegmediametadataretriever.native)

    // On-device OCR
    implementation(libs.mlkit.text.recognition) // Latin script
    implementation(libs.mlkit.text.recognition.chinese) // Chinese
    implementation(libs.mlkit.text.recognition.devanagari) // Devanagari
    implementation(libs.mlkit.text.recognition.japanese) // Japanese
    implementation(libs.mlkit.text.recognition.korean) // Korean
    implementation(libs.kotlinx.coroutines.play.services)

    // Readium Kotlin Toolkit - Modern EPUB, PDF, Audiobook library
    implementation(libs.readium.shared)
    implementation(libs.readium.streamer)
    implementation(libs.readium.navigator)
    implementation(libs.readium.opds)

    // MIDI support - ktmidi for Kotlin MIDI 1.0/2.0 support
    implementation(libs.ktmidi.android)

    // Testing
    testImplementation(libs.junit)
    testImplementation(libs.mockito.core)
    testImplementation(libs.mockito.kotlin)
    testImplementation(libs.kotlinx.coroutines.test)
    testImplementation(libs.androidx.test.core)
    testImplementation(libs.androidx.test.core.ktx)
    testImplementation(libs.arch.core.testing)
    testImplementation(libs.androidx.test.ext.junit)
    testImplementation(libs.androidx.test.ext.junit.ktx)
    testImplementation(libs.google.truth)
    testImplementation(libs.mockk)
    testImplementation(libs.mockk.android)
    testImplementation(libs.robolectric)

    androidTestImplementation(libs.androidx.test.ext.junit)
    androidTestImplementation(libs.androidx.test.espresso.core)
    androidTestImplementation(enforcedPlatform(libs.androidx.compose.bom))
    androidTestImplementation(libs.androidx.compose.ui.test.junit4)
    androidTestImplementation(libs.mockito.android)
    androidTestImplementation(libs.mockk.android)

    debugImplementation(libs.androidx.compose.ui.tooling)
    debugImplementation(libs.androidx.compose.ui.test.manifest)
}

// Apply publishing configuration for GitHub Packages
apply(from = "publish.gradle")