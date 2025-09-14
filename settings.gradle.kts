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
        // JitPack repository for GitHub-hosted libraries (must be first for com.github.* dependencies)
        maven { url = uri("https://jitpack.io") }
        // Maven repository for additional libraries
        maven { url = uri("https://repo1.maven.org/maven2") }
    }
}
rootProject.name = "UniversalMediaLibrary"
include(":CleverFerret")
