# Moon Reader Pro APK Disassembly

This directory contains the disassembled contents of the Moon Reader Pro APK (`com.flyersoft.moonreaderp.apk`).

## Disassembly Information

- **Tool Used**: apktool 2.7.0
- **Original APK Size**: 40MB
- **Disassembly Date**: 2024

## Directory Structure

### Main Components

- **AndroidManifest.xml** - Application manifest file containing app permissions, activities, and configuration
- **apktool.yml** - Apktool configuration file with build information
- **res/** - Application resources
  - layouts/ - UI layout XML files
  - drawable/ - Image resources for different screen densities
  - values/ - String resources, colors, dimensions, styles
  - menu/ - Menu definitions
  - anim/ - Animation definitions
  - raw/ - Raw resource files

### Code

- **smali/** - Decompiled Dalvik bytecode (main classes)
- **smali_classes2/** - Additional decompiled classes
- **smali_classes3/** - Additional decompiled classes
- **smali_classes4/** - Additional decompiled classes
- **smali_classes5/** - Additional decompiled classes

The smali directories contain the decompiled Java/Kotlin code in Smali format (Dalvik bytecode assembly language).

### Assets

- **assets/** - Application assets
  - fonts/ - Custom fonts
  - themes/ - Theme files
  - book/ - Book-related resources
  - background/ - Background images
  - hyphenation/ - Hyphenation dictionaries
  - network/ - Network-related resources
  - readme/ - Documentation files

### Kotlin Runtime

- **kotlin/** - Kotlin standard library components
  - annotation/
  - collections/
  - coroutines/
  - internal/
  - ranges/
  - reflect/

### Other

- **META-INF/** - Metadata and service configurations
- **original/** - Original files from the APK
- **unknown/** - Unclassified resources and configuration files

## Key Features Identified

Based on the disassembly structure, Moon Reader Pro includes:

1. **Multi-format Support** - Assets for various book formats (FB2, MOBI, etc.)
2. **Theming System** - Multiple theme files in assets/themes/
3. **Font Support** - Custom fonts in assets/fonts/
4. **Network Features** - Network catalog and online resources
5. **Hyphenation** - Language-specific hyphenation support
6. **Auto-scroll & TTS** - Tips images suggest text-to-speech and auto-scroll features
7. **Multi-language Support** - Chinese character conversion files (simplified/traditional)

## Technical Details

- **Package Name**: com.flyersoft.moonreaderp
- **Build Tool**: Gradle-based Android build
- **Minimum SDK**: Information available in AndroidManifest.xml
- **Target SDK**: Information available in AndroidManifest.xml
- **Kotlin Support**: Yes (Kotlin runtime included)
- **Google Play Services**: Auth, Identity, FIDO integration

## Notes

- This is a decompiled version for analysis purposes
- Smali code can be converted to Java using tools like jadx or dex2jar
- Resources are in their original XML format
- All assets are preserved in their original structure

## Rebuilding

To rebuild the APK from these sources:

```bash
apktool b moonreader_apk_disassembled -o rebuilt.apk
```

Note: The rebuilt APK will need to be signed before installation.