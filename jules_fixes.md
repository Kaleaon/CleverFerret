# Jules's Fixes

This document tracks the fixes I am making to the CleverFerret project to get it to a buildable state.

## Build Failures and Fixes

### 1. Initial Build Failure - Missing Android SDK

- **Error:** `SDK location not found. Define a valid SDK location with an ANDROID_HOME environment variable or by setting the sdk.dir path in your project's local properties file at '/app/local.properties'.`
- **Fix:** Set the `ANDROID_HOME` environment variable to `/app/android_sdk`.

### 2. AAPT2 Executable Not Found

- **Error:** `Specified AAPT2 executable does not exist: /app/modern-android-tools/termux-aapt/prebuilt-binary/arm64/aapt2.`
- **Fix:** Removed the `android.aapt2FromMavenOverride` property from `gradle.properties`.

### 3. Theme Not Found

- **Error:** `resource android:style/Theme.Material.DayNight.NoActionBar not found.`
- **Fix:**
    - Removed `android:theme` attribute from `AndroidManifest.xml`.
    - Deleted `themes.xml`.
    - Updated `ic_app_icon.xml` to use a hardcoded color instead of a theme attribute.

### 4. Kapt Error - Incompatible Types

- **Error:** `incompatible types: NonExistentClass cannot be converted to Annotation`
- **Fix:**
    - Replaced `GsonConverterFactory` with `retrofit2-kotlinx-serialization-converter`.
    - Added Retrofit dependencies.

### 5. Kapt Error - Could not find dependency

- **Error:** `Could not find com.google.mediapipe:tasks-vision-llm-inference:0.10.11`
- **Fix:** Corrected the MediaPipe dependency to `com.google.mediapipe:tasks-genai:0.10.27`.

### 6. Widespread Compilation Errors

- **Error:** A large number of `Unresolved reference`, `Redeclaration`, and `Overload resolution ambiguity` errors.
- **Fix:**
    - **Dependencies:** Added dependencies for DataStore, MediaPipe, Retrofit XML converter, MLKit, and Tika.
    - **Redeclarations:** Renamed data classes in `UserSettings.kt` to avoid conflicts.
    - **Unresolved References (In Progress):**
        - Fixing unresolved icon references in `MainActivity.kt`.
