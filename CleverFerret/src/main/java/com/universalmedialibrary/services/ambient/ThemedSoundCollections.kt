package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.data.local.entity.AmbientSoundType

/**
 * Themed sound collections for specific genres and settings
 * 
 * HOW TO ADD NEW THEMES:
 * 1. Create a new object (e.g., SciFiSounds, MedievalSounds)
 * 2. Implement getAllSounds() returning List<AmbientSound>
 * 3. Register it in your Application class or initialization code:
 *    
 *    SoundLibrary.registerCollection(
 *        SoundLibrary.SoundCollection(
 *            id = "scifi",
 *            name = "Sci-Fi Ambience",
 *            description = "Futuristic and space sounds",
 *            theme = "sci-fi",
 *            sounds = SciFiSounds.getAllSounds()
 *        )
 *    )
 * 
 * 4. Optionally use AudioPackImporter to let users add their own sounds
 */

/**
 * Sci-Fi themed sounds
 * Perfect for science fiction, space opera, cyberpunk books
 */
object SciFiSounds {
    
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Spaceship Engine",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.SPACE,
            description = "Low hum of spaceship engines",
            keywords = listOf("spaceship", "engine", "space", "sci-fi", "vessel")
        ),
        AmbientSound(
            name = "Space Station",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.SPACE,
            description = "Ambient sounds inside a space station",
            keywords = listOf("space station", "sci-fi", "orbital", "technology")
        ),
        AmbientSound(
            name = "Computer Core",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Humming computer servers and data processing",
            keywords = listOf("computer", "servers", "technology", "processing", "sci-fi")
        ),
        AmbientSound(
            name = "Asteroid Field",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.SPACE,
            description = "Distant impacts and space debris",
            keywords = listOf("asteroids", "space", "debris", "impacts")
        ),
        AmbientSound(
            name = "Warp Core",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Pulsing energy of warp drive",
            keywords = listOf("warp", "energy", "drive", "power", "sci-fi")
        ),
        AmbientSound(
            name = "Cyberpunk City",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Futuristic neon city with flying vehicles",
            keywords = listOf("cyberpunk", "future", "city", "neon", "flying cars")
        ),
        AmbientSound(
            name = "Robot Workshop",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Mechanical sounds of robot construction",
            keywords = listOf("robots", "mechanical", "workshop", "construction")
        ),
        AmbientSound(
            name = "Deep Space",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.SPACE,
            description = "Empty void of deep space",
            keywords = listOf("deep space", "void", "silence", "cosmic")
        )
    )
    
    /**
     * Register this collection automatically when initialized
     */
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "scifi",
                name = "Sci-Fi Ambience",
                description = "Futuristic and space-themed sounds for science fiction",
                theme = "sci-fi",
                sounds = getAllSounds(),
                enabled = false // Disabled by default, users can enable
            )
        )
    }
}

/**
 * Medieval themed sounds
 * Perfect for fantasy, historical fiction, medieval settings
 */
object MedievalSounds {
    
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Castle Hall",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Echoing stone hall with distant voices",
            keywords = listOf("castle", "hall", "medieval", "stone", "echoes")
        ),
        AmbientSound(
            name = "Blacksmith",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Hammer on anvil and roaring forge",
            keywords = listOf("blacksmith", "forge", "hammer", "anvil", "medieval")
        ),
        AmbientSound(
            name = "Tavern",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Lively medieval tavern with lute music",
            keywords = listOf("tavern", "inn", "medieval", "lute", "crowd")
        ),
        AmbientSound(
            name = "Market Square",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CROWD,
            description = "Bustling medieval marketplace",
            keywords = listOf("market", "marketplace", "medieval", "vendors", "crowd")
        ),
        AmbientSound(
            name = "Monastery",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Peaceful monastery with chanting monks",
            keywords = listOf("monastery", "monks", "chanting", "peaceful", "medieval")
        ),
        AmbientSound(
            name = "Stable",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Horses neighing and hay rustling",
            keywords = listOf("stable", "horses", "medieval", "barn")
        ),
        AmbientSound(
            name = "Battlefield",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Distant battle sounds and war cries",
            keywords = listOf("battle", "war", "medieval", "combat", "swords")
        ),
        AmbientSound(
            name = "Forest Patrol",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Medieval patrol through forest",
            keywords = listOf("forest", "patrol", "medieval", "guards", "march")
        ),
        AmbientSound(
            name = "Harbor",
            category = AmbientCategory.WATER,
            soundType = AmbientSoundType.OCEAN,
            description = "Medieval port with ships and sailors",
            keywords = listOf("harbor", "port", "medieval", "ships", "sailors")
        ),
        AmbientSound(
            name = "Wizard's Tower",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Magical ambience with mystical sounds",
            keywords = listOf("wizard", "magic", "tower", "mystical", "fantasy")
        )
    )
    
    /**
     * Register this collection automatically when initialized
     */
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "medieval",
                name = "Medieval Ambience",
                description = "Historical and fantasy medieval sounds",
                theme = "medieval",
                sounds = getAllSounds(),
                enabled = false // Disabled by default, users can enable
            )
        )
    }
}

/**
 * Fantasy themed sounds
 * Perfect for high fantasy, magical worlds, mythical settings
 */
object FantasySounds {
    
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Enchanted Forest",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.FOREST,
            description = "Magical forest with mystical sounds",
            keywords = listOf("enchanted", "forest", "magic", "mystical", "fantasy")
        ),
        AmbientSound(
            name = "Dragon's Lair",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cavernous lair with dragon breathing",
            keywords = listOf("dragon", "lair", "cave", "fantasy", "beast")
        ),
        AmbientSound(
            name = "Fairy Glen",
            category = AmbientCategory.NATURE,
            soundType = AmbientSoundType.CUSTOM,
            description = "Gentle magical sounds and tinkling",
            keywords = listOf("fairy", "glen", "magic", "tinkling", "fantasy")
        ),
        AmbientSound(
            name = "Magic Academy",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "School of magic with spell casting",
            keywords = listOf("academy", "magic", "school", "spells", "fantasy")
        ),
        AmbientSound(
            name = "Crystal Cave",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Resonating crystals in underground cave",
            keywords = listOf("crystal", "cave", "resonance", "underground", "fantasy")
        ),
        AmbientSound(
            name = "Elven City",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CUSTOM,
            description = "Ethereal elven civilization",
            keywords = listOf("elven", "elf", "city", "ethereal", "fantasy")
        )
    )
    
    /**
     * Register this collection automatically when initialized
     */
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "fantasy",
                name = "Fantasy Ambience",
                description = "Magical and mythical sounds for fantasy worlds",
                theme = "fantasy",
                sounds = getAllSounds(),
                enabled = false // Disabled by default, users can enable
            )
        )
    }
}

/**
 * Horror themed sounds
 * Perfect for horror, thriller, suspense books
 */
object HorrorSounds {
    
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Creaking House",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Old house creaking and settling",
            keywords = listOf("creaking", "house", "old", "haunted", "horror")
        ),
        AmbientSound(
            name = "Distant Whispers",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Faint unsettling whispers",
            keywords = listOf("whispers", "voices", "eerie", "horror")
        ),
        AmbientSound(
            name = "Foggy Graveyard",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Cemetery atmosphere with wind",
            keywords = listOf("graveyard", "cemetery", "fog", "wind", "horror")
        ),
        AmbientSound(
            name = "Abandoned Hospital",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Empty hospital with distant echoes",
            keywords = listOf("hospital", "abandoned", "empty", "echoes", "horror")
        )
    )
    
    /**
     * Register this collection automatically when initialized
     */
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "horror",
                name = "Horror Ambience",
                description = "Eerie and suspenseful sounds for horror",
                theme = "horror",
                sounds = getAllSounds(),
                enabled = false // Disabled by default, users can enable
            )
        )
    }
}

/**
 * Initialize all themed collections
 * Call this in your Application class onCreate() or similar
 */
object ThemedCollections {
    fun initialize() {
        SciFiSounds.register()
        MedievalSounds.register()
        FantasySounds.register()
        HorrorSounds.register()
    }
}
