# Gemini OCR Plugin - Implementation Guide

**Purpose**: Use Google's Gemini AI as a lightweight OCR plugin for screenshot-based text scanning and book identification.

---

## Overview

CleverFerret will use **Gemini AI** as an **optional plugin** for enhanced OCR and text extraction capabilities. This is a lightweight, API-based approach that avoids heavy on-device ML models.

### What to Keep: Gemini Service ✅

**File**: `CleverFerret/src/main/java/com/universalmedialibrary/services/gemini/GeminiService.kt`

**Current Capabilities**:
- Visual OCR of book pages (screenshot → text extraction)
- Book metadata identification from cover images
- Text analysis and enhancement
- API-based (no heavy on-device models)

**Use Cases**:
1. **Screenshot OCR**: Take photo of book page → extract text
2. **Cover Recognition**: Photo of book cover → identify book metadata
3. **Text Enhancement**: Improve extracted text quality
4. **Optional Feature**: Users provide their own Gemini API key

---

## What to Remove: Heavy AI/ML Features ❌

Remove these services to focus on lightweight, maintainable solution:

### 1. Gemma LLM Service
**File**: `services/analysis/GemmaLLMService.kt`
**Reason**: 
- Resource-intensive on-device model
- Complex to maintain
- Large download size
- Not essential for core functionality

### 2. Smart Content Analyzer
**File**: `services/analysis/SmartContentAnalyzer.kt`
**Reason**:
- Complex implementation
- Incomplete
- Overlaps with Gemini capabilities

### 3. Heavy NLP Libraries
**Services to Remove**:
- `services/analysis/nlp/MetadataExtractor.kt`
- Any Stanford CoreNLP dependencies
- Heavy Apache Lucene features

**Reason**:
- Too heavy for Android (200MB+)
- Compilation errors
- Can be replaced by Gemini API calls

### 4. Advanced Analysis Services
**Files to Remove**:
- `services/analysis/classification/`
- `services/analysis/comparison/`
- `services/analysis/fingerprint/`

**Reason**:
- Incomplete implementations
- Not essential for MVP
- Add complexity without clear value

---

## Gemini Plugin Architecture

### API Key Management

Users provide their own Gemini API key:

```kotlin
// Already implemented in GeminiService.kt
private val apiKeyRepository: APIKeyRepository

suspend fun initialize(): Boolean {
    val apiKey = apiKeyRepository.getGeminiApiKey()
    if (apiKey.isNullOrBlank()) {
        return false
    }
    generativeModel = GenerativeModel(
        modelName = "gemini-pro-vision",
        apiKey = apiKey
    )
    return true
}
```

### Screenshot OCR Workflow

1. **User Action**: Tap "Scan Page" button
2. **Capture**: Take screenshot or select image
3. **API Call**: Send to Gemini for OCR
4. **Extract**: Receive text content
5. **Display**: Show extracted text to user

```kotlin
// Existing method in GeminiService
suspend fun extractTextFromImage(bitmap: Bitmap): String? {
    if (!isConfigured()) return null
    
    val response = generativeModel?.generateContent(
        content {
            image(bitmap)
            text("Extract all text from this image")
        }
    )
    
    return response?.text
}
```

### Book Cover Identification

1. **User Action**: Tap "Identify Book" 
2. **Capture**: Photo of book cover
3. **API Call**: Send to Gemini with prompt
4. **Extract**: Receive title, author, ISBN
5. **Search**: Query metadata sources
6. **Import**: Add to library with metadata

```kotlin
suspend fun identifyBookFromCover(bitmap: Bitmap): BookMetadata? {
    if (!isConfigured()) return null
    
    val response = generativeModel?.generateContent(
        content {
            image(bitmap)
            text("Identify this book. Provide: title, author, ISBN if visible")
        }
    )
    
    return parseBookMetadata(response?.text)
}
```

---

## Implementation Plan

### Phase 1: Fix Existing Gemini Service (Week 1)

**Tasks**:
1. Fix compilation errors in `GeminiService.kt`
2. Test API key storage/retrieval
3. Test basic image → text extraction
4. Add error handling and user feedback

**Testing**:
- [ ] API key can be saved in settings
- [ ] Service initializes correctly
- [ ] Screenshot OCR works
- [ ] Error messages are user-friendly

### Phase 2: UI Integration (Week 2)

**Tasks**:
1. Add "Scan Page" button to reader UI
2. Add "Identify Book" option in library creation
3. Add API key input in settings
4. Show loading states during API calls
5. Display extracted text in dialog

**UI Components**:
```kotlin
// In reader screen
IconButton(onClick = { viewModel.scanCurrentPage() }) {
    Icon(Icons.Default.Scanner, "Scan Page")
}

// In settings
TextField(
    value = geminiApiKey,
    onValueChange = { viewModel.updateGeminiApiKey(it) },
    label = { Text("Gemini API Key (Optional)") },
    placeholder = { Text("Get key from ai.google.dev") }
)
```

### Phase 3: Polish & Documentation (Week 3)

**Tasks**:
1. Add user documentation for getting Gemini API key
2. Add privacy notice (images sent to Google)
3. Add usage limits warning
4. Add cost transparency
5. Make feature optional (graceful degradation)

---

## Cost Considerations

### Gemini API Pricing
- **Free Tier**: 60 requests/minute
- **Paid**: Pay per request (very affordable)
- **User Responsibility**: Users provide their own API key

### Privacy Notice
```
When using OCR features, images are sent to Google's 
Gemini API for processing. No images are stored. 
See Google's privacy policy for details.
```

---

## User Experience

### Settings Screen

```
┌─────────────────────────────────────┐
│ Settings > Advanced                 │
├─────────────────────────────────────┤
│                                     │
│ 📸 OCR & AI Features (Optional)     │
│                                     │
│ Gemini API Key                      │
│ [___________________________]       │
│                                     │
│ ℹ️ Get your free API key at:        │
│    ai.google.dev                    │
│                                     │
│ Features enabled with API key:      │
│ • Screenshot text extraction        │
│ • Book cover identification         │
│ • Enhanced OCR                      │
│                                     │
│ Note: Images sent to Google         │
│                                     │
└─────────────────────────────────────┘
```

### Reader with OCR

```
┌─────────────────────────────────────┐
│ < Book Title               📸 ⋮    │
├─────────────────────────────────────┤
│                                     │
│   [Book page content displayed]     │
│                                     │
│                                     │
│                                     │
│                                     │
└─────────────────────────────────────┘

When 📸 (scan) is tapped:
1. Take screenshot of current page
2. Show loading indicator
3. Display extracted text in dialog
4. Offer to copy or search text
```

---

## File Removal Checklist

### Services to Remove
- [ ] `services/analysis/GemmaLLMService.kt`
- [ ] `services/analysis/SmartContentAnalyzer.kt`
- [ ] `services/analysis/nlp/MetadataExtractor.kt`
- [ ] `services/analysis/classification/` (entire directory)
- [ ] `services/analysis/comparison/` (entire directory)
- [ ] `services/analysis/fingerprint/` (entire directory)
- [ ] `services/analysis/ocr/OCRService.kt` (replace with Gemini)

### Dependencies to Remove
Check `build.gradle.kts` and remove:
- [ ] Stanford CoreNLP dependencies
- [ ] Heavy Apache Lucene dependencies
- [ ] Any TensorFlow Lite dependencies for Gemma
- [ ] On-device ML model dependencies

### Keep These Files
- ✅ `services/gemini/GeminiService.kt` - Fix and enhance
- ✅ `services/analysis/AnalysisModels.kt` - Might need for basic types
- ✅ Google AI Client library (for Gemini API)

---

## Benefits of This Approach

### Technical Benefits
1. **Lightweight**: No heavy on-device models
2. **Maintainable**: Simple API integration
3. **Scalable**: Google handles the heavy lifting
4. **Up-to-date**: Google improves model over time
5. **Fast**: No model loading delays

### User Benefits
1. **Optional**: Works without API key for core features
2. **Professional**: High-quality OCR from Google
3. **Free Tier**: Most users won't need to pay
4. **Simple**: Just add API key to enable
5. **Privacy**: Users control if/when to use

### Development Benefits
1. **Fewer Dependencies**: Easier builds
2. **Less Code**: Remove thousands of lines
3. **Faster Builds**: No heavy libraries to compile
4. **Easier Testing**: Mock API calls
5. **Clear Scope**: Well-defined feature boundary

---

## Migration Guide

### Step 1: Comment Out Heavy Features (Day 1)

```kotlin
// In build.gradle.kts - Comment these out:
// implementation("com.google.mlkit:text-recognition:...")
// implementation("org.tensorflow:tensorflow-lite:...")
// implementation("edu.stanford.nlp:stanford-corenlp:...")
```

### Step 2: Remove Service Files (Day 1)

```bash
# Safely remove files (can be recovered from git if needed)
git rm CleverFerret/src/main/java/com/universalmedialibrary/services/analysis/GemmaLLMService.kt
git rm CleverFerret/src/main/java/com/universalmedialibrary/services/analysis/SmartContentAnalyzer.kt
git rm -r CleverFerret/src/main/java/com/universalmedialibrary/services/analysis/nlp/
git rm -r CleverFerret/src/main/java/com/universalmedialibrary/services/analysis/classification/
# ... etc
```

### Step 3: Fix GeminiService (Days 2-3)

1. Fix compilation errors
2. Test API integration
3. Add comprehensive error handling
4. Document public API

### Step 4: Add UI (Days 4-5)

1. Settings screen for API key
2. Scan button in reader
3. Book identification in library

### Step 5: Test & Document (Day 6)

1. End-to-end testing
2. User documentation
3. Privacy policy update
4. Cost transparency docs

---

## Success Criteria

### Technical Success
- [ ] GeminiService compiles without errors
- [ ] API key can be saved and retrieved
- [ ] Screenshot OCR returns text
- [ ] Book cover identification works
- [ ] Error handling is comprehensive
- [ ] No heavy ML dependencies remain

### User Experience Success
- [ ] Feature is discoverable
- [ ] Setup is simple (paste API key)
- [ ] OCR quality is good
- [ ] Loading states are clear
- [ ] Errors are helpful
- [ ] Works smoothly on low-end devices

### Business Success
- [ ] Reduced APK size (remove heavy libraries)
- [ ] Faster build times
- [ ] Easier maintenance
- [ ] Clear feature value
- [ ] Optional = no blocker to publication

---

## Future Enhancements (Post-MVP)

### Phase 2 Ideas
1. **Batch OCR**: Process multiple pages
2. **Language Detection**: Identify text language
3. **Translation**: Translate extracted text
4. **Summaries**: Generate chapter summaries
5. **Smart Search**: Search across OCR'd content

### Phase 3 Ideas
1. **Offline Fallback**: Basic OCR without API
2. **Caching**: Cache OCR results
3. **History**: View past scans
4. **Export**: Export extracted text
5. **Annotations**: Add notes to scanned text

---

## Resources

### Gemini API Documentation
- Getting Started: https://ai.google.dev/tutorials/android_quickstart
- API Reference: https://ai.google.dev/api/rest
- Pricing: https://ai.google.dev/pricing
- Best Practices: https://ai.google.dev/docs/best_practices

### Android Integration
- Kotlin Coroutines: Already in use
- Image handling: Bitmap APIs
- API key storage: Secure preferences
- Network calls: Async/await pattern

---

## Decision Rationale

### Why Gemini Over On-Device ML?

**Gemini API (Chosen)**:
- ✅ Professional quality results
- ✅ Always up-to-date
- ✅ No model downloads
- ✅ Minimal APK size impact
- ✅ Works on any device
- ✅ Free tier available

**On-Device ML (Rejected)**:
- ❌ Large model downloads (100MB+)
- ❌ Device-specific performance
- ❌ Requires GPU/NPU
- ❌ Models become outdated
- ❌ Complex maintenance
- ❌ Higher battery usage

### Why Remove Other AI Features?

**Focus**: Be excellent at core functionality first
**Resources**: Limited development time
**Complexity**: Each AI feature adds maintenance burden
**Value**: OCR provides clear user value, others less clear

---

## Timeline

**Week 1**: Remove heavy AI/ML, fix GeminiService
**Week 2**: Add UI integration
**Week 3**: Testing and documentation
**Week 4**: Polish and release

**Total**: 4 weeks to production-ready Gemini plugin

---

## Conclusion

By focusing on **Gemini as a lightweight OCR plugin** and removing heavy AI/ML features, CleverFerret will:

1. **Reduce complexity** - Fewer dependencies, easier builds
2. **Improve maintainability** - One simple API vs many complex services
3. **Better user experience** - Optional feature, clear value
4. **Faster to market** - Less code to fix and test
5. **Professional results** - Google's best-in-class OCR

This approach aligns with the project goal: **Be an excellent book reader first**, with OCR as a valuable optional enhancement.

---

**Document Created**: January 2025  
**Status**: Implementation Guide  
**Next Action**: Begin Phase 1 - Remove heavy AI/ML services
