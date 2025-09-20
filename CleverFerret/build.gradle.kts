plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("kotlin-kapt")
    id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.23"
}

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 33

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26
        targetSdk = 33
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }

        // Multi-architecture support
        ndk {
            abiFilters += listOf("arm64-v8a", "armeabi-v7a", "x86_64", "x86")
        }
        
        // Build configuration info
        buildConfigField("String", "BUILD_TIMESTAMP", "\"${System.currentTimeMillis()}\"")
        buildConfigField("String", "HOST_ARCHITECTURE", "\"arm64-v8a\"")
    }

    // Enhanced splits configuration for all architectures
    splits {
        abi {
            isEnable = true
            reset()
            include("arm64-v8a", "armeabi-v7a", "x86_64", "x86")
            isUniversalApk = true // Also generate a universal APK
        }
    }

    buildTypes {
        debug {
            isMinifyEnabled = false
            isDebuggable = true
            
            // Build info
            buildConfigField("String", "AAPT2_PATH", "\"default\"")
            buildConfigField("String", "AAPT2_ARCH", "\"arm64-v8a\"")
            buildConfigField("Boolean", "ANDROID_TOOLS_CONFIGURED", "true")
        }
        
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            
            // Build info
            buildConfigField("String", "AAPT2_PATH", "\"default\"")
            buildConfigField("String", "AAPT2_ARCH", "\"arm64-v8a\"")
            buildConfigField("Boolean", "ANDROID_TOOLS_CONFIGURED", "true")
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
        buildConfig = true
    }
    composeOptions {
        kotlinCompilerExtensionVersion = "1.5.11"
    }
    packaging {
        resources {
            excludes += "/META-INF/{AL2.0,LGPL2.1}"
            excludes += "/META-INF/versions/**"
            excludes += "**/kotlin/**"
            excludes += "**/*.kotlin_metadata"
            excludes += "**/*.version"
            excludes += "**/DEPENDENCIES"
            excludes += "**/LICENSE"
            excludes += "**/LICENSE.txt"
            excludes += "**/license.txt"
            excludes += "**/NOTICE"
            excludes += "**/NOTICE.txt"
            excludes += "**/notice.txt"
            excludes += "**/ASL2.0"
            excludes += "**/*.pro"
        }
        
        // JNI libraries configuration for multi-architecture
        jniLibs {
            useLegacyPackaging = true
        }
    }
}

dependencies {
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.0")
    implementation("androidx.activity:activity-compose:1.9.0")
    implementation(platform("androidx.compose:compose-bom:2024.05.00"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    
    // Navigation
    implementation("androidx.navigation:navigation-compose:2.7.7")
    
    // ViewModel
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.0")
    
    // Room Database
    implementation("androidx.room:room-runtime:2.6.1")
    implementation("androidx.room:room-ktx:2.6.1")
    kapt("androidx.room:room-compiler:2.6.1")
    
    // Hilt Dependency Injection
    implementation("com.google.dagger:hilt-android:2.50")
    kapt("com.google.dagger:hilt-compiler:2.50")
    implementation("androidx.hilt:hilt-navigation-compose:1.2.0")
    
    // Media3 for media playback
    implementation("androidx.media3:media3-exoplayer:1.3.0")
    implementation("androidx.media3:media3-ui:1.3.0")
    implementation("androidx.media3:media3-common:1.3.0")
    
    // HTTP client
    implementation("com.squareup.okhttp3:okhttp:4.12.0")
    
    // JSON serialization
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.3")
    
    // File operations
    implementation("commons-io:commons-io:2.11.0")
    
    // Image loading
    implementation("io.coil-kt:coil-compose:2.6.0")
    
    // PDF processing (lightweight alternative)
    implementation("com.github.mhiew:android-pdf-viewer:3.2.0-beta.1")
    
    // EPUB processing  
    implementation("org.jsoup:jsoup:1.17.2")
    
    // Archive handling
    implementation("org.apache.commons:commons-compress:1.26.1")
    
    // XML processing
    implementation("com.fasterxml.jackson.dataformat:jackson-dataformat-xml:2.17.0")
    
    // Document file access
    implementation("androidx.documentfile:documentfile:1.0.1")
    
    // Testing
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
    androidTestImplementation(platform("androidx.compose:compose-bom:2024.05.00"))
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}

// Log build configuration
tasks.register("logBuildConfig") {
    description = "Log build configuration information"
    group = "help"
    
    doLast {
        println("\n📱 CLEVERFERRET BUILD CONFIGURATION")
        println("===================================")
        println("Target SDK: ${android.compileSdk}")
        println("Min SDK: ${android.defaultConfig.minSdk}")
        println("Supported ABIs: ${android.defaultConfig.ndk.abiFilters.joinToString(", ")}")
        println("Build timestamp: ${System.currentTimeMillis()}")
        println()
    }
}