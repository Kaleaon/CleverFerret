#!/bin/bash

# CleverFerret Build Script with Android Tools Integration
# Automatically sets up android-tools and builds the application

set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

# Color output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[WARNING]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Setup function
setup_environment() {
    log_info "Setting up build environment..."
    
    # Set Java environment
    export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-arm64}
    if [ ! -d "$JAVA_HOME" ]; then
        # Try alternative Java paths
        for java_path in /usr/lib/jvm/java-17-openjdk-* /usr/lib/jvm/default-java; do
            if [ -d "$java_path" ]; then
                export JAVA_HOME="$java_path"
                break
            fi
        done
    fi
    
    if [ ! -d "$JAVA_HOME" ]; then
        log_error "Java 17 not found. Please install OpenJDK 17"
        exit 1
    fi
    
    # Set Android SDK environment
    export ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
    if [ ! -d "$ANDROID_HOME" ]; then
        log_error "Android SDK not found. Please install Android SDK"
        exit 1
    fi
    
    # Update PATH
    export PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
    
    log_success "Environment configured"
    log_info "JAVA_HOME: $JAVA_HOME"
    log_info "ANDROID_HOME: $ANDROID_HOME"
}

# Android tools setup
setup_android_tools() {
    log_info "Setting up Android tools..."
    
    # Run android-tools setup script
    if [ -f "$PROJECT_ROOT/build-scripts/android-tools-setup.sh" ]; then
        chmod +x "$PROJECT_ROOT/build-scripts/android-tools-setup.sh"
        "$PROJECT_ROOT/build-scripts/android-tools-setup.sh"
    else
        log_error "Android tools setup script not found"
        exit 1
    fi
    
    # Source gradle properties if created
    if [ -f "$PROJECT_ROOT/gradle-android-tools.properties" ]; then
        log_info "Loading Android tools configuration..."
        # Export gradle properties as environment variables (with valid shell variable names)
        while IFS='=' read -r key value; do
            if [[ ! "$key" =~ ^[[:space:]]*# ]] && [ -n "$key" ]; then
                # Convert gradle property names to valid shell variable names
                local shell_var=$(echo "$key" | sed 's/\./_/g')
                export "$shell_var"="$value"
                
                # Also set specific variables for known android-tools properties
                case "$key" in
                    "android.tools.custom.aapt2.path")
                        export CUSTOM_AAPT2_PATH="$value"
                        ;;
                    "android.tools.custom.aapt2.arch")
                        export CUSTOM_AAPT2_ARCH="$value"
                        ;;
                    "android.tools.host.arch")
                        export ANDROID_TOOLS_HOST_ARCH="$value"
                        ;;
                esac
            fi
        done < "$PROJECT_ROOT/gradle-android-tools.properties"
    fi
}

# Build function
build_project() {
    local build_type="${1:-debug}"
    
    log_info "Starting CleverFerret build ($build_type)..."
    
    cd "$PROJECT_ROOT"
    
    # Clean build directories
    log_info "Cleaning previous builds..."
    rm -rf build/ CleverFerret/build/ .gradle/
    
    # Configure gradle with optimized settings
    local gradle_opts="-Xmx4g -XX:MaxMetaspaceSize=1g -XX:+UseG1GC"
    export GRADLE_OPTS="$gradle_opts"
    
    # Build command based on type
    local build_command
    case "$build_type" in
        "release")
            build_command="assembleRelease"
            ;;
        "debug"|*)
            build_command="assembleDebug"
            ;;
    esac
    
    log_info "Running gradle build: $build_command"
    
    # Run build with timeout and proper error handling
    if timeout 10m ./gradlew "$build_command" \
        --parallel \
        --build-cache \
        --configuration-cache \
        --no-daemon \
        --stacktrace; then
        
        log_success "Build completed successfully!"
        
        # Find and report APK
        local apk_path=$(find . -name "*.apk" -type f | head -1)
        if [ -n "$apk_path" ]; then
            log_success "APK generated: $apk_path"
            ls -lh "$apk_path"
        fi
        
        return 0
    else
        log_error "Build failed!"
        
        # Show recent build logs for debugging
        if [ -f "$PROJECT_ROOT/build.log" ]; then
            log_info "Recent build output:"
            tail -n 50 "$PROJECT_ROOT/build.log"
        fi
        
        return 1
    fi
}

# Test function
test_build() {
    log_info "Testing build environment..."
    
    # Test Java
    if java -version; then
        log_success "Java working"
    else
        log_error "Java test failed"
        return 1
    fi
    
    # Test Android tools
    if [ -n "$CUSTOM_AAPT2_PATH" ] && [ -f "$CUSTOM_AAPT2_PATH" ]; then
        if "$CUSTOM_AAPT2_PATH" version; then
            log_success "AAPT2 working: $CUSTOM_AAPT2_PATH"
        else
            log_warning "AAPT2 version check failed, but tool exists"
        fi
    else
        log_warning "Custom AAPT2 not configured"
    fi
    
    # Test gradle
    if ./gradlew --version; then
        log_success "Gradle working"
    else
        log_error "Gradle test failed"
        return 1
    fi
    
    log_success "Build environment tests passed"
}

# Main function
main() {
    local build_type="${1:-debug}"
    local action="${2:-build}"
    
    log_info "CleverFerret Build with Android Tools"
    log_info "Build type: $build_type"
    log_info "Action: $action"
    
    case "$action" in
        "test")
            setup_environment
            setup_android_tools
            test_build
            ;;
        "setup")
            setup_environment
            setup_android_tools
            log_success "Setup completed. Run with 'build' action to compile."
            ;;
        "build"|*)
            setup_environment
            setup_android_tools
            build_project "$build_type"
            ;;
    esac
}

# Help function
show_help() {
    echo "CleverFerret Build Script with Android Tools"
    echo ""
    echo "Usage: $0 [build_type] [action]"
    echo ""
    echo "Build Types:"
    echo "  debug     - Debug build (default)"
    echo "  release   - Release build"
    echo ""
    echo "Actions:"
    echo "  build     - Full build (default)"
    echo "  setup     - Setup environment only" 
    echo "  test      - Test build environment"
    echo ""
    echo "Examples:"
    echo "  $0                    # Debug build"
    echo "  $0 release           # Release build"
    echo "  $0 debug setup       # Setup environment"
    echo "  $0 debug test        # Test environment"
}

# Handle help
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    show_help
    exit 0
fi

# Execute main function
main "$@"