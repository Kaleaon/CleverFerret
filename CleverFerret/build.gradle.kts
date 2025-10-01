plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
    id("org.jetbrains.kotlin.plugin.compose")


    id("com.google.devtools.ksp")
    id("dagger.hilt.android.plugin")
    id("org.jetbrains.kotlin.plugin.serialization") version "2.1.0"
    id("com.diffplug.spotless")


}

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
    implementation("com.google.dagger:hilt-android:2.54")
    ksp("com.google.dagger:hilt-compiler:2.54")


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

    // HTML parsing for web scraping
    implementation("org.jsoup:jsoup:1.17.2")
    
    // Security for encrypted token storage
    implementation("androidx.security:security-crypto:1.1.0-alpha06")
    

    // Image loading - Use stable version
    implementation("io.coil-kt:coil-compose:2.7.0")


    // Basic media - Use stable versions
    implementation("androidx.media:media:1.7.1")
    implementation("androidx.media3:media3-exoplayer:1.8.0")
    implementation("androidx.media3:media3-ui:1.8.0")

    // File handling
    implementation("androidx.documentfile:documentfile:1.1.0")

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
