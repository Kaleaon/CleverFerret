# File Format Parser Integration Guide

## Overview

This document outlines the recommended approach for implementing full parsing support for all file formats in Clever Ferret, based on proven open-source Android reader implementations.

## Recommended Libraries

### Pure Java/Kotlin Libraries (Preferred)

#### MOBI/AZW/AZW3 Formats
- **Note**: Readium does not provide a MOBI parser. Readium toolkits are EPUB-focused.
- **libmobi** (C library): Reference implementation for MOBI format
  - GitHub: `https://github.com/bfabiszewski/libmobi`
  - Supports: MOBI, PRC, AZW, AZW3
  - Requires JNI wrapper for Android
  - Reference: CoolReader and FBReader implementations
- **Alternative Approach**: Convert MOBI to EPUB using Calibre
  - Use `ebook-convert` command-line tool
  - Convert MOBI→EPUB, then use Readium for EPUB
  - Example: `ebook-convert book.mobi book.epub`

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
    // Note: MOBI support requires libmobi (C) via JNI or conversion workflow
    // See Phase 2 for JNI-based formats
    
    // Microsoft Office
    implementation("org.apache.poi:poi-ooxml:5.2.5")
    implementation("org.apache.poi:poi-scratchpad:5.2.5") // For .doc (legacy)
    
    // Content analysis
    implementation("org.apache.tika:tika-core:2.9.1")
    implementation("org.apache.tika:tika-parsers-standard-package:2.9.1")
}
```

2. **Update UnifiedReaderService.kt**:
   - Replace DOCX/DOC extraction with Apache POI
   - Replace RTF extraction with Apache Tika
   - Replace CHM extraction with Apache Tika
   - For MOBI: Use libmobi via JNI (Phase 2) or implement conversion workflow

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

### MOBI with libmobi (C library via JNI)

**Note**: libmobi is a C library requiring JNI integration. Reference CoolReader or FBReader implementations.

**Alternative**: Use Calibre conversion workflow:
```kotlin
// Convert MOBI to EPUB using Calibre's ebook-convert
// Then use Readium EPUB service
private suspend fun convertMobiToEpub(mobiPath: String, epubPath: String): Boolean {
    return withContext(Dispatchers.IO) {
        try {
            val process = ProcessBuilder(
                "ebook-convert",
                mobiPath,
                epubPath
            ).start()
            process.waitFor() == 0
        } catch (e: Exception) {
            false
        }
    }
}
```

**For direct MOBI parsing**: Implement JNI wrapper around libmobi C library (see Phase 2).

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

1. **High Priority** (Most Common, Pure Java/Kotlin):
   - DOCX/DOC (Apache POI)
   - RTF (Apache Tika)
   - ODT (Apache Tika)

2. **Medium Priority** (Pure Java/Kotlin):
   - CHM (Apache Tika)

3. **Lower Priority** (Requires JNI):
   - MOBI/AZW3 (libmobi C library via JNI, or use conversion workflow)
   - DJVU (DjVuLibre)
   - LIT, SNB, RB, PDB (libe-book)

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
