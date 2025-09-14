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
        // Artifex repository for MuPDF
        maven { url = uri("https://artifex.com/releases") }
        // Maven repository for additional libraries
        maven { url = uri("https://repo1.maven.org/maven2") }
        // Dropbox SDK repository
        maven { url = uri("https://maven.dropbox.tech/releases") }
    }
}
rootProject.name = "UniversalMediaLibrary"
include(":CleverFerret")
