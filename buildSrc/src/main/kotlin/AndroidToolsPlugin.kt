import org.gradle.api.Plugin
import org.gradle.api.Project
import org.gradle.api.tasks.TaskAction
import org.gradle.api.DefaultTask
import java.io.File
import java.nio.file.Files
import java.nio.file.StandardCopyOption

/**
 * Android Tools Architecture Plugin
 * Automatically detects host architecture and configures appropriate AAPT2 binaries
 */
class AndroidToolsPlugin : Plugin<Project> {
    
    companion object {
        private const val ANDROID_TOOLS_DIR = "android-tools"
        private const val ANDROID_11_VERSION = "android-11.0.0_r33"
        private const val ANDROID_9_VERSION = "android-9.0.0_r33"
    }
    
    override fun apply(project: Project) {
        // Only apply to root project
        if (project != project.rootProject) return
        
        val configureTask = project.tasks.register("configureAndroidTools", ConfigureAndroidToolsTask::class.java)
        
        // Auto-run before any Android tasks
        project.allprojects { 
            afterEvaluate {
                tasks.matching { 
                    it.name.startsWith("process") || 
                    it.name.startsWith("compile") || 
                    it.name.startsWith("assemble") 
                }.configureEach {
                    dependsOn(configureTask)
                }
            }
        }
    }
}

abstract class ConfigureAndroidToolsTask : DefaultTask() {
    
    init {
        description = "Configure Android Tools for current architecture"
        group = "android tools"
        outputs.upToDateWhen { false } // Always run to ensure tools are configured
    }
    
    @TaskAction
    fun configureTools() {
        val hostArch = detectHostArchitecture()
        val androidToolsDir = File(project.rootDir, "android-tools")
        
        logger.lifecycle("🔧 Configuring Android Tools for architecture: $hostArch")
        
        if (!androidToolsDir.exists()) {
            logger.warn("⚠️ Android tools directory not found: ${androidToolsDir.absolutePath}")
            return
        }
        
        val aapt2Binary = findBestAapt2Binary(androidToolsDir, hostArch)
        if (aapt2Binary != null) {
            configureAapt2(aapt2Binary, hostArch)
            createGradleProperties(aapt2Binary, hostArch)
        } else {
            logger.error("❌ No compatible AAPT2 binary found for architecture: $hostArch")
        }
    }
    
    private fun detectHostArchitecture(): String {
        val osArch = System.getProperty("os.arch").lowercase()
        val osName = System.getProperty("os.name").lowercase()
        
        return when {
            osArch.contains("aarch64") || osArch.contains("arm64") -> "arm64-v8a"
            osArch.contains("arm") -> "armeabi-v7a" 
            osArch.contains("x86_64") || osArch.contains("amd64") -> "x86_64"
            osArch.contains("x86") || osArch.contains("i386") || osArch.contains("i686") -> "x86"
            else -> {
                logger.warn("🔍 Unknown architecture: $osArch, defaulting to x86_64")
                "x86_64"
            }
        }.also {
            logger.lifecycle("🏗️ Host System: $osName, Architecture: $osArch -> Android ABI: $it")
        }
    }
    
    private fun findBestAapt2Binary(androidToolsDir: File, targetArch: String): File? {
        val versions = listOf("android-11.0.0_r33", "android-9.0.0_r33")
        val archPriority = listOf(targetArch, "arm64-v8a", "x86_64", "armeabi-v7a", "x86")
        
        for (version in versions) {
            for (arch in archPriority) {
                val aapt2Path = File(androidToolsDir, "build/$version/aapt2/$arch/bin/aapt2")
                if (aapt2Path.exists() && aapt2Path.canExecute()) {
                    logger.lifecycle("✅ Found AAPT2: $version/$arch")
                    return aapt2Path
                }
            }
        }
        return null
    }
    
    private fun configureAapt2(aapt2Binary: File, arch: String) {
        try {
            // Find and replace cached AAPT2 binaries
            val gradleHome = File(System.getProperty("user.home"), ".gradle")
            val cachesDirs = listOf(
                File(gradleHome, "caches"),
                File(project.rootDir, ".gradle/caches")
            )
            
            var replacedCount = 0
            
            for (cachesDir in cachesDirs) {
                if (cachesDir.exists()) {
                    replacedCount += replaceAapt2InDirectory(cachesDir, aapt2Binary)
                }
            }
            
            logger.lifecycle("🔄 Replaced $replacedCount AAPT2 binaries with $arch version")
            
            // Verify the replacement worked
            verifyAapt2Binary(aapt2Binary)
            
        } catch (e: Exception) {
            logger.error("❌ Failed to configure AAPT2: ${e.message}")
            // Don't throw - allow build to continue with default tools
        }
    }
    
    private fun replaceAapt2InDirectory(directory: File, sourceAapt2: File): Int {
        var count = 0
        
        try {
            directory.walkTopDown()
                .filter { it.name == "aapt2" && it.isFile }
                .forEach { cachedAapt2 ->
                    try {
                        // Backup original if not already backed up
                        val backup = File(cachedAapt2.parent, "aapt2.original")
                        if (!backup.exists()) {
                            Files.copy(cachedAapt2.toPath(), backup.toPath())
                        }
                        
                        // Replace with our compatible version
                        Files.copy(sourceAapt2.toPath(), cachedAapt2.toPath(), StandardCopyOption.REPLACE_EXISTING)
                        cachedAapt2.setExecutable(true)
                        
                        count++
                        logger.debug("🔄 Replaced AAPT2: ${cachedAapt2.absolutePath}")
                    } catch (e: Exception) {
                        logger.warn("⚠️ Failed to replace ${cachedAapt2.absolutePath}: ${e.message}")
                    }
                }
        } catch (e: Exception) {
            logger.warn("⚠️ Failed to walk directory ${directory.absolutePath}: ${e.message}")
        }
        
        return count
    }
    
    private fun verifyAapt2Binary(aapt2Binary: File) {
        try {
            val process = ProcessBuilder(aapt2Binary.absolutePath, "version")
                .redirectErrorStream(true)
                .start()
            
            val output = process.inputStream.bufferedReader().readText()
            val exitCode = process.waitFor()
            
            if (exitCode == 0 || output.contains("Android Asset Packaging Tool")) {
                logger.lifecycle("✅ AAPT2 verification successful")
            } else {
                logger.warn("⚠️ AAPT2 verification returned non-zero exit code: $exitCode")
            }
        } catch (e: Exception) {
            logger.warn("⚠️ AAPT2 verification failed: ${e.message}")
        }
    }
    
    private fun createGradleProperties(aapt2Binary: File, arch: String) {
        try {
            val propsFile = File(project.rootDir, "gradle-android-tools-runtime.properties")
            
            val properties = """
                # Auto-generated Android Tools Runtime Configuration
                # Generated: ${java.time.LocalDateTime.now()}
                # Host Architecture: $arch
                
                # Runtime AAPT2 Configuration
                android.tools.runtime.aapt2.path=${aapt2Binary.absolutePath}
                android.tools.runtime.aapt2.arch=$arch
                android.tools.runtime.configured=true
                
                # Build Optimizations
                android.aapt2FromMavenOverride=false
                android.builder.sdkDownload=false
                android.enableResourceOptimizations=false
                
                # Multi-architecture support
                android.defaultConfig.ndk.abiFilters=$arch
            """.trimIndent()
            
            propsFile.writeText(properties)
            logger.lifecycle("📝 Created runtime configuration: ${propsFile.name}")
        } catch (e: Exception) {
            logger.warn("⚠️ Failed to create gradle properties: ${e.message}")
        }
    }
}