plugins {
    id("com.android.application") version "7.4.2" apply false
    id("org.jetbrains.kotlin.android") version "1.8.10" apply false
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

println("🏗️ CleverFerret Universal Media Library")
println("📱 Host Architecture: $hostArchitecture")
println("🎯 Building basic Android app with view system")

tasks.register("architectureInfo") {
    description = "Display architecture and build environment information"
    group = "help"
    
    doLast {
        println("🏗️ Build Environment Information")
        println("================================")
        println("Host Architecture: $hostArchitecture")
        println("Java Version: ${System.getProperty("java.version")}")
        println("Gradle Version: ${gradle.gradleVersion}")
        println("Android Gradle Plugin: 7.4.2")
        println("Kotlin Version: 1.8.10")
        println("Target SDK: 33")
        println("Min SDK: 24")
        println("✅ Ready to build compatible APK")
    }
}