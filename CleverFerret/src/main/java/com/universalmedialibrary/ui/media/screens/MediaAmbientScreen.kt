package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Ambient Sounds Screen
 * 
 * Create immersive reading/relaxation environments with:
 * - Nature sounds (rain, ocean, forest, etc.)
 * - White/brown/pink noise
 * - Music atmospheres
 * - Custom sound mixes
 * - Presets for different activities
 * 
 * Features:
 * - Multiple simultaneous sounds
 * - Individual volume control
 * - Sleep timer
 * - Save custom presets
 * - Freesound integration
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaAmbientScreen(
    state: AmbientScreenState,
    onSoundToggle: (AmbientSound) -> Unit,
    onVolumeChange: (AmbientSound, Float) -> Unit,
    onPresetSelect: (AmbientPreset) -> Unit,
    onSavePreset: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showSaveDialog by remember { mutableStateOf(false) }
    var showTimerDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            AmbientTopBar(
                isPlaying = state.activeSounds.isNotEmpty(),
                onBackClick = onBackClick,
                onTimerClick = { showTimerDialog = true },
                onSaveClick = { showSaveDialog = true }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(bottom = if (state.activeSounds.isNotEmpty()) 180.dp else MediaSpacing.XL)
        ) {
            // Active sounds section (if any)
            if (state.activeSounds.isNotEmpty()) {
                item {
                    ActiveSoundsSection(
                        activeSounds = state.activeSounds,
                        onVolumeChange = onVolumeChange,
                        onRemove = onSoundToggle
                    )
                }
            }
            
            // Presets section
            item {
                SectionTitle(
                    title = "Presets",
                    icon = Icons.Default.AutoAwesome
                )
            }
            item {
                PresetsRow(
                    presets = state.presets,
                    activePreset = state.activePreset,
                    onPresetSelect = onPresetSelect
                )
            }
            
            // Sound categories
            state.categories.forEach { category ->
                item {
                    Spacer(modifier = Modifier.height(MediaSpacing.LG))
                    SectionTitle(
                        title = category.name,
                        icon = category.icon
                    )
                }
                item {
                    SoundsGrid(
                        sounds = category.sounds,
                        activeSounds = state.activeSounds,
                        onSoundToggle = onSoundToggle
                    )
                }
            }
        }
        
        // Now playing bar
        if (state.activeSounds.isNotEmpty()) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues),
                contentAlignment = Alignment.BottomCenter
            ) {
                AmbientNowPlayingBar(
                    activeSounds = state.activeSounds,
                    masterVolume = state.masterVolume,
                    onMasterVolumeChange = { /* Update master volume */ },
                    onStopAll = { state.activeSounds.forEach { onSoundToggle(it) } }
                )
            }
        }
    }
    
    // Save preset dialog
    if (showSaveDialog) {
        SavePresetDialog(
            onDismiss = { showSaveDialog = false },
            onSave = { name ->
                onSavePreset(name)
                showSaveDialog = false
            }
        )
    }
    
    // Timer dialog
    if (showTimerDialog) {
        TimerDialog(
            currentTimer = state.sleepTimer,
            onDismiss = { showTimerDialog = false },
            onSetTimer = { /* Set timer */ }
        )
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun AmbientTopBar(
    isPlaying: Boolean,
    onBackClick: () -> Unit,
    onTimerClick: () -> Unit,
    onSaveClick: () -> Unit
) {
    TopAppBar(
        title = {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Icon(
                    imageVector = Icons.Default.Spa,
                    contentDescription = "Media image",
                    tint = MediaColors.Success,
                    modifier = Modifier.size(24.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(
                    text = "Ambient Sounds",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            }
        },
        navigationIcon = {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            if (isPlaying) {
                IconButton(onClick = onTimerClick) {
                    Icon(
                        imageVector = Icons.Outlined.Timer,
                        contentDescription = "Sleep Timer",
                        tint = MediaColors.TextSecondary
                    )
                }
                IconButton(onClick = onSaveClick) {
                    Icon(
                        imageVector = Icons.Default.Save,
                        contentDescription = "Save Preset",
                        tint = MediaColors.TextSecondary
                    )
                }
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}

// =============================================================================
// ACTIVE SOUNDS
// =============================================================================

@Composable
private fun ActiveSoundsSection(
    activeSounds: List<AmbientSound>,
    onVolumeChange: (AmbientSound, Float) -> Unit,
    onRemove: (AmbientSound) -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .padding(MediaSpacing.MD),
        shape = RoundedCornerShape(MediaCorners.LG),
        color = MediaColors.BackgroundElevated
    ) {
        Column(modifier = Modifier.padding(MediaSpacing.MD)) {
            Text(
                text = "Now Playing",
                style = MediaTypography.TitleSmall,
                color = MediaColors.TextSecondary
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            activeSounds.forEach { sound ->
                ActiveSoundItem(
                    sound = sound,
                    onVolumeChange = { onVolumeChange(sound, it) },
                    onRemove = { onRemove(sound) }
                )
                if (sound != activeSounds.last()) {
                    Spacer(modifier = Modifier.height(MediaSpacing.MD))
                }
            }
        }
    }
}

@Composable
private fun ActiveSoundItem(
    sound: AmbientSound,
    onVolumeChange: (Float) -> Unit,
    onRemove: () -> Unit
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Sound icon
        Surface(
            shape = CircleShape,
            color = sound.color.copy(alpha = 0.2f),
            modifier = Modifier.size(40.dp)
        ) {
            Icon(
                imageVector = sound.icon,
                contentDescription = "Media image",
                tint = sound.color,
                modifier = Modifier.padding(MediaSpacing.SM)
            )
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        // Name and volume
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = sound.name,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary
            )
            
            Slider(
                value = sound.volume,
                onValueChange = onVolumeChange,
                modifier = Modifier.fillMaxWidth(),
                colors = SliderDefaults.colors(
                    thumbColor = sound.color,
                    activeTrackColor = sound.color,
                    inactiveTrackColor = MediaColors.ProgressBackground
                )
            )
        }
        
        // Remove button
        IconButton(onClick = onRemove) {
            Icon(
                imageVector = Icons.Default.Close,
                contentDescription = "Remove",
                tint = MediaColors.TextTertiary
            )
        }
    }
}

// =============================================================================
// PRESETS
// =============================================================================

@Composable
private fun PresetsRow(
    presets: List<AmbientPreset>,
    activePreset: AmbientPreset?,
    onPresetSelect: (AmbientPreset) -> Unit
) {
    LazyRow(
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
    ) {
        items(presets) { preset ->
            PresetCard(
                preset = preset,
                isActive = preset.id == activePreset?.id,
                onClick = { onPresetSelect(preset) }
            )
        }
    }
}

@Composable
private fun PresetCard(
    preset: AmbientPreset,
    isActive: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .width(120.dp)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick)
            .border(
                width = if (isActive) 2.dp else 0.dp,
                color = if (isActive) MediaColors.AccentPrimary else Color.Transparent,
                shape = RoundedCornerShape(MediaCorners.MD)
            ),
        color = if (isActive)
            MediaColors.AccentPrimary.copy(alpha = 0.1f)
        else
            MediaColors.BackgroundElevated
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(MediaSpacing.MD)
        ) {
            Surface(
                shape = CircleShape,
                color = preset.color.copy(alpha = 0.2f),
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    imageVector = preset.icon,
                    contentDescription = "Media image",
                    tint = preset.color,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.SM))
            
            Text(
                text = preset.name,
                style = MediaTypography.LabelMedium,
                color = if (isActive) MediaColors.AccentPrimary else MediaColors.TextPrimary,
                textAlign = TextAlign.Center,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// SOUNDS GRID
// =============================================================================

@Composable
private fun SectionTitle(
    title: String,
    icon: ImageVector
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = "Media image",
            tint = MediaColors.AccentPrimary,
            modifier = Modifier.size(20.dp)
        )
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        Text(
            text = title,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextPrimary,
            fontWeight = FontWeight.SemiBold
        )
    }
}

@Composable
private fun SoundsGrid(
    sounds: List<AmbientSound>,
    activeSounds: List<AmbientSound>,
    onSoundToggle: (AmbientSound) -> Unit
) {
    LazyRow(
        contentPadding = PaddingValues(horizontal = MediaSpacing.MD),
        horizontalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
    ) {
        items(sounds) { sound ->
            val isActive = activeSounds.any { it.id == sound.id }
            SoundCard(
                sound = sound,
                isActive = isActive,
                onClick = { onSoundToggle(sound) }
            )
        }
    }
}

@Composable
private fun SoundCard(
    sound: AmbientSound,
    isActive: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .size(100.dp)
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick)
            .border(
                width = if (isActive) 2.dp else 0.dp,
                color = if (isActive) sound.color else Color.Transparent,
                shape = RoundedCornerShape(MediaCorners.MD)
            ),
        color = if (isActive)
            sound.color.copy(alpha = 0.2f)
        else
            MediaColors.BackgroundElevated
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center,
            modifier = Modifier.fillMaxSize()
        ) {
            Icon(
                imageVector = sound.icon,
                contentDescription = "Media image",
                tint = if (isActive) sound.color else MediaColors.TextSecondary,
                modifier = Modifier.size(32.dp)
            )
            
            Spacer(modifier = Modifier.height(MediaSpacing.XS))
            
            Text(
                text = sound.name,
                style = MediaTypography.LabelSmall,
                color = if (isActive) sound.color else MediaColors.TextSecondary,
                textAlign = TextAlign.Center,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

// =============================================================================
// NOW PLAYING BAR
// =============================================================================

@Composable
private fun AmbientNowPlayingBar(
    activeSounds: List<AmbientSound>,
    masterVolume: Float,
    onMasterVolumeChange: (Float) -> Unit,
    onStopAll: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.LG
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(MediaSpacing.MD)
        ) {
            // Active sounds icons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.Center
            ) {
                activeSounds.take(5).forEach { sound ->
                    Surface(
                        shape = CircleShape,
                        color = sound.color.copy(alpha = 0.3f),
                        modifier = Modifier
                            .size(36.dp)
                            .padding(horizontal = 2.dp)
                    ) {
                        Icon(
                            imageVector = sound.icon,
                            contentDescription = "Media image",
                            tint = sound.color,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
                if (activeSounds.size > 5) {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.BackgroundSurface,
                        modifier = Modifier.size(36.dp)
                    ) {
                        Box(contentAlignment = Alignment.Center) {
                            Text(
                                text = "+${activeSounds.size - 5}",
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextSecondary
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            // Master volume
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    imageVector = Icons.Default.VolumeDown,
                    contentDescription = "Media image",
                    tint = MediaColors.TextSecondary,
                    modifier = Modifier.size(20.dp)
                )
                
                Slider(
                    value = masterVolume,
                    onValueChange = onMasterVolumeChange,
                    modifier = Modifier.weight(1f),
                    colors = SliderDefaults.colors(
                        thumbColor = MediaColors.AccentPrimary,
                        activeTrackColor = MediaColors.AccentPrimary
                    )
                )
                
                Icon(
                    imageVector = Icons.Default.VolumeUp,
                    contentDescription = "Media image",
                    tint = MediaColors.TextSecondary,
                    modifier = Modifier.size(20.dp)
                )
                
                Spacer(modifier = Modifier.width(MediaSpacing.MD))
                
                // Stop button
                Button(
                    onClick = onStopAll,
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MediaColors.Error
                    ),
                    contentPadding = PaddingValues(horizontal = MediaSpacing.MD)
                ) {
                    Icon(
                        imageVector = Icons.Default.Stop,
                        contentDescription = "Media image",
                        modifier = Modifier.size(18.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.XS))
                    Text("Stop")
                }
            }
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================

@Composable
private fun SavePresetDialog(
    onDismiss: () -> Unit,
    onSave: (String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Save Preset", color = MediaColors.TextPrimary) },
        text = {
            OutlinedTextField(
                value = name,
                onValueChange = { name = it },
                label = { Text("Preset Name") },
                singleLine = true,
                modifier = Modifier.fillMaxWidth(),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = MediaColors.AccentPrimary
                )
            )
        },
        confirmButton = {
            Button(
                onClick = { onSave(name) },
                enabled = name.isNotBlank()
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}

@Composable
private fun TimerDialog(
    currentTimer: Long?,
    onDismiss: () -> Unit,
    onSetTimer: (Int) -> Unit
) {
    val options = listOf(
        15 to "15 minutes",
        30 to "30 minutes",
        45 to "45 minutes",
        60 to "1 hour",
        90 to "1.5 hours",
        120 to "2 hours"
    )
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Sleep Timer", color = MediaColors.TextPrimary) },
        text = {
            Column {
                if (currentTimer != null && currentTimer > 0) {
                    Surface(
                        color = MediaColors.AccentPrimary.copy(alpha = 0.1f),
                        shape = RoundedCornerShape(MediaCorners.SM),
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(bottom = MediaSpacing.MD)
                    ) {
                        Row(
                            modifier = Modifier.padding(MediaSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Timer,
                                contentDescription = "Media image",
                                tint = MediaColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(MediaSpacing.SM))
                            Text(
                                text = "Timer: ${currentTimer / 60000} min",
                                color = MediaColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.weight(1f))
                            TextButton(onClick = { onSetTimer(0) }) {
                                Text("Cancel", color = MediaColors.Error)
                            }
                        }
                    }
                }
                
                options.forEach { (minutes, label) ->
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .clickable { onSetTimer(minutes) }
                            .padding(MediaSpacing.MD)
                    ) {
                        Text(text = label, color = MediaColors.TextPrimary)
                    }
                }
            }
        },
        confirmButton = {},
        containerColor = MediaColors.BackgroundElevated
    )
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class AmbientScreenState(
    val categories: List<AmbientCategory> = emptyList(),
    val presets: List<AmbientPreset> = emptyList(),
    val activeSounds: List<AmbientSound> = emptyList(),
    val activePreset: AmbientPreset? = null,
    val masterVolume: Float = 0.8f,
    val sleepTimer: Long? = null,
    val isLoading: Boolean = false
)

data class AmbientCategory(
    val id: String,
    val name: String,
    val icon: ImageVector,
    val sounds: List<AmbientSound>
)

data class AmbientSound(
    val id: String,
    val name: String,
    val icon: ImageVector,
    val color: Color,
    val audioUrl: String,
    val volume: Float = 0.7f,
    val isLooping: Boolean = true
)

data class AmbientPreset(
    val id: String,
    val name: String,
    val icon: ImageVector,
    val color: Color,
    val sounds: List<AmbientSound>,
    val isBuiltIn: Boolean = false
)
