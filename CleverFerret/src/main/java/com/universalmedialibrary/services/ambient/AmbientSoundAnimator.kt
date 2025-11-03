package com.universalmedialibrary.services.ambient

import kotlinx.coroutines.*
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlin.math.sin
import kotlin.random.Random

/**
 * Ambient Sound Animator
 * Inspired by myNoise.net - provides dynamic, non-repetitive soundscapes
 * by animating volume levels with randomized patterns
 */
class AmbientSoundAnimator {
    
    private val _isAnimating = MutableStateFlow(false)
    val isAnimating: StateFlow<Boolean> = _isAnimating.asStateFlow()
    
    private var animationJob: Job? = null
    private val animationScope = CoroutineScope(SupervisorJob() + Dispatchers.Default)
    
    /**
     * Animation modes that control how many layers are animated simultaneously
     */
    enum class AnimationMode {
        SOLO,   // Animate 1 layer at a time
        DUO,    // Animate 2 layers simultaneously
        TRIO,   // Animate 3 layers simultaneously
        QUAD,   // Animate 4 layers simultaneously
        ALL     // Animate all layers with independent patterns
    }
    
    /**
     * Animation speed controlling how fast the volume changes occur
     */
    enum class AnimationSpeed(val durationMs: Long) {
        VERY_SLOW(30000),  // 30 seconds per cycle
        SLOW(20000),       // 20 seconds
        MEDIUM(10000),     // 10 seconds
        FAST(5000),        // 5 seconds
        VERY_FAST(2000)    // 2 seconds
    }
    
    /**
     * Start animating sound layers with specified mode and speed
     * 
     * @param layerCount Number of sound layers to animate
     * @param mode Animation complexity mode
     * @param speed How fast the animation cycles
     * @param onVolumeChange Callback when a layer's volume changes (layerIndex, newVolume)
     */
    fun startAnimation(
        layerCount: Int,
        mode: AnimationMode = AnimationMode.DUO,
        speed: AnimationSpeed = AnimationSpeed.MEDIUM,
        onVolumeChange: (layerIndex: Int, volume: Float) -> Unit
    ) {
        stopAnimation()
        
        _isAnimating.value = true
        
        animationJob = animationScope.launch {
            val activeLayerCount = when (mode) {
                AnimationMode.SOLO -> 1
                AnimationMode.DUO -> 2
                AnimationMode.TRIO -> 3
                AnimationMode.QUAD -> 4
                AnimationMode.ALL -> layerCount
            }.coerceAtMost(layerCount)
            
            // Initialize random phases for each layer to create variety
            val phases = List(layerCount) { Random.nextFloat() * 2f * Math.PI.toFloat() }
            val frequencies = List(layerCount) { 
                // Random frequency multiplier between 0.5 and 1.5 for variety
                0.5f + Random.nextFloat() 
            }
            
            var elapsedTime = 0L
            val updateIntervalMs = 100L // Update every 100ms for smooth animation
            
            while (isActive && _isAnimating.value) {
                val cycleProgress = (elapsedTime % speed.durationMs) / speed.durationMs.toFloat()
                
                // Calculate active layers for this cycle
                val activeLayers = if (mode == AnimationMode.ALL) {
                    (0 until layerCount).toList()
                } else {
                    // Rotate which layers are active based on cycle
                    val startIndex = ((cycleProgress * layerCount).toInt()) % layerCount
                    (0 until activeLayerCount).map { (startIndex + it) % layerCount }
                }
                
                // Update volumes for all layers
                for (i in 0 until layerCount) {
                    val volume = if (activeLayers.contains(i)) {
                        // Active layers use animated volume with sine wave + randomness
                        val baseVolume = calculateAnimatedVolume(
                            cycleProgress,
                            phases[i],
                            frequencies[i]
                        )
                        
                        // Add subtle randomness (±10%) for natural feel
                        val randomness = (Random.nextFloat() - 0.5f) * 0.2f
                        (baseVolume + randomness).coerceIn(0f, 1f)
                    } else {
                        // Inactive layers fade to lower volume
                        calculateFadeVolume(cycleProgress, phases[i])
                    }
                    
                    onVolumeChange(i, volume)
                }
                
                delay(updateIntervalMs)
                elapsedTime += updateIntervalMs
            }
        }
    }
    
    /**
     * Calculate animated volume using sine wave with phase and frequency
     */
    private fun calculateAnimatedVolume(
        progress: Float,
        phase: Float,
        frequency: Float
    ): Float {
        // Sine wave oscillation between 0.3 and 1.0
        val angle = (progress * 2f * Math.PI.toFloat() * frequency) + phase
        val sine = sin(angle)
        return 0.65f + (sine * 0.35f) // Maps [-1, 1] to [0.3, 1.0]
    }
    
    /**
     * Calculate fade volume for inactive layers
     */
    private fun calculateFadeVolume(progress: Float, phase: Float): Float {
        // Gentle breathing at low volume
        val angle = (progress * Math.PI.toFloat()) + phase
        val sine = sin(angle)
        return 0.2f + (sine * 0.1f) // Maps [-1, 1] to [0.1, 0.3]
    }
    
    /**
     * Stop the animation
     */
    fun stopAnimation() {
        _isAnimating.value = false
        animationJob?.cancel()
        animationJob = null
    }
    
    /**
     * Clean up resources
     */
    fun cleanup() {
        stopAnimation()
        animationScope.cancel()
    }
}

/**
 * Sound Layer Configuration
 * Represents a single layer in a multi-layered soundscape
 */
data class SoundLayer(
    val name: String,
    val frequency: Float,      // Frequency range this layer covers (for filtering)
    val baseVolume: Float = 0.7f,
    val audioResourcePath: String? = null,
    val description: String = ""
)

/**
 * Multi-Layered Soundscape
 * Groups multiple sound layers that can be mixed and animated together
 */
data class LayeredSoundscape(
    val id: Long,
    val name: String,
    val category: String,
    val layers: List<SoundLayer>,
    val description: String = "",
    val recommendedAnimationMode: AmbientSoundAnimator.AnimationMode = AmbientSoundAnimator.AnimationMode.DUO,
    val recommendedSpeed: AmbientSoundAnimator.AnimationSpeed = AmbientSoundAnimator.AnimationSpeed.MEDIUM
)

/**
 * Preset layered soundscapes inspired by myNoise.net and 99sounds.org
 */
object LayeredSoundscapePresets {
    
    fun getRainSoundscape() = LayeredSoundscape(
        id = 1,
        name = "Layered Rain",
        category = "Weather",
        layers = listOf(
            SoundLayer("Thunder Rumble", 0.1f, 0.3f, description = "Deep thunder in distance"),
            SoundLayer("Heavy Drops", 0.3f, 0.8f, description = "Large rain drops"),
            SoundLayer("Rain Patter", 0.5f, 1.0f, description = "Light rain sound"),
            SoundLayer("Wind Whoosh", 0.7f, 0.6f, description = "Wind gusts"),
            SoundLayer("Dripping Water", 0.9f, 0.4f, description = "Water dripping")
        ),
        description = "Multi-layered rain with thunder, drops, and wind",
        recommendedAnimationMode = AmbientSoundAnimator.AnimationMode.TRIO,
        recommendedSpeed = AmbientSoundAnimator.AnimationSpeed.SLOW
    )
    
    fun getForestSoundscape() = LayeredSoundscape(
        id = 2,
        name = "Deep Forest",
        category = "Nature",
        layers = listOf(
            SoundLayer("Wind in Trees", 0.2f, 0.7f, description = "Rustling leaves"),
            SoundLayer("Bird Chorus", 0.4f, 0.8f, description = "Multiple bird species"),
            SoundLayer("Crickets", 0.6f, 0.5f, description = "Cricket chirping"),
            SoundLayer("Distant Stream", 0.8f, 0.3f, description = "Flowing water"),
            SoundLayer("Woodland Ambience", 1.0f, 0.6f, description = "General forest sounds")
        ),
        description = "Rich forest atmosphere with birds, wind, and water",
        recommendedAnimationMode = AmbientSoundAnimator.AnimationMode.ALL,
        recommendedSpeed = AmbientSoundAnimator.AnimationSpeed.VERY_SLOW
    )
    
    fun getCafeSoundscape() = LayeredSoundscape(
        id = 3,
        name = "Bustling Cafe",
        category = "Indoor",
        layers = listOf(
            SoundLayer("Coffee Machine", 0.2f, 0.6f, description = "Espresso machine hissing"),
            SoundLayer("Quiet Chatter", 0.4f, 0.7f, description = "Background conversations"),
            SoundLayer("Dishes Clinking", 0.6f, 0.4f, description = "Cups and plates"),
            SoundLayer("Door Chime", 0.8f, 0.2f, description = "Occasional door bell"),
            SoundLayer("Music Playing", 1.0f, 0.3f, description = "Soft background music")
        ),
        description = "Coffee shop atmosphere with machines, chatter, and music",
        recommendedAnimationMode = AmbientSoundAnimator.AnimationMode.QUAD,
        recommendedSpeed = AmbientSoundAnimator.AnimationSpeed.MEDIUM
    )
    
    fun getOceanSoundscape() = LayeredSoundscape(
        id = 4,
        name = "Ocean Waves",
        category = "Water",
        layers = listOf(
            SoundLayer("Deep Wave Bass", 0.1f, 0.8f, description = "Low frequency waves"),
            SoundLayer("Wave Crash", 0.3f, 0.9f, description = "Waves breaking"),
            SoundLayer("Water Foam", 0.5f, 0.7f, description = "Foamy water sounds"),
            SoundLayer("Seagulls", 0.7f, 0.3f, description = "Distant birds"),
            SoundLayer("Coastal Wind", 0.9f, 0.5f, description = "Breeze from ocean")
        ),
        description = "Realistic ocean beach with waves, foam, and seagulls",
        recommendedAnimationMode = AmbientSoundAnimator.AnimationMode.TRIO,
        recommendedSpeed = AmbientSoundAnimator.AnimationSpeed.SLOW
    )
    
    fun getAllPresets() = listOf(
        getRainSoundscape(),
        getForestSoundscape(),
        getCafeSoundscape(),
        getOceanSoundscape()
    )
}
