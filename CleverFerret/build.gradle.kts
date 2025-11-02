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
        versionCode = 6
        versionName = "1.5.2"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
        
        // Enable BuildConfig generation
        buildConfigField("String", "VERSION_NAME", "\"${versionName}\"")
        buildConfigField("int", "VERSION_CODE", "${versionCode}")
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
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    
    // Core Android
    implementation("androidx.core:core-ktx:1.17.0")
    implementation("androidx.appcompat:appcompat:1.7.1")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.9.4")
    implementation("androidx.activity:activity-compose:1.11.0")
    
    // Compose BOM and core components
    implementation(platform("androidx.compose:compose-bom:2025.10.01"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")
    
    // Navigation
    implementation("androidx.navigation:navigation-compose:2.9.5")
    implementation("androidx.hilt:hilt-navigation-compose:1.3.0")
    
    // Hilt dependency injection
    implementation("com.google.dagger:hilt-android:2.53")
    ksp("com.google.dagger:hilt-compiler:2.53")
    
    // ViewModel and LiveData
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.9.4")
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:2.9.4")
    implementation("androidx.lifecycle:lifecycle-runtime-compose:2.9.4")
    
    // Room database
    implementation("androidx.room:room-runtime:2.8.3")
    implementation("androidx.room:room-ktx:2.8.3")
    ksp("androidx.room:room-compiler:2.8.3")
    
    // DataStore for settings persistence
    implementation("androidx.datastore:datastore-preferences:1.1.7")
    
    // Basic networking
    implementation("com.squareup.retrofit2:retrofit:2.11.0")
    implementation("com.squareup.retrofit2:converter-gson:2.11.0")
    implementation("com.squareup.okhttp3:logging-interceptor:5.2.1")
    
    // Kotlinx Serialization for Retrofit
    implementation("com.jakewharton.retrofit:retrofit2-kotlinx-serialization-converter:1.0.0")
    implementation("com.squareup.okhttp3:okhttp:5.2.1")
    
    // Jellyfin SDK
    implementation("org.jellyfin.sdk:jellyfin-core:1.8.1")
    
    // SMB/CIFS support for network drives
    implementation("eu.agno3.jcifs:jcifs-ng:2.1.10")
    
    // Image loading
    implementation("io.coil-kt:coil-compose:2.7.0")
    
    // Drag and drop reorderable lists
    implementation("org.burnoutcrew.composereorderable:reorderable:0.9.6")
    
    // Basic media
    implementation("androidx.media:media:1.7.1")
    implementation("androidx.media3:media3-exoplayer:1.8.0")
    implementation("androidx.media3:media3-ui:1.8.0")
    implementation("androidx.media3:media3-session:1.8.0") // Required for MediaSessionService
    
    // File handling
    implementation("androidx.documentfile:documentfile:1.1.0")
    
    // Serialization
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.3")
    
    // Glance for widgets
    implementation("androidx.glance:glance-appwidget:1.1.1")
    implementation("androidx.glance:glance-material3:1.1.1")
    
    // Archives: RAR (CBR) support for comic reader
    implementation("com.github.junrar:junrar:7.5.7")
    
    // HTML parsing for web scraping
    implementation("org.jsoup:jsoup:1.21.2")
    
    // Security for encrypted token storage
    implementation("androidx.security:security-crypto:1.1.0")
    
    // Biometric authentication
    implementation("androidx.biometric:biometric:1.4.0-alpha04")
    
    // WorkManager for background tasks
    implementation("androidx.work:work-runtime-ktx:2.11.0")
    
    // Embedded HTTP server for OPDS
    implementation("org.nanohttpd:nanohttpd:2.3.1")
    
    // Google Cast SDK for Chromecast
    implementation("com.google.android.gms:play-services-cast-framework:22.2.0")
    implementation("androidx.media3:media3-cast:1.8.0")
    
    // Gemini AI for content analysis and translation
    implementation("com.google.ai.client.generativeai:generativeai:0.9.0")
    
    // ML Kit for on-device text recognition (OCR)
    implementation("com.google.mlkit:text-recognition:16.0.1")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-play-services:1.10.1")
    
    // Media metadata extraction libraries
    // Readium Kotlin Toolkit - Modern EPUB, PDF, Audiobook library
    // Replaces old epublib with actively-maintained, feature-rich toolkit
    val readiumVersion = "3.1.2"
    implementation("org.readium.kotlin-toolkit:readium-shared:$readiumVersion")
    implementation("org.readium.kotlin-toolkit:readium-streamer:$readiumVersion")
    implementation("org.readium.kotlin-toolkit:readium-navigator:$readiumVersion")
    implementation("org.readium.kotlin-toolkit:readium-opds:$readiumVersion") // OPDS catalog support
    
    // Testing
    testImplementation("junit:junit:4.13.2")
    testImplementation("org.mockito:mockito-core:5.14.2")
    testImplementation("org.mockito.kotlin:mockito-kotlin:5.4.0")
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-test:1.10.1")
    testImplementation("androidx.test:core:1.7.0")
    testImplementation("androidx.test:core-ktx:1.7.0")
    testImplementation("androidx.arch.core:core-testing:2.2.0")
    testImplementation("androidx.test.ext:junit:1.3.0")
    testImplementation("androidx.test.ext:junit-ktx:1.3.0")
    testImplementation("com.google.truth:truth:1.4.4")
    testImplementation("io.mockk:mockk:1.13.13")
    testImplementation("io.mockk:mockk-android:1.13.13")
    testImplementation("org.robolectric:robolectric:4.14.1")
    androidTestImplementation("androidx.test.ext:junit:1.3.0")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.7.0")
    androidTestImplementation(platform("androidx.compose:compose-bom:2025.10.01"))
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    androidTestImplementation("org.mockito:mockito-android:5.14.2")
    androidTestImplementation("io.mockk:mockk-android:1.13.13")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}