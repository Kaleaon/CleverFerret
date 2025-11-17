package com.universalmedialibrary.services.audiobook.maker

import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Manages action sound effects for audiobook generation
 * Provides genre-appropriate sound effects library
 */
@Singleton
class ActionSoundService @Inject constructor() {
    
    private val soundLibrary = mutableMapOf<String, ActionSound>()
    
    init {
        // Initialize default sound library
        initializeDefaultSounds()
    }
    
    /**
     * Initialize default action sounds
     */
    private fun initializeDefaultSounds() {
        // Combat sounds
        addSound(ActionSound(
            id = "sword_clash_1",
            name = "Sword Clash",
            category = ActionSoundCategory.SWORD_CLASH,
            keywords = listOf("sword", "blade", "clang", "steel", "clash", "parry", "duel")
        ))
        
        addSound(ActionSound(
            id = "gunfire_1",
            name = "Gunshot",
            category = ActionSoundCategory.GUNFIRE,
            keywords = listOf("gun", "shot", "fired", "pistol", "rifle", "weapon", "bang")
        ))
        
        addSound(ActionSound(
            id = "explosion_1",
            name = "Explosion",
            category = ActionSoundCategory.EXPLOSION,
            keywords = listOf("explosion", "explode", "blast", "boom", "detonate")
        ))
        
        addSound(ActionSound(
            id = "arrow_flight_1",
            name = "Arrow Flight",
            category = ActionSoundCategory.ARROW_FLIGHT,
            keywords = listOf("arrow", "bow", "shot", "whistle", "flew")
        ))
        
        addSound(ActionSound(
            id = "punch_1",
            name = "Punch",
            category = ActionSoundCategory.PUNCH,
            keywords = listOf("punch", "hit", "struck", "blow", "fist")
        ))
        
        // Sci-Fi sounds
        addSound(ActionSound(
            id = "lightsaber_1",
            name = "Lightsaber",
            category = ActionSoundCategory.LIGHTSABER,
            keywords = listOf("lightsaber", "laser sword", "energy blade", "hum")
        ))
        
        addSound(ActionSound(
            id = "laser_blast_1",
            name = "Laser Blast",
            category = ActionSoundCategory.LASER_BLAST,
            keywords = listOf("laser", "blaster", "phaser", "beam", "energy weapon")
        ))
        
        addSound(ActionSound(
            id = "spaceship_1",
            name = "Spaceship Engine",
            category = ActionSoundCategory.SPACESHIP,
            keywords = listOf("spaceship", "ship", "engine", "thrusters", "launch")
        ))
        
        addSound(ActionSound(
            id = "teleport_1",
            name = "Teleport",
            category = ActionSoundCategory.TELEPORT,
            keywords = listOf("teleport", "transport", "beam", "materialize", "vanish")
        ))
        
        // Magic/Fantasy sounds
        addSound(ActionSound(
            id = "spell_cast_1",
            name = "Spell Casting",
            category = ActionSoundCategory.SPELL_CAST,
            keywords = listOf("spell", "cast", "magic", "incantation", "enchant")
        ))
        
        addSound(ActionSound(
            id = "magic_whoosh_1",
            name = "Magic Whoosh",
            category = ActionSoundCategory.MAGIC_WHOOSH,
            keywords = listOf("magic", "whoosh", "swirl", "energy", "mystical")
        ))
        
        addSound(ActionSound(
            id = "dragon_roar_1",
            name = "Dragon Roar",
            category = ActionSoundCategory.DRAGON_ROAR,
            keywords = listOf("dragon", "roar", "roared", "beast", "creature")
        ))
        
        // Environment sounds
        addSound(ActionSound(
            id = "door_open_1",
            name = "Door Opening",
            category = ActionSoundCategory.DOOR_OPEN,
            keywords = listOf("door opened", "opened the door", "creak")
        ))
        
        addSound(ActionSound(
            id = "door_close_1",
            name = "Door Closing",
            category = ActionSoundCategory.DOOR_CLOSE,
            keywords = listOf("door closed", "closed the door", "slam", "shut")
        ))
        
        addSound(ActionSound(
            id = "footsteps_1",
            name = "Footsteps",
            category = ActionSoundCategory.FOOTSTEPS,
            keywords = listOf("footsteps", "walked", "running", "steps", "footfall")
        ))
        
        addSound(ActionSound(
            id = "glass_break_1",
            name = "Glass Breaking",
            category = ActionSoundCategory.GLASS_BREAK,
            keywords = listOf("glass", "shatter", "broke", "crash", "smash")
        ))
        
        // Transportation sounds
        addSound(ActionSound(
            id = "horse_gallop_1",
            name = "Horse Galloping",
            category = ActionSoundCategory.HORSE_GALLOP,
            keywords = listOf("horse", "gallop", "rode", "hooves", "steed")
        ))
        
        addSound(ActionSound(
            id = "car_engine_1",
            name = "Car Engine",
            category = ActionSoundCategory.CAR_ENGINE,
            keywords = listOf("car", "engine", "vehicle", "drove", "accelerate")
        ))
        
        addSound(ActionSound(
            id = "train_whistle_1",
            name = "Train Whistle",
            category = ActionSoundCategory.TRAIN_WHISTLE,
            keywords = listOf("train", "whistle", "locomotive", "railway")
        ))
        
        // Nature sounds
        addSound(ActionSound(
            id = "thunder_1",
            name = "Thunder",
            category = ActionSoundCategory.THUNDER,
            keywords = listOf("thunder", "lightning", "storm", "rumble")
        ))
        
        addSound(ActionSound(
            id = "wind_gust_1",
            name = "Wind Gust",
            category = ActionSoundCategory.WIND_GUST,
            keywords = listOf("wind", "gust", "blow", "breeze", "howl")
        ))
        
        addSound(ActionSound(
            id = "water_splash_1",
            name = "Water Splash",
            category = ActionSoundCategory.WATER_SPLASH,
            keywords = listOf("splash", "water", "wave", "plunge")
        ))
        
        addSound(ActionSound(
            id = "fire_crackle_1",
            name = "Fire Crackling",
            category = ActionSoundCategory.FIRE_CRACKLE,
            keywords = listOf("fire", "flame", "crackle", "burn", "blaze")
        ))
        
        // Emotional sounds
        addSound(ActionSound(
            id = "heartbeat_1",
            name = "Heartbeat",
            category = ActionSoundCategory.HEARTBEAT,
            keywords = listOf("heart", "pulse", "beat", "pounding")
        ))
        
        addSound(ActionSound(
            id = "gasp_1",
            name = "Gasp",
            category = ActionSoundCategory.GASP,
            keywords = listOf("gasp", "gasped", "breath", "inhale")
        ))
        
        addSound(ActionSound(
            id = "scream_1",
            name = "Scream",
            category = ActionSoundCategory.SCREAM,
            keywords = listOf("scream", "screamed", "shriek", "yell")
        ))
        
        addSound(ActionSound(
            id = "laughter_1",
            name = "Laughter",
            category = ActionSoundCategory.LAUGHTER,
            keywords = listOf("laugh", "laughed", "chuckle", "giggle")
        ))
    }
    
    /**
     * Add a sound to the library
     */
    fun addSound(sound: ActionSound) {
        soundLibrary[sound.id] = sound
    }
    
    /**
     * Get a sound by ID
     */
    fun getSound(id: String): ActionSound? {
        return soundLibrary[id]
    }
    
    /**
     * Detect appropriate action sounds from text
     */
    suspend fun detectActionSounds(
        text: String,
        genre: BookGenre,
        maxResults: Int = 5
    ): List<ActionSound> = withContext(Dispatchers.IO) {
        val lowerText = text.lowercase()
        val detectedSounds = mutableListOf<Pair<ActionSound, Int>>()
        
        // Score each sound based on keyword matches
        soundLibrary.values.forEach { sound ->
            // Skip sounds that don't match the genre
            if (!isSoundAppropriateForGenre(sound, genre)) {
                return@forEach
            }
            
            var score = 0
            sound.keywords.forEach { keyword ->
                if (lowerText.contains(keyword)) {
                    score++
                }
            }
            
            if (score > 0) {
                detectedSounds.add(sound to score)
            }
        }
        
        // Return top results sorted by score
        detectedSounds
            .sortedByDescending { it.second }
            .take(maxResults)
            .map { it.first }
    }
    
    /**
     * Check if a sound is appropriate for a genre
     * Prevents highway noise in fantasy novels, etc.
     */
    private fun isSoundAppropriateForGenre(sound: ActionSound, genre: BookGenre): Boolean {
        return when (genre) {
            BookGenre.FANTASY, BookGenre.HISTORICAL -> {
                // Exclude modern technology sounds
                sound.category !in listOf(
                    ActionSoundCategory.CAR_ENGINE,
                    ActionSoundCategory.AIRPLANE,
                    ActionSoundCategory.LASER_BLAST,
                    ActionSoundCategory.LIGHTSABER,
                    ActionSoundCategory.SPACESHIP,
                    ActionSoundCategory.TELEPORT
                )
            }
            
            BookGenre.SCIENCE_FICTION, BookGenre.CYBERPUNK -> {
                // Exclude medieval/fantasy sounds
                sound.category !in listOf(
                    ActionSoundCategory.SWORD_CLASH,
                    ActionSoundCategory.ARROW_FLIGHT,
                    ActionSoundCategory.HORSE_GALLOP,
                    ActionSoundCategory.DRAGON_ROAR,
                    ActionSoundCategory.SPELL_CAST
                )
            }
            
            BookGenre.CONTEMPORARY, BookGenre.ROMANCE, BookGenre.MYSTERY -> {
                // Exclude fantasy and sci-fi sounds
                sound.category !in listOf(
                    ActionSoundCategory.SWORD_CLASH,
                    ActionSoundCategory.DRAGON_ROAR,
                    ActionSoundCategory.SPELL_CAST,
                    ActionSoundCategory.LIGHTSABER,
                    ActionSoundCategory.LASER_BLAST,
                    ActionSoundCategory.SPACESHIP,
                    ActionSoundCategory.MAGIC_WHOOSH
                )
            }
            
            else -> true // Allow all sounds for other genres
        }
    }
    
    /**
     * Get sounds by category
     */
    fun getSoundsByCategory(category: ActionSoundCategory): List<ActionSound> {
        return soundLibrary.values.filter { it.category == category }
    }
    
    /**
     * Get all sounds appropriate for a genre
     */
    fun getSoundsForGenre(genre: BookGenre): List<ActionSound> {
        return soundLibrary.values.filter { isSoundAppropriateForGenre(it, genre) }
    }
    
    /**
     * Get all available sounds
     */
    fun getAllSounds(): List<ActionSound> {
        return soundLibrary.values.toList()
    }
}
