plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("org.jetbrains.kotlin.plugin.compose")


    id("com.google.devtools.ksp")
    id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization") version "2.1.0"
    id("com.diffplug.spotless")


}

// Apply version management script
apply(from = "version.gradle")

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 36

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26
        targetSdk = 36
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
    }

    signingConfigs {
        create("release") {
            // Read signing configuration from environment variables or gradle properties
            storeFile = System.getenv("KEYSTORE_FILE")?.let { file(it) }
                ?: findProperty("KEYSTORE_FILE")?.let { file(it.toString()) }
            storePassword = System.getenv("KEYSTORE_PASSWORD")?.toString()
                ?: findProperty("KEYSTORE_PASSWORD")?.toString()
            keyAlias = System.getenv("KEY_ALIAS")?.toString()
                ?: findProperty("KEY_ALIAS")?.toString()
            keyPassword = System.getenv("KEY_PASSWORD")?.toString()
                ?: findProperty("KEY_PASSWORD")?.toString()
        }
    }

    buildTypes {
        release {
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            // Use signing config if available, otherwise APK will be unsigned
            if (signingConfigs.findByName("release")?.storeFile != null) {
                signingConfig = signingConfigs.getByName("release")
            }
        }
        debug {
            // Debug builds use default debug signing
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-debug"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
            freeCompilerArgs.add("-opt-in=androidx.compose.material3.ExperimentalMaterial3Api")
        }
    }
    buildFeatures {
        compose = true
    }




    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.11"
    }


    lint {
        abortOnError = false
        warningsAsErrors = false
        checkReleaseBuilds = false
        ignoreWarnings = true
        quiet = true

        // Disable problematic lint checks
        disable += setOf(
            "MissingTranslation",
            "ExtraTranslation",
            "HardcodedText",
            "ContentDescription",
            "UnusedResources",
            "IconMissingDensityFolder",
            "IconDensities",
            "VectorDrawableCompat",
            "Deprecated",
            "ObsoleteLintCustomCheck",
            "GradleDeprecated",
            "NewApi",
            "OldTargetApi",
            "DefaultLocale"
        )
    }

    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.17.0")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.9.4")
    implementation("androidx.activity:activity-compose:1.11.0")

    implementation(platform("androidx.compose:compose-bom:2025.09.01"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")

    implementation("com.google.android.material:material:1.12.0")

    implementation("androidx.navigation:navigation-compose:2.9.5")
    implementation("androidx.hilt:hilt-navigation-compose:1.3.0")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.9.4")
    implementation("androidx.datastore:datastore-preferences:1.1.7")
    implementation("androidx.documentfile:documentfile:1.1.0")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.3")

    // Hilt dependency injection - Updated to modern version
    implementation("com.google.dagger:hilt-android:2.52")
    ksp("com.google.dagger:hilt-compiler:2.52")


    // ViewModel and LiveData
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.9.4")
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:2.9.4")

    // Room database - Updated to modern version
    implementation("androidx.room:room-runtime:2.8.1")
    implementation("androidx.room:room-ktx:2.8.1")
    ksp("androidx.room:room-compiler:2.8.1")



    // Basic networking - Updated
    implementation("com.squareup.retrofit2:retrofit:2.11.0")
    implementation("com.squareup.retrofit2:converter-gson:2.11.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")

    // HTML parsing for EPUB and web scraping
    implementation("org.jsoup:jsoup:1.17.2")

    // XML parsing for Plex API
    implementation("com.tickaroo.tikxml:annotation:0.8.13")
    implementation("com.tickaroo.tikxml:core:0.8.13")
    implementation("com.tickaroo.tikxml:retrofit-converter:0.8.13")

    // ML Kit for OCR and text recognition
    implementation("com.google.mlkit:text-recognition:16.0.0")
    implementation("com.google.mlkit:entity-extraction:16.0.0-beta5")

    // Gemini AI - PRIMARY AI SERVICE for all devices
    // Cloud-based processing via Google's Gemini API
    implementation("com.google.ai.client.generativeai:generativeai:0.1.2")

    // MediaPipe for Gemma LLM - PLUGIN APP ONLY
    // On-device processing for high-end devices
    // Will be moved to separate downloadable plugin app
    // implementation("com.google.mediapipe:tasks-genai:latest.release")  // Uncomment when available

    // HTML parsing for web scraping
    implementation("org.jsoup:jsoup:1.17.2")

    // Security for encrypted token storage
    implementation("androidx.security:security-crypto:1.1.0-alpha06")

    // Biometric authentication
    implementation("androidx.biometric:biometric:1.4.0-alpha02")

    // WorkManager for background tasks
    implementation("androidx.work:work-runtime-ktx:2.10.0")
    implementation("androidx.hilt:hilt-work:1.3.0")

    // Image loading - Use stable version
    implementation("io.coil-kt:coil-compose:2.7.0")

    // Embedded HTTP server for OPDS
    implementation("org.nanohttpd:nanohttpd:2.3.1")


    // Basic media - Use stable versions
    implementation("androidx.media:media:1.7.1")
    implementation("androidx.media3:media3-exoplayer:1.8.0")
    implementation("androidx.media3:media3-ui:1.8.0")
    implementation("androidx.media3:media3-session:1.8.0")
    implementation("androidx.media3:media3-cast:1.8.0")

    // Google Cast SDK for Chromecast
    implementation("com.google.android.gms:play-services-cast-framework:21.5.0")
    implementation("com.google.android.gms:play-services-cast:21.5.0")

    // File handling
    implementation("androidx.documentfile:documentfile:1.1.0")

    // Archives: RAR (CBR) support for comic reader
    implementation("com.github.junrar:junrar:7.5.4")

    // Glance for widgets
    implementation("androidx.glance:glance-appwidget:1.1.1")
    implementation("androidx.glance:glance-material3:1.1.1")

    // Serialization - Already updated above

    // Testing - Updated
    testImplementation("junit:junit:4.13.2")

    testImplementation("io.mockk:mockk:1.13.8")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.7.3")
    androidTestImplementation("androidx.test.ext:junit:1.2.1")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.6.1")

    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}

spotless {
    kotlin {
        target("src/main/**/*.kt")
        targetExclude("**/build/**", "**/generated/**")
        // Use basic formatting rules only
        trimTrailingWhitespace()
        endWithNewline()
        indentWithSpaces(4)
    }
    kotlinGradle {
        target("*.gradle.kts")
        trimTrailingWhitespace()
        endWithNewline()
        indentWithSpaces(4)
    }
    format("xml") {
        target("src/main/res/**/*.xml")
        trimTrailingWhitespace()
        endWithNewline()
        indentWithSpaces(4)
    }
}
