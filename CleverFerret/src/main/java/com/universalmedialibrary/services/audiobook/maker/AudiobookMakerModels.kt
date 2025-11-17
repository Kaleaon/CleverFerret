package com.universalmedialibrary.services.audiobook.maker

/**
 * Data models for the Audiobook Maker feature
 * Supports character voices, background sounds, and action effects
 */

/**
 * Represents a character in a book with voice profile
 */
data class BookCharacter(
    val id: String,
    val name: String,
    val description: String = "",
    val firstAppearance: Int = 0, // Chapter/page where character first appears
    val voiceProfile: CharacterVoiceProfile,
    val role: CharacterRole = CharacterRole.SUPPORTING,
    val dialogueCount: Int = 0,
    val sampleDialogue: List<String> = emptyList()
)

/**
 * Voice profile for a book character
 */
data class CharacterVoiceProfile(
    val characterId: String,
    val characterName: String,
    val pitch: Float = 1.0f, // 0.5-2.0
    val speed: Float = 1.0f, // 0.5-2.0
    val tone: VoiceTone = VoiceTone.NEUTRAL,
    val emotion: EmotionStyle = EmotionStyle.CALM,
    val voiceType: VoiceType = VoiceType.MEDIUM,
    val gender: VoiceGender = VoiceGender.NEUTRAL,
    val age: VoiceAge = VoiceAge.ADULT,
    val accent: String? = null,
    val description: String? = null,
    val aiGenerated: Boolean = true
)

/**
 * Role of a character in the story
 */
enum class CharacterRole {
    PROTAGONIST,
    ANTAGONIST,
    SUPPORTING,
    MINOR,
    NARRATOR
}

/**
 * Voice tone characteristics
 */
enum class VoiceTone {
    WARM,
    COLD,
    NEUTRAL,
    HARSH,
    SOFT,
    AUTHORITATIVE,
    FRIENDLY,
    MYSTERIOUS
}

/**
 * Emotional style for voice
 */
enum class EmotionStyle {
    CALM,
    ENERGETIC,
    MELANCHOLIC,
    CHEERFUL,
    SERIOUS,
    ANXIOUS,
    CONFIDENT,
    VARIABLE
}

/**
 * Voice type classification
 */
enum class VoiceType {
    DEEP,
    HIGH,
    MEDIUM,
    BASS,
    TENOR,
    ALTO,
    SOPRANO
}

/**
 * Voice gender
 */
enum class VoiceGender {
    MALE,
    FEMALE,
    NEUTRAL,
    ANDROGYNOUS
}

/**
 * Voice age range
 */
enum class VoiceAge {
    CHILD,
    TEEN,
    YOUNG_ADULT,
    ADULT,
    MIDDLE_AGED,
    ELDERLY
}

/**
 * Action sound effect for audiobook
 */
data class ActionSound(
    val id: String,
    val name: String,
    val category: ActionSoundCategory,
    val keywords: List<String>,
    val audioResourcePath: String? = null,
    val audioUrl: String? = null,
    val duration: Long = 0, // milliseconds
    val volume: Float = 1.0f
)

/**
 * Categories of action sounds
 */
enum class ActionSoundCategory {
    // Combat
    SWORD_CLASH,
    GUNFIRE,
    EXPLOSION,
    ARROW_FLIGHT,
    PUNCH,
    KICK,
    
    // Sci-Fi
    LIGHTSABER,
    LASER_BLAST,
    SPACESHIP,
    TELEPORT,
    FORCE_POWER,
    
    // Magic/Fantasy
    SPELL_CAST,
    MAGIC_WHOOSH,
    DRAGON_ROAR,
    POTION_BUBBLE,
    
    // Environment
    DOOR_OPEN,
    DOOR_CLOSE,
    FOOTSTEPS,
    GLASS_BREAK,
    
    // Transportation
    HORSE_GALLOP,
    CAR_ENGINE,
    TRAIN_WHISTLE,
    AIRPLANE,
    
    // Nature
    THUNDER,
    WIND_GUST,
    WATER_SPLASH,
    FIRE_CRACKLE,
    
    // Emotional
    HEARTBEAT,
    GASP,
    SCREAM,
    LAUGHTER,
    
    // Other
    GENERIC,
    CUSTOM
}

/**
 * Represents a segment of audiobook narration
 */
data class AudiobookSegment(
    val id: String,
    val chapterId: String,
    val startPosition: Long, // milliseconds
    val duration: Long, // milliseconds
    val type: SegmentType,
    val text: String,
    val characterId: String? = null, // For dialogue
    val voiceProfile: CharacterVoiceProfile? = null,
    val backgroundSoundId: String? = null,
    val actionSounds: List<ActionSoundTiming> = emptyList(),
    val emotion: String? = null,
    val pitch: Float = 1.0f,
    val speed: Float = 1.0f
)

/**
 * Type of audiobook segment
 */
enum class SegmentType {
    NARRATION,
    DIALOGUE,
    DESCRIPTION,
    ACTION,
    INTERNAL_MONOLOGUE
}

/**
 * Timing for action sound effects
 */
data class ActionSoundTiming(
    val soundId: String,
    val relativePosition: Long, // milliseconds from segment start
    val volume: Float = 1.0f,
    val fadeDuration: Long = 0 // milliseconds
)

/**
 * Book genre for context-aware processing
 */
enum class BookGenre {
    FANTASY,
    SCIENCE_FICTION,
    MYSTERY,
    THRILLER,
    ROMANCE,
    HISTORICAL,
    HORROR,
    ADVENTURE,
    CONTEMPORARY,
    WESTERN,
    DYSTOPIAN,
    URBAN_FANTASY,
    PARANORMAL,
    STEAMPUNK,
    CYBERPUNK,
    LITERARY_FICTION,
    UNKNOWN
}

/**
 * Context information for a book section
 */
data class BookContext(
    val genre: BookGenre,
    val setting: String, // e.g., "forest", "city", "spaceship"
    val timeOfDay: String? = null, // e.g., "morning", "night"
    val weather: String? = null, // e.g., "rain", "sunny"
    val mood: String? = null, // e.g., "tense", "peaceful"
    val actionLevel: ActionLevel = ActionLevel.LOW,
    val characters: List<String> = emptyList()
)

/**
 * Level of action in a scene
 */
enum class ActionLevel {
    NONE,
    LOW,
    MEDIUM,
    HIGH,
    INTENSE
}

/**
 * Result of book content analysis
 */
data class BookAnalysisResult(
    val success: Boolean,
    val characters: List<BookCharacter> = emptyList(),
    val genre: BookGenre = BookGenre.UNKNOWN,
    val settings: List<String> = emptyList(),
    val mainThemes: List<String> = emptyList(),
    val narratorStyle: String? = null,
    val error: String? = null
)

/**
 * Configuration for audiobook generation
 */
data class AudiobookGenerationConfig(
    val useCharacterVoices: Boolean = true,
    val useBackgroundSounds: Boolean = true,
    val useActionSounds: Boolean = true,
    val masterVolume: Float = 1.0f,
    val dialogueVolume: Float = 1.0f,
    val backgroundVolume: Float = 0.3f,
    val effectsVolume: Float = 0.5f,
    val narratorVoice: CharacterVoiceProfile? = null,
    val autoDetectCharacters: Boolean = true,
    val autoDetectSounds: Boolean = true,
    val genreOverride: BookGenre? = null
)

/**
 * Status of audiobook generation
 */
data class GenerationStatus(
    val isGenerating: Boolean = false,
    val currentChapter: Int = 0,
    val totalChapters: Int = 0,
    val currentSegment: Int = 0,
    val totalSegments: Int = 0,
    val progress: Float = 0f, // 0.0 - 1.0
    val estimatedTimeRemaining: Long = 0, // milliseconds
    val error: String? = null
)
