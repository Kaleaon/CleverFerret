package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.data.local.entity.AmbientSoundType

/**
 * Sound Pack Manager
 * Organizes and manages ambient sound packs inspired by 99sounds.org structure
 */
object SoundPackManager {
    
    /**
     * Sound Pack metadata
     */
    data class SoundPack(
        val id: String,
        val name: String,
        val category: AmbientCategory,
        val description: String,
        val totalSizeMB: Int,
        val soundCount: Int,
        val quality: AudioQuality,
        val source: String = "99sounds.org",
        val license: String = "Royalty-Free",
        val sounds: List<AmbientSound>
    )
    
    /**
     * Audio quality specifications
     */
    data class AudioQuality(
        val bitDepth: Int,      // e.g., 24-bit
        val sampleRate: Int,    // e.g., 96000 Hz
        val format: String = "WAV"
    )
    
    /**
     * Nature Sounds Pack
     * Inspired by 99sounds.org "Nature Sounds" - 83+ audio files, 3GB+
     * High-quality stereo field recordings from forests, rivers, rain, animals
     */
    fun getNatureSoundsPack() = SoundPack(
        id = "nature_sounds_v1",
        name = "Nature Sounds Collection",
        category = AmbientCategory.NATURE,
        description = "Premium nature recordings featuring animals, forests, rain, water, and wind. " +
                "Recorded in pristine natural environments with professional equipment.",
        totalSizeMB = 3072,
        soundCount = 83,
        quality = AudioQuality(bitDepth = 24, sampleRate = 96000),
        sounds = listOf(
            // Forest sounds
            AmbientSound(
                name = "Deep Forest Ambience",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.FOREST,
                description = "Dense woodland atmosphere with distant birds and rustling leaves",
                keywords = listOf("forest", "woods", "trees", "birds", "nature")
            ),
            AmbientSound(
                name = "Tropical Rainforest",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.FOREST,
                description = "Lush tropical forest with exotic birds and insects",
                keywords = listOf("rainforest", "tropical", "jungle", "exotic birds")
            ),
            
            // Water sounds
            AmbientSound(
                name = "Mountain Stream",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.RIVER,
                description = "Crystal clear mountain stream flowing over rocks",
                keywords = listOf("stream", "creek", "flowing water", "mountain")
            ),
            AmbientSound(
                name = "Gentle Brook",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.RIVER,
                description = "Peaceful small stream with occasional bird calls",
                keywords = listOf("brook", "babbling", "stream", "peaceful")
            ),
            
            // Rain sounds
            AmbientSound(
                name = "Soft Rain on Leaves",
                category = AmbientCategory.WEATHER,
                soundType = AmbientSoundType.RAIN,
                description = "Gentle rain falling on forest canopy",
                keywords = listOf("rain", "drizzle", "leaves", "forest")
            ),
            AmbientSound(
                name = "Thunderstorm Approach",
                category = AmbientCategory.WEATHER,
                soundType = AmbientSoundType.THUNDER,
                description = "Distant thunder with increasing rain intensity",
                keywords = listOf("thunder", "storm", "lightning", "rain")
            ),
            
            // Bird sounds
            AmbientSound(
                name = "Morning Bird Chorus",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.BIRDS,
                description = "Dawn chorus with multiple species singing",
                keywords = listOf("birds", "dawn", "morning", "singing", "chorus")
            ),
            AmbientSound(
                name = "Forest Birds",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.BIRDS,
                description = "Various woodland bird calls throughout the day",
                keywords = listOf("birds", "forest", "chirping", "calls")
            ),
            
            // Wind sounds
            AmbientSound(
                name = "Gentle Breeze",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.WIND,
                description = "Soft wind rustling through leaves and grass",
                keywords = listOf("wind", "breeze", "gentle", "rustling")
            ),
            AmbientSound(
                name = "Strong Wind",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.WIND,
                description = "Powerful wind gusts through trees",
                keywords = listOf("wind", "gusts", "strong", "blowing")
            )
        )
    )
    
    /**
     * World Sounds Pack
     * Inspired by 99sounds.org "World Sounds" - 4GB of global field recordings
     * Environmental soundscapes from various locations worldwide
     */
    fun getWorldSoundsPack() = SoundPack(
        id = "world_sounds_v1",
        name = "World Sounds Collection",
        category = AmbientCategory.URBAN,
        description = "Authentic environmental soundscapes captured from locations around the world. " +
                "Features urban, rural, coastal, and wilderness environments.",
        totalSizeMB = 4096,
        soundCount = 95,
        quality = AudioQuality(bitDepth = 24, sampleRate = 96000),
        sounds = listOf(
            // Urban sounds
            AmbientSound(
                name = "City Morning",
                category = AmbientCategory.URBAN,
                soundType = AmbientSoundType.CITY,
                description = "Bustling city waking up with traffic and people",
                keywords = listOf("city", "urban", "morning", "traffic", "people")
            ),
            AmbientSound(
                name = "Night Market",
                category = AmbientCategory.URBAN,
                soundType = AmbientSoundType.CROWD,
                description = "Vibrant night market with vendors and crowds",
                keywords = listOf("market", "crowd", "night", "vendors", "busy")
            ),
            
            // Transportation
            AmbientSound(
                name = "Train Station",
                category = AmbientCategory.URBAN,
                soundType = AmbientSoundType.TRAIN,
                description = "Busy train station with announcements and trains arriving",
                keywords = listOf("train", "station", "railway", "announcements")
            ),
            AmbientSound(
                name = "Subway Journey",
                category = AmbientCategory.URBAN,
                soundType = AmbientSoundType.TRAIN,
                description = "Inside a moving subway train",
                keywords = listOf("subway", "metro", "underground", "train")
            ),
            
            // Coastal sounds
            AmbientSound(
                name = "Seashore Waves",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.OCEAN,
                description = "Rhythmic ocean waves on sandy beach",
                keywords = listOf("ocean", "beach", "waves", "shore", "sea")
            ),
            AmbientSound(
                name = "Harbor Ambience",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.OCEAN,
                description = "Busy harbor with boats, seagulls, and water",
                keywords = listOf("harbor", "port", "boats", "seagulls", "marina")
            )
        )
    )
    
    /**
     * Cinematic Textures Pack
     * Inspired by 99sounds.org "Cinematic Textures"
     * Atmospheric pads, drones, and evolving soundscapes
     */
    fun getCinematicTexturesPack() = SoundPack(
        id = "cinematic_textures_v1",
        name = "Cinematic Textures",
        category = AmbientCategory.CUSTOM,
        description = "Atmospheric soundscapes perfect for creating moody, evolving backgrounds. " +
                "Ideal for focus, meditation, and immersive reading experiences.",
        totalSizeMB = 512,
        soundCount = 40,
        quality = AudioQuality(bitDepth = 24, sampleRate = 48000),
        sounds = listOf(
            AmbientSound(
                name = "Deep Space Drone",
                category = AmbientCategory.CUSTOM,
                soundType = AmbientSoundType.SPACE,
                description = "Ethereal cosmic atmosphere",
                keywords = listOf("space", "cosmic", "ambient", "drone")
            ),
            AmbientSound(
                name = "Underwater Ambience",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.UNDERWATER,
                description = "Submerged soundscape with water movement",
                keywords = listOf("underwater", "diving", "submerged", "depths")
            ),
            AmbientSound(
                name = "White Noise Texture",
                category = AmbientCategory.CUSTOM,
                soundType = AmbientSoundType.WHITE_NOISE,
                description = "Pure white noise for focus and concentration",
                keywords = listOf("white noise", "static", "focus", "concentration")
            ),
            AmbientSound(
                name = "Pink Noise Pad",
                category = AmbientCategory.CUSTOM,
                soundType = AmbientSoundType.PINK_NOISE,
                description = "Balanced pink noise for relaxation",
                keywords = listOf("pink noise", "relaxation", "sleep", "calm")
            ),
            AmbientSound(
                name = "Brown Noise Deep",
                category = AmbientCategory.CUSTOM,
                soundType = AmbientSoundType.BROWN_NOISE,
                description = "Deep brown noise for sleep and relaxation",
                keywords = listOf("brown noise", "red noise", "deep", "sleep")
            )
        )
    )
    
    /**
     * Indoor Ambience Pack
     * Coffee shops, libraries, and other indoor environments
     */
    fun getIndoorAmbiencePack() = SoundPack(
        id = "indoor_ambience_v1",
        name = "Indoor Ambience Collection",
        category = AmbientCategory.INDOOR,
        description = "Realistic indoor soundscapes including coffee shops, libraries, and cozy spaces. " +
                "Perfect for creating a productive or relaxing atmosphere.",
        totalSizeMB = 768,
        soundCount = 45,
        quality = AudioQuality(bitDepth = 24, sampleRate = 48000),
        sounds = listOf(
            AmbientSound(
                name = "Busy Coffee Shop",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.CAFE,
                description = "Active cafe with espresso machine, chatter, and music",
                keywords = listOf("cafe", "coffee shop", "busy", "espresso", "chatter")
            ),
            AmbientSound(
                name = "Quiet Cafe Corner",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.CAFE,
                description = "Peaceful corner of a cafe with distant sounds",
                keywords = listOf("cafe", "quiet", "peaceful", "corner")
            ),
            AmbientSound(
                name = "University Library",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.LIBRARY,
                description = "Quiet study library with page turning and whispers",
                keywords = listOf("library", "study", "quiet", "academic")
            ),
            AmbientSound(
                name = "Cozy Fireplace",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.FIRE,
                description = "Crackling fireplace in a comfortable room",
                keywords = listOf("fireplace", "crackling", "cozy", "warm")
            )
        )
    )
    
    /**
     * Get all available sound packs
     */
    fun getAllPacks(): List<SoundPack> = listOf(
        getNatureSoundsPack(),
        getWorldSoundsPack(),
        getCinematicTexturesPack(),
        getIndoorAmbiencePack()
    )
    
    /**
     * Get total available sound count across all packs
     */
    fun getTotalSoundCount(): Int = getAllPacks().sumOf { it.soundCount }
    
    /**
     * Get total size in MB across all packs
     */
    fun getTotalSizeMB(): Int = getAllPacks().sumOf { it.totalSizeMB }
    
    /**
     * Get sounds by category from all packs
     */
    fun getSoundsByCategory(category: AmbientCategory): List<AmbientSound> {
        return getAllPacks()
            .filter { it.category == category }
            .flatMap { it.sounds }
    }
    
    /**
     * Search sounds across all packs
     */
    fun searchSounds(query: String): List<AmbientSound> {
        val lowercaseQuery = query.lowercase()
        return getAllPacks()
            .flatMap { it.sounds }
            .filter { sound ->
                sound.name.lowercase().contains(lowercaseQuery) ||
                sound.description.lowercase().contains(lowercaseQuery) ||
                sound.keywords.any { it.contains(lowercaseQuery) }
            }
    }
}
