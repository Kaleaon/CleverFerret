# JNI Implementation Guide for Native Parsers

This guide provides detailed instructions for implementing JNI wrappers for native C/C++ libraries used in document parsing.

## Overview

The following parsers require JNI integration with native C/C++ libraries:
1. **MOBI/AZW/AZW3** - libmobi
2. **DJVU** - DjVuLibre
3. **LIT/SNB/RB/PDB** - libe-book

## Prerequisites

- Android NDK (r25 or later)
- CMake (3.18 or later)
- C/C++ compiler toolchain
- Git for cloning reference implementations

## Directory Structure

```
CleverFerret/
├── src/
│   └── main/
│       ├── java/com/universalmedialibrary/parsers/
│       │   └── impl/
│       │       ├── MobiParser.kt
│       │       ├── DjvuParser.kt
│       │       └── LegacyEbookParsers.kt
│       ├── cpp/
│       │   ├── mobi/
│       │   │   ├── mobi_jni.cpp
│       │   │   └── libmobi/ (submodule)
│       │   ├── djvu/
│       │   │   ├── djvu_jni.cpp
│       │   │   └── djvulibre/ (submodule)
│       │   └── ebook/
│       │       ├── ebook_jni.cpp
│       │       └── libe-book/ (submodule)
│       └── jniLibs/
│           ├── armeabi-v7a/
│           ├── arm64-v8a/
│           ├── x86/
│           └── x86_64/
└── CMakeLists.txt
```

## Implementation Steps

### Phase 1: Setup Native Build System

1. **Add CMake configuration to build.gradle.kts**:

```kotlin
android {
    // ... existing config ...
    
    defaultConfig {
        // ... existing config ...
        
        ndk {
            abiFilters += listOf("armeabi-v7a", "arm64-v8a", "x86", "x86_64")
        }
        
        externalNativeBuild {
            cmake {
                cppFlags += listOf("-std=c++17", "-frtti", "-fexceptions")
                arguments += listOf(
                    "-DANDROID_STL=c++_shared",
                    "-DANDROID_PLATFORM=android-26"
                )
            }
        }
    }
    
    externalNativeBuild {
        cmake {
            path = file("src/main/cpp/CMakeLists.txt")
            version = "3.18.1"
        }
    }
}
```

2. **Create main CMakeLists.txt**:

```cmake
cmake_minimum_required(VERSION 3.18.1)
project("cleverferret-parsers")

# Add subdirectories for each parser
add_subdirectory(mobi)
add_subdirectory(djvu)
add_subdirectory(ebook)
```

### Phase 2: MOBI Parser Implementation

#### Reference Implementation
- **Primary**: https://github.com/bfabiszewski/libmobi
- **Secondary**: CoolReader (https://github.com/buggins/coolreader)

#### Steps

1. **Clone libmobi as submodule**:
```bash
cd CleverFerret/src/main/cpp/mobi
git submodule add https://github.com/bfabiszewski/libmobi.git
```

2. **Create mobi/CMakeLists.txt**:
```cmake
cmake_minimum_required(VERSION 3.18.1)

# Add libmobi source files
add_library(mobi SHARED
    libmobi/src/buffer.c
    libmobi/src/compression.c
    libmobi/src/debug.c
    libmobi/src/encryption.c
    libmobi/src/index.c
    libmobi/src/memory.c
    libmobi/src/meta.c
    libmobi/src/miniz.c
    libmobi/src/parse_rawml.c
    libmobi/src/read.c
    libmobi/src/structure.c
    libmobi/src/util.c
    libmobi/src/write.c
    mobi_jni.cpp
)

target_include_directories(mobi PRIVATE
    libmobi/src
    ${ANDROID_NDK}/sources/android/native_app_glue
)

target_link_libraries(mobi
    android
    log
)
```

3. **Create mobi_jni.cpp**:
```cpp
#include <jni.h>
#include <string>
#include <android/log.h>
#include "mobi.h"

#define LOG_TAG "MobiParser"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

extern "C" JNIEXPORT jstring JNICALL
Java_com_universalmedialibrary_parsers_impl_MobiParser_parseMobiNative(
    JNIEnv* env,
    jobject /* this */,
    jstring filePath) {
    
    const char* path = env->GetStringUTFChars(filePath, nullptr);
    
    // Initialize MOBI data structure
    MOBIData* m = mobi_init();
    if (m == nullptr) {
        env->ReleaseStringUTFChars(filePath, path);
        return env->NewStringUTF("");
    }
    
    // Open MOBI file
    FILE* file = fopen(path, "rb");
    if (file == nullptr) {
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return env->NewStringUTF("");
    }
    
    // Load MOBI file
    MOBI_RET ret = mobi_load_file(m, file);
    fclose(file);
    
    if (ret != MOBI_SUCCESS) {
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return env->NewStringUTF("");
    }
    
    // Parse MOBI file
    MOBIRawml* rawml = mobi_init_rawml(m);
    if (rawml == nullptr) {
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return env->NewStringUTF("");
    }
    
    ret = mobi_parse_rawml(rawml, m);
    if (ret != MOBI_SUCCESS) {
        mobi_free_rawml(rawml);
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return env->NewStringUTF("");
    }
    
    // Extract text content
    std::string content;
    MOBIPart* part = rawml->markup;
    while (part != nullptr) {
        if (part->data != nullptr && part->size > 0) {
            content.append(reinterpret_cast<const char*>(part->data), part->size);
        }
        part = part->next;
    }
    
    // Cleanup
    mobi_free_rawml(rawml);
    mobi_free(m);
    env->ReleaseStringUTFChars(filePath, path);
    
    return env->NewStringUTF(content.c_str());
}

extern "C" JNIEXPORT jobject JNICALL
Java_com_universalmedialibrary_parsers_impl_MobiParser_extractMobiMetadata(
    JNIEnv* env,
    jobject /* this */,
    jstring filePath) {
    
    const char* path = env->GetStringUTFChars(filePath, nullptr);
    
    // Initialize MOBI data structure
    MOBIData* m = mobi_init();
    if (m == nullptr) {
        env->ReleaseStringUTFChars(filePath, path);
        return nullptr;
    }
    
    // Open and load MOBI file
    FILE* file = fopen(path, "rb");
    if (file == nullptr) {
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return nullptr;
    }
    
    MOBI_RET ret = mobi_load_file(m, file);
    fclose(file);
    
    if (ret != MOBI_SUCCESS) {
        mobi_free(m);
        env->ReleaseStringUTFChars(filePath, path);
        return nullptr;
    }
    
    // Create HashMap for metadata
    jclass hashMapClass = env->FindClass("java/util/HashMap");
    jmethodID hashMapInit = env->GetMethodID(hashMapClass, "<init>", "()V");
    jmethodID hashMapPut = env->GetMethodID(hashMapClass, "put",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;");
    
    jobject hashMap = env->NewObject(hashMapClass, hashMapInit);
    
    // Extract metadata
    if (m->mh != nullptr && m->mh->full_name_length > 0) {
        jstring key = env->NewStringUTF("title");
        jstring value = env->NewStringUTF(reinterpret_cast<const char*>(m->mh->full_name));
        env->CallObjectMethod(hashMap, hashMapPut, key, value);
    }
    
    // Add more metadata fields as needed
    
    // Cleanup
    mobi_free(m);
    env->ReleaseStringUTFChars(filePath, path);
    
    return hashMap;
}
```

4. **Update MobiParser.kt to use native methods**:
```kotlin
class MobiParser : DocumentParser {
    
    companion object {
        init {
            System.loadLibrary("mobi")
        }
    }
    
    private external fun parseMobiNative(filePath: String): String
    private external fun extractMobiMetadata(filePath: String): Map<String, String>
    
    override suspend fun parse(filePath: String): ParsedDocument = withContext(Dispatchers.IO) {
        try {
            val content = parseMobiNative(filePath)
            val metadataMap = extractMobiMetadata(filePath)
            
            val metadata = DocumentMetadata(
                title = metadataMap["title"],
                author = metadataMap["author"],
                format = "MOBI"
            )
            
            ParsedDocument(content, metadata)
        } catch (e: Exception) {
            throw ParserException("Failed to parse MOBI file: $filePath", e)
        }
    }
    
    // ... rest of implementation
}
```

### Phase 3: DJVU Parser Implementation

#### Reference Implementation
- **Primary**: http://djvu.sourceforge.net/
- **Secondary**: EBookDroid (https://github.com/foobnix/EBookDroid)

#### Steps

1. **Study EBookDroid's DJVU implementation**:
   - Clone EBookDroid repository
   - Examine `jni/djvu/` directory
   - Study `src/org/ebookdroid/droids/djvu/` for Java integration

2. **Create djvu/CMakeLists.txt** (similar to MOBI)

3. **Create djvu_jni.cpp** based on EBookDroid's implementation

4. **Update DjvuParser.kt** with native methods

### Phase 4: Legacy eBook Parser Implementation

#### Reference Implementation
- **Primary**: https://sourceforge.net/projects/libebook/
- **Secondary**: CoolReader (https://github.com/buggins/coolreader)

#### Steps

1. **Study CoolReader's libe-book integration**:
   - Clone CoolReader repository
   - Examine `crengine/src/` for format-specific parsers

2. **Create ebook/CMakeLists.txt**

3. **Create ebook_jni.cpp** for each format

4. **Update LegacyEbookParsers.kt** with native methods

## Testing

### Unit Tests

Create test files for each parser:

```kotlin
@Test
fun testMobiParser() {
    val parser = MobiParser()
    val testFile = "test_files/sample.mobi"
    val result = runBlocking { parser.parse(testFile) }
    
    assertNotNull(result.content)
    assertTrue(result.content.isNotEmpty())
    assertEquals("MOBI", result.metadata.format)
}
```

### Integration Tests

Test with real eBook files to ensure proper parsing.

## Troubleshooting

### Common Issues

1. **UnsatisfiedLinkError**: Native library not found
   - Check library is in correct jniLibs directory
   - Verify library name matches System.loadLibrary() call

2. **Compilation errors**: Missing headers or libraries
   - Ensure all submodules are initialized
   - Check CMake configuration

3. **Runtime crashes**: Memory issues or null pointers
   - Add proper error handling in JNI code
   - Use Android Studio's native debugger

## Performance Optimization

1. **Memory Management**:
   - Use RAII patterns in C++
   - Properly release JNI references
   - Implement object pooling for frequently used objects

2. **Threading**:
   - Perform parsing on background threads
   - Use Kotlin coroutines for async operations

3. **Caching**:
   - Cache parsed content
   - Implement LRU cache for metadata

## Security Considerations

1. **Input Validation**:
   - Validate file paths before passing to native code
   - Check file sizes to prevent memory exhaustion

2. **Error Handling**:
   - Catch and handle all native exceptions
   - Provide meaningful error messages

## References

- [Android NDK Documentation](https://developer.android.com/ndk)
- [JNI Tips](https://developer.android.com/training/articles/perf-jni)
- [libmobi Documentation](https://github.com/bfabiszewski/libmobi)
- [DjVuLibre Documentation](http://djvu.sourceforge.net/)
- [CoolReader Source](https://github.com/buggins/coolreader)
- [EBookDroid Source](https://github.com/foobnix/EBookDroid)