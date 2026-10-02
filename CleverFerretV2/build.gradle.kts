plugins {
    base
    kotlin("jvm") version "1.9.24" apply false
}

subprojects {
    apply(plugin = "java-library")
    apply(plugin = "org.jetbrains.kotlin.jvm")

    group = "com.cleverferret.v2"
    version = "0.1.0"

    repositories {
        google()
        maven { url = uri("https://maven-central.storage-download.googleapis.com/maven2/") }
        mavenCentral()
    }

    java {
        toolchain {
            languageVersion.set(JavaLanguageVersion.of(17))
        }
    }

    kotlin {
        jvmToolchain(17)
    }
}
