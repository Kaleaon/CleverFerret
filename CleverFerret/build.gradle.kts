plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("kotlin-kapt")
    id("com.google.dagger.hilt.android")
    id("jacoco")
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.24"
}

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 24
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
    }

    signingConfigs {
        // Debug signing - use default Android debug keystore
        getByName("debug") {
            // Android Gradle Plugin handles debug signing automatically
            // Uses ~/.android/debug.keystore with default credentials
        }
        
        // Release signing configuration
        // Keystore should be stored securely, not in repository
        // For CI/CD: use GitHub Secrets to provide environment variables
        // For local development: set environment variables or use gradle.properties
        val keystoreFile = System.getenv("KEYSTORE_FILE")?.let { file(it) }
            ?: file("release.keystore") // Local fallback (not in repo)
        val keystorePassword = System.getenv("KEYSTORE_PASSWORD")
        val keyAlias = System.getenv("KEY_ALIAS") ?: "androidreleasekey"
        val keyPassword = System.getenv("KEY_PASSWORD") ?: keystorePassword
        
        // Only create release signing config if all required properties are available
        if (keystoreFile?.exists() == true && !keystorePassword.isNullOrEmpty()) {
            create("release") {
                storeFile = keystoreFile
                storePassword = keystorePassword
                this.keyAlias = keyAlias
                this.keyPassword = keyPassword
                
                // Validate signing configuration
                println("✓ Release signing configured with keystore: ${keystoreFile.name}")
                println("✓ Using key alias: $keyAlias")
            }
        } else {
            println("⚠️  Release signing not configured - missing keystore or credentials")
            println("   For production builds, ensure KEYSTORE_FILE, KEYSTORE_PASSWORD are set")
            println("   Keystore path: ${keystoreFile?.absolutePath ?: "not specified"}")
            println("   Password provided: ${if (keystorePassword.isNullOrEmpty()) "no" else "yes"}")
        }
    }

    buildTypes {
        debug {
            // Use default debug signing config
            signingConfig = signingConfigs.getByName("debug")
        }
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            
            // Configure release signing
            val releaseSigningConfig = signingConfigs.findByName("release")
            if (releaseSigningConfig != null) {
                signingConfig = releaseSigningConfig
                println("✓ Release build will be signed with release keystore")
            } else {
                // For development builds without release keystore, use debug signing
                // This allows local development without requiring production keystore
                signingConfig = signingConfigs.getByName("debug")
                applicationIdSuffix = ".unsigned"
                versionNameSuffix = "-unsigned"
                println("⚠️  Release build using debug signing (unsigned for production)")
                println("   This APK should not be distributed to users")
            }
        }
    }
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }
    kotlinOptions {
        jvmTarget = "1.8"
    }
    buildFeatures {
        compose = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.13"
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
        }
    }
    
    // Lint configuration
    lint {
        abortOnError = false
        warningsAsErrors = false
        checkReleaseBuilds = false
        ignoreWarnings = true
        quiet = true
        
        // Disable specific lint checks that commonly cause issues
        disable += setOf(
            "MissingTranslation",
            "ExtraTranslation", 
            "HardcodedText",
            "ContentDescription",
            "UnusedResources",
            "IconMissingDensityFolder",
            "IconDensities",
            "VectorDrawableCompat",
            "NewApi",
            "ObsoleteLintCustomCheck",
            "BanUncheckedReflection",
            "SuspiciousCompositionLocalModifierRead"
        )
        
        // Set specific issues to warning instead of error
        warning += setOf(
            "InvalidPackage",
            "TrustAllX509TrustManager", 
            "BadHostnameVerifier",
            "AllowBackup",
            "GoogleAppIndexingWarning"
        )
        
        // Use custom lint.xml configuration
        lintConfig = file("lint.xml")
        
        // Output options
        textReport = true
        xmlReport = true
        htmlReport = true
        
        textOutput = file("build/reports/lint-results.txt")
        xmlOutput = file("build/reports/lint-results.xml") 
        htmlOutput = file("build/reports/lint-results.html")
    }
    
    // Required for Robolectric to access resources
    testOptions {
        unitTests {
            isIncludeAndroidResources = true
        }
    }
}

// Apply additional build scripts
apply(from = "publish.gradle")
apply(from = "version.gradle")

kapt {
    correctErrorTypes = true
}

dependencies {
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.sqlite:sqlite-ktx:2.4.0")
    implementation("androidx.activity:activity-compose:1.9.0")
    implementation(platform("androidx.compose:compose-bom:2024.05.00"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.0")
    implementation("androidx.navigation:navigation-compose:2.7.7")

    // Audio/Video player
    implementation("androidx.media3:media3-exoplayer:1.3.0")
    implementation("androidx.media3:media3-ui:1.3.0")
    implementation("androidx.media3:media3-session:1.3.0")

    // Hilt for Dependency Injection
    implementation("com.google.dagger:hilt-android:2.51.1")
    kapt("com.google.dagger:hilt-compiler:2.51.1")
    implementation("androidx.hilt:hilt-navigation-compose:1.2.0")

    // Room for Database
    implementation("androidx.room:room-runtime:2.6.1")
    implementation("androidx.room:room-ktx:2.6.1")
    kapt("androidx.room:room-compiler:2.6.1")
    
    // HTML rendering and text processing
    implementation("androidx.compose.ui:ui-text-google-fonts")
    implementation("androidx.datastore:datastore-preferences:1.1.1")
    
    // Kotlinx serialization for settings
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.3")
    
    // Audio processing for enhanced TTS (placeholder for future Coqui integration)
    implementation("androidx.media:media:1.7.0")
    
    // HTTP client for metadata API calls
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")
    
    // Image loading for cover art
    implementation("io.coil-kt:coil-compose:2.6.0")
    
    // File handling and document access
    implementation("androidx.documentfile:documentfile:1.0.1")
    
    // Advanced document and media support - Using WebView + PDF.js approach
    // PDF viewing will be handled by WebView with PDF.js or Android's PdfRenderer
    // This removes the need for external PDF libraries
    
    // Archive support for comics (CBZ, CBR)  
    implementation("org.apache.commons:commons-compress:1.24.0")
    // RAR support temporarily removed - ZIP/CBZ support via commons-compress is sufficient
    
    // Image processing and manipulation
    implementation("androidx.graphics:graphics-core:1.0.0-beta01")
    
    // Advanced media support with comprehensive codec support
    implementation("androidx.media3:media3-exoplayer-hls:1.3.0")
    implementation("androidx.media3:media3-exoplayer-dash:1.3.0")
    implementation("androidx.media3:media3-exoplayer-rtsp:1.3.0")
    implementation("androidx.media3:media3-exoplayer-smoothstreaming:1.3.0")
    
    // VLC Android SDK for comprehensive video format support
    implementation("org.videolan.android:libvlc-all:4.0.0-eap13")
    
    // Additional ExoPlayer extensions for more formats
    implementation("androidx.media3:media3-extractor:1.3.0")
    implementation("androidx.media3:media3-decoder:1.3.0")
    implementation("androidx.media3:media3-datasource:1.3.0")
    implementation("androidx.media3:media3-common:1.3.0")
    
    // Subtitle and closed caption support
    implementation("androidx.media3:media3-extractor:1.3.0")
    implementation("androidx.media3:media3-transformer:1.3.0")
    
    // Advanced audio codec support - using standard ExoPlayer decoders
    // Note: Specialized OPUS and FLAC decoders (media3-decoder-opus, media3-decoder-flac) 
    // don't exist in the media3 repository. Standard ExoPlayer handles these formats.
    
    // Network and streaming protocols
    implementation("androidx.media3:media3-datasource-okhttp:1.3.0")
    implementation("androidx.media3:media3-datasource-rtmp:1.3.0")
    
    // Additional video format support 
    // Note: mobile-ffmpeg-full:4.4.LTS is not available in standard repositories.
    // ExoPlayer with VLC Android SDK provides comprehensive format support.
    
    // Container format support
    implementation("org.apache.commons:commons-compress:1.24.0") // Already included but needed for video containers
    
    // Gesture detection and advanced UI
    implementation("androidx.compose.foundation:foundation:1.7.0-beta01")
    
    // HTML/XML parsing for web scraping and EPUB
    implementation("org.jsoup:jsoup:1.17.2")
    
    // WebView for EPUB rendering
    implementation("androidx.webkit:webkit:1.11.0")
    
    // Date parsing
    implementation("org.jetbrains.kotlinx:kotlinx-datetime:0.5.0")
    
    // File format detection
    implementation("org.apache.tika:tika-core:2.9.1")
    
    // Machine learning for content analysis
    implementation("org.tensorflow:tensorflow-lite:2.13.0")
    implementation("org.tensorflow:tensorflow-lite-support:0.4.4")
    
    // OCR and text extraction
    implementation("com.google.mlkit:text-recognition:16.0.0")
    implementation("com.google.mlkit:language-id:17.0.4")
    
    // Lightweight text processing for Android
    implementation("org.apache.lucene:lucene-core:8.11.2") // Android compatible version
    implementation("org.apache.lucene:lucene-analyzers-common:8.11.2") // Android compatible version
    // Stanford CoreNLP removed - too heavy for Android (200MB+), use ML Kit instead
    
    // Content fingerprinting removed - will use Android's built-in image processing if needed
    
    // Additional text processing
    implementation("org.apache.commons:commons-text:1.10.0")
    implementation("org.apache.commons:commons-lang3:3.12.0")
    
    // Cloud storage integrations - Using stable versions
    implementation("com.dropbox.core:dropbox-core-sdk:5.4.5")
    implementation("com.google.api-client:google-api-client-android:2.2.0")
    implementation("com.google.apis:google-api-services-drive:v3-rev20220815-2.0.0")
    implementation("com.google.auth:google-auth-library-oauth2-http:1.19.0")
    
    // Plex API integration
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    implementation("com.squareup.retrofit2:converter-simplexml:2.9.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")
    
    // Calibre integration - Fixed version
    implementation("commons-net:commons-net:3.9.0") // Fixed groupId
    implementation("com.jcraft:jsch:0.1.55")
    
    // Amazon/Google Books APIs
    implementation("com.amazonaws:aws-android-sdk-core:2.73.0")
    implementation("com.amazonaws:aws-android-sdk-s3:2.73.0")
    
    // WebDAV removed - will implement using OkHttp directly if needed
    
    // Background sync and work manager
    implementation("androidx.work:work-runtime-ktx:2.9.0")
    implementation("androidx.work:work-gcm:2.9.0")

    testImplementation("junit:junit:4.13.2")
    testImplementation("androidx.test.ext:junit:1.1.5")
    testImplementation("org.robolectric:robolectric:4.12.1")
    testImplementation("com.google.truth:truth:1.4.2")
    testImplementation("org.mockito.kotlin:mockito-kotlin:5.2.1")
    testImplementation("androidx.arch.core:core-testing:2.2.0")

    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
    androidTestImplementation("com.google.truth:truth:1.4.2")
    androidTestImplementation(platform("androidx.compose:compose-bom:2024.05.00"))
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}

// JaCoCo configuration for code coverage
jacoco {
    toolVersion = "0.8.8"
}

tasks.register<JacocoReport>("jacocoTestReport") {
    dependsOn("testDebugUnitTest")
    
    reports {
        xml.required.set(true)
        html.required.set(true)
    }
    
    val fileFilter = listOf(
        "**/R.class",
        "**/R$*.class",
        "**/BuildConfig.*",
        "**/Manifest*.*",
        "**/*Test*.*",
        "android/**/*.*",
        "**/databinding/**/*.*",
        "**/android/databinding/*Binding.*",
        "**/BR.*",
        "**/Hilt_*.*",
        "**/*_Hilt*.*",
        "**/*Module.*",
        "**/*Dagger*.*",
        "**/*MembersInjector*.*",
        "**/*_Factory*.*",
        "**/*_Provide*Factory*.*",
        "**/di/**"
    )
    
    val debugTree = fileTree("${layout.buildDirectory.get()}/tmp/kotlin-classes/debug") {
        exclude(fileFilter)
    }
    
    val mainSrc = "${project.projectDir}/src/main/java"
    
    sourceDirectories.setFrom(files(mainSrc))
    classDirectories.setFrom(files(debugTree))
    executionData.setFrom(fileTree(layout.buildDirectory.get()) {
        include("**/*.exec", "**/*.ec")
    })
}
