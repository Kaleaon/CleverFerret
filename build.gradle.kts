plugins {
    id("com.android.application") version "8.4.1" apply false
    id("org.jetbrains.kotlin.android") version "1.9.23" apply false
    id("com.google.dagger.hilt.android") version "2.50" apply false
    id("org.jetbrains.kotlin.plugin.serialization") version "1.9.23" apply false
}

// Architecture Detection
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
}

println("🏗️ CleverFerret Universal Media Library")
println("📱 Host Architecture: $hostArchitecture")
println("🎯 Building for all Android architectures")

// Clean task enhancement
tasks.register("cleanAll") {
    description = "Clean all build artifacts and caches"
    group = "build"
    
    doLast {
        delete(fileTree(rootDir) { 
            include("**/build/")
            include("**/*.log")
        })
        println("🧹 Cleaned all build artifacts")
    }
}

// Architecture info task
tasks.register("architectureInfo") {
    description = "Display architecture and build environment information"
    group = "help"
    
    doLast {
        println("🏗️ Build Environment Information")
        println("================================")
        println("Host Architecture: $hostArchitecture")
        println("Java Version: ${System.getProperty("java.version")}")
        println("Gradle Version: ${gradle.gradleVersion}")
        println("Android Gradle Plugin: 8.4.1")
        println("Kotlin Version: 1.9.23")
        println("Target SDK: 34")
        println("Min SDK: 26")
        println("")
        println("📱 Supported ABIs:")
        println("  • arm64-v8a (64-bit ARM)")
        println("  • armeabi-v7a (32-bit ARM)")  
        println("  • x86_64 (64-bit Intel)")
        println("  • x86 (32-bit Intel)")
        println("")
        println("✅ Ready to build universal APK")
    }
}