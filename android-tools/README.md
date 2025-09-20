# CleverFerret Android Tools Integration

This directory contains Android build tools compiled for multiple architectures, sourced from [JonForShort/android-tools](https://github.com/JonForShort/android-tools).

## Purpose

These pre-compiled Android tools solve architecture-specific build issues by providing:
- **aapt/aapt2**: Android Asset Packaging Tool for resource compilation
- **dex2oat**: DEX to native code compiler  
- **dexdump/dexdiag/dexlist**: DEX analysis tools
- **Multi-architecture support**: ARM64, ARM32, x86, x86_64

## Architecture Support

### Available Architectures
```
android-9.0.0_r33/
├── aapt/
│   ├── arm64-v8a/bin/aapt
│   ├── armeabi-v7a/bin/aapt  
│   ├── x86/bin/aapt
│   └── x86_64/bin/aapt
├── aapt2/
│   ├── arm64-v8a/bin/aapt2
│   ├── armeabi-v7a/bin/aapt2
│   ├── x86/bin/aapt2
│   └── x86_64/bin/aapt2
└── [other tools...]

android-11.0.0_r33/
└── [same structure]
```

## Integration

The build system automatically detects the host architecture and uses the appropriate tools:

1. **Gradle Integration**: `build.gradle.kts` configured to use architecture-specific AAPT2
2. **Build Scripts**: `build-scripts/` contain setup and selection logic
3. **Environment Setup**: Automatic path configuration for correct tool versions

## Usage

Tools are automatically selected during build process:

```bash
# Build uses correct architecture tools automatically
./gradlew assembleDebug

# Manual tool usage
./android-tools/build/android-9.0.0_r33/aapt2/arm64-v8a/bin/aapt2 version
```

## License

These tools are licensed under Apache 2.0 from the original android-tools repository.