# File Format Parser Integration Guide

## Overview

This document outlines the recommended approach for implementing full parsing support for all file formats in Clever Ferret, based on proven open-source Android reader implementations.

## Recommended Libraries

### Pure Java/Kotlin Libraries (Preferred)

#### MOBI/AZW/AZW3 Formats
- **lib-mobi**: Pure Java library for MOBI format parsing
  - GitHub: `https://github.com/readium/lib-mobi`
  - Supports: MOBI, PRC, AZW, AZW3
  - No JNI required, easy integration

#### Microsoft Office Formats
- **Apache POI**: Java library for Microsoft Office documents
  - Maven: `org.apache.poi:poi-ooxml`
  - Supports: DOCX, DOC, XLSX, PPTX
  - Pure Java, well-maintained

- **Apache Tika**: Content analysis toolkit
  - Maven: `org.apache.tika:tika-core`, `org.apache.tika:tika-parsers`
  - Supports: DOC, DOCX, RTF, ODT, and many other formats
  - Auto-detection and metadata extraction

#### CHM Format
- **Apache Tika**: Also supports CHM via chmlib wrapper
- Alternative: Use chmlib Java bindings

### C++ Libraries via JNI (For Legacy Formats)

#### LIT/SNB/RB/PDB Formats
- **libe-book**: C++ library for legacy eBook formats
  - Part of LibreOffice/librevenge project
  - Supports: LIT (Microsoft Reader), SNB (Sony), RB (Rocket), PDB (Palm)
  - Requires JNI wrapper

#### DJVU Format
- **DjVuLibre**: C++ library for DJVU format
  - Official: `http://djvu.sourceforge.net/`
  - Android port available in EBookDroid
  - Requires JNI wrapper

## Reference Implementations

### FBReader (Older Open Source Versions)
- **Location**: Check older versions (pre-2015) on GitHub
- **Formats**: MOBI, CHM, RTF
- **Key Files**: 
  - MOBI parser implementation
  - CHM extraction logic
  - RTF text extraction

### CoolReader (Engine)
- **GitHub**: `https://github.com/buggins/coolreader`
- **Formats**: CHM, PDB, MOBI
- **Key Features**: C++ parsing engines with Android JNI bindings
- **Reference**: Look at `crengine` directory for format parsers

### EBookDroid
- **GitHub**: `https://github.com/foobnix/EBookDroid`
- **Formats**: DJVU, PDF
- **Key Features**: 
  - DJVU rendering with DjVuLibre
  - PDF integration
  - Android-specific optimizations

### Readium Kotlin Toolkit
- **GitHub**: `https://github.com/readium/kotlin-toolkit`
- **Formats**: EPUB, PDF, Audiobooks (LCP)
- **Status**: Already integrated in Clever Ferret
- **Architecture**: Excellent reference for Kotlin-first reader design

## Implementation Strategy

### Phase 1: Pure Java/Kotlin Formats (Easiest)

1. **Add Dependencies** (build.gradle.kts):
```kotlin
dependencies {
    // MOBI support
    implementation("com.github.readium:lib-mobi:0.1.0") // Check latest version
    
    // Microsoft Office
    implementation("org.apache.poi:poi-ooxml:5.2.5")
    implementation("org.apache.poi:poi-scratchpad:5.2.5") // For .doc (legacy)
    
    // Content analysis
    implementation("org.apache.tika:tika-core:2.9.1")
    implementation("org.apache.tika:tika-parsers-standard-package:2.9.1")
}
```

2. **Update UnifiedReaderService.kt**:
   - Replace placeholder MOBI extraction with lib-mobi
   - Replace DOCX/DOC extraction with Apache POI
   - Replace RTF extraction with Apache Tika
   - Replace CHM extraction with Apache Tika

### Phase 2: JNI-Based Formats (More Complex)

1. **DjVu Support**:
   - Reference EBookDroid's DjVuLibre integration
   - Create JNI wrapper for Android
   - Add native library loading

2. **Legacy Formats (LIT/SNB/RB/PDB)**:
   - Reference CoolReader's libe-book integration
   - Create JNI wrapper
   - Implement format-specific extraction

## Code Examples

### MOBI with lib-mobi

```kotlin
import org.readium.mobi.MobiFile

private fun extractMobiContent(filePath: String): String {
    return try {
        val mobiFile = MobiFile(File(filePath))
        val textContent = StringBuilder()
        
        // Extract text from all sections
        for (i in 0 until mobiFile.numSections) {
            val section = mobiFile.getSection(i)
            textContent.append(section.text)
            textContent.append("\n\n")
        }
        
        textContent.toString()
    } catch (e: Exception) {
        throw Exception("Failed to extract MOBI content: ${e.message}", e)
    }
}
```

### DOCX with Apache POI

```kotlin
import org.apache.poi.xwpf.usermodel.XWPFDocument
import org.apache.poi.xwpf.extractor.XWPFWordExtractor

private fun extractDocxContent(filePath: String): String {
    return try {
        FileInputStream(filePath).use { fis ->
            XWPFDocument(fis).use { document ->
                XWPFWordExtractor(document).use { extractor ->
                    extractor.text
                }
            }
        }
    } catch (e: Exception) {
        throw Exception("Failed to extract DOCX content: ${e.message}", e)
    }
}
```

### DOC (Legacy) with Apache POI

```kotlin
import org.apache.poi.hwpf.HWPFDocument
import org.apache.poi.hwpf.extractor.WordExtractor

private fun extractDocContent(filePath: String): String {
    return try {
        FileInputStream(filePath).use { fis ->
            HWPFDocument(fis).use { document ->
                WordExtractor(document).use { extractor ->
                    extractor.text
                }
            }
        }
    } catch (e: Exception) {
        throw Exception("Failed to extract DOC content: ${e.message}", e)
    }
}
```

### RTF with Apache Tika

```kotlin
import org.apache.tika.Tika
import org.apache.tika.exception.TikaException

private fun extractRtfContent(filePath: String): String {
    return try {
        val tika = Tika()
        tika.parseToString(File(filePath))
    } catch (e: TikaException) {
        throw Exception("Failed to extract RTF content: ${e.message}", e)
    }
}
```

### CHM with Apache Tika

```kotlin
import org.apache.tika.Tika

private fun extractCHMContent(filePath: String): String {
    return try {
        val tika = Tika()
        tika.parseToString(File(filePath))
    } catch (e: Exception) {
        throw Exception("Failed to extract CHM content: ${e.message}", e)
    }
}
```

### ODT with Apache Tika

```kotlin
import org.apache.tika.Tika

private fun extractOdtContent(filePath: String): String {
    return try {
        val tika = Tika()
        tika.parseToString(File(filePath))
    } catch (e: Exception) {
        throw Exception("Failed to extract ODT content: ${e.message}", e)
    }
}
```

## JNI Integration (For C++ Libraries)

### DjVu with DjVuLibre

1. **Add Native Library**:
   - Reference EBookDroid's native library structure
   - Place `.so` files in `src/main/jniLibs/armeabi-v7a/`, `arm64-v8a/`, etc.

2. **Create JNI Wrapper**:
```kotlin
external fun extractDjvuText(filePath: String): String
external fun getDjvuPageCount(filePath: String): Int

companion object {
    init {
        System.loadLibrary("djvu")
    }
}
```

3. **Native Implementation** (C++):
```cpp
#include <jni.h>
#include "ddjvuapi.h"

extern "C" JNIEXPORT jstring JNICALL
Java_com_universalmedialibrary_services_reader_DjvuExtractor_extractDjvuText(
    JNIEnv *env, jobject thiz, jstring filePath) {
    // DjVuLibre implementation
    // Reference EBookDroid's native code
}
```

## Integration Steps

### Step 1: Add Dependencies
Update `build.gradle.kts` with recommended libraries.

### Step 2: Update UnifiedReaderService
Replace placeholder extraction functions with proper library implementations.

### Step 3: Add Native Libraries (if needed)
For DJVU and legacy formats, add JNI wrappers and native libraries.

### Step 4: Testing
Test with sample files for each format to ensure proper extraction.

### Step 5: Error Handling
Ensure all extraction functions have proper error handling and user feedback.

## Priority Order

1. **High Priority** (Most Common):
   - MOBI/AZW3 (lib-mobi)
   - DOCX/DOC (Apache POI)
   - RTF (Apache Tika)
   - ODT (Apache Tika)

2. **Medium Priority**:
   - CHM (Apache Tika)
   - DJVU (DjVuLibre via JNI)

3. **Low Priority** (Rare Formats):
   - LIT, SNB, RB, PDB (libe-book via JNI)

## Notes

- All pure Java/Kotlin libraries should be integrated first (easier, no JNI)
- JNI-based libraries require more setup but provide better performance for complex formats
- Reference implementations provide valuable insights into Android-specific optimizations
- Consider caching extracted content for better performance
- Always handle errors gracefully and provide user feedback

## Resources

- FBReader Source: Check older versions on GitHub
- CoolReader: https://github.com/buggins/coolreader
- EBookDroid: https://github.com/foobnix/EBookDroid
- Readium Kotlin: https://github.com/readium/kotlin-toolkit
- Apache POI: https://poi.apache.org/
- Apache Tika: https://tika.apache.org/
- DjVuLibre: http://djvu.sourceforge.net/
