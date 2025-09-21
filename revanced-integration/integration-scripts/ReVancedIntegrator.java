package com.cleverferret.integrations.revanced;

import java.io.*;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.TimeUnit;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.Files;

/**
 * CleverFerret ReVanced Integration Service
 * 
 * Provides seamless integration between CleverFerret Universal Media Library
 * and ReVanced patching capabilities for enhanced media app functionality.
 * 
 * Features:
 * - Automated APK patching
 * - Batch processing support  
 * - Progress tracking and callbacks
 * - Error handling and recovery
 * - Patch management and selection
 * 
 * @version 1.0.0
 * @since CleverFerret v1.0
 */
public class ReVancedIntegrator {
    
    private static final String REVANCED_CLI_PATH = "revanced-integration/binaries/revanced-cli-5.0.1-all.jar";
    private static final String PATCHES_PATH = "revanced-integration/patches/patches-5.40.0.rvp";
    private static final String MANAGER_APK_PATH = "revanced-integration/manager/revanced-manager-1.25.1.apk";
    
    private final Path workingDirectory;
    private final boolean enableLogging;
    private PatchingProgressCallback progressCallback;
    
    /**
     * Initialize ReVanced Integrator
     * 
     * @param workingDir Base directory containing revanced-integration folder
     * @param enableLogs Enable detailed logging for debugging
     */
    public ReVancedIntegrator(String workingDir, boolean enableLogs) {
        this.workingDirectory = Paths.get(workingDir);
        this.enableLogging = enableLogs;
        validateEnvironment();
    }
    
    /**
     * Set progress callback for patching operations
     */
    public void setProgressCallback(PatchingProgressCallback callback) {
        this.progressCallback = callback;
    }
    
    /**
     * Get list of available patches for a specific application
     * 
     * @param packageName Android package name (e.g., "com.google.android.youtube")
     * @return List of available patch names
     */
    public List<String> getAvailablePatches(String packageName) {
        List<String> patches = new ArrayList<>();
        
        try {
            // Use ReVanced CLI to list patches for the specific package
            ProcessBuilder pb = new ProcessBuilder(
                "java", "-jar", getCliPath(),
                "--list-patches",
                "--packages", packageName
            );
            
            pb.directory(workingDirectory.toFile());
            Process process = pb.start();
            
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    if (line.trim().startsWith("-")) {
                        // Parse patch name from CLI output
                        String patchName = extractPatchName(line);
                        if (patchName != null) {
                            patches.add(patchName);
                        }
                    }
                }
            }
            
            process.waitFor(30, TimeUnit.SECONDS);
            
        } catch (Exception e) {
            log("Error getting available patches: " + e.getMessage());
        }
        
        return patches;
    }
    
    /**
     * Patch an Android APK with specified patches
     * 
     * @param inputApkPath Path to input APK file
     * @param outputApkPath Path for output patched APK
     * @param selectedPatches List of patch names to apply
     * @param excludePatches List of patch names to exclude
     * @return PatchingResult with success status and details
     */
    public PatchingResult patchApk(String inputApkPath, String outputApkPath, 
                                  List<String> selectedPatches, List<String> excludePatches) {
        
        notifyProgress(0, "Starting APK patching process...");
        
        try {
            // Validate input file exists
            Path inputPath = Paths.get(inputApkPath);
            if (!Files.exists(inputPath)) {
                return new PatchingResult(false, "Input APK file not found: " + inputApkPath, null);
            }
            
            // Build command
            List<String> command = buildPatchCommand(inputApkPath, outputApkPath, selectedPatches, excludePatches);
            
            log("Executing ReVanced CLI with command: " + String.join(" ", command));
            notifyProgress(20, "Executing ReVanced CLI...");
            
            ProcessBuilder pb = new ProcessBuilder(command);
            pb.directory(workingDirectory.toFile());
            pb.redirectErrorStream(true);
            
            Process process = pb.start();
            
            // Monitor progress
            StringBuilder output = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                int progress = 20;
                
                while ((line = reader.readLine()) != null) {
                    output.append(line).append("\n");
                    log("CLI Output: " + line);
                    
                    // Update progress based on CLI output
                    if (line.contains("Applying patch")) {
                        progress = Math.min(80, progress + 10);
                        notifyProgress(progress, "Applying patches: " + extractCurrentPatch(line));
                    } else if (line.contains("Building")) {
                        notifyProgress(90, "Building patched APK...");
                    }
                }
            }
            
            boolean success = process.waitFor(300, TimeUnit.SECONDS) && process.exitValue() == 0;
            
            if (success) {
                notifyProgress(100, "Patching completed successfully!");
                return new PatchingResult(true, "APK patched successfully", outputApkPath);
            } else {
                String error = "Patching failed. Exit code: " + process.exitValue() + "\n" + output.toString();
                return new PatchingResult(false, error, null);
            }
            
        } catch (Exception e) {
            log("Exception during patching: " + e.getMessage());
            return new PatchingResult(false, "Patching failed: " + e.getMessage(), null);
        }
    }
    
    /**
     * Batch patch multiple APK files
     * 
     * @param batchRequests List of patching requests
     * @return CompletableFuture with batch results
     */
    public CompletableFuture<List<PatchingResult>> batchPatch(List<BatchPatchRequest> batchRequests) {
        return CompletableFuture.supplyAsync(() -> {
            List<PatchingResult> results = new ArrayList<>();
            
            for (int i = 0; i < batchRequests.size(); i++) {
                BatchPatchRequest request = batchRequests.get(i);
                notifyProgress((i * 100) / batchRequests.size(), 
                             "Processing " + (i + 1) + "/" + batchRequests.size() + ": " + request.getInputApkPath());
                
                PatchingResult result = patchApk(
                    request.getInputApkPath(),
                    request.getOutputApkPath(),
                    request.getSelectedPatches(),
                    request.getExcludePatches()
                );
                
                results.add(result);
                
                // Stop on first failure if requested
                if (!result.isSuccess() && request.isStopOnFailure()) {
                    break;
                }
            }
            
            return results;
        });
    }
    
    /**
     * Get ReVanced Manager APK for installation
     * 
     * @return Path to ReVanced Manager APK file
     */
    public String getManagerApkPath() {
        return workingDirectory.resolve(MANAGER_APK_PATH).toString();
    }
    
    /**
     * Check if ReVanced integration is properly configured
     * 
     * @return true if all required files are present and accessible
     */
    public boolean isEnvironmentValid() {
        try {
            validateEnvironment();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    /**
     * Get integration status and version information
     * 
     * @return ReVancedStatus object with current status
     */
    public ReVancedStatus getStatus() {
        return new ReVancedStatus(
            isEnvironmentValid(),
            "5.0.1", // CLI Version
            "5.40.0", // Patches Version  
            "1.25.1", // Manager Version
            getAvailablePatches("").size() // Total patches available
        );
    }
    
    // Private helper methods
    
    private void validateEnvironment() {
        Path cliPath = workingDirectory.resolve(REVANCED_CLI_PATH);
        Path patchesPath = workingDirectory.resolve(PATCHES_PATH);
        Path managerPath = workingDirectory.resolve(MANAGER_APK_PATH);
        
        if (!Files.exists(cliPath)) {
            throw new IllegalStateException("ReVanced CLI not found: " + cliPath);
        }
        
        if (!Files.exists(patchesPath)) {
            throw new IllegalStateException("ReVanced patches not found: " + patchesPath);
        }
        
        if (!Files.exists(managerPath)) {
            throw new IllegalStateException("ReVanced Manager not found: " + managerPath);
        }
        
        log("ReVanced environment validated successfully");
    }
    
    private String getCliPath() {
        return workingDirectory.resolve(REVANCED_CLI_PATH).toString();
    }
    
    private String getPatchesPath() {
        return workingDirectory.resolve(PATCHES_PATH).toString();
    }
    
    private List<String> buildPatchCommand(String inputApk, String outputApk, 
                                          List<String> include, List<String> exclude) {
        List<String> command = new ArrayList<>();
        command.add("java");
        command.add("-jar");
        command.add(getCliPath());
        
        command.add("--patches");
        command.add(getPatchesPath());
        
        command.add("--apk");
        command.add(inputApk);
        
        command.add("--out");
        command.add(outputApk);
        
        // Add included patches
        if (include != null && !include.isEmpty()) {
            for (String patch : include) {
                command.add("--include");
                command.add(patch);
            }
        }
        
        // Add excluded patches  
        if (exclude != null && !exclude.isEmpty()) {
            for (String patch : exclude) {
                command.add("--exclude");
                command.add(patch);
            }
        }
        
        return command;
    }
    
    private String extractPatchName(String line) {
        // Parse patch name from CLI output line
        // Example: "  - remove-ads: Remove advertisements"
        if (line.contains(":")) {
            return line.trim().substring(2, line.indexOf(":")).trim();
        }
        return null;
    }
    
    private String extractCurrentPatch(String line) {
        // Extract current patch being applied from output
        if (line.contains("Applying patch")) {
            return line.substring(line.lastIndexOf(" ") + 1);
        }
        return "Unknown patch";
    }
    
    private void notifyProgress(int percentage, String message) {
        if (progressCallback != null) {
            progressCallback.onProgress(percentage, message);
        }
    }
    
    private void log(String message) {
        if (enableLogging) {
            System.out.println("[ReVancedIntegrator] " + message);
        }
    }
    
    // Inner classes for data structures
    
    public static class PatchingResult {
        private final boolean success;
        private final String message;
        private final String outputPath;
        
        public PatchingResult(boolean success, String message, String outputPath) {
            this.success = success;
            this.message = message;
            this.outputPath = outputPath;
        }
        
        public boolean isSuccess() { return success; }
        public String getMessage() { return message; }
        public String getOutputPath() { return outputPath; }
    }
    
    public static class BatchPatchRequest {
        private final String inputApkPath;
        private final String outputApkPath;
        private final List<String> selectedPatches;
        private final List<String> excludePatches;
        private final boolean stopOnFailure;
        
        public BatchPatchRequest(String inputApkPath, String outputApkPath,
                               List<String> selectedPatches, List<String> excludePatches,
                               boolean stopOnFailure) {
            this.inputApkPath = inputApkPath;
            this.outputApkPath = outputApkPath;
            this.selectedPatches = selectedPatches;
            this.excludePatches = excludePatches;
            this.stopOnFailure = stopOnFailure;
        }
        
        // Getters
        public String getInputApkPath() { return inputApkPath; }
        public String getOutputApkPath() { return outputApkPath; }
        public List<String> getSelectedPatches() { return selectedPatches; }
        public List<String> getExcludePatches() { return excludePatches; }
        public boolean isStopOnFailure() { return stopOnFailure; }
    }
    
    public static class ReVancedStatus {
        private final boolean environmentValid;
        private final String cliVersion;
        private final String patchesVersion;
        private final String managerVersion;
        private final int totalPatches;
        
        public ReVancedStatus(boolean environmentValid, String cliVersion, 
                            String patchesVersion, String managerVersion, int totalPatches) {
            this.environmentValid = environmentValid;
            this.cliVersion = cliVersion;
            this.patchesVersion = patchesVersion;
            this.managerVersion = managerVersion;
            this.totalPatches = totalPatches;
        }
        
        // Getters
        public boolean isEnvironmentValid() { return environmentValid; }
        public String getCliVersion() { return cliVersion; }
        public String getPatchesVersion() { return patchesVersion; }
        public String getManagerVersion() { return managerVersion; }
        public int getTotalPatches() { return totalPatches; }
    }
    
    @FunctionalInterface
    public interface PatchingProgressCallback {
        void onProgress(int percentage, String message);
    }
}