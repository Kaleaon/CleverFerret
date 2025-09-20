plugins {
    id("com.android.application") version "8.4.1" apply false
    id("org.jetbrains.kotlin.android") version "1.9.23" apply false
    id("com.google.dagger.hilt.android") version "2.50" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.23" apply false
}

// Apply Android Tools Plugin
apply<AndroidToolsPlugin>()

// Configure all projects
allprojects {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

// Architecture Detection and Configuration
val hostArchitecture by lazy {
    val osArch = System.getProperty("os.arch").lowercase()
    when {
        osArch.contains("aarch64") || osArch.contains("arm64") -> "arm64-v8a"
        osArch.contains("arm") -> "armeabi-v7a"
        osArch.contains("x86_64") || osArch.contains("amd64") -> "x86_64"
        osArch.contains("x86") || osArch.contains("i386") || osArch.contains("i686") -> "x86"
        else -> "x86_64"
    }
}

// Global configuration
extra.apply {
    set("hostArchitecture", hostArchitecture)
    set("androidToolsConfigured", true)
}

println("🏗️ CleverFerret Build System")
println("📱 Host Architecture: $hostArchitecture")
println("🔧 Android Tools: ${if (file("android-tools").exists()) "Available" else "Not Available"}")

// Clean task enhancement
tasks.register("cleanAll") {
    description = "Clean all build artifacts and caches"
    group = "build"
    
    doLast {
        delete(fileTree(rootDir) { 
            include("**/build/")
            include("**/*.log")
            include("gradle-android-tools-runtime.properties")
        })
        println("🧹 Cleaned all build artifacts")
    }
}

// Architecture info task
tasks.register("architectureInfo") {
    description = "Display architecture and build environment information"
    group = "help"
    
    doLast {
        println("\n🏗️ CLEVERFERRET BUILD ENVIRONMENT")
        println("================================")
        println("Host OS: ${System.getProperty("os.name")}")
        println("Host Architecture: ${System.getProperty("os.arch")} -> $hostArchitecture")
        println("Java Version: ${System.getProperty("java.version")}")
        println("Gradle Version: ${gradle.gradleVersion}")
        
        val androidToolsDir = file("android-tools")
        if (androidToolsDir.exists()) {
            println("\n🔧 ANDROID TOOLS STATUS")
            println("======================")
            println("Android Tools: ✅ Available")
            
            val versions = listOf("android-11.0.0_r33", "android-9.0.0_r33")
            val architectures = listOf("arm64-v8a", "armeabi-v7a", "x86_64", "x86")
            
            for (version in versions) {
                println("\n📦 $version:")
                for (arch in architectures) {
                    val aapt2 = file("android-tools/build/$version/aapt2/$arch/bin/aapt2")
                    val status = if (aapt2.exists()) "✅" else "❌"
                    val current = if (arch == hostArchitecture) " (current)" else ""
                    println("  $status AAPT2 ($arch)$current")
                }
            }
        } else {
            println("\n🔧 ANDROID TOOLS STATUS")
            println("======================") 
            println("Android Tools: ❌ Not Available")
        }
        println()
    }
}