// Gradle runtime JDK policy:
// - AGP 8.13.x + Kotlin 2.1.x should run on JDK 17-21.
// - The wrapper scripts enforce this before Gradle starts, to fail fast with a clear message.

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
        maven { url = uri("https://maven-central.storage-download.googleapis.com/maven2/") }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        maven { url = uri("https://maven-central.storage-download.googleapis.com/maven2/") }
        mavenCentral()
        // JitPack repository for GitHub-hosted libraries
        maven { url = uri("https://jitpack.io") }
    }
}
rootProject.name = "UniversalMediaLibrary"
include(":CleverFerret")
include(":core:design-system")

// Phase 0 step 8: empty placeholder benchmark module so :benchmark-macro:assemble
// succeeds before any real macro-benchmark wiring lands. See
// docs/planning/PREMIERE_ROADMAP.md and benchmark-macro/build.gradle.kts.
include(":benchmark-macro")

// CleverFerretV2 core submodules (7)
val v2CoreModules = listOf(
    "auth", "common", "data", "database", "media", "network", "ui"
)
for (mod in v2CoreModules) {
    include(":core:$mod")
    project(":core:$mod").projectDir = file("CleverFerretV2/core/$mod")
}

// CleverFerretV2 feature submodules (16)
val v2FeatureModules = listOf(
    "ai", "audio", "collections", "library", "metadata", "opds", "plex",
    "podcast", "radio", "reader", "search", "settings", "stats", "sync",
    "webfiction", "widgets"
)
for (mod in v2FeatureModules) {
    include(":feature:$mod")
    project(":feature:$mod").projectDir = file("CleverFerretV2/feature/$mod")
}

// CleverFerretV2 app module
include(":CleverFerretV2:app")


