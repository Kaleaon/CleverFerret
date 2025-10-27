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
        // Built-in presets (now 20+ presets!)
        val DEFAULT_PRESETS = listOf(
            // Original presets
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
            ),
            // New visualization style presets
            VisualizerPreset(
                id = "oscilloscope",
                name = "Oscilloscope XY",
                author = "CleverFerret",
                description = "Classic oscilloscope XY mode display",
                baseStyle = "oscilloscope",
                parameters = VisualizerParameters(
                    waveformPoints = 256,
                    sensitivity = 1.2f
                ),
                tags = listOf("oscilloscope", "classic", "technical")
            ),
            VisualizerPreset(
                id = "spectrograph",
                name = "Frequency Waterfall",
                author = "CleverFerret",
                description = "Scrolling frequency spectrograph",
                baseStyle = "spectrograph",
                parameters = VisualizerParameters(
                    barCount = 64,
                    smoothing = 0.8f,
                    colorCycleSpeed = 1.2f
                ),
                tags = listOf("spectrograph", "waterfall", "technical")
            ),
            VisualizerPreset(
                id = "lissajous",
                name = "Lissajous Curves",
                author = "CleverFerret",
                description = "Beautiful mathematical Lissajous patterns",
                baseStyle = "lissajous",
                parameters = VisualizerParameters(
                    waveformPoints = 256,
                    smoothing = 0.6f
                ),
                tags = listOf("lissajous", "curves", "mathematical")
            ),
            VisualizerPreset(
                id = "radial_wave",
                name = "Radial Pulse",
                author = "CleverFerret",
                description = "Waveform radiating from center",
                baseStyle = "radial_waveform",
                parameters = VisualizerParameters(
                    waveformPoints = 256,
                    circularRotationSpeed = 1.0f,
                    sensitivity = 1.3f
                ),
                tags = listOf("radial", "pulse", "circular")
            ),
            VisualizerPreset(
                id = "beat_pulse",
                name = "Beat Reactor",
                author = "CleverFerret",
                description = "Shapes that react strongly to beats",
                baseStyle = "beat_reactive",
                parameters = VisualizerParameters(
                    bassBoost = 2.0f,
                    pulseEffect = true,
                    sensitivity = 1.5f
                ),
                tags = listOf("beat", "reactive", "energetic")
            ),
            VisualizerPreset(
                id = "kaleidoscope",
                name = "Kaleidoscope Dream",
                author = "CleverFerret",
                description = "Symmetric kaleidoscope patterns",
                baseStyle = "kaleidoscope",
                parameters = VisualizerParameters(
                    mirrorEffect = true,
                    circularRotationSpeed = 0.8f,
                    colorCycleSpeed = 1.5f
                ),
                tags = listOf("kaleidoscope", "symmetric", "psychedelic")
            ),
            VisualizerPreset(
                id = "fractal",
                name = "Fractal Recursion",
                author = "CleverFerret",
                description = "Recursive fractal circle patterns",
                baseStyle = "fractal",
                parameters = VisualizerParameters(
                    circularRotationSpeed = 0.5f,
                    sensitivity = 1.0f
                ),
                tags = listOf("fractal", "recursive", "mathematical")
            ),
            VisualizerPreset(
                id = "matrix_rain",
                name = "Matrix Rain",
                author = "CleverFerret",
                description = "Digital rain effect inspired by The Matrix",
                baseStyle = "matrix_rain",
                parameters = VisualizerParameters(
                    speed = 1.2f,
                    sensitivity = 1.0f
                ),
                colorScheme = ColorScheme(
                    primary = "#00FF41",
                    secondary = "#008F11",
                    tertiary = "#003B00",
                    background = "#000000"
                ),
                tags = listOf("matrix", "digital", "cyberpunk")
            ),
            VisualizerPreset(
                id = "dual_stereo",
                name = "Dual Channel Stereo",
                author = "CleverFerret",
                description = "Separate left and right channel visualization",
                baseStyle = "dual_channel",
                parameters = VisualizerParameters(
                    waveformPoints = 256,
                    waveformThickness = 2.5f
                ),
                tags = listOf("stereo", "dual", "technical")
            ),
            VisualizerPreset(
                id = "cube_3d",
                name = "3D Cube Spectrum",
                author = "CleverFerret",
                description = "Pseudo-3D rotating cube with spectrum",
                baseStyle = "cube_3d",
                parameters = VisualizerParameters(
                    circularRotationSpeed = 1.0f,
                    barCount = 12,
                    sensitivity = 1.2f
                ),
                tags = listOf("3d", "cube", "rotation")
            ),
            // Additional themed presets
            VisualizerPreset(
                id = "neon_pulse",
                name = "Neon Pulse",
                author = "CleverFerret",
                description = "Neon colored beat reactive visualization",
                baseStyle = "beat_reactive",
                parameters = VisualizerParameters(
                    bassBoost = 1.8f,
                    pulseEffect = true,
                    glowEffect = true
                ),
                colorScheme = ColorScheme(
                    primary = "#FF006E",
                    secondary = "#8338EC",
                    tertiary = "#3A86FF",
                    background = "#000000"
                ),
                tags = listOf("neon", "pulse", "glow", "colorful")
            ),
            VisualizerPreset(
                id = "aurora",
                name = "Aurora Borealis",
                author = "CleverFerret",
                description = "Flowing aurora-like waveforms",
                baseStyle = "radial_waveform",
                parameters = VisualizerParameters(
                    smoothing = 0.9f,
                    circularRotationSpeed = 0.3f,
                    waveformAmplitude = 0.7f
                ),
                colorScheme = ColorScheme(
                    primary = "#0FA",
                    secondary = "#08F",
                    tertiary = "#C0F",
                    background = "#001529"
                ),
                tags = listOf("aurora", "flowing", "calm", "colorful")
            ),
            VisualizerPreset(
                id = "cyber_grid",
                name = "Cyber Grid",
                author = "CleverFerret",
                description = "Cyberpunk-style grid visualization",
                baseStyle = "spectrograph",
                parameters = VisualizerParameters(
                    barCount = 80,
                    sensitivity = 1.5f,
                    colorCycleSpeed = 2.0f
                ),
                colorScheme = ColorScheme(
                    primary = "#FF00FF",
                    secondary = "#00FFFF",
                    tertiary = "#FFFF00",
                    background = "#0A0A0A"
                ),
                tags = listOf("cyberpunk", "grid", "neon", "energetic")
            ),
            VisualizerPreset(
                id = "sunset_wave",
                name = "Sunset Wave",
                author = "CleverFerret",
                description = "Warm sunset-colored waveforms",
                baseStyle = "dual_channel",
                parameters = VisualizerParameters(
                    smoothing = 0.85f,
                    waveformAmplitude = 0.6f,
                    speed = 0.8f
                ),
                colorScheme = ColorScheme(
                    primary = "#FF6B35",
                    secondary = "#F7931E",
                    tertiary = "#FDC830",
                    background = "#1A0F0A"
                ),
                tags = listOf("sunset", "warm", "calm", "colorful")
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
