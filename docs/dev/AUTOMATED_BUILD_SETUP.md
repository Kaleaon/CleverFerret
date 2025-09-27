# CleverFerret Automated Build & Release System

This document explains how to set up and use the automated build and release system for CleverFerret Universal Media Library. The system uses GitHub Actions to automatically build, test, sign, and publish APK files to GitHub releases and packages.

## 🚀 Features

- **Automated CI/CD Pipeline**: Builds and tests on every push and pull request
- **Automated Releases**: Creates GitHub releases with APK assets when tags are pushed
- **Nightly Builds**: Automatic nightly builds from the main branch
- **Release Candidates**: Special builds for testing before main releases
- **APK Signing**: Automatic APK signing with configurable keystore
- **GitHub Packages**: Publishes to GitHub Packages for distribution
- **Security Scanning**: Automated security analysis of APK files
- **Multi-variant Builds**: Debug and release APK variants

## 📋 Prerequisites

1. **GitHub Repository**: Your CleverFerret code must be in a GitHub repository
2. **Android SDK**: The build system uses Android SDK 34 (Android 14)
3. **Java 17**: Required for building the Android project
4. **Signing Keystore** (optional): For signed release APKs

## ⚙️ Setup Instructions

### 1. Repository Setup

1. Push your CleverFerret code to a GitHub repository
2. Ensure the repository has the following structure:
   ```
   your-repo/
   ├── .github/workflows/          # GitHub Actions workflows
   ├── CleverFerret/              # Android project directory
   ├── CleverFerret/build.gradle.kts
   ├── CleverFerret/publish.gradle
   ├── CleverFerret/version.gradle
   └── gradlew                    # Gradle wrapper
   ```

### 2. Configure Repository Secrets

Go to your GitHub repository → Settings → Secrets and variables → Actions, and add the following secrets:

#### Required Secrets:
- `GITHUB_TOKEN`: Automatically provided by GitHub (no action needed)

#### Optional Secrets (for APK signing):
- `KEYSTORE_BASE64`: Your release keystore file encoded in base64
- `KEYSTORE_PASSWORD`: Password for your keystore
- `KEY_ALIAS`: Alias of the key in your keystore
- `KEY_PASSWORD`: Password for the key

#### How to create base64 keystore:
```bash
# Convert your keystore to base64 (replace 'your-keystore.jks' with your actual keystore filename)
base64 -i your-keystore.jks | pbcopy  # macOS
base64 your-keystore.jks | xclip      # Linux
```

**Note**: Replace `your-keystore.jks` with the actual filename of your keystore file.

### 3. Update Build Configuration

1. **Update build.gradle.kts**: Ensure your CleverFerret/build.gradle.kts includes the publish configuration:
   ```kotlin
   // Add this at the end of your build.gradle.kts
   apply from: 'publish.gradle'
   apply from: 'version.gradle'
   ```

2. **Configure package.json equivalent**: Update your GitHub username in `publish.gradle`:
   ```groovy
   // Replace YOUR-USERNAME with your actual GitHub username
   url = uri("https://maven.pkg.github.com/YOUR-USERNAME/CleverFerret")
   ```

### 4. Enable GitHub Packages (Optional)

1. Go to your repository → Settings → Pages
2. Enable GitHub Packages for your repository
3. Configure package permissions in repository settings

## 🔄 Workflow Types

### 1. Main CI/CD Pipeline (`android-ci.yml`)

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop`
- Tags starting with `v*` (e.g., `v1.2.0`)

**Jobs:**
1. **Test**: Runs unit tests and lint checks
2. **Build**: Builds debug and release APKs
3. **Security Scan**: Analyzes APK for security issues
4. **Release**: Creates GitHub release (tags only)
5. **Publish**: Publishes to GitHub Packages

**Artifacts:**
- Debug APK (retained for 30 days)
- Release APK (retained for 90 days)
- Test reports
- Security scan results

### 2. Nightly Builds (`nightly-build.yml`)

**Triggers:**
- Scheduled daily at 2 AM UTC
- Manual trigger via GitHub Actions UI

**Features:**
- Builds from latest `main` branch
- Creates nightly release with timestamp
- Automatically cleans old nightly releases (keeps last 7)
- Uses special nightly version naming

### 3. Release Candidates (`release-candidate.yml`)

**Triggers:**
- Push to `release/*` branches
- Tags with `-rc`, `-beta`, or `-alpha` suffixes

**Features:**
- Comprehensive testing
- Pre-release GitHub releases
- Extended retention for testing

## 📦 Build Outputs

### APK Naming Convention

- **Release**: `CleverFerret-v{version}-release.apk`
- **Debug**: `CleverFerret-v{version}-debug.apk`
- **Nightly**: `CleverFerret-nightly-{date}-{commit}.apk`
- **RC**: `CleverFerret-{version}-rc.{timestamp}.apk`

### GitHub Releases

All releases include:
- Automatically generated changelog
- Installation instructions
- System requirements
- Feature highlights
- Both debug and release APKs

## 🎯 Usage Guide

### Creating a Release

1. **Update version in build.gradle.kts**:
   ```kotlin
   versionName = "1.2.0"
   versionCode = 12
   ```

2. **Commit and push changes**:
   ```bash
   git add .
   git commit -m "Bump version to 1.2.0"
   git push origin main
   ```

3. **Create and push tag**:
   ```bash
   git tag v1.2.0
   git push origin v1.2.0
   ```

4. **Monitor build**: Check GitHub Actions tab for build progress

### Creating a Release Candidate

1. **Create release branch**:
   ```bash
   git checkout -b release/1.2.0
   git push origin release/1.2.0
   ```

2. **Or create RC tag**:
   ```bash
   git tag v1.2.0-rc1
   git push origin v1.2.0-rc1
   ```

### Manual Nightly Build

1. Go to GitHub Actions → Nightly Build
2. Click "Run workflow"
3. Select branch (usually `main`)
4. Click "Run workflow"

## 🔧 Customization Options

### Modifying Build Scripts

**Add custom build steps** in `.github/workflows/android-ci.yml`:
```yaml
- name: Custom build step
  run: |
    echo "Running custom build logic"
    ./gradlew customTask
```

**Modify version extraction** in `version.gradle`:
```groovy
// Customize version extraction logic
def getCustomVersion() {
    // Your custom version logic
    return "custom-version"
}
```

### Environment Variables

Set environment variables in workflow files:
```yaml
env:
  CUSTOM_BUILD_FLAG: "production"
  API_ENDPOINT: "https://api.cleverferret.com"
```

## 📊 Monitoring & Troubleshooting

### Build Status

Monitor builds in GitHub Actions tab:
- ✅ Green: Build successful
- ❌ Red: Build failed
- 🟡 Yellow: Build in progress

### Common Issues

1. **Build fails with missing dependencies**:
   - Check Gradle cache
   - Verify Android SDK version
   - Update dependencies in build.gradle.kts

2. **APK signing fails**:
   - Verify keystore secrets are correctly set
   - Check keystore passwords
   - Ensure base64 encoding is correct

3. **Version extraction fails**:
   - Check version format in build.gradle.kts
   - Verify version.gradle script

4. **GitHub Packages upload fails**:
   - Check repository permissions
   - Verify GitHub token has correct scope
   - Check package visibility settings

### Debug Information

Each workflow provides detailed logs:
1. Go to GitHub Actions tab
2. Click on failed workflow
3. Expand job steps to see detailed logs
4. Download artifacts for further analysis

## 🔒 Security Considerations

1. **Keystore Security**: Never commit keystore files to repository
2. **Secret Management**: Use GitHub Secrets for sensitive data
3. **Package Permissions**: Configure appropriate permissions for GitHub Packages
4. **APK Verification**: Always verify APK signatures before distribution
5. **Dependency Scanning**: Regular security scans of dependencies

## 📈 Advanced Features

### Custom Gradle Tasks

Add custom tasks to `version.gradle`:
```groovy
task customBuildTask {
    doLast {
        println "Executing custom build logic"
        // Your custom logic here
    }
}
```

### Slack/Discord Notifications

Add notification steps to workflows:
```yaml
- name: Notify Slack
  if: failure()
  uses: 8398a7/action-slack@v3
  with:
    status: failure
    webhook_url: ${{ secrets.SLACK_WEBHOOK }}
```

### Multiple Build Variants

Configure different build variants:
```yaml
strategy:
  matrix:
    build-type: [debug, release, beta]
```

## 📚 Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Android GitHub Actions](https://github.com/actions/setup-java)
- [APK Signing Guide](https://developer.android.com/studio/publish/app-signing)
- [GitHub Packages Documentation](https://docs.github.com/en/packages)

## 🤝 Contributing

When contributing to the build system:

1. Test changes in a fork first
2. Update documentation for any new features
3. Ensure backward compatibility
4. Add appropriate error handling
5. Test with different build scenarios

## 📞 Support

If you encounter issues with the automated build system:

1. Check the troubleshooting section above
2. Review GitHub Actions logs
3. Create an issue with build logs and error details
4. Tag the issue with `build-system` label

---

**Happy Building! 🚀**

The CleverFerret automated build system is designed to make releases effortless and reliable. With proper setup, every code change automatically goes through testing, building, and packaging, ensuring high-quality releases for your users.