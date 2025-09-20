#!/bin/bash

# Jules AI Development Environment Setup Script
# Configures CleverFerret Universal Build System for Jules

set -e

echo "🤖 Setting up CleverFerret for Jules AI Development Environment..."

# Color output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log_info() { echo -e "${BLUE}[JULES-SETUP]${NC} $1"; }
log_success() { echo -e "${GREEN}[JULES-SUCCESS]${NC} $1"; }
log_warning() { echo -e "${YELLOW}[JULES-WARNING]${NC} $1"; }

# Project root detection
PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_ROOT"

log_info "Project root: $PROJECT_ROOT"

# 1. Verify Universal Build System
log_info "Verifying Universal Build System..."
if [ -d "android-tools" ] && [ -f "build-scripts/universal-build.sh" ]; then
    log_success "Universal Build System detected"
    chmod +x build-scripts/*.sh
    chmod +x gradlew
else
    log_warning "Universal Build System not fully present"
fi

# 2. Environment Detection
log_info "Detecting development environment..."
echo "Host Architecture: $(uname -m)"
echo "Available Java versions:"
java -version 2>&1 || echo "Java not found"
echo "Available Node.js versions:"
node --version 2>/dev/null || echo "Node.js not found"

# 3. Android SDK Detection
log_info "Checking Android development environment..."
if [ -n "$ANDROID_HOME" ]; then
    log_success "ANDROID_HOME found: $ANDROID_HOME"
    if [ -f "$ANDROID_HOME/platform-tools/adb" ]; then
        log_success "Android platform tools available"
    fi
else
    log_warning "ANDROID_HOME not set - may need Android SDK setup"
fi

# 4. Create Jules workspace configuration
log_info "Creating Jules workspace configuration..."
cat > .jules/workspace.json << EOF
{
  "workspace": {
    "name": "CleverFerret",
    "type": "android-kotlin",
    "root": "$PROJECT_ROOT",
    "main_module": "CleverFerret",
    "build_system": "universal"
  },
  "quick_commands": {
    "info": "./build-scripts/universal-build.sh info",
    "build": "./build-scripts/simple-build.sh build debug",
    "test": "./gradlew testDebugUnitTest",
    "clean": "./gradlew clean",
    "diagnose": "./gradlew diagnose"
  },
  "file_structure": {
    "source": "CleverFerret/src/main/java/",
    "resources": "CleverFerret/src/main/res/",
    "tests": "CleverFerret/src/test/",
    "build_scripts": "build-scripts/",
    "docs": "docs/",
    "android_tools": "android-tools/"
  },
  "ai_context": {
    "primary_language": "kotlin",
    "architecture_pattern": "MVVM",
    "ui_framework": "jetpack_compose",
    "key_concepts": [
      "Universal Build System",
      "Multi-architecture support",
      "Media library management",
      "Calibre integration"
    ]
  }
}
EOF

# 5. Create development environment info
log_info "Creating development environment summary..."
cat > .jules/dev-environment.md << EOF
# CleverFerret Development Environment for Jules

## Project Overview
CleverFerret is a Universal Media Library Android application with a revolutionary multi-architecture build system.

## Key Technologies
- **Language**: Kotlin
- **UI Framework**: Jetpack Compose + Material 3
- **Architecture**: MVVM with Hilt DI
- **Database**: Room + SQLite
- **Media**: Media3 ExoPlayer
- **Build System**: Universal Build System (custom)

## Universal Build System
This project includes a custom Universal Build System that:
- Automatically detects host architecture
- Fixes AAPT2 compatibility issues
- Builds APKs for all Android architectures
- Provides self-healing build processes

## Quick Start Commands
\`\`\`bash
# Check system status
./build-scripts/universal-build.sh info

# Build the app
./build-scripts/simple-build.sh build debug

# Run tests
./gradlew testDebugUnitTest

# System diagnostics
./gradlew diagnose
\`\`\`

## Project Structure
- \`CleverFerret/src/main/java/\` - Main Kotlin source code
- \`build-scripts/\` - Universal build system scripts
- \`android-tools/\` - Multi-architecture build tools
- \`docs/\` - Comprehensive documentation

## AI Development Notes
- The Universal Build System is the key innovation
- All builds should use \`./build-scripts/simple-build.sh\`
- Architecture detection is automatic
- AAPT2 issues are auto-resolved

## Common Tasks
1. **Adding Features**: Modify files in \`CleverFerret/src/main/java/\`
2. **UI Changes**: Update Compose files in the UI package
3. **Build Issues**: Run \`./build-scripts/universal-build.sh test-env\`
4. **Testing**: Use \`./gradlew testDebugUnitTest\`

## Integration Points
- Room database entities in \`data/\` package
- Compose UI screens in \`ui/\` package
- Media players in \`players/\` package
- Hilt modules in \`di/\` package
EOF

# 6. Generate project context for AI
log_info "Generating AI context information..."
cat > .jules/ai-context.json << EOF
{
  "project_context": {
    "name": "CleverFerret Universal Media Library",
    "description": "Android app for managing books, music, movies, and podcasts with Calibre integration",
    "innovation": "Universal Build System with automatic architecture detection and AAPT2 compatibility",
    "target_users": "Media enthusiasts who want to organize all their content in one app"
  },
  "technical_architecture": {
    "pattern": "MVVM",
    "dependency_injection": "Hilt",
    "database": "Room with SQLite",
    "ui": "Jetpack Compose with Material 3",
    "media_playback": "Media3 ExoPlayer",
    "build_innovation": "Universal Build System"
  },
  "key_packages": {
    "ui": "User interface components and screens",
    "data": "Database entities and repositories", 
    "domain": "Business logic and use cases",
    "di": "Dependency injection modules",
    "players": "Media player implementations",
    "utils": "Utility functions and extensions"
  },
  "build_system_commands": {
    "diagnosis": "./gradlew diagnose",
    "architecture_info": "./gradlew architectureInfo",
    "simple_build": "./build-scripts/simple-build.sh build debug",
    "universal_build": "./build-scripts/universal-build.sh build",
    "environment_test": "./build-scripts/universal-build.sh test-env",
    "clean_build": "./build-scripts/universal-build.sh full-build"
  },
  "ai_development_tips": [
    "Always use Universal Build System commands for building",
    "Architecture detection is automatic - no manual configuration needed",
    "AAPT2 compatibility issues are auto-resolved by the build system",
    "Multi-architecture APKs are generated automatically",
    "Use ./build-scripts/simple-build.sh for most reliable builds",
    "Check ./gradlew diagnose for system information",
    "All documentation is in docs/ directory"
  ]
}
EOF

# 7. Test Universal Build System
log_info "Testing Universal Build System for Jules..."
if ./build-scripts/universal-build.sh info >/dev/null 2>&1; then
    log_success "Universal Build System is working"
else
    log_warning "Universal Build System test had issues - check build-scripts/"
fi

# 8. Create Jules-specific gitignore additions
log_info "Adding Jules-specific ignore patterns..."
if [ -f ".gitignore" ]; then
    echo "" >> .gitignore
    echo "# Jules AI Development Environment" >> .gitignore
    echo ".jules/temp/" >> .gitignore
    echo ".jules/cache/" >> .gitignore
    echo ".jules/logs/" >> .gitignore
else
    log_warning ".gitignore not found"
fi

log_success "Jules AI Development Environment setup completed!"
echo ""
echo "🤖 Jules Integration Ready!"
echo "🏗️ Universal Build System: Available"
echo "📱 Multi-Architecture Support: Enabled"
echo "🔧 AI-Friendly Configuration: Complete"
echo ""
echo "Next steps for Jules:"
echo "1. Connect your GitHub repository to Jules"
echo "2. Use commands from .jules/workspace.json"
echo "3. Reference .jules/dev-environment.md for context"
echo "4. Run './build-scripts/universal-build.sh info' to verify setup"