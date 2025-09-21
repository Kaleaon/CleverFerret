// CleverFerret ReVanced Integration Usage Example

import com.cleverferret.integrations.revanced.ReVancedIntegrator;
import java.util.Arrays;
import java.util.List;

public class ReVancedUsageExample {
    
    public static void main(String[] args) {
        // Initialize ReVanced Integrator
        ReVancedIntegrator integrator = new ReVancedIntegrator("/app", true);
        
        // Set progress callback
        integrator.setProgressCallback((percentage, message) -> {
            System.out.println("[" + percentage + "%] " + message);
        });
        
        // Check environment status
        ReVancedIntegrator.ReVancedStatus status = integrator.getStatus();
        System.out.println("ReVanced Environment Status: " + status.isEnvironmentValid());
        System.out.println("CLI Version: " + status.getCliVersion());
        System.out.println("Patches Version: " + status.getPatchesVersion());
        System.out.println("Manager Version: " + status.getManagerVersion());
        
        // Example 1: Get available patches for YouTube
        System.out.println("\n=== Available YouTube Patches ===");
        List<String> youtubePatches = integrator.getAvailablePatches("com.google.android.youtube");
        youtubePatches.forEach(patch -> System.out.println("- " + patch));
        
        // Example 2: Patch a YouTube APK with selected patches
        System.out.println("\n=== Patching YouTube APK ===");
        
        List<String> selectedPatches = Arrays.asList(
            "hide-ads",           // Remove advertisements
            "background-play",    // Enable background playback
            "sponsorblock",       // Skip sponsored segments
            "return-youtube-dislike", // Show dislike count
            "hide-shorts-button"  // Hide YouTube Shorts button
        );
        
        List<String> excludePatches = Arrays.asList(
            "premium-heading",    // Keep premium prompts
            "hide-premium-navbar" // Keep premium tab
        );
        
        ReVancedIntegrator.PatchingResult result = integrator.patchApk(
            "/path/to/youtube.apk",           // Input APK
            "/path/to/youtube-patched.apk",   // Output APK
            selectedPatches,                  // Patches to include
            excludePatches                    // Patches to exclude
        );
        
        if (result.isSuccess()) {
            System.out.println("✅ YouTube patching successful!");
            System.out.println("Patched APK: " + result.getOutputPath());
        } else {
            System.out.println("❌ YouTube patching failed: " + result.getMessage());
        }
        
        // Example 3: Batch patching multiple apps
        System.out.println("\n=== Batch Patching Multiple Apps ===");
        
        List<ReVancedIntegrator.BatchPatchRequest> batchRequests = Arrays.asList(
            new ReVancedIntegrator.BatchPatchRequest(
                "/path/to/instagram.apk",
                "/path/to/instagram-patched.apk",
                Arrays.asList("hide-ads", "download-story"),
                Arrays.asList(),
                false // Don't stop on failure
            ),
            new ReVancedIntegrator.BatchPatchRequest(
                "/path/to/tiktok.apk", 
                "/path/to/tiktok-patched.apk",
                Arrays.asList("download-video", "remove-ads"),
                Arrays.asList(),
                false
            )
        );
        
        integrator.batchPatch(batchRequests).thenAccept(results -> {
            System.out.println("Batch patching completed:");
            for (int i = 0; i < results.size(); i++) {
                ReVancedIntegrator.PatchingResult batchResult = results.get(i);
                System.out.println("App " + (i + 1) + ": " + 
                    (batchResult.isSuccess() ? "SUCCESS" : "FAILED - " + batchResult.getMessage()));
            }
        }).join();
        
        // Example 4: Get ReVanced Manager for user installation
        System.out.println("\n=== ReVanced Manager ===");
        String managerPath = integrator.getManagerApkPath();
        System.out.println("ReVanced Manager APK available at: " + managerPath);
        System.out.println("Users can install this APK for GUI-based patching");
        
        System.out.println("\n=== Integration Examples Complete ===");
    }
}

/*
Expected Output:

ReVanced Environment Status: true
CLI Version: 5.0.1
Patches Version: 5.40.0
Manager Version: 1.25.1

=== Available YouTube Patches ===
- hide-ads
- background-play
- sponsorblock
- return-youtube-dislike
- hide-shorts-button
- premium-heading
- hide-premium-navbar
- custom-video-speed
- wide-searchbar
- tablet-mini-player
[... and 20+ more patches]

=== Patching YouTube APK ===
[0%] Starting APK patching process...
[20%] Executing ReVanced CLI...
[30%] Applying patches: hide-ads
[40%] Applying patches: background-play
[50%] Applying patches: sponsorblock
[60%] Applying patches: return-youtube-dislike
[70%] Applying patches: hide-shorts-button
[90%] Building patched APK...
[100%] Patching completed successfully!
✅ YouTube patching successful!
Patched APK: /path/to/youtube-patched.apk

=== Batch Patching Multiple Apps ===
[0%] Processing 1/2: /path/to/instagram.apk
[50%] Processing 2/2: /path/to/tiktok.apk
Batch patching completed:
App 1: SUCCESS
App 2: SUCCESS

=== ReVanced Manager ===
ReVanced Manager APK available at: /app/revanced-integration/manager/revanced-manager-1.25.1.apk
Users can install this APK for GUI-based patching

=== Integration Examples Complete ===
*/