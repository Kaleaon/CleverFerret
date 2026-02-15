# Security Best Practices - CleverFerret

**Last Updated:** December 30, 2024  
**Version:** 1.6.5

This document outlines security best practices implemented in CleverFerret and guidelines for maintaining security.

---

## Table of Contents
1. [Network Security](#network-security)
2. [API Key Management](#api-key-management)
3. [Storage Security](#storage-security)
4. [Permission Management](#permission-management)
5. [Service Security](#service-security)
6. [Code Security](#code-security)
7. [Build Security](#build-security)

---

## Network Security

### ✅ HTTPS Enforcement

CleverFerret enforces HTTPS by default through Network Security Configuration.

**Configuration**: `res/xml/network_security_config.xml`

```xml
<base-config cleartextTrafficPermitted="false">
    <!-- HTTPS required for all traffic except explicitly allowed domains -->
</base-config>
```

### ⚠️ Cleartext Traffic Exceptions

HTTP (cleartext) traffic is only allowed for:

1. **Local Network**: `localhost`, `127.0.0.1`, and private IP ranges
2. **Development**: localhost servers for testing
3. **Legacy Services**: Only specific domains if absolutely necessary

**Important**: Before adding any domain to cleartext exceptions, verify:
- Is HTTPS truly unavailable?
- Is the domain trusted?
- Is the data transmission non-sensitive?

### 🔒 Certificate Pinning (Future Enhancement)

For production, consider implementing certificate pinning for critical services:

```xml
<domain-config>
    <domain includeSubdomains="true">api.yourservice.com</domain>
    <pin-set>
        <pin digest="SHA-256">base64-encoded-hash</pin>
    </pin-set>
</domain-config>
```

---

## API Key Management

### ✅ Secrets Management

Sensitive API keys are **not** written to `BuildConfig` and must be provided at runtime through secure provisioning.

**Provisioning model**:

1. **Production/Release**: provision secrets through backend token exchange or encrypted local key provisioning (for example, user-provided keys stored in encrypted app storage).
2. **Local development**: place untracked values in `local.properties` or export environment variables before running Gradle tasks.
3. **Build enforcement**: `preDebugBuild` and `preReleaseBuild` fail fast when required runtime secrets (currently `TASTEDIVE_API_KEY`) are missing.

**Local setup example** (`local.properties`, untracked):

```properties
TASTEDIVE_API_KEY=your_local_dev_key
```

Or use environment variables:

```bash
export TASTEDIVE_API_KEY="your-key"
```

### 🔐 Supported API Keys

| Service | Key Name | Purpose |
|---------|----------|---------|
| TasteDive | `TASTEDIVE_API_KEY` | Music/book recommendations |
| OpenAI | `OPENAI_API_KEY` | AI features (summaries, analysis) |
| Google | `GOOGLE_API_KEY` | Cloud sync |
| Dropbox | `DROPBOX_API_KEY` | Cloud sync |
| Plex | `PLEX_API_KEY` | Plex integration |

### ⚠️ API Key Security Rules

1. **Never hardcode** API keys in source code
2. **Never commit** secrets to tracked files (`gradle.properties`, source, or VCS history)
3. **Use environment variables** in CI/CD pipelines
4. **Rotate keys** periodically
5. **Restrict key permissions** to minimum required scope

### 🔁 Secret Rotation Runbook

1. Generate a new provider key in the upstream service.
2. Update backend/token-exchange secret storage first.
3. Update CI secret values (`TASTEDIVE_API_KEY`, etc.) and local `local.properties` copies.
4. Revoke old keys after rollout validation.
5. Record rotation date and owner in your team security log.

### 🔄 CI/CD Integration

For automated builds, use environment variables:

```bash
export TASTEDIVE_API_KEY="your-key"
./gradlew assembleRelease
```

Or use GitHub Secrets in workflows:

```yaml
env:
  TASTEDIVE_API_KEY: ${{ secrets.TASTEDIVE_API_KEY }}
```

---

## Storage Security

### Current Implementation

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" 
    android:maxSdkVersion="32" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" 
    android:maxSdkVersion="29" />
<uses-permission android:name="android.permission.MANAGE_EXTERNAL_STORAGE" />
```

### ⚠️ Legacy Storage Flags

Currently using legacy storage mode:
```xml
android:requestLegacyExternalStorage="true"
android:preserveLegacyExternalStorage="true"
```

**Action Required**: Migrate to Scoped Storage (Android 11+)

### 🔒 Secure File Sharing

FileProvider configured for secure file sharing:

```xml
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
```

**Best Practices**:
- Use FileProvider for sharing files between apps
- Never expose file:// URIs directly
- Grant temporary URI permissions only

---

## Permission Management

### Runtime Permissions

All dangerous permissions must be requested at runtime:

```kotlin
// Example: Request storage permission
if (ContextCompat.checkSelfPermission(context, 
    Manifest.permission.READ_MEDIA_AUDIO) != PackageManager.PERMISSION_GRANTED) {
    ActivityCompat.requestPermissions(activity, 
        arrayOf(Manifest.permission.READ_MEDIA_AUDIO), 
        REQUEST_CODE)
}
```

### Protected Permissions

These permissions are declared but may not be granted:

```xml
<!-- System/Signature permissions - may not be granted -->
<uses-permission android:name="android.permission.ACCESS_BROADCAST_RADIO" 
    tools:ignore="ProtectedPermissions" />
<uses-permission android:name="android.permission.CAPTURE_AUDIO_OUTPUT" 
    tools:ignore="ProtectedPermissions" />
```

**Important**: Always check permission status before use and provide fallback functionality.

---

## Service Security

### Exported Services

**Current Issue**: Some services are exported without permission protection.

```xml
<service
    android:name=".services.media.MediaNotificationService"
    android:exported="true"
    tools:ignore="ExportedService">
```

### 🔒 Recommended Fix

Add custom permission for exported services:

1. Define custom permission:
```xml
<permission
    android:name="com.universalmedialibrary.permission.BIND_MEDIA_SERVICE"
    android:protectionLevel="signature" />
```

2. Require permission:
```xml
<service
    android:name=".services.media.MediaNotificationService"
    android:exported="true"
    android:permission="com.universalmedialibrary.permission.BIND_MEDIA_SERVICE">
```

### Internal Services

Services not needed by other apps should be `exported="false"`:

```xml
<service
    android:name=".services.CalibreImportForegroundService"
    android:exported="false"
    android:foregroundServiceType="dataSync" />
```

---

## Code Security

### Input Validation

Always validate user input:

```kotlin
fun parseUrl(url: String): Uri? {
    if (!URLUtil.isValidUrl(url)) {
        return null
    }
    return Uri.parse(url)
}
```

### SQL Injection Prevention

Use Room's parameterized queries:

```kotlin
@Query("SELECT * FROM books WHERE title = :title")
fun findByTitle(title: String): Book?
```

**Never** use string concatenation for SQL:
```kotlin
// ❌ NEVER DO THIS
val query = "SELECT * FROM books WHERE title = '$userInput'"
```

### WebView Security

If using WebView, enable security features:

```kotlin
webView.settings.apply {
    javaScriptEnabled = false  // Only enable if necessary
    allowFileAccess = false
    allowContentAccess = false
}
```

---

## Build Security

### ProGuard/R8 Configuration

Enable code obfuscation for release builds:

```kotlin
buildTypes {
    release {
        isMinifyEnabled = true
        isShrinkResources = true
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
    }
}
```

### Signing Configuration

**Never commit keystores** to version control:

```gitignore
*.keystore
*.jks
*.p12
keystore/
```

Use environment variables for CI/CD:

```kotlin
val keystoreFile = if (System.getenv("KEYSTORE_BASE64") != null) {
    // Load from environment
} else {
    null
}
```

---

## Security Checklist

### Before Each Release

- [ ] Review all permissions - remove unused ones
- [ ] Check for hardcoded credentials
- [ ] Verify network security config
- [ ] Test with ProGuard/R8 enabled
- [ ] Run security scanner (e.g., MobSF)
- [ ] Review exported components
- [ ] Check for SQL injection vulnerabilities
- [ ] Validate all user inputs
- [ ] Test permission handling
- [ ] Review third-party dependencies for CVEs

### Continuous Security

- [ ] Keep dependencies updated
- [ ] Monitor security advisories
- [ ] Rotate API keys periodically
- [ ] Review crash reports for security issues
- [ ] Perform security audits
- [ ] Monitor for abnormal network traffic
- [ ] Keep Android SDK updated

---

## Reporting Security Issues

If you discover a security vulnerability:

1. **DO NOT** open a public issue
2. Email security concerns privately to the maintainers
3. Include detailed description and steps to reproduce
4. Allow time for patch before public disclosure

---

## Security Tools

### Recommended Tools

1. **Android Lint**: Built-in security checks
   ```bash
   ./gradlew lint
   ```

2. **MobSF**: Mobile Security Framework
   - Static and dynamic analysis
   - https://github.com/MobSF/Mobile-Security-Framework-MobSF

3. **OWASP Dependency Check**: Check for known vulnerabilities
   ```bash
   ./gradlew dependencyCheckAnalyze
   ```

4. **LeakCanary**: Memory leak detection
   ```kotlin
   debugImplementation("com.squareup.leakcanary:leakcanary-android:2.12")
   ```

---

## References

- [Android Security Best Practices](https://developer.android.com/topic/security/best-practices)
- [OWASP Mobile Security](https://owasp.org/www-project-mobile-security/)
- [Android Network Security Config](https://developer.android.com/training/articles/security-config)
- [Android Data and File Storage](https://developer.android.com/training/data-storage)

---

**Last Review**: December 30, 2024  
**Next Review**: March 30, 2025  
**Reviewer**: Development Team
