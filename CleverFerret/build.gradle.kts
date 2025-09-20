plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("kotlin-kapt")
    id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.23"
}

// Android Tools Integration
// Load android-tools configuration if available
val androidToolsPropsFile = rootProject.file("gradle-android-tools.properties")
val androidToolsProps = java.util.Properties()
if (androidToolsPropsFile.exists()) {
    androidToolsPropsFile.inputStream().use { androidToolsProps.load(it) }
}

// Helper function to get android-tools property
fun getAndroidToolsProperty(key: String, defaultValue: String = ""): String {
    return androidToolsProps.getProperty(key) ?: defaultValue
}

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26  // Increased from 24 to support newer media libraries
        targetSdk = 34
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }

        // Multi-architecture support for android-tools
        ndk {
            abiFilters += listOf("arm64-v8a", "armeabi-v7a", "x86_64", "x86")
        }
    }

    // Android Tools Configuration
    androidComponents {
        onVariants { variant ->
            // Configure AAPT2 path if custom android-tools are available
            val customAapt2Path = getAndroidToolsProperty("android.tools.custom.aapt2.path")
            if (customAapt2Path.isNotEmpty()) {
                println("Using custom AAPT2: $customAapt2Path")
            }
        }
    }

    buildTypes {
        debug {
            isMinifyEnabled = false
            isDebuggable = true
            
            // Android Tools optimization for debug builds
            // Disable resource optimization to speed up builds with custom tools
            buildConfigField("String", "ANDROID_TOOLS_ARCH", "\"${getAndroidToolsProperty("android.tools.host.arch", "unknown")}\"")
        }
        
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
            
            buildConfigField("String", "ANDROID_TOOLS_ARCH", "\"${getAndroidToolsProperty("android.tools.host.arch", "unknown")}\"")
        }
    }

    // Enhanced splits configuration for multi-architecture support
    splits {
        abi {
            isEnable = true
            reset()
            include("arm64-v8a", "armeabi-v7a", "x86_64", "x86")
            isUniversalApk = true // Also generate a universal APK
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
            // Exclude conflicting architecture libraries if needed
            excludes += "/lib/*/libandroid_tools_*.so"
        }
        
        // JNI libraries configuration for multi-architecture
        jniLibs {
            useLegacyPackaging = true
        }
    }

    // Build optimization
    buildFeatures {
        compose = true
        buildConfig = true // Enable BuildConfig for android-tools arch info
    }
}

dependencies {
    // Core Android
    implementation("androidx.core:core-ktx:1.13.1")
    implementation("androidx.lifecycle:lifecycle-runtime-ktx:2.8.1")
    implementation("androidx.activity:activity-compose:1.9.0")
    
    // Compose BOM and core components
    implementation(platform("androidx.compose:compose-bom:2024.05.00"))
    implementation("androidx.compose.ui:ui")
    implementation("androidx.compose.ui:ui-graphics")
    implementation("androidx.compose.ui:ui-tooling-preview")
    implementation("androidx.compose.material3:material3")
    implementation("androidx.compose.material:material-icons-extended")
    
    // Navigation
    implementation("androidx.navigation:navigation-compose:2.7.7")
    implementation("androidx.hilt:hilt-navigation-compose:1.2.0")
    
    // Hilt dependency injection
    implementation("com.google.dagger:hilt-android:2.51.1")
    kapt("com.google.dagger:hilt-compiler:2.51.1")
    
    // ViewModel and LiveData
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.8.1")
    implementation("androidx.lifecycle:lifecycle-livedata-ktx:2.8.1")
    
    // Room database
    implementation("androidx.room:room-runtime:2.6.1")
    implementation("androidx.room:room-ktx:2.6.1")
    kapt("androidx.room:room-compiler:2.6.1")
    
    // Basic networking
    implementation("com.squareup.retrofit2:retrofit:2.9.0")
    implementation("com.squareup.retrofit2:converter-gson:2.9.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")
    
    // Image loading
    implementation("io.coil-kt:coil-compose:2.6.0")
    
    // Basic media
    implementation("androidx.media:media:1.7.0")
    implementation("androidx.media3:media3-exoplayer:1.3.0")
    implementation("androidx.media3:media3-ui:1.3.0")
    
    // File handling
    implementation("androidx.documentfile:documentfile:1.0.1")
    
    // Serialization
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.6.3")
    
    // Testing
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.1.5")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.5.1")
    androidTestImplementation(platform("androidx.compose:compose-bom:2024.05.00"))
    androidTestImplementation("androidx.compose.ui:ui-test-junit4")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}