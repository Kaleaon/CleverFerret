package com.cleverferret.integrations.revanced;

import java.io.*;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

/**
 * CleverFerret ReVanced Builder for ARM64 Architecture
 * 
 * This class provides proper ReVanced CLI integration for CleverFerret,
 * using the correct --custom-aapt2-binary parameter for ARM64 compatibility.
 * 
 * Resolves the AAPT2 architecture incompatibility issue by using ARM64-native
 * AAPT2 binaries with ReVanced CLI.
 * 
 * @version 2.0.0
 * @since CleverFerret v1.0
 */
public class CleverFerretReVancedBuilder {
    
    private static final String REVANCED_CLI_PATH = "revanced-integration/binaries/revanced-cli-5.0.1-all.jar";
    private static final String PATCHES_PATH = "revanced-integration/patches/patches-5.40.0.rvp";
    private static final String ARM64_AAPT2_PATH = "revanced-integration/official-aapt2-arm64/aapt2";
    
    private final Path workingDirectory;
    private final boolean enableLogging;
    private final ProgressCallback progressCallback;
    
    /**
     * Initialize CleverFerret ReVanced Builder
     * 
     * @param workingDir Base directory containing revanced-integration folder
     * @param enableLogs Enable detailed logging for debugging
     * @param callback Progress callback for build operations
     */
    public CleverFerretReVancedBuilder(String workingDir, boolean enableLogs, ProgressCallback callback) {
        this.workingDirectory = Paths.get(workingDir);
        this.enableLogging = enableLogs;
        this.progressCallback = callback;
        validateEnvironment();
    }
    
    /**
     * Build CleverFerret APK with ARM64 compatibility
     * 
     * This method uses the proper ReVanced approach for ARM64 systems:
     * java -jar revanced-cli.jar patch --custom-aapt2-binary=/path/to/arm64/aapt2
     * 
     * @param sourceApkPath Path to source CleverFerret APK
     * @param outputApkPath Path for enhanced output APK
     * @param selectedPatches List of patches to apply (optional for CleverFerret enhancement)
     * @return BuildResult with success status and details
     */
    public BuildResult buildCleverFerretApk(String sourceApkPath, String outputApkPath, List<String> selectedPatches) {
        
        notifyProgress(0, "Starting CleverFerret ReVanced build with ARM64 compatibility...");
        
        try {
            // Validate source APK exists
            Path sourcePath = Paths.get(sourceApkPath);
            if (!Files.exists(sourcePath)) {
                return new BuildResult(false, "Source APK not found: " + sourceApkPath, null);
            }
            
            notifyProgress(10, "Validating ARM64 AAPT2 binary...");
            
            // Validate ARM64 AAPT2 binary
            Path arm64Aapt2 = workingDirectory.resolve(ARM64_AAPT2_PATH);
            if (!Files.exists(arm64Aapt2)) {
                return new BuildResult(false, "ARM64 AAPT2 binary not found: " + arm64Aapt2, null);
            }
            
            // Test ARM64 AAPT2 functionality
            if (!testAapt2Binary(arm64Aapt2.toString())) {
                return new BuildResult(false, "ARM64 AAPT2 binary is not functional", null);
            }
            
            notifyProgress(20, "Building ReVanced CLI command with ARM64 support...");
            
            // Build ReVanced CLI command with --custom-aapt2-binary parameter
            List<String> command = buildReVancedCommand(sourceApkPath, outputApkPath, selectedPatches, arm64Aapt2.toString());
            
            log("Executing ReVanced CLI with ARM64 AAPT2: " + String.join(" ", command));
            notifyProgress(30, "Executing ReVanced CLI with ARM64 compatibility...");
            
            ProcessBuilder pb = new ProcessBuilder(command);
            pb.directory(workingDirectory.toFile());
            pb.redirectErrorStream(true);
            
            Process process = pb.start();
            
            // Monitor progress
            StringBuilder output = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                int progress = 30;
                
                while ((line = reader.readLine()) != null) {
                    output.append(line).append("\n");
                    log("ReVanced CLI: " + line);
                    
                    // Update progress based on CLI output
                    if (line.contains("Loading patches")) {
                        progress = 40;
                        notifyProgress(progress, "Loading ReVanced patches...");
                    } else if (line.contains("Executing patches")) {
                        progress = 50;
                        notifyProgress(progress, "Executing patches with ARM64 AAPT2...");
                    } else if (line.contains("Compiling")) {
                        progress = 70;
                        notifyProgress(progress, "Compiling APK with ARM64 tools...");
                    } else if (line.contains("Signing")) {
                        progress = 85;
                        notifyProgress(progress, "Signing enhanced APK...");
                    } else if (line.contains("Finished")) {
                        progress = 95;
                        notifyProgress(progress, "Finalizing CleverFerret enhanced APK...");
                    }
                }
            }
            
            boolean success = process.waitFor(600, TimeUnit.SECONDS) && process.exitValue() == 0;
            
            if (success) {
                notifyProgress(100, "CleverFerret ReVanced build completed successfully!");
                return new BuildResult(true, "CleverFerret APK enhanced successfully with ARM64 compatibility", outputApkPath);
            } else {
                String error = "ReVanced build failed. Exit code: " + process.exitValue() + "\n" + output.toString();
                return new BuildResult(false, error, null);
            }
            
        } catch (Exception e) {
            log("Exception during ReVanced build: " + e.getMessage());
            return new BuildResult(false, "ReVanced build failed: " + e.getMessage(), null);
        }
    }
    
    /**
     * Build CleverFerret APK from source with ReVanced enhancements
     * 
     * This method compiles CleverFerret from source and then applies ReVanced
     * enhancements, solving both ARM64 compilation and enhancement in one step.
     * 
     * @param outputDir Directory for build outputs
     * @return BuildResult with success status and APK path
     */
    public BuildResult buildFromSource(String outputDir) {
        
        notifyProgress(0, "Starting CleverFerret source compilation with ARM64 ReVanced tools...");
        
        try {
            // Step 1: Compile CleverFerret APK using ARM64 AAPT2
            notifyProgress(10, "Compiling CleverFerret APK with ARM64 compatibility...");
            
            String gradleCommand = buildGradleCommand();
            ProcessBuilder gradlePb = new ProcessBuilder(gradleCommand.split(" "));
            gradlePb.directory(workingDirectory.toFile());
            gradlePb.environment().put("ANDROID_AAPT2_PATH", workingDirectory.resolve(ARM64_AAPT2_PATH).toString());
            
            Process gradleProcess = gradlePb.start();
            
            // Monitor Gradle build
            StringBuilder gradleOutput = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(gradleProcess.getInputStream()))) {
                String line;
                int progress = 10;
                
                while ((line = reader.readLine()) != null) {
                    gradleOutput.append(line).append("\n");
                    log("Gradle: " + line);
                    
                    if (line.contains("compileDebugKotlin")) {
                        progress = 25;
                        notifyProgress(progress, "Compiling Kotlin sources...");
                    } else if (line.contains("processDebugResources")) {
                        progress = 40;
                        notifyProgress(progress, "Processing resources with ARM64 AAPT2...");
                    } else if (line.contains("assembleDebug")) {
                        progress = 55;
                        notifyProgress(progress, "Assembling CleverFerret APK...");
                    }
                }
            }
            
            boolean gradleSuccess = gradleProcess.waitFor(600, TimeUnit.SECONDS) && gradleProcess.exitValue() == 0;
            
            if (!gradleSuccess) {
                return new BuildResult(false, 
                    "CleverFerret source compilation failed:\n" + gradleOutput.toString(), null);
            }
            
            // Step 2: Find compiled APK
            notifyProgress(60, "Locating compiled CleverFerret APK...");
            
            Path compiledApk = findCompiledApk();
            if (compiledApk == null) {
                return new BuildResult(false, "Could not locate compiled CleverFerret APK", null);
            }
            
            log("Found compiled APK: " + compiledApk);
            
            // Step 3: Apply ReVanced enhancements (optional for CleverFerret)
            notifyProgress(70, "Applying ReVanced enhancements...");
            
            String enhancedApkPath = outputDir + "/CleverFerret-Enhanced-" + System.currentTimeMillis() + ".apk";
            
            // Apply minimal enhancements for CleverFerret (mainly ARM64 compatibility)
            List<String> cleverferretPatches = Arrays.asList(); // No patches needed, just ARM64 rebuild
            
            BuildResult enhancementResult = buildCleverFerretApk(
                compiledApk.toString(), 
                enhancedApkPath, 
                cleverferretPatches
            );
            
            if (enhancementResult.isSuccess()) {
                notifyProgress(100, "CleverFerret compiled and enhanced successfully!");
                return new BuildResult(true, 
                    "CleverFerret built from source with ARM64 compatibility and ReVanced tools", 
                    enhancementResult.getOutputPath());
            } else {
                // Return the original compiled APK if enhancement fails
                notifyProgress(100, "CleverFerret compiled successfully (enhancement skipped)");
                return new BuildResult(true, 
                    "CleverFerret built from source with ARM64 compatibility", 
                    compiledApk.toString());
            }
            
        } catch (Exception e) {
            return new BuildResult(false, "Source build failed: " + e.getMessage(), null);
        }
    }
    
    /**
     * Test ARM64 AAPT2 binary functionality
     */
    private boolean testAapt2Binary(String aapt2Path) {
        try {
            ProcessBuilder pb = new ProcessBuilder("java", "-version");
            Process process = pb.start();
            boolean javaWorks = process.waitFor(10, TimeUnit.SECONDS) && process.exitValue() == 0;
            
            if (!javaWorks) {
                log("Java is not available - required for ReVanced CLI");
                return false;
            }
            
            // Test AAPT2 binary
            ProcessBuilder aapt2Pb = new ProcessBuilder(aapt2Path, "version");
            Process aapt2Process = aapt2Pb.start();
            boolean aapt2Works = aapt2Process.waitFor(10, TimeUnit.SECONDS) && aapt2Process.exitValue() == 0;
            
            if (aapt2Works) {
                log("ARM64 AAPT2 binary verified functional");
                return true;
            } else {
                log("ARM64 AAPT2 binary test failed");
                return false;
            }
            
        } catch (Exception e) {
            log("Error testing ARM64 AAPT2: " + e.getMessage());
            return false;
        }
    }
    
    /**
     * Build ReVanced CLI command with proper ARM64 AAPT2 integration
     */
    private List<String> buildReVancedCommand(String inputApk, String outputApk, List<String> patches, String aapt2Path) {
        List<String> command = new ArrayList<>();
        
        // Java and ReVanced CLI
        command.add("java");
        command.add("-jar");
        command.add(workingDirectory.resolve(REVANCED_CLI_PATH).toString());
        
        // Patch command
        command.add("patch");
        
        // CRITICAL: Add ARM64 AAPT2 binary parameter
        command.add("--custom-aapt2-binary=" + aapt2Path);
        
        // Patches file
        command.add("--patches");
        command.add(workingDirectory.resolve(PATCHES_PATH).toString());
        
        // Input APK
        command.add(inputApk);
        
        // Output APK
        command.add("--out");
        command.add(outputApk);
        
        // Add specific patches if provided
        if (patches != null && !patches.isEmpty()) {
            for (String patch : patches) {
                command.add("--include");
                command.add(patch);
            }
        } else {
            // For CleverFerret, we mainly need ARM64 compatibility, not specific patches
            log("Building CleverFerret with ARM64 compatibility (no specific patches)");
        }
        
        return command;
    }
    
    /**
     * Build Gradle command for CleverFerret compilation
     */
    private String buildGradleCommand() {
        return "./gradlew CleverFerret:assembleDebug --stacktrace";
    }
    
    /**
     * Find compiled APK in build output directories
     */
    private Path findCompiledApk() {
        try {
            // Look for APK in CleverFerret build directory
            Path buildDir = workingDirectory.resolve("CleverFerret/build/outputs/apk/debug");
            if (Files.exists(buildDir)) {
                return Files.walk(buildDir)
                    .filter(path -> path.toString().endsWith(".apk"))
                    .findFirst()
                    .orElse(null);
            }
            return null;
        } catch (Exception e) {
            log("Error finding compiled APK: " + e.getMessage());
            return null;
        }
    }
    
    private void validateEnvironment() {
        Path cliPath = workingDirectory.resolve(REVANCED_CLI_PATH);
        Path patchesPath = workingDirectory.resolve(PATCHES_PATH);
        Path aapt2Path = workingDirectory.resolve(ARM64_AAPT2_PATH);
        
        if (!Files.exists(cliPath)) {
            throw new IllegalStateException("ReVanced CLI not found: " + cliPath);
        }
        
        if (!Files.exists(patchesPath)) {
            throw new IllegalStateException("ReVanced patches not found: " + patchesPath);
        }
        
        if (!Files.exists(aapt2Path)) {
            throw new IllegalStateException("ARM64 AAPT2 binary not found: " + aapt2Path);
        }
        
        log("CleverFerret ReVanced Builder environment validated successfully");
    }
    
    private void notifyProgress(int percentage, String message) {
        if (progressCallback != null) {
            progressCallback.onProgress(percentage, message);
        }
    }
    
    private void log(String message) {
        if (enableLogging) {
            System.out.println("[CleverFerretReVancedBuilder] " + message);
        }
    }
    
    // Inner classes
    
    public static class BuildResult {
        private final boolean success;
        private final String message;
        private final String outputPath;
        
        public BuildResult(boolean success, String message, String outputPath) {
            this.success = success;
            this.message = message;
            this.outputPath = outputPath;
        }
        
        public boolean isSuccess() { return success; }
        public String getMessage() { return message; }
        public String getOutputPath() { return outputPath; }
    }
    
    @FunctionalInterface
    public interface ProgressCallback {
        void onProgress(int percentage, String message);
    }
}