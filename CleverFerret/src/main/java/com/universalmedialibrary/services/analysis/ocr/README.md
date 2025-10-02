# OCR Service - Disabled

## Status: Disabled (moved to Gemini API)

The OCRService.kt has been disabled because it uses Google ML Kit for on-device text recognition, which is machine learning functionality.

## Migration Path

Per project strategy, ML functionality should use Gemini API instead:

1. **Use Gemini Vision API** for OCR tasks
   - Gemini API supports image-to-text extraction
   - Handles PDF page images, EPUB covers, and comic panels
   - Better accuracy with cloud-based processing

2. **Implementation in GeminiService**
   - Add OCR methods to `services/gemini/GeminiService.kt`
   - Use Gemini's vision capabilities for text extraction
   - Supports multimodal input (images + text prompts)

## Original Functionality

OCRService provided:
- PDF text extraction (first N pages)
- EPUB cover text extraction
- CBZ/CBR comic text extraction
- Generic bitmap text extraction

All these can be handled by Gemini API's vision model.

## Usage Example

```kotlin
// Old way (disabled):
// ocrService.extractTextFromPDF(context, uri, maxPages = 5)

// New way (use Gemini):
geminiService.extractTextFromImage(bitmap, "Extract all visible text")
// or
geminiService.analyzeDocument(uri, "Extract text and identify metadata")
```

## Dependencies Removed

- `com.google.mlkit.vision:text-recognition`
- `org.apache.commons.compress` (for ZIP handling)

These are no longer needed when using Gemini API.
