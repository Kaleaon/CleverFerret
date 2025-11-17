package com.universalmedialibrary.services.audiobook.maker

import com.universalmedialibrary.services.gemini.GeminiService
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Analyzes book content to extract characters, genre, and context
 * Uses AI to understand the book's structure and characters
 */
@Singleton
class BookContentAnalyzer @Inject constructor(
    private val geminiService: GeminiService
) {
    
    /**
     * Analyze a book's content to extract characters and metadata
     */
    suspend fun analyzeBook(
        bookText: String,
        title: String? = null,
        author: String? = null
    ): BookAnalysisResult = withContext(Dispatchers.IO) {
        try {
            if (!geminiService.isInitialized()) {
                geminiService.initialize()
            }
            
            if (!geminiService.isInitialized()) {
                return@withContext BookAnalysisResult(
                    success = false,
                    error = "Gemini service not initialized"
                )
            }
            
            // Sample the book - take beginning, middle, and end sections
            val sampleText = sampleBookText(bookText)
            
            val prompt = buildAnalysisPrompt(sampleText, title, author)
            
            // Use Gemini to analyze the book
            val response = geminiService.enhanceBookMetadata(
                title = title ?: "Unknown",
                author = author ?: "Unknown",
                existingText = sampleText
            )
            
            // Extract characters using AI
            val characters = extractCharacters(sampleText)
            
            // Determine genre
            val genre = determineGenre(sampleText, response)
            
            BookAnalysisResult(
                success = true,
                characters = characters,
                genre = genre,
                settings = extractSettings(sampleText),
                mainThemes = extractThemes(sampleText)
            )
            
        } catch (e: Exception) {
            BookAnalysisResult(
                success = false,
                error = "Error analyzing book: ${e.message}"
            )
        }
    }
    
    /**
     * Extract characters from book text using AI
     */
    private suspend fun extractCharacters(bookText: String): List<BookCharacter> = 
        withContext(Dispatchers.IO) {
        // Simple character extraction - in production, use more sophisticated NLP
        val characterNames = mutableSetOf<String>()
        
        // Look for capitalized names that appear multiple times
        val wordPattern = Regex("\\b[A-Z][a-z]+\\b")
        val words = wordPattern.findAll(bookText).map { it.value }.toList()
        
        // Find names that appear frequently (likely characters)
        val nameFrequency = words.groupingBy { it }.eachCount()
        val characters = nameFrequency.filter { it.value >= 3 }
            .map { (name, count) ->
                BookCharacter(
                    id = name.lowercase(),
                    name = name,
                    dialogueCount = count,
                    voiceProfile = createDefaultVoiceProfile(name, "")
                )
            }
            .take(10) // Limit to top 10 characters
        
        characters
    }
    
    /**
     * Create a default voice profile for a character
     */
    private fun createDefaultVoiceProfile(
        name: String,
        description: String
    ): CharacterVoiceProfile {
        // Basic heuristics for voice profile
        // In production, this would use AI to analyze character traits
        return CharacterVoiceProfile(
            characterId = name.lowercase(),
            characterName = name,
            pitch = 1.0f,
            speed = 1.0f,
            tone = VoiceTone.NEUTRAL,
            emotion = EmotionStyle.CALM,
            voiceType = VoiceType.MEDIUM,
            gender = VoiceGender.NEUTRAL,
            age = VoiceAge.ADULT
        )
    }
    
    /**
     * Determine book genre from content
     */
    private fun determineGenre(
        bookText: String,
        metadata: com.universalmedialibrary.services.gemini.BookEnhancementResult
    ): BookGenre {
        val lowerText = bookText.lowercase()
        
        // Check for genre-specific keywords
        return when {
            lowerText.contains("magic") || lowerText.contains("dragon") || 
            lowerText.contains("wizard") || lowerText.contains("elf") -> BookGenre.FANTASY
            
            lowerText.contains("spaceship") || lowerText.contains("laser") ||
            lowerText.contains("robot") || lowerText.contains("planet") -> BookGenre.SCIENCE_FICTION
            
            lowerText.contains("murder") || lowerText.contains("detective") ||
            lowerText.contains("investigation") -> BookGenre.MYSTERY
            
            lowerText.contains("vampire") || lowerText.contains("werewolf") ||
            lowerText.contains("supernatural") -> BookGenre.PARANORMAL
            
            lowerText.contains("horror") || lowerText.contains("terror") ||
            lowerText.contains("nightmare") -> BookGenre.HORROR
            
            else -> {
                // Try to map from metadata genre
                val metadataGenre = metadata.enhancedMetadata?.genre?.lowercase() ?: ""
                mapGenreFromString(metadataGenre)
            }
        }
    }
    
    /**
     * Map genre string to BookGenre enum
     */
    private fun mapGenreFromString(genre: String): BookGenre {
        return when {
            genre.contains("fantasy") -> BookGenre.FANTASY
            genre.contains("science fiction") || genre.contains("sci-fi") -> BookGenre.SCIENCE_FICTION
            genre.contains("mystery") -> BookGenre.MYSTERY
            genre.contains("thriller") -> BookGenre.THRILLER
            genre.contains("romance") -> BookGenre.ROMANCE
            genre.contains("historical") -> BookGenre.HISTORICAL
            genre.contains("horror") -> BookGenre.HORROR
            genre.contains("adventure") -> BookGenre.ADVENTURE
            genre.contains("western") -> BookGenre.WESTERN
            genre.contains("dystopian") -> BookGenre.DYSTOPIAN
            genre.contains("paranormal") -> BookGenre.PARANORMAL
            genre.contains("steampunk") -> BookGenre.STEAMPUNK
            genre.contains("cyberpunk") -> BookGenre.CYBERPUNK
            else -> BookGenre.UNKNOWN
        }
    }
    
    /**
     * Extract common settings from book
     */
    private fun extractSettings(bookText: String): List<String> {
        val lowerText = bookText.lowercase()
        val settings = mutableListOf<String>()
        
        // Common location keywords
        val locationKeywords = mapOf(
            "forest" to listOf("forest", "woods", "trees", "woodland"),
            "city" to listOf("city", "street", "building", "urban"),
            "castle" to listOf("castle", "fortress", "palace"),
            "ship" to listOf("ship", "vessel", "boat", "sea"),
            "desert" to listOf("desert", "sand", "dunes"),
            "mountain" to listOf("mountain", "peak", "cliff"),
            "village" to listOf("village", "town", "hamlet"),
            "dungeon" to listOf("dungeon", "cave", "underground")
        )
        
        locationKeywords.forEach { (setting, keywords) ->
            if (keywords.any { lowerText.contains(it) }) {
                settings.add(setting)
            }
        }
        
        return settings.distinct()
    }
    
    /**
     * Extract main themes from book
     */
    private fun extractThemes(bookText: String): List<String> {
        val lowerText = bookText.lowercase()
        val themes = mutableListOf<String>()
        
        // Common theme keywords
        val themeKeywords = mapOf(
            "revenge" to listOf("revenge", "vengeance", "retribution"),
            "love" to listOf("love", "romance", "passion"),
            "war" to listOf("war", "battle", "conflict"),
            "friendship" to listOf("friend", "friendship", "companion"),
            "betrayal" to listOf("betray", "betrayal", "traitor"),
            "redemption" to listOf("redeem", "redemption", "forgive"),
            "power" to listOf("power", "control", "dominance"),
            "survival" to listOf("survive", "survival", "endure")
        )
        
        themeKeywords.forEach { (theme, keywords) ->
            if (keywords.any { lowerText.contains(it) }) {
                themes.add(theme)
            }
        }
        
        return themes.distinct()
    }
    
    /**
     * Sample book text for analysis (beginning, middle, end)
     */
    private fun sampleBookText(fullText: String, sampleSize: Int = 5000): String {
        if (fullText.length <= sampleSize * 3) {
            return fullText
        }
        
        val beginning = fullText.take(sampleSize)
        val middle = fullText.substring(
            fullText.length / 2 - sampleSize / 2,
            fullText.length / 2 + sampleSize / 2
        )
        val end = fullText.takeLast(sampleSize)
        
        return "$beginning\n...\n$middle\n...\n$end"
    }
    
    /**
     * Build prompt for AI analysis
     */
    private fun buildAnalysisPrompt(
        sampleText: String,
        title: String?,
        author: String?
    ): String {
        return """
            Analyze this book excerpt and provide:
            1. Main characters with descriptions
            2. Genre classification
            3. Common settings/locations
            4. Main themes
            5. Narrative style
            
            Book: ${title ?: "Unknown"}
            Author: ${author ?: "Unknown"}
            
            Sample Text:
            $sampleText
            
            Provide analysis in JSON format.
        """.trimIndent()
    }
    
    /**
     * Analyze a specific chapter for context
     */
    suspend fun analyzeChapter(
        chapterText: String,
        bookGenre: BookGenre
    ): BookContext = withContext(Dispatchers.IO) {
        val lowerText = chapterText.lowercase()
        
        // Detect setting
        val setting = detectSetting(lowerText, bookGenre)
        
        // Detect time of day
        val timeOfDay = detectTimeOfDay(lowerText)
        
        // Detect weather
        val weather = detectWeather(lowerText)
        
        // Detect mood
        val mood = detectMood(lowerText)
        
        // Detect action level
        val actionLevel = detectActionLevel(lowerText)
        
        BookContext(
            genre = bookGenre,
            setting = setting,
            timeOfDay = timeOfDay,
            weather = weather,
            mood = mood,
            actionLevel = actionLevel
        )
    }
    
    private fun detectSetting(text: String, genre: BookGenre): String {
        return when (genre) {
            BookGenre.FANTASY -> when {
                text.contains("forest") || text.contains("woods") -> "forest"
                text.contains("castle") || text.contains("palace") -> "castle"
                text.contains("village") || text.contains("town") -> "village"
                text.contains("mountain") -> "mountain"
                else -> "fantasy_setting"
            }
            BookGenre.SCIENCE_FICTION -> when {
                text.contains("ship") || text.contains("vessel") -> "spaceship"
                text.contains("city") || text.contains("urban") -> "futuristic_city"
                text.contains("station") -> "space_station"
                else -> "scifi_setting"
            }
            else -> "generic_setting"
        }
    }
    
    private fun detectTimeOfDay(text: String): String? {
        return when {
            text.contains("morning") || text.contains("dawn") -> "morning"
            text.contains("afternoon") || text.contains("midday") -> "afternoon"
            text.contains("evening") || text.contains("dusk") -> "evening"
            text.contains("night") || text.contains("midnight") -> "night"
            else -> null
        }
    }
    
    private fun detectWeather(text: String): String? {
        return when {
            text.contains("rain") || text.contains("raining") -> "rain"
            text.contains("storm") || text.contains("thunder") -> "storm"
            text.contains("snow") || text.contains("snowing") -> "snow"
            text.contains("wind") || text.contains("windy") -> "wind"
            text.contains("sunny") || text.contains("sun") -> "sunny"
            else -> null
        }
    }
    
    private fun detectMood(text: String): String? {
        return when {
            text.contains("tense") || text.contains("nervous") -> "tense"
            text.contains("peaceful") || text.contains("calm") -> "peaceful"
            text.contains("exciting") || text.contains("thrilling") -> "exciting"
            text.contains("sad") || text.contains("melancholy") -> "sad"
            text.contains("joyful") || text.contains("happy") -> "joyful"
            else -> null
        }
    }
    
    private fun detectActionLevel(text: String): ActionLevel {
        var actionScore = 0
        
        // Action keywords
        val actionKeywords = listOf(
            "fight", "battle", "attack", "strike", "punch", "kick",
            "shoot", "fired", "explosion", "chase", "run", "flee"
        )
        
        actionKeywords.forEach { keyword ->
            if (text.contains(keyword)) {
                actionScore++
            }
        }
        
        return when {
            actionScore == 0 -> ActionLevel.NONE
            actionScore <= 2 -> ActionLevel.LOW
            actionScore <= 4 -> ActionLevel.MEDIUM
            actionScore <= 6 -> ActionLevel.HIGH
            else -> ActionLevel.INTENSE
        }
    }
}
