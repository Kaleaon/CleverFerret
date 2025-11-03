# Adding New Ambient Sound Themes

The ambient sound system is designed to be easily extensible. You can add new themed sound collections (sci-fi, medieval, horror, etc.) without modifying core service files.

## Quick Start

### 1. Create a New Sound Collection Object

```kotlin
object MyThemeSounds {
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "My Sound",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Description of the sound",
            keywords = listOf("keyword1", "keyword2", "keyword3")
        ),
        // Add more sounds...
    )
}
```

### 2. Register Your Collection

```kotlin
// In your Application class onCreate() or initialization code:
SoundLibrary.registerCollection(
    SoundLibrary.SoundCollection(
        id = "mytheme",
        name = "My Theme Collection",
        description = "Sounds for my specific theme",
        theme = "my-theme",
        sounds = MyThemeSounds.getAllSounds(),
        enabled = true  // or false if disabled by default
    )
)
```

### 3. That's It!

Your sounds will automatically be:
- ✅ Included in `SoundLibrary.getAllSounds()`
- ✅ Available in the ambient sound browser UI
- ✅ Compatible with animation and layering features
- ✅ Searchable by keywords for context detection
- ✅ Manageable (can be enabled/disabled at runtime)

## Examples

### Sci-Fi Theme

```kotlin
object SciFiSounds {
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Spaceship Engine",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.SPACE,
            description = "Low hum of spaceship engines",
            keywords = listOf("spaceship", "engine", "space", "sci-fi")
        ),
        AmbientSound(
            name = "Cyberpunk City",
            category = AmbientCategory.URBAN,
            soundType = AmbientSoundType.CITY,
            description = "Futuristic neon city",
            keywords = listOf("cyberpunk", "future", "city", "neon")
        )
    )
    
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "scifi",
                name = "Sci-Fi Ambience",
                description = "Futuristic and space sounds",
                theme = "sci-fi",
                sounds = getAllSounds()
            )
        )
    }
}
```

### Medieval Theme

```kotlin
object MedievalSounds {
    fun getAllSounds(): List<AmbientSound> = listOf(
        AmbientSound(
            name = "Castle Hall",
            category = AmbientCategory.INDOOR,
            soundType = AmbientSoundType.CUSTOM,
            description = "Echoing stone hall",
            keywords = listOf("castle", "hall", "medieval", "stone")
        ),
        AmbientSound(
            name = "Blacksmith",
            category = AmbientCategory.CUSTOM,
            soundType = AmbientSoundType.CUSTOM,
            description = "Hammer on anvil",
            keywords = listOf("blacksmith", "forge", "hammer", "medieval")
        )
    )
    
    fun register() {
        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "medieval",
                name = "Medieval Ambience",
                description = "Historical and fantasy medieval sounds",
                theme = "medieval",
                sounds = getAllSounds()
            )
        )
    }
}
```

## Using AudioPack Imports

Users can also add themed sounds via the AudioPack import feature:

1. Create a ZIP file with themed sounds (e.g., "SciFi_Ambience.zip")
2. Import via AudioPackImportScreen
3. Files are automatically categorized by filename analysis
4. No code changes needed!

## Existing Themed Collections

The following themed collections are already available in `ThemedSoundCollections.kt`:

- **Sci-Fi**: 8 sounds (spaceship, cyberpunk city, computer core, etc.)
- **Medieval**: 10 sounds (castle, tavern, blacksmith, battlefield, etc.)
- **Fantasy**: 6 sounds (enchanted forest, dragon's lair, fairy glen, etc.)
- **Horror**: 4 sounds (creaking house, whispers, graveyard, etc.)

To enable them, call `initializeThemedCollections()` in your app initialization.

## Architecture

```
SoundLibrary (Central Registry)
├── Moodist Collection (84 sounds) - Enabled by default
├── Sci-Fi Collection (8 sounds) - User-enabled
├── Medieval Collection (10 sounds) - User-enabled
├── Fantasy Collection (6 sounds) - User-enabled
├── Horror Collection (4 sounds) - User-enabled
└── Your Custom Collections...
```

## Benefits

✅ **No Core Modifications**: Add themes without changing AmbientSoundService  
✅ **Plug-and-Play**: Register collections dynamically at runtime  
✅ **User Control**: Collections can be enabled/disabled  
✅ **Theme Filtering**: Get sounds by theme for genre-specific reading  
✅ **Statistics**: Track sounds per theme and category  
✅ **Backwards Compatible**: Existing code continues to work  

## Advanced Usage

### Get Sounds by Theme

```kotlin
val sciFiSounds = SoundLibrary.getSoundsByTheme("sci-fi")
val medievalSounds = SoundLibrary.getSoundsByTheme("medieval")
```

### Get Available Themes

```kotlin
val themes = SoundLibrary.getAvailableThemes()
// Returns: ["fantasy", "horror", "medieval", "modern", "sci-fi"]
```

### Get Library Statistics

```kotlin
val stats = SoundLibrary.getStats()
println("Total collections: ${stats.totalCollections}")
println("Total sounds: ${stats.totalSounds}")
println("Sounds by theme: ${stats.soundsByTheme}")
```

### Enable/Disable Collections

```kotlin
SoundLibrary.setCollectionEnabled("scifi", true)
SoundLibrary.setCollectionEnabled("horror", false)
```

## Notes

- Keywords are used for context detection when reading books
- Choose appropriate categories (NATURE, URBAN, INDOOR, WEATHER, WATER, CUSTOM)
- Audio files (if any) should be added via AudioPack import or resource files
- Collections are disabled by default to give users control
- The system is designed to handle 1000+ sounds efficiently
