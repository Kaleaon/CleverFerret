plugins {
    base
}

subprojects {
    apply(plugin = "java-library")

    group = "com.cleverferret.v2"
    version = "0.1.0"

    repositories {
        mavenCentral()
    }

    java {
        toolchain {
            languageVersion.set(JavaLanguageVersion.of(17))
        }
    }
}
