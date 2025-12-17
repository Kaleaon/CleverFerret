# Audiobook Maker Feature

## Overview

The Audiobook Maker feature transforms the book audio reader into a comprehensive audiobook generation system with AI-powered character voices, contextual background sounds, and action sound effects.

## Key Features

### 1. Character Voice Management

The audiobook maker automatically detects characters in your book and assigns unique, consistent voices to each character.

**Features:**
- AI-powered voice profile generation using character descriptions
- Consistent voice tracking throughout the book
- Genre-specific voice adjustments (e.g., more dramatic voices for fantasy)
- Customizable voice parameters:
  - Pitch (0.5-2.0)
  - Speed (0.5-2.0)
  - Tone (warm, cold, neutral, harsh, soft, authoritative, friendly, mysterious)
  - Emotion (calm, energetic, melancholic, cheerful, serious, anxious, confident)
  - Voice type (deep, high, medium, bass, tenor, alto, soprano)
  - Gender (male, female, neutral, androgynous)
  - Age (child, teen, young adult, adult, middle-aged, elderly)

### 2. Multiple TTS Provider Support

Choose from multiple TTS providers based on your needs and budget:

#### **Gemini TTS** (Google AI)
- AI-powered natural speech
- Excellent for character differentiation
- Requires API key from https://aistudio.google.com/app/apikey

#### **ElevenLabs**
- Ultra-realistic AI voices with emotion and inflection
- Best quality but costs per character
- Custom voice cloning available
- Requires API key from https://elevenlabs.io/app/settings/api-keys

#### **OpenAI TTS**
- Natural human-like speech
- Multiple voice options: alloy, echo, fable, onyx, nova, shimmer
- Good balance of quality and cost
- Requires API key from https://platform.openai.com/api-keys

#### **Google Cloud TTS**
- Professional-grade TTS
- 380+ voices in 50+ languages
- Requires API key from https://console.cloud.google.com/apis/credentials

#### **Android TTS**
- Built-in device text-to-speech
- Free and offline
- No API key required
- Works immediately out of the box

### 3. Action Sound Effects

The system includes 30+ predefined action sounds organized by category:

#### Combat Sounds
- Sword clashes
- Gunfire
- Explosions
- Arrow flight
- Punches and kicks

#### Sci-Fi Sounds
- Lightsaber hums
- Laser blasts
- Spaceship engines
- Teleportation effects
- Force powers

#### Magic/Fantasy Sounds
- Spell casting
- Magic whooshes
- Dragon roars
- Potion bubbling

#### Environment Sounds
- Doors opening/closing
- Footsteps
- Glass breaking

#### Transportation Sounds
- Horse galloping
- Car engines
- Train whistles
- Airplanes

#### Nature Sounds
- Thunder
- Wind gusts
- Water splashing
- Fire crackling

#### Emotional Sounds
- Heartbeats
- Gasps
- Screams
- Laughter

**Genre-Aware Filtering:**
The system automatically filters inappropriate sounds based on the book's genre. For example:
- Fantasy novels won't include car engine or laser sounds
- Sci-fi novels won't include sword clashes or magic spells
- Contemporary novels won't include dragons or spaceships

### 4. Background Ambient Sounds

Contextual background sounds are automatically detected and applied based on the scene:

- **Locations:** Forest, city, castle, ocean, desert, mountain, village
- **Weather:** Rain, thunder, snow, wind, sunny
- **Time of Day:** Morning, afternoon, evening, night
- **Mood:** Tense, peaceful, exciting, sad, joyful

### 5. Book Content Analysis

The AI analyzes your book to extract:

- **Characters:** Automatically detected from the text with role classification (protagonist, antagonist, supporting, minor)
- **Genre:** Fantasy, Science Fiction, Mystery, Thriller, Romance, Horror, etc.
- **Settings:** Common locations in the book
- **Themes:** Main themes and motifs
- **Context:** Scene-by-scene analysis of mood, action level, and atmosphere

## Configuration

### Setting Up TTS Providers

1. Open CleverFerret
2. Go to **Settings** > **API Keys**
3. Scroll to the **Text-to-Speech APIs** section
4. Enter your API key for your chosen provider
5. The audiobook maker will automatically use the configured provider

### Audiobook Generation Config

When creating an audiobook, you can configure:

```kotlin
AudiobookGenerationConfig(
    useCharacterVoices = true,           // Enable character-specific voices
    useBackgroundSounds = true,          // Enable ambient sounds
    useActionSounds = true,              // Enable action effects
    masterVolume = 1.0f,                 // Overall volume (0.0-1.0)
    dialogueVolume = 1.0f,               // Character dialogue volume
    backgroundVolume = 0.3f,             // Ambient sound volume
    effectsVolume = 0.5f,                // Action sound effects volume
    autoDetectCharacters = true,         // Auto-detect characters from text
    autoDetectSounds = true,             // Auto-detect appropriate sounds
    ttsProvider = TtsProviderType.GEMINI // Choose TTS provider
)
```

## Usage Example

```kotlin
// Initialize the audiobook maker service
val audiobookMaker = AudiobookMakerService(...)

// Analyze the book
val analysis = audiobookMaker.initializeBook(
    bookText = fullBookText,
    title = "The Great Adventure",
    author = "Jane Doe",
    config = AudiobookGenerationConfig(
        ttsProvider = TtsProviderType.ELEVEN_LABS,
        useCharacterVoices = true,
        useBackgroundSounds = true,
        useActionSounds = true
    )
)

// Process a chapter
val segments = audiobookMaker.processChapter(
    chapterText = chapterOneText,
    chapterId = "chapter_1",
    chapterIndex = 0
)

// Generate audio for each segment
segments.forEach { segment ->
    audiobookMaker.generateSegmentAudio(segment)
}
```

## Architecture

### Core Services

1. **AudiobookMakerService** - Main orchestration service
2. **BookContentAnalyzer** - AI-powered book analysis and character extraction
3. **CharacterVoiceService** - Character voice generation and management
4. **ActionSoundService** - Action sound effects library and detection
5. **AmbientSoundService** - Background ambient sounds (existing service)
6. **ContextDetectionService** - Scene context analysis (existing service)

### Data Models

- **BookCharacter** - Character with voice profile
- **CharacterVoiceProfile** - Voice parameters for a character
- **ActionSound** - Sound effect definition
- **AudiobookSegment** - A piece of narration with timing and sounds
- **BookContext** - Scene context information
- **AudiobookGenerationConfig** - Configuration settings

## Testing

The feature includes comprehensive unit tests:

- `ActionSoundServiceTest` - Tests sound library and genre filtering
- `BookContentAnalyzerTest` - Tests content analysis and context detection
- `CharacterVoiceServiceTest` - Tests voice profile generation

Run tests with:
```bash
./gradlew :CleverFerret:testDebugUnitTest
```

## API Key Security

All API keys are stored securely using Android's `EncryptedSharedPreferences` with AES256 encryption. Keys are never logged or exposed in plain text.

## Limitations

1. **Timing Accuracy:** Sound effect timing is estimated based on text position and may not be perfectly synchronized
2. **Character Detection:** Character detection uses heuristics and may not catch all characters or may incorrectly identify some names
3. **Voice Limitations:** Some TTS providers don't support pitch/speed adjustments
4. **Cost Considerations:** Premium TTS providers charge per character, so long books can be expensive

## Future Enhancements

- Real-time audiobook generation during playback
- Custom voice cloning for specific characters
- User-adjustable character voice assignments
- More sophisticated dialogue attribution
- Support for multiple narrators
- Audio mixing and mastering
- Export to audiobook formats (M4B, etc.)

## Support

For issues or questions about the audiobook maker feature, please file an issue on the GitHub repository.
