import org.gradle.api.plugins.JavaPluginExtension
import org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension

plugins {
    base
    kotlin("jvm") apply false
}

subprojects {
    apply(plugin = "java-library")
    apply(plugin = "org.jetbrains.kotlin.jvm")

    group = "com.cleverferret.v2"
    version = "0.1.0"

    val targetJavaVersion = if (JavaVersion.current() == JavaVersion.VERSION_17) 17 else JavaVersion.current().majorVersion.toInt()

    configure<JavaPluginExtension> {
        toolchain {
            languageVersion.set(JavaLanguageVersion.of(targetJavaVersion))
        }
    }

    configure<KotlinJvmProjectExtension> {
        jvmToolchain(targetJavaVersion)
    }
}
