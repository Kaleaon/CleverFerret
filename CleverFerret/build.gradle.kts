plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("org.jetbrains.kotlin.plugin.compose")


    // Temporarily disabled to resolve build issues
    // id("com.google.devtools.ksp")
    // id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.22"


}

android {
    namespace = "com.universalmedialibrary"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.universalmedialibrary"
        minSdk = 26
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"

        testInstrumentationRunner = "androidx.test.runner.AndroidJUnitRunner"
        vectorDrawables {
            useSupportLibrary = true
        }
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
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
    kotlin {
        compilerOptions {
            jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17)
        }
    }
    buildFeatures {
        compose = true
    }

    composeOptions {
        kotlinCompilerExtensionVersion ========

    
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
    // implementation("androidx.hilt:hilt-navigation-compose:1.2.0")  // Temporarily disabled
    implementation("androidx.lifecycle:lifecycle-viewmodel-compose:2.9.4")

    implementation("androidx.datastore:datastore-preferences:1.1.7")
    implementation("androidx.documentfile:documentfile:1.1.0")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.7.3")
    

    // Hilt dependency injection - temporarily disabled due to KSP issues
    // implementation("com.google.dagger:hilt-android:2.51.1")
    // ksp("com.google.dagger:hilt-compiler:2.51.1")

    
    // Room database - temporarily disabled due to KSP issues
    // implementation("androidx.room:room-runtime:2.6.1")
    // implementation("androidx.room:room-ktx:2.6.1")
    // ksp("androidx.room:room-compiler:2.6.1")


    
    // Basic networking - Updated
    implementation("com.squareup.retrofit2:retrofit:2.11.0")
    implementation("com.squareup.retrofit2:converter-gson:2.11.0")
    implementation("com.squareup.okhttp3:logging-interceptor:4.12.0")
    
    // Image loading - Use stable version
    implementation("io.coil-kt:coil-compose:2.7.0")
    

    // Basic media - Use stable versions
    implementation("androidx.media:media:1.7.1")
    implementation("androidx.media3:media3-exoplayer:1.8.0")
    implementation("androidx.media3:media3-ui:1.8.0")
    implementation("androidx.media3:media3-session:1.8.0")
    
    // Glance for widgets - TODO: Enable when ready for full widget implementation
    // implementation("androidx.glance:glance-appwidget:1.1.0")
    // implementation("androidx.glance:glance-material3:1.1.0")
    
    // File handling
    implementation("androidx.documentfile:documentfile:1.1.0")
    
    // Serialization - Already updated above
    
    // Testing - Updated
    testImplementation("junit:junit:4.13.2")
    androidTestImplementation("androidx.test.ext:junit:1.3.0")
    androidTestImplementation("androidx.test.espresso:espresso-core:3.7.0")
    debugImplementation("androidx.compose.ui:ui-tooling")
    debugImplementation("androidx.compose.ui:ui-test-manifest")
}
