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
```bash
# Check system status
./build-scripts/universal-build.sh info

# Build the app
./build-scripts/simple-build.sh build debug

# Run tests
./gradlew testDebugUnitTest

# System diagnostics
./gradlew diagnose
```

## Project Structure
- `CleverFerret/src/main/java/` - Main Kotlin source code
- `build-scripts/` - Universal build system scripts
- `android-tools/` - Multi-architecture build tools
- `docs/` - Comprehensive documentation

## AI Development Notes
- The Universal Build System is the key innovation
- All builds should use `./build-scripts/simple-build.sh`
- Architecture detection is automatic
- AAPT2 issues are auto-resolved

## Common Tasks
1. **Adding Features**: Modify files in `CleverFerret/src/main/java/`
2. **UI Changes**: Update Compose files in the UI package
3. **Build Issues**: Run `./build-scripts/universal-build.sh test-env`
4. **Testing**: Use `./gradlew testDebugUnitTest`

## Integration Points
- Room database entities in `data/` package
- Compose UI screens in `ui/` package
- Media players in `players/` package
- Hilt modules in `di/` package
