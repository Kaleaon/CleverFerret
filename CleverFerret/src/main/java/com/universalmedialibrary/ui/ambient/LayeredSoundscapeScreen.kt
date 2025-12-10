package com.universalmedialibrary.ui.ambient

import androidx.compose.animation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.ambient.AmbientSoundAnimator
import com.universalmedialibrary.services.ambient.LayeredSoundscape
import com.universalmedialibrary.services.ambient.LayeredSoundscapePresets
import com.universalmedialibrary.services.ambient.SoundLayer
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Layered Soundscape Screen
 * Inspired by myNoise.net - provides multi-layered sound control with animation
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun LayeredSoundscapeScreen(
    onBack: () -> Unit
) {
    val animator = remember { AmbientSoundAnimator() }
    var selectedSoundscape by remember { mutableStateOf(LayeredSoundscapePresets.getRainSoundscape()) }
    var layerVolumes by remember { mutableStateOf(selectedSoundscape.layers.map { it.baseVolume }) }
    var isPlaying by remember { mutableStateOf(false) }
    var animationMode by remember { mutableStateOf(selectedSoundscape.recommendedAnimationMode) }
    var animationSpeed by remember { mutableStateOf(selectedSoundscape.recommendedSpeed) }
    val isAnimating by animator.isAnimating.collectAsState()
    
    DisposableEffect(Unit) {
        onDispose {
            animator.cleanup()
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = PhosphorIcons.Nature,
                            contentDescription = null,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text("Layered Soundscapes")
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Soundscape selector
            SoundscapeSelector(
                selectedSoundscape = selectedSoundscape,
                onSoundscapeSelected = { soundscape ->
                    selectedSoundscape = soundscape
                    layerVolumes = soundscape.layers.map { it.baseVolume }
                    animationMode = soundscape.recommendedAnimationMode
                    animationSpeed = soundscape.recommendedSpeed
                    if (isAnimating) {
                        animator.stopAnimation()
                        startAnimation(animator, soundscape, animationMode, animationSpeed) { index, volume ->
                            layerVolumes = layerVolumes.toMutableList().apply { this[index] = volume }
                        }
                    }
                }
            )
            
            // Description card
            Card {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                ) {
                    Text(
                        text = selectedSoundscape.name,
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = selectedSoundscape.description,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            // Control buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Play/Stop button
                Button(
                    onClick = {
                        isPlaying = !isPlaying
                        // In production, this would actually play/stop audio
                    },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(
                        imageVector = if (isPlaying) Icons.Default.Stop else Icons.Default.PlayArrow,
                        contentDescription = if (isPlaying) "Stop" else "Play"
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(if (isPlaying) "Stop" else "Play")
                }
                
                // Animate button
                Button(
                    onClick = {
                        if (isAnimating) {
                            animator.stopAnimation()
                        } else {
                            startAnimation(animator, selectedSoundscape, animationMode, animationSpeed) { index, volume ->
                                layerVolumes = layerVolumes.toMutableList().apply { this[index] = volume }
                            }
                        }
                    },
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = if (isAnimating) 
                            MaterialTheme.colorScheme.secondary 
                        else 
                            MaterialTheme.colorScheme.tertiary
                    )
                ) {
                    Icon(
                        imageVector = if (isAnimating) Icons.Default.PauseCircle else Icons.Default.Animation,
                        contentDescription = if (isAnimating) "Stop Animation" else "Animate"
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(if (isAnimating) "Stop Anim" else "Animate")
                }
            }
            
            // Animation settings (when animating)
            AnimatedVisibility(visible = isAnimating) {
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        Text(
                            text = "Animation Settings",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        // Animation mode selector
                        Text("Complexity", style = MaterialTheme.typography.labelMedium)
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            AmbientSoundAnimator.AnimationMode.values().forEach { mode ->
                                FilterChip(
                                    selected = animationMode == mode,
                                    onClick = { 
                                        animationMode = mode
                                        animator.stopAnimation()
                                        startAnimation(animator, selectedSoundscape, mode, animationSpeed) { index, volume ->
                                            layerVolumes = layerVolumes.toMutableList().apply { this[index] = volume }
                                        }
                                    },
                                    label = { Text(mode.name, style = MaterialTheme.typography.labelSmall) },
                                    modifier = Modifier.weight(1f)
                                )
                            }
                        }
                        
                        // Animation speed selector
                        Text("Speed", style = MaterialTheme.typography.labelMedium)
                        Row(
                            modifier = Modifier.fillMaxWidth(),
                            horizontalArrangement = Arrangement.spacedBy(4.dp)
                        ) {
                            listOf(
                                AmbientSoundAnimator.AnimationSpeed.VERY_SLOW to "Slow",
                                AmbientSoundAnimator.AnimationSpeed.MEDIUM to "Med",
                                AmbientSoundAnimator.AnimationSpeed.FAST to "Fast"
                            ).forEach { (speed, label) ->
                                FilterChip(
                                    selected = animationSpeed == speed,
                                    onClick = { 
                                        animationSpeed = speed
                                        animator.stopAnimation()
                                        startAnimation(animator, selectedSoundscape, animationMode, speed) { index, volume ->
                                            layerVolumes = layerVolumes.toMutableList().apply { this[index] = volume }
                                        }
                                    },
                                    label = { Text(label, style = MaterialTheme.typography.labelSmall) },
                                    modifier = Modifier.weight(1f)
                                )
                            }
                        }
                    }
                }
            }
            
            // Layer sliders
            Text(
                text = "Sound Layers",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            selectedSoundscape.layers.forEachIndexed { index, layer ->
                LayerSlider(
                    layer = layer,
                    volume = layerVolumes.getOrElse(index) { layer.baseVolume },
                    onVolumeChange = { newVolume ->
                        layerVolumes = layerVolumes.toMutableList().apply { this[index] = newVolume }
                    },
                    isAnimating = isAnimating
                )
            }
            
            // Info card
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.surfaceVariant
                )
            ) {
                Column(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp)
                ) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.Info,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = "How it works",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Bold
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Adjust individual sliders to customize your soundscape. " +
                                "Enable animation for dynamic, non-repetitive sound that evolves over time, " +
                                "just like real nature. Inspired by myNoise.net.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun SoundscapeSelector(
    selectedSoundscape: LayeredSoundscape,
    onSoundscapeSelected: (LayeredSoundscape) -> Unit
) {
    Column {
        Text(
            text = "Select Soundscape",
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold
        )
        Spacer(modifier = Modifier.height(8.dp))
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            LayeredSoundscapePresets.getAllPresets().forEach { soundscape ->
                FilterChip(
                    selected = selectedSoundscape.id == soundscape.id,
                    onClick = { onSoundscapeSelected(soundscape) },
                    label = { Text(soundscape.name) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

@Composable
private fun LayerSlider(
    layer: SoundLayer,
    volume: Float,
    onVolumeChange: (Float) -> Unit,
    isAnimating: Boolean
) {
    Card {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = layer.name,
                        style = MaterialTheme.typography.bodyMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = layer.description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                if (isAnimating) {
                    Icon(
                        imageVector = Icons.Default.Animation,
                        contentDescription = "Animating",
                        tint = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = "${(volume * 100).toInt()}%",
                    style = MaterialTheme.typography.labelMedium,
                    modifier = Modifier.width(40.dp)
                )
                
                Slider(
                    value = volume,
                    onValueChange = onVolumeChange,
                    modifier = Modifier.weight(1f),
                    enabled = !isAnimating // Disable manual control when animating
                )
                
                IconButton(
                    onClick = { onVolumeChange(if (volume > 0f) 0f else layer.baseVolume) },
                    modifier = Modifier.size(36.dp)
                ) {
                    Icon(
                        imageVector = if (volume > 0f) Icons.AutoMirrored.Filled.VolumeUp else Icons.Default.VolumeOff,
                        contentDescription = if (volume > 0f) "Mute" else "Unmute",
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
        }
    }
}

private fun startAnimation(
    animator: AmbientSoundAnimator,
    soundscape: LayeredSoundscape,
    mode: AmbientSoundAnimator.AnimationMode,
    speed: AmbientSoundAnimator.AnimationSpeed,
    onVolumeChange: (Int, Float) -> Unit
) {
    animator.startAnimation(
        layerCount = soundscape.layers.size,
        mode = mode,
        speed = speed,
        onVolumeChange = onVolumeChange
    )
}
