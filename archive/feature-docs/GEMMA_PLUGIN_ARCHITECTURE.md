# Gemma LLM Plugin Architecture

## Overview

CleverFerret uses a **dual AI strategy** to support devices of all capabilities:

1. **Gemini AI (Cloud)** - PRIMARY service for all devices
2. **Gemma LLM (On-Device)** - Optional plugin for high-end devices

## Primary AI Service: Gemini

**Location**: `services/gemini/GeminiService.kt`

**Purpose**: Cloud-based AI processing via Google's Gemini API

**Features**:
- Book identification from cover images
- OCR text extraction and enhancement
- Metadata extraction and enrichment
- Automated debugging and issue analysis
- Works on ALL Android devices (no hardware requirements)

**Configuration**: 
- Requires Gemini API key (free tier available)
- Configured via API Keys settings
- Added to database initialization: `Triple("gemini", "AI_SERVICES", false)`

## Plugin Service: Gemma LLM (Future)

**Location**: `services/analysis/GemmaLLMService.kt`

**Purpose**: On-device LLM processing for capable devices

**Target Devices**:
- High-end phones (Snapdragon 8 Gen 2+, etc.)
- Tablets with 8GB+ RAM
- Devices with NPU/Neural Engine support

**Plugin Architecture** (To Be Implemented):

### 1. Capability Detection
```kotlin
// In main app
object DeviceCapabilities {
    fun canRunGemmaLLM(): Boolean {
        val totalRAM = getTotalRAM()
        val hasNPU = detectNPU()
        val cpuBenchmark = getCPUBenchmark()
        
        return totalRAM >= 8_000_000_000L && // 8GB
               cpuBenchmark > GEMMA_MIN_BENCHMARK
    }
}
```

### 2. Plugin Installation
When user opens AI settings and device is capable:
- Show "Download Gemma Plugin" option
- Download separate APK (50-100MB) with:
  - Gemma model files (quantized)
  - MediaPipe runtime
  - GemmaLLMService implementation

### 3. Plugin Communication
Use Android's plugin architecture:
```kotlin
// Main app checks for plugin
val pluginIntent = Intent("com.universalmedialibrary.plugin.GEMMA")
val pluginInfo = packageManager.queryIntentServices(pluginIntent, 0)

if (pluginInfo.isNotEmpty()) {
    // Use Gemma plugin via bound service
    bindService(pluginIntent, connection, Context.BIND_AUTO_CREATE)
} else {
    // Fall back to Gemini cloud service
    useGeminiService()
}
```

### 4. Unified AI Interface
Both services implement the same interface:
```kotlin
interface AIService {
    suspend fun extractMetadata(image: Bitmap): MetadataResult
    suspend fun enhanceOCR(text: String): String
    suspend fun identifyBook(coverImage: Bitmap): BookInfo
}
```

## Implementation Plan

### Phase 1: Gemini Integration (Current)
- [x] Add Gemini dependency
- [x] Implement GeminiService
- [x] Add API key configuration
- [x] Mark GemmaLLMService as plugin-only
- [x] Document architecture

### Phase 2: Plugin Framework (Future)
- [ ] Create separate plugin app project
- [ ] Implement device capability detection
- [ ] Add plugin download UI
- [ ] Implement plugin communication
- [ ] Test on high-end devices

### Phase 3: Model Optimization (Future)
- [ ] Quantize Gemma model to 4-bit
- [ ] Optimize for mobile inference
- [ ] Add caching strategies
- [ ] Performance benchmarking

## Benefits

### For Regular Users
- **Works immediately** - No special hardware needed
- **Free tier** - Gemini API has generous free limits
- **Always updated** - Cloud models improve automatically
- **No storage impact** - No large model files to download

### For Power Users
- **Privacy** - Process sensitive data on-device
- **Speed** - No network latency
- **Offline** - Works without internet
- **Cost** - No API costs after plugin download

## Migration Path

Current code with GemmaLLMService stays in main app but:
1. Marked with clear comments as "PLUGIN APP ONLY"
2. Not initialized in production builds
3. Will be extracted to plugin in Phase 2

This approach:
- Keeps codebase organized
- Documents the architecture
- Makes future plugin extraction easier
- Maintains feature parity planning

## Configuration

### Gemini API Key Setup
1. Go to https://makersuite.google.com/app/apikey
2. Create or select a project
3. Generate API key
4. In CleverFerret: Settings → API Keys → Google Gemini AI
5. Paste API key and save

### Gemma Plugin (When Available)
1. Go to Settings → AI Services
2. Device capability check runs automatically
3. If compatible: "Download Gemma Plugin" button appears
4. Download and install plugin APK
5. Plugin automatically used for on-device processing

## Technical Notes

### Why Separate Plugin?
- **Size**: Gemma model is ~2GB (quantized 4-bit version)
- **Compatibility**: Only ~15% of Android devices can run it
- **Maintenance**: Separate release cycle for model updates
- **User Choice**: Users decide if they want on-device processing

### API Comparison

| Feature | Gemini (Cloud) | Gemma (Plugin) |
|---------|----------------|----------------|
| Hardware Req | Any Android device | High-end only |
| Internet Req | Yes | No |
| Setup Time | Instant (API key) | ~5min download |
| Processing Speed | ~2-5 sec | ~1-3 sec |
| Privacy | Data sent to Google | Fully local |
| Cost | Free tier, then paid | Free after download |
| Storage | 0 MB | ~2 GB |

## References

- Gemini API: https://ai.google.dev/docs
- MediaPipe GenAI: https://developers.google.com/mediapipe/solutions/genai
- Android Plugin Architecture: https://developer.android.com/guide/components/bound-services
