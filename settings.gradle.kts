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
