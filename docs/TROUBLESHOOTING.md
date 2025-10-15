# 🔧 CleverFerret Troubleshooting Guide

## Quick Diagnostics

Before diving into specific issues, run these diagnostic commands:

```bash
# Comprehensive system check
./gradlew diagnose

# Architecture and tools status  
./build-scripts/universal-build.sh info

# Build environment test
./build-scripts/universal-build.sh test-env
```

## Common Build Issues

### 1. AAPT2 Process Failed

**Error Messages:**
```
AAPT2 aapt2-8.4.1-11315950-linux Daemon #0: Unexpected error output
aapt2: 2: Syntax error: "(" unexpected
Failed to start AAPT2 process
Process unexpectedly exit
```

**Root Cause:** Architecture mismatch between cached AAPT2 binary and host system

**Solutions:**

```bash
# Option 1: Auto-fix with configuration
./gradlew configureAndroidTools
./build-scripts/universal-build.sh build

# Option 2: Clean and rebuild
./build-scripts/universal-build.sh clean
./build-scripts/universal-build.sh full-build

# Option 3: Manual cache clear
rm -rf ~/.gradle/caches/*/transforms/*/transformed/aapt2*
./gradlew clean build
```

**Verification:**
```bash
# Check if correct AAPT2 is being used
./gradlew logBuildConfig
```

### 2. Android Tools Not Found

**Error Messages:**
```
Android tools directory not found: /path/to/android-tools
No compatible AAPT2 binary found for architecture: [arch]
```

**Root Cause:** Missing or incomplete android-tools integration

**Solutions:**

```bash
# Check if android-tools directory exists
ls -la android-tools/

# Verify tools structure
./build-scripts/universal-build.sh info

# If missing, re-clone repository
git status
git pull origin main
```

**Manual Verification:**
```bash
# Check specific architecture support
ls -la android-tools/build/android-11.0.0_r33/aapt2/
find android-tools -name "aapt2" -type f -exec file {} \;
```

### 3. Java Version Issues

**Error Messages:**
```
Java 17 or higher required. Found: [version]
JAVA_HOME is not set
```

**Solutions:**

**Linux/Ubuntu:**
```bash
# Install Java 17
sudo apt update
sudo apt install openjdk-17-jdk

# Set JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc
```

**macOS:**
```bash
# Install with Homebrew
brew install openjdk@17

# Set JAVA_HOME
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
echo 'export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home' >> ~/.zshrc
```

**Windows:**
```powershell
# Download OpenJDK 17 from https://openjdk.org/
# Set environment variables
$env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk-17", "User")
```

**Verification:**
```bash
java -version
javac -version
echo $JAVA_HOME
```

### 4. Android SDK Issues

**Error Messages:**
```
ANDROID_HOME is not set
Android SDK not found
SDK location not found
```

**Solutions:**

**Automatic Setup:**
```bash
# Linux - Download Android SDK
cd /tmp
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip
unzip commandlinetools-linux-11076708_latest.zip
sudo mkdir -p /opt/android-sdk/cmdline-tools
sudo mv cmdline-tools /opt/android-sdk/cmdline-tools/latest

# Set environment variables
export ANDROID_HOME=/opt/android-sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Install required components
yes | sdkmanager --licenses
sdkmanager "platform-tools" "platforms;android-36" "build-tools;33.0.2"
```

**Manual Setup:**
```bash
# Set ANDROID_HOME to existing installation
export ANDROID_HOME=/path/to/your/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin
```

**Verification:**
```bash
echo $ANDROID_HOME
adb --version
aapt --version
```

### 5. Memory Issues

**Error Messages:**
```
OutOfMemoryError: Java heap space
Build failed with an exception
Gradle build daemon disappeared unexpectedly
```

**Solutions:**

```bash
# Increase Gradle heap memory
export GRADLE_OPTS="-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC"

# For persistent settings, add to ~/.gradle/gradle.properties
echo "org.gradle.jvmargs=-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC" >> ~/.gradle/gradle.properties

# Reduce parallel builds if needed
echo "org.gradle.parallel=false" >> ~/.gradle/gradle.properties
```

**System-specific adjustments:**
```bash
# Check available memory
free -h  # Linux
vm_stat  # macOS

# Adjust based on available RAM
# 8GB RAM: -Xmx2g
# 16GB RAM: -Xmx4g  
# 32GB RAM: -Xmx8g
```

### 6. Permission Issues

**Error Messages:**
```
Permission denied: ./gradlew
Permission denied: /path/to/aapt2
Could not execute binary
```

**Solutions:**

```bash
# Fix gradlew permissions
chmod +x gradlew
chmod +x build-scripts/*.sh

# Fix android-tools permissions
find android-tools -name "aapt2" -type f -exec chmod +x {} \;
find android-tools -name "aapt" -type f -exec chmod +x {} \;

# Fix all binary permissions
find android-tools -type f -name "*" -exec chmod +x {} \;
```

### 7. Network/Proxy Issues

**Error Messages:**
```
Could not resolve dependencies
Failed to download gradle
Connection timeout
```

**Solutions:**

**Configure Gradle Proxy:**
```bash
# ~/.gradle/gradle.properties
systemProp.http.proxyHost=proxy.company.com
systemProp.http.proxyPort=8080
systemProp.https.proxyHost=proxy.company.com
systemProp.https.proxyPort=8080
```

**Use Offline Mode:**
```bash
# Build with cached dependencies only
./gradlew build --offline
```

**Alternative Repositories:**
```bash
# Add to build.gradle.kts repositories block
maven { url = uri("https://maven.aliyun.com/repository/google") }
maven { url = uri("https://maven.aliyun.com/repository/central") }
```

## Architecture-Specific Issues

### ARM64 (Apple Silicon, ARM64 Linux)

**Common Issues:**
- Cached x86_64 AAPT2 binaries
- Rosetta compatibility problems (macOS)

**Solutions:**
```bash
# Force ARM64 tools
./gradlew configureAndroidTools
./gradlew clean build

# macOS: Ensure native ARM64 Java
arch -arm64 java -version
```

### x86_64 (Intel/AMD)

**Common Issues:**
- Missing x86_64 binaries
- Performance issues with emulation

**Solutions:**
```bash
# Verify x86_64 tools availability
ls -la android-tools/build/*/aapt2/x86_64/bin/

# Use native x86_64 build
./build-scripts/universal-build.sh build
```

### x86 (32-bit Intel)

**Common Issues:**
- Limited tool availability
- Memory constraints

**Solutions:**
```bash
# Check 32-bit support
./build-scripts/universal-build.sh info

# Reduce memory usage
export GRADLE_OPTS="-Xmx1g -XX:MaxMetaspaceSize=512m"
```

## Build Cache Issues

### Corrupted Cache

**Symptoms:**
- Inconsistent build results
- Strange compilation errors
- Tool compatibility issues

**Solutions:**
```bash
# Clear all caches
./gradlew cleanAll
rm -rf ~/.gradle/caches/
rm -rf .gradle/

# Rebuild from scratch
./build-scripts/universal-build.sh full-build
```

### Cache Size Issues

**Symptoms:**
- Disk space warnings
- Slow builds
- Cache corruption

**Solutions:**
```bash
# Check cache size
du -sh ~/.gradle/caches/

# Clean old cache entries
find ~/.gradle/caches -type f -atime +30 -delete

# Set cache size limit in ~/.gradle/gradle.properties
org.gradle.caching.buildCache.local.maxSize=2GB
```

## IDE Integration Issues

### Android Studio

**Common Issues:**
- Gradle sync failures
- Architecture detection problems
- Build tool mismatches

**Solutions:**
```bash
# Refresh Gradle project
# File -> Sync Project with Gradle Files

# Clear IDE caches
# File -> Invalidate Caches and Restart

# Import project fresh
# File -> Open -> Select project root
```

### VS Code

**Common Issues:**
- Extension conflicts
- Path issues
- Terminal environment

**Solutions:**
```bash
# Install required extensions
# - Kotlin Language
# - Gradle for Java
# - Android Tools

# Configure VS Code settings.json
{
    "java.home": "/path/to/java-17",
    "android.home": "/path/to/android-sdk"
}
```

## Debugging Commands

### System Information

```bash
# Complete system diagnostic
./gradlew diagnose

# Architecture detection
uname -m
java -XshowSettings:properties -version 2>&1 | grep os.arch

# Tool verification
find android-tools -name "aapt2" -type f -exec {} version \; 2>/dev/null
```

### Build Analysis

```bash
# Verbose build output
./gradlew build --info --stacktrace

# Profile build performance
./gradlew build --profile

# Dependency analysis
./gradlew dependencies

# Task analysis
./gradlew tasks --all
```

### Cache Inspection

```bash
# Find AAPT2 binaries
find ~/.gradle/caches -name "aapt2" -type f

# Check binary architecture
file ~/.gradle/caches/*/transforms/*/transformed/*/aapt2

# View gradle properties
cat ~/.gradle/gradle.properties
cat gradle-android-tools-runtime.properties
```

## Advanced Troubleshooting

### Custom Architecture Support

If you're using an unsupported architecture:

```kotlin
// Add to buildSrc/src/main/kotlin/AndroidToolsPlugin.kt
private fun detectHostArchitecture(): String {
    val osArch = System.getProperty("os.arch").lowercase()
    return when {
        // Add your custom architecture
        osArch.contains("riscv64") -> "riscv64"
        osArch.contains("mips64") -> "mips64"
        // ... existing mappings
        else -> "x86_64"
    }
}
```

### Custom Tool Sources

```bash
# Add custom AAPT2 binary
mkdir -p android-tools/build/custom/aapt2/your-arch/bin/
cp /path/to/your/aapt2 android-tools/build/custom/aapt2/your-arch/bin/
chmod +x android-tools/build/custom/aapt2/your-arch/bin/aapt2
```

### Build Script Debugging

```bash
# Enable debug mode in build scripts
export DEBUG=1
./build-scripts/universal-build.sh build

# Trace gradle execution
./gradlew build --debug > build-debug.log 2>&1
```

## Getting Help

### Information to Provide

When reporting issues, include:

1. **System Information:**
   ```bash
   ./gradlew diagnose > system-info.txt
   ./build-scripts/universal-build.sh info >> system-info.txt
   ```

2. **Error Logs:**
   ```bash
   ./gradlew build --stacktrace > build-error.log 2>&1
   ```

3. **Environment:**
   ```bash
   echo "OS: $(uname -a)" > environment.txt
   echo "Java: $(java -version 2>&1)" >> environment.txt
   echo "ANDROID_HOME: $ANDROID_HOME" >> environment.txt
   echo "PATH: $PATH" >> environment.txt
   ```

### Support Channels

1. **GitHub Issues**: Create detailed issue with logs
2. **Documentation**: Check docs/ directory for guides
3. **Diagnostics**: Run built-in diagnostic tools first

### Self-Service Debugging

```bash
# Step-by-step debugging
./build-scripts/universal-build.sh info          # 1. Check system
./build-scripts/universal-build.sh test-env      # 2. Test environment  
./gradlew configureAndroidTools                  # 3. Configure tools
./gradlew clean                                   # 4. Clean build
./gradlew build --info                           # 5. Verbose build
```

## Prevention

### Best Practices

1. **Regular Updates:**
   ```bash
   git pull origin main  # Keep android-tools updated
   ```

2. **Environment Consistency:**
   ```bash
   # Use consistent Java version
   # Set environment variables in shell profile
   # Document system requirements
   ```

3. **Cache Management:**
   ```bash
   # Periodic cache cleanup
   ./gradlew cleanAll
   ```

4. **Monitoring:**
   ```bash
   # Check build health regularly
   ./build-scripts/universal-build.sh test-env
   ```

Remember: The CleverFerret build system is designed to be self-healing. Most issues can be resolved by running the diagnostic and configuration commands. When in doubt, start with a clean build!