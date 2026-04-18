// Ensure Android SDK is discoverable in CI/containers.
// Fallback behavior:
// 1) If ANDROID_HOME / ANDROID_SDK_ROOT is already set, do nothing.
// 2) If neither env var is set and root local.properties does not exist,
//    use a bundled `android-sdk/` directory (if present) and generate local.properties.
// 3) If neither is available, Gradle/AGP uses its default SDK discovery behavior.
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
    }
}
rootProject.name = "UniversalMediaLibrary"
include(":CleverFerret")
