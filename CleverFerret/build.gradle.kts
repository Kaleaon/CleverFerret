/**
 * CleverFerret Module Build Configuration
 * 
 * Universal Media Library - Android application module
 * Architecture: Kotlin + Jetpack Compose + Material 3 + Hilt + Room
 */

import java.io.File
import java.util.Base64
import java.util.Properties

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("com.google.devtools.ksp")
    id("com.google.dagger.hilt.android")
    id("org.jetbrains.kotlin.plugin.serialization")
    id("org.jetbrains.kotlin.plugin.compose")
    id("com.mikepenz.aboutlibraries.plugin") version "13.2.1"
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

    // =========================================================================
    // Signing (required for update-compatible installs)
    //
    // IMPORTANT:
    // - Android updates require the *same* package name (applicationId) AND the *same* signing key.
    // - If different machines generate different debug keystores, installs will fail with
    //   "conflicting package" / INSTALL_FAILED_UPDATE_INCOMPATIBLE.
    //
    // CI-friendly release signing uses the secrets described in scripts/setup-automated-builds.sh:
    // - KEYSTORE_BASE64, KEYSTORE_PASSWORD, KEY_ALIAS, KEY_PASSWORD
    // =========================================================================
    val keystoreBase64Raw: String? =
        System.getenv("KEYSTORE_BASE64") ?: (project.findProperty("KEYSTORE_BASE64") as String?)
    val keystorePassword: String? =
        System.getenv("KEYSTORE_PASSWORD") ?: (project.findProperty("KEYSTORE_PASSWORD") as String?)
    val keyAlias: String? =
        System.getenv("KEY_ALIAS") ?: (project.findProperty("KEY_ALIAS") as String?)
    val keyPassword: String? =
        System.getenv("KEY_PASSWORD") ?: (project.findProperty("KEY_PASSWORD") as String?)

    val releaseKeystoreFile: File? = if (
        !keystoreBase64Raw.isNullOrBlank() &&
        !keystorePassword.isNullOrBlank() &&
        !keyAlias.isNullOrBlank() &&
        !keyPassword.isNullOrBlank()
    ) {
        val keystoreFile = File(rootProject.layout.buildDirectory.asFile.get(), "keystores/cleverferret-release.jks")
        keystoreFile.parentFile?.mkdirs()
        val cleanB64 = keystoreBase64Raw.replace("\\s".toRegex(), "")
        keystoreFile.writeBytes(Base64.getDecoder().decode(cleanB64))
        keystoreFile
    } else {
        null
    }

    signingConfigs {
        // debug config is provided by AGP automatically
        if (releaseKeystoreFile != null) {
            create("release") {
                storeFile = releaseKeystoreFile
                storePassword = keystorePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
            }
        } else {
            println("⚠️  Release signing not configured. Set KEYSTORE_* env vars for update-compatible releases.")
        }
    }

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26  // Android 8.0+ for broad device compatibility
        targetSdk = 36  // Android 15 (latest)
        versionCode = 49

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
        
        // Enable BuildConfig generation
        buildConfigField("String", "VERSION_NAME", "\"${versionName}\"")
        buildConfigField("int", "VERSION_CODE", "${versionCode}")

        // Load API keys from secrets.properties (fallback to default for development)
        val secretsFile = rootProject.file("secrets.properties")
        val secrets = Properties()
        if (secretsFile.exists()) {
            secrets.load(secretsFile.inputStream())
        }
        
        val tasteDiveKey = secrets.getProperty("TASTEDIVE_API_KEY") 
            ?: project.properties["TASTEDIVE_API_KEY"] as String? 
            ?: "1062990-CleverFe-17BF9586" // Default dev key
        buildConfigField("String", "TASTEDIVE_API_KEY", "\"$tasteDiveKey\"")

        val nytApiKey = project.properties["NYT_API_KEY"] ?: ""
        buildConfigField("String", "NYT_API_KEY", "\"$nytApiKey\"")

        val nytApiSecret = project.properties["NYT_API_SECRET"] ?: ""
        buildConfigField("String", "NYT_API_SECRET", "\"$nytApiSecret\"")

        val nytAppId = project.properties["NYT_APP_ID"] ?: ""
        buildConfigField("String", "NYT_APP_ID", "\"$nytAppId\"")
    }

    buildTypes {
        debug {
            isDebuggable = true
            isMinifyEnabled = false
            applicationIdSuffix = ".debug"
            versionNameSuffix = "-debug"
            
            // Debug-specific BuildConfig fields
            buildConfigField("boolean", "DEBUG_REPORTING_ENABLED", "true")
            buildConfigField("boolean", "CRASH_REPORTING_ENABLED", "true")
            buildConfigField("boolean", "SHOW_DEBUG_MENU", "true")
            buildConfigField("String", "BUILD_TIME", "\"${System.currentTimeMillis()}\"")
            buildConfigField("String", "GIT_COMMIT", "\"${getGitCommitHash()}\"")
        }
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )

            // Use stable release key if configured; otherwise fall back to debug signing for local builds.
            // NOTE: debug signing will not be update-compatible across different machines.
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
            
            // Release-specific BuildConfig fields
            buildConfigField("boolean", "DEBUG_REPORTING_ENABLED", "false")
            buildConfigField("boolean", "CRASH_REPORTING_ENABLED", "false")
            buildConfigField("boolean", "SHOW_DEBUG_MENU", "false")
            buildConfigField("String", "BUILD_TIME", "\"${System.currentTimeMillis()}\"")
            buildConfigField("String", "GIT_COMMIT", "\"${getGitCommitHash()}\"")
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
            excludes += "/META-INF/DEPENDENCIES"
            excludes += "/META-INF/LICENSE*"
            excludes += "/META-INF/NOTICE*"
            excludes += "/META-INF/*.md"
            excludes += "/META-INF/*.txt"
            // Note: Excluding *.properties may remove some library metadata, but is needed to resolve
            // packaging conflicts. If runtime issues occur, consider being more specific.
            excludes += "/META-INF/*.properties"
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

fun getGitCommitHash(): String {
    return try {
        val process = ProcessBuilder("git", "rev-parse", "--short", "HEAD")
            .redirectErrorStream(true)
            .start()
        process.inputStream.bufferedReader().readText().trim()
    } catch (e: Exception) {
        "unknown"
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


    // Document parsing libraries
    implementation(libs.apache.poi.ooxml) {
        exclude(group = "commons-logging", module = "commons-logging")
    }
    implementation(libs.apache.poi.scratchpad) {
        exclude(group = "commons-logging", module = "commons-logging")
    }
    implementation(libs.apache.tika.core) {
        exclude(group = "commons-logging", module = "commons-logging")
    }
    implementation(libs.apache.tika.parsers) {
        exclude(group = "commons-logging", module = "commons-logging")
    }
    implementation(libs.lib.mobi.core)

    // Parsing & data utilities
    implementation(libs.jsoup)
    implementation(libs.kotlin.csv)

    // Security & authentication
    implementation(libs.androidx.security.crypto)
    implementation(libs.androidx.biometric)

    // Background work
    implementation(libs.androidx.work.runtime.ktx)
    implementation(libs.androidx.hilt.work)
    ksp(libs.androidx.hilt.compiler)

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

    // Model Context Protocol (MCP) SDK for AI memory expansion
    implementation(libs.mcp.kotlin.sdk)
    
    // Ktor client (required for MCP SDK)
    implementation(libs.ktor.client.core)
    implementation(libs.ktor.client.okhttp)
    implementation(libs.ktor.client.content.negotiation)
    implementation(libs.ktor.serialization.kotlinx.json)

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

// Version helper tasks for CI (printVersionCode, incrementVersionCode, etc.)
apply(from = "version.gradle")