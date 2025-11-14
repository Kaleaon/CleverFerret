package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientSoundType

object FreeAmbientCollections {

    fun registerAll() {
        registerBbcCollection()
        registerFreesoundCollection()
    }

    private fun registerBbcCollection() {
        val sounds = listOf(
            AmbientSound(
                name = "Rainforest Downpour",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.RAIN,
                audioUrl = "https://bbcsfx.acropolis.org.uk/assets/07067040.wav",
                iconType = "rain",
                description = "Recorded by BBC engineers in the Monteverde Cloud Forest. Licensed under RemArc (CC BY).",
                keywords = listOf("rain", "forest", "nature", "downpour"),
                volume = 0.6f
            ),
            AmbientSound(
                name = "Coastal Waves",
                category = AmbientCategory.WATER,
                soundType = AmbientSoundType.OCEAN,
                audioUrl = "https://bbcsfx.acropolis.org.uk/assets/07002050.wav",
                iconType = "wave",
                description = "Atlantic surf breaking on a rocky beach. Licensed under RemArc (CC BY).",
                keywords = listOf("ocean", "waves", "coast", "sea"),
                volume = 0.6f
            ),
            AmbientSound(
                name = "Highland Winds",
                category = AmbientCategory.NATURE,
                soundType = AmbientSoundType.WIND,
                audioUrl = "https://bbcsfx.acropolis.org.uk/assets/07054060.wav",
                iconType = "wind",
                description = "Strong wind through Scottish highlands. Licensed under RemArc (CC BY).",
                keywords = listOf("wind", "mountain", "highland"),
                volume = 0.5f
            )
        )

        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "bbc_soundscapes",
                name = "BBC Soundscapes",
                description = "Nature ambiences from the BBC Sound Effects library (RemArc CC BY).",
                theme = "nature",
                sounds = sounds,
                enabled = true
            )
        )
    }

    private fun registerFreesoundCollection() {
        val sounds = listOf(
            AmbientSound(
                name = "Space Drone",
                category = AmbientCategory.CUSTOM,
                soundType = AmbientSoundType.SPACE,
                audioUrl = "https://freesound.org/data/previews/415/415209_5121236-lq.mp3",
                iconType = "space",
                description = "Ambient sci‑fi drone by tyops (Freesound, CC0). Perfect for futuristic reading sessions.",
                keywords = listOf("space", "drone", "sci-fi", "ambient"),
                volume = 0.5f
            ),
            AmbientSound(
                name = "City Night Loop",
                category = AmbientCategory.CITY,
                soundType = AmbientSoundType.CITY,
                audioUrl = "https://freesound.org/data/previews/490/490466_1015240-lq.mp3",
                iconType = "city",
                description = "Quiet downtown ambience captured by klankbeeld (Freesound, CC BY 3.0). Attribution required.",
                keywords = listOf("city", "night", "urban"),
                volume = 0.5f
            ),
            AmbientSound(
                name = "Library Murmurs",
                category = AmbientCategory.INDOOR,
                soundType = AmbientSoundType.LIBRARY,
                audioUrl = "https://freesound.org/data/previews/348/348858_5121236-lq.mp3",
                iconType = "library",
                description = "Soft library ambience recorded by InspectorJ (Freesound, CC BY 3.0). Attribution required.",
                keywords = listOf("library", "reading", "murmur"),
                volume = 0.4f
            )
        )

        SoundLibrary.registerCollection(
            SoundLibrary.SoundCollection(
                id = "freesound_atmospheres",
                name = "Freesound Atmospheres",
                description = "Community-contributed ambiences from Freesound.org. Check track licenses for attribution.",
                theme = "ambient",
                sounds = sounds,
                enabled = false
            )
        )
    }
}
