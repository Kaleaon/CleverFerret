package com.universalmedialibrary.services.visualizer

import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import kotlinx.serialization.decodeFromString

/**
 * Visualizer Preset System
 * 
 * Allows downloading, creating, and sharing custom visualizer effects
 * Similar to projectM's .milk preset files but using JSON format
 */

@Serializable
data class VisualizerPreset(
    val id: String,
    val name: String,
    val author: String = "Unknown",
    val description: String = "",
    val version: Int = 1,
    val baseStyle: String, // "spectrum_bars", "waveform", "circular", "particles", "frequency_rings", "custom"
    val parameters: VisualizerParameters = VisualizerParameters(),
    val colorScheme: ColorScheme? = null, // null = use theme colors
    val tags: List<String> = emptyList()
)

@Serializable
data class VisualizerParameters(
    // Common parameters
    val sensitivity: Float = 1.0f,
    val smoothing: Float = 0.5f,
    val speed: Float = 1.0f,
    
    // Spectrum bars parameters
    val barCount: Int = 64,
    val barSpacing: Float = 0.1f,
    val barWidth: Float = 0.9f,
    
    // Waveform parameters
    val waveformPoints: Int = 128,
    val waveformThickness: Float = 3.0f,
    val waveformAmplitude: Float = 0.8f,
    
    // Circular parameters
    val circularRadius: Float = 0.2f,
    val circularSpokes: Int = 64,
    val circularRotationSpeed: Float = 1.0f,
    
    // Particles parameters
    val particleCount: Int = 8,
    val particleSize: Float = 1.0f,
    val particleDistance: Float = 150.0f,
    
    // Rings parameters
    val ringCount: Int = 3,
    val ringThickness: Float = 20.0f,
    val ringPulseAmount: Float = 0.2f,
    
    // Advanced parameters
    val bassBoost: Float = 1.0f,
    val midBoost: Float = 1.0f,
    val trebleBoost: Float = 1.0f,
    val colorCycleSpeed: Float = 1.0f,
    val blendMode: String = "normal", // "normal", "additive", "multiply"
    val glowEffect: Boolean = false,
    val mirrorEffect: Boolean = false,
    val pulseEffect: Boolean = true
)

@Serializable
data class ColorScheme(
    val primary: String, // Hex color like "#FF0000"
    val secondary: String,
    val tertiary: String,
    val background: String = "#000000",
    val gradientType: String = "linear" // "linear", "radial", "angular"
)

/**
 * Preset Manager - Handles loading, saving, and managing presets
 */
class VisualizerPresetManager {
    
    private val json = Json { 
        prettyPrint = true
        ignoreUnknownKeys = true
    }
    
    companion object {
        // Built-in presets
        val DEFAULT_PRESETS = listOf(
            VisualizerPreset(
                id = "classic_spectrum",
                name = "Classic Spectrum",
                author = "CleverFerret",
                description = "Traditional frequency spectrum bars",
                baseStyle = "spectrum_bars",
                parameters = VisualizerParameters(
                    barCount = 64,
                    sensitivity = 1.0f
                ),
                tags = listOf("classic", "spectrum", "bars")
            ),
            VisualizerPreset(
                id = "smooth_waveform",
                name = "Smooth Waveform",
                author = "CleverFerret",
                description = "Flowing waveform visualization",
                baseStyle = "waveform",
                parameters = VisualizerParameters(
                    waveformPoints = 128,
                    smoothing = 0.7f,
                    waveformThickness = 4.0f
                ),
                tags = listOf("waveform", "smooth", "flowing")
            ),
            VisualizerPreset(
                id = "spinning_spiral",
                name = "Spinning Spiral",
                author = "CleverFerret",
                description = "Rotating radial visualization",
                baseStyle = "circular",
                parameters = VisualizerParameters(
                    circularSpokes = 72,
                    circularRotationSpeed = 1.5f,
                    sensitivity = 1.2f
                ),
                tags = listOf("circular", "spiral", "rotation")
            ),
            VisualizerPreset(
                id = "bass_pulse",
                name = "Bass Pulse",
                author = "CleverFerret",
                description = "Heavy bass reactive particles",
                baseStyle = "particles",
                parameters = VisualizerParameters(
                    bassBoost = 2.0f,
                    particleSize = 1.5f,
                    pulseEffect = true
                ),
                tags = listOf("bass", "particles", "pulse")
            ),
            VisualizerPreset(
                id = "frequency_rings",
                name = "Frequency Rings",
                author = "CleverFerret",
                description = "Concentric frequency-reactive rings",
                baseStyle = "frequency_rings",
                parameters = VisualizerParameters(
                    ringCount = 3,
                    ringPulseAmount = 0.3f
                ),
                tags = listOf("rings", "frequency", "concentric")
            ),
            VisualizerPreset(
                id = "neon_spectrum",
                name = "Neon Spectrum",
                author = "CleverFerret",
                description = "Bright neon-style spectrum with glow",
                baseStyle = "spectrum_bars",
                parameters = VisualizerParameters(
                    barCount = 96,
                    glowEffect = true,
                    sensitivity = 1.3f,
                    colorCycleSpeed = 2.0f
                ),
                colorScheme = ColorScheme(
                    primary = "#00FF00",
                    secondary = "#00FFFF",
                    tertiary = "#FF00FF",
                    background = "#000000"
                ),
                tags = listOf("neon", "glow", "bright", "colorful")
            ),
            VisualizerPreset(
                id = "ocean_waves",
                name = "Ocean Waves",
                author = "CleverFerret",
                description = "Calming blue waveform",
                baseStyle = "waveform",
                parameters = VisualizerParameters(
                    smoothing = 0.9f,
                    waveformAmplitude = 0.6f,
                    speed = 0.7f
                ),
                colorScheme = ColorScheme(
                    primary = "#0077BE",
                    secondary = "#00A8E8",
                    tertiary = "#00D4FF",
                    background = "#001529"
                ),
                tags = listOf("calm", "blue", "ocean", "relaxing")
            ),
            VisualizerPreset(
                id = "fire_spectrum",
                name = "Fire Spectrum",
                author = "CleverFerret",
                description = "Hot fire-colored spectrum",
                baseStyle = "spectrum_bars",
                parameters = VisualizerParameters(
                    barCount = 80,
                    sensitivity = 1.5f,
                    bassBoost = 1.8f
                ),
                colorScheme = ColorScheme(
                    primary = "#FF4500",
                    secondary = "#FF8C00",
                    tertiary = "#FFD700",
                    background = "#1A0500"
                ),
                tags = listOf("fire", "hot", "energetic", "red")
            ),
            VisualizerPreset(
                id = "mirror_dance",
                name = "Mirror Dance",
                author = "CleverFerret",
                description = "Mirrored circular visualization",
                baseStyle = "circular",
                parameters = VisualizerParameters(
                    mirrorEffect = true,
                    circularRotationSpeed = 2.0f,
                    glowEffect = true
                ),
                tags = listOf("mirror", "symmetric", "dance")
            ),
            VisualizerPreset(
                id = "particle_storm",
                name = "Particle Storm",
                author = "CleverFerret",
                description = "Chaotic particle explosion",
                baseStyle = "particles",
                parameters = VisualizerParameters(
                    particleCount = 16,
                    sensitivity = 2.0f,
                    speed = 1.5f,
                    blendMode = "additive"
                ),
                tags = listOf("particles", "chaotic", "energetic")
            )
        )
    }
    
    /**
     * Export preset to JSON string
     */
    fun exportPreset(preset: VisualizerPreset): String {
        return json.encodeToString(preset)
    }
    
    /**
     * Import preset from JSON string
     */
    fun importPreset(jsonString: String): VisualizerPreset? {
        return try {
            json.decodeFromString<VisualizerPreset>(jsonString)
        } catch (e: Exception) {
            null
        }
    }
    
    /**
     * Create custom preset
     */
    fun createCustomPreset(
        name: String,
        baseStyle: String,
        parameters: VisualizerParameters,
        colorScheme: ColorScheme? = null,
        author: String = "User",
        description: String = ""
    ): VisualizerPreset {
        return VisualizerPreset(
            id = "custom_${System.currentTimeMillis()}",
            name = name,
            author = author,
            description = description,
            baseStyle = baseStyle,
            parameters = parameters,
            colorScheme = colorScheme,
            tags = listOf("custom", "user-created")
        )
    }
    
    /**
     * Get preset by ID
     */
    fun getPresetById(id: String, customPresets: List<VisualizerPreset> = emptyList()): VisualizerPreset? {
        return (DEFAULT_PRESETS + customPresets).find { it.id == id }
    }
    
    /**
     * Search presets by tag
     */
    fun searchPresetsByTag(tag: String, customPresets: List<VisualizerPreset> = emptyList()): List<VisualizerPreset> {
        return (DEFAULT_PRESETS + customPresets).filter { 
            it.tags.any { t -> t.contains(tag, ignoreCase = true) } 
        }
    }
    
    /**
     * Get all presets
     */
    fun getAllPresets(customPresets: List<VisualizerPreset> = emptyList()): List<VisualizerPreset> {
        return DEFAULT_PRESETS + customPresets
    }
}

/**
 * Preset categories for organization
 */
enum class PresetCategory {
    CLASSIC,
    ENERGETIC,
    CALM,
    COLORFUL,
    MINIMAL,
    EXPERIMENTAL,
    CUSTOM
}

/**
 * Extension function to categorize presets
 */
fun VisualizerPreset.getCategory(): PresetCategory {
    return when {
        tags.contains("custom") -> PresetCategory.CUSTOM
        tags.any { it in listOf("classic", "traditional") } -> PresetCategory.CLASSIC
        tags.any { it in listOf("energetic", "chaotic", "intense") } -> PresetCategory.ENERGETIC
        tags.any { it in listOf("calm", "relaxing", "smooth") } -> PresetCategory.CALM
        tags.any { it in listOf("colorful", "neon", "rainbow") } -> PresetCategory.COLORFUL
        tags.any { it in listOf("minimal", "simple") } -> PresetCategory.MINIMAL
        else -> PresetCategory.EXPERIMENTAL
    }
}
