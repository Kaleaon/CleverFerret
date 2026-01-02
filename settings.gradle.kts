// Ensure Android SDK is discoverable in CI/containers.
// - If the environment already provides ANDROID_HOME / ANDROID_SDK_ROOT, do nothing.
// - Otherwise, if this repo contains a bundled `android-sdk/` directory, generate a
//   root `local.properties` pointing at it (file is gitignored).
val androidHome = System.getenv("ANDROID_HOME") ?: System.getenv("ANDROID_SDK_ROOT")
val localPropertiesFile = file("local.properties")
if (androidHome.isNullOrBlank() && !localPropertiesFile.exists()) {
    val bundledSdkDir = file("android-sdk")
    if (bundledSdkDir.exists() && bundledSdkDir.isDirectory) {
        // Use an absolute path so Gradle/AGP can resolve it reliably.
        localPropertiesFile.writeText("sdk.dir=${bundledSdkDir.canonicalPath}\n")
    }
}

pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        // JitPack repository for GitHub-hosted libraries
        maven { url = uri("https://jitpack.io") }
        // Maven repository for additional libraries
        maven { url = uri("https://repo1.maven.org/maven2") }
        // VideoLAN repository for VLC Android SDK
        maven { url = uri("https://download.videolan.org/pub/android/maven") }
        // Mobile FFmpeg repository
        maven { url = uri("https://github.com/tanersener/mobile-ffmpeg/releases") }
    }
}
rootProject.name = "UniversalMediaLibrary"
include(":CleverFerret")
