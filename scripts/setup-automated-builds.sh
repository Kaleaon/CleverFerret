#!/bin/bash

# CleverFerret Automated Build Setup Script
# This script helps set up the automated build system for CleverFerret

set -e

echo "🚀 CleverFerret Automated Build Setup"
echo "======================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check prerequisites
check_prerequisites() {
    log_info "Checking prerequisites..."
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
        log_error "This is not a git repository. Please initialize git first."
        exit 1
    fi
    
    # Check if GitHub CLI is available
    if command -v gh &> /dev/null; then
        log_success "GitHub CLI found"
        HAS_GH_CLI=true
    else
        log_warning "GitHub CLI not found. Manual setup required for some features."
        HAS_GH_CLI=false
    fi
    
    # Check if gradlew exists
    if [ -f "./gradlew" ]; then
        log_success "Gradle wrapper found"
    else
        log_error "Gradle wrapper not found. Please ensure you're in the project root."
        exit 1
    fi
    
    # Check if required directories exist
    if [ -d "./CleverFerret" ]; then
        log_success "CleverFerret directory found"
    else
        log_error "CleverFerret directory not found. Please check project structure."
        exit 1
    fi
}

# Set up GitHub repository
setup_github_repo() {
    log_info "Setting up GitHub repository..."
    
    if [ "$HAS_GH_CLI" = true ]; then
        # Check if repo exists on GitHub
        REPO_INFO=$(gh repo view 2>/dev/null || echo "")
        if [ -n "$REPO_INFO" ]; then
            log_success "GitHub repository already exists"
            REPO_URL=$(gh repo view --json url -q .url)
            log_info "Repository URL: $REPO_URL"
        else
            log_warning "GitHub repository not found. Please create it manually or use 'gh repo create'"
        fi
    else
        log_warning "Please ensure your code is pushed to a GitHub repository"
    fi
}

# Verify workflow files
verify_workflows() {
    log_info "Verifying GitHub Actions workflow files..."
    
    WORKFLOW_DIR=".github/workflows"
    if [ ! -d "$WORKFLOW_DIR" ]; then
        log_error "GitHub Actions workflow directory not found at $WORKFLOW_DIR"
        exit 1
    fi
    
    REQUIRED_WORKFLOWS=("android-ci.yml" "nightly-build.yml" "release-candidate.yml")
    
    for workflow in "${REQUIRED_WORKFLOWS[@]}"; do
        if [ -f "$WORKFLOW_DIR/$workflow" ]; then
            log_success "Found $workflow"
        else
            log_error "Missing required workflow: $workflow"
            exit 1
        fi
    done
}

# Check build configuration
check_build_config() {
    log_info "Checking build configuration..."
    
    BUILD_FILE="CleverFerret/build.gradle.kts"
    if [ -f "$BUILD_FILE" ]; then
        log_success "Found build.gradle.kts"
        
        # Check if publish.gradle is applied
        if grep -q "publish.gradle" "$BUILD_FILE"; then
            log_success "publish.gradle is applied"
        else
            log_warning "publish.gradle not applied. Adding it now..."
            echo "" >> "$BUILD_FILE"
            echo "// Apply additional build scripts" >> "$BUILD_FILE"
            echo "apply(from = \"publish.gradle\")" >> "$BUILD_FILE"
            echo "apply(from = \"version.gradle\")" >> "$BUILD_FILE"
            log_success "Added build scripts to build.gradle.kts"
        fi
    else
        log_error "build.gradle.kts not found"
        exit 1
    fi
    
    # Check supporting files
    SUPPORT_FILES=("CleverFerret/publish.gradle" "CleverFerret/version.gradle")
    for file in "${SUPPORT_FILES[@]}"; do
        if [ -f "$file" ]; then
            log_success "Found $(basename $file)"
        else
            log_error "Missing required file: $file"
            exit 1
        fi
    done
}

# Generate keystore instructions
generate_keystore_instructions() {
    log_info "Generating keystore setup instructions..."
    
    cat > keystore-setup.md << 'EOF'
# Keystore Setup for APK Signing

## 1. Generate a new keystore (if you don't have one):

```bash
keytool -genkey -v -keystore cleverferret-release.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias cleverferret-key
```

## 2. Convert keystore to base64:

```bash
# macOS
base64 -i cleverferret-release.jks | pbcopy

# Linux
base64 cleverferret-release.jks | xclip -selection clipboard

# Windows (PowerShell)
[Convert]::ToBase64String([IO.File]::ReadAllBytes("cleverferret-release.jks")) | Set-Clipboard
```

## 3. Add GitHub Secrets:

Go to your GitHub repository → Settings → Secrets and variables → Actions

Add these secrets:
- `KEYSTORE_BASE64`: The base64 encoded keystore (from step 2)
- `KEYSTORE_PASSWORD`: Password you used when creating the keystore
- `KEY_ALIAS`: The alias (cleverferret-key from example above)
- `KEY_PASSWORD`: Key password (often same as keystore password)

## 4. Security Notes:

- Never commit the .jks file to your repository
- Store keystore file securely offline
- Use strong passwords
- Document keystore details securely for team access

EOF
    
    log_success "Created keystore-setup.md with detailed instructions"
}

# Test build system
test_build_system() {
    log_info "Testing build system..."
    
    # Make gradlew executable
    chmod +x ./gradlew
    
    # Test version tasks
    log_info "Testing version extraction..."
    if ./gradlew printVersionName >/dev/null 2>&1; then
        VERSION_NAME=$(./gradlew -q printVersionName 2>/dev/null | tail -n1)
        log_success "Version Name: $VERSION_NAME"
    else
        log_error "Failed to extract version name"
    fi
    
    if ./gradlew printVersionCode >/dev/null 2>&1; then
        VERSION_CODE=$(./gradlew -q printVersionCode 2>/dev/null | tail -n1)
        log_success "Version Code: $VERSION_CODE"
    else
        log_error "Failed to extract version code"
    fi
    
    # Test basic build (optional, can be slow)
    read -p "Do you want to test a basic build? This may take several minutes. (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        log_info "Testing basic build..."
        if ./gradlew assembleDebug >/dev/null 2>&1; then
            log_success "Debug build successful"
        else
            log_warning "Debug build failed, but this might be due to missing dependencies"
        fi
    fi
}

# Setup GitHub secrets reminder
setup_secrets_reminder() {
    log_info "Setting up GitHub Secrets reminder..."
    
    cat > github-secrets-checklist.md << 'EOF'
# GitHub Secrets Setup Checklist

## Required Secrets (for APK signing):

Go to: Repository → Settings → Secrets and variables → Actions

### Add these secrets:

- [ ] `KEYSTORE_BASE64` - Your release keystore encoded in base64
- [ ] `KEYSTORE_PASSWORD` - Password for your keystore
- [ ] `KEY_ALIAS` - Alias of the key in your keystore
- [ ] `KEY_PASSWORD` - Password for the key

### Automatic Secrets:

- [x] `GITHUB_TOKEN` - Automatically provided by GitHub

## Optional Setup:

- [ ] Enable GitHub Packages in repository settings
- [ ] Configure branch protection rules
- [ ] Set up notification webhooks (Slack, Discord, etc.)
- [ ] Review and customize workflow triggers

## Testing:

- [ ] Push a commit to trigger CI/CD
- [ ] Create a test tag to trigger release workflow
- [ ] Verify APK artifacts are generated
- [ ] Check GitHub Packages publishing (if enabled)

## Next Steps:

1. Complete keystore setup (see keystore-setup.md)
2. Add GitHub secrets
3. Push changes to trigger first build
4. Create your first release tag (e.g., v1.0.0)

EOF
    
    log_success "Created github-secrets-checklist.md"
}

# Create release helper script
create_release_script() {
    log_info "Creating release helper script..."
    
    cat > create-release.sh << 'EOF'
#!/bin/bash

# CleverFerret Release Helper Script
# Usage: ./create-release.sh <version> [--beta|--rc]

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <version> [--beta|--rc]"
    echo "Example: $0 1.2.0"
    echo "Example: $0 1.2.0 --beta"
    exit 1
fi

VERSION=$1
SUFFIX=""

if [ "$2" = "--beta" ]; then
    SUFFIX="-beta"
elif [ "$2" = "--rc" ]; then
    SUFFIX="-rc1"
fi

FULL_VERSION="v${VERSION}${SUFFIX}"

echo "Creating release: $FULL_VERSION"

# Update version in build.gradle.kts
sed -i.bak "s/versionName = \".*\"/versionName = \"$VERSION$SUFFIX\"/" CleverFerret/build.gradle.kts

# Commit version bump
git add CleverFerret/build.gradle.kts
git commit -m "Bump version to $FULL_VERSION"

# Create and push tag
git tag $FULL_VERSION
git push origin main
git push origin $FULL_VERSION

echo "✅ Release $FULL_VERSION created and pushed!"
echo "Check GitHub Actions for build progress: https://github.com/$(git remote get-url origin | sed 's/.*github.com[:/]\([^/]*\/[^/]*\).*/\1/' | sed 's/\.git$//')/actions"
EOF
    
    chmod +x create-release.sh
    log_success "Created create-release.sh helper script"
}

# Main setup function
main() {
    echo
    log_info "Starting CleverFerret automated build setup..."
    echo
    
    check_prerequisites
    setup_github_repo
    verify_workflows
    check_build_config
    generate_keystore_instructions
    test_build_system
    setup_secrets_reminder
    create_release_script
    
    echo
    log_success "Setup complete! 🎉"
    echo
    echo "Next steps:"
    echo "1. 📖 Read keystore-setup.md for APK signing setup"
    echo "2. ✅ Complete github-secrets-checklist.md"
    echo "3. 🚀 Push your changes to trigger the first build"
    echo "4. 📦 Use ./create-release.sh to create releases"
    echo
    echo "Documentation: AUTOMATED_BUILD_SETUP.md"
    echo "Support: Create an issue on GitHub if you need help"
    echo
}

# Run main function
main "$@"