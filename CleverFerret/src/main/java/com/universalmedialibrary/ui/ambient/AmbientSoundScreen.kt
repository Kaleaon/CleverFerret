package com.universalmedialibrary.ui.ambient

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Ambient Sound Generator Screen
 * Standalone screen for ambient sound playback
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AmbientSoundScreen(
    onBack: () -> Unit,
    onNavigateToThemeManager: () -> Unit = {},
    viewModel: AmbientSoundViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val playingSounds by viewModel.playingSounds.collectAsStateWithLifecycle()
    
    var selectedCategory by remember { mutableStateOf<AmbientCategory?>(null) }
    var showFavoritesOnly by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = PhosphorIcons.Nature,
                            contentDescription = "Ambient Sounds",
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text("Ambient Sounds")
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    // Theme Manager
                    IconButton(onClick = onNavigateToThemeManager) {
                        Icon(
                            imageVector = Icons.Default.Category,
                            contentDescription = "Manage Themes"
                        )
                    }
                    
                    // Favorites filter
                    IconButton(onClick = { 
                        showFavoritesOnly = !showFavoritesOnly
                        if (showFavoritesOnly) {
                            viewModel.loadFavoriteSounds()
                        } else {
                            viewModel.loadSounds()
                        }
                    }) {
                        Icon(
                            imageVector = if (showFavoritesOnly) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                            contentDescription = "Favorites",
                            tint = if (showFavoritesOnly) MaterialTheme.colorScheme.primary else LocalContentColor.current
                        )
                    }
                    
                    // Stop all sounds
                    if (playingSounds.isNotEmpty()) {
                        IconButton(onClick = { viewModel.stopAllSounds() }) {
                            Icon(Icons.Default.Close, contentDescription = "Stop All")
                        }
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Category filter chips
            CategoryFilterRow(
                selectedCategory = selectedCategory,
                onCategorySelected = { category ->
                    selectedCategory = category
                    if (category != null) {
                        viewModel.loadSoundsByCategory(category)
                    } else {
                        if (showFavoritesOnly) {
                            viewModel.loadFavoriteSounds()
                        } else {
                            viewModel.loadSounds()
                        }
                    }
                }
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Content based on state
            when (val state = uiState) {
                is AmbientSoundUiState.Loading -> {
                    Box(
                        modifier = Modifier.fillMaxSize(),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                }
                
                is AmbientSoundUiState.Success -> {
                    if (state.sounds.isEmpty()) {
                        EmptyState()
                    } else {
                        SoundsGrid(
                            sounds = state.sounds,
                            playingSounds = playingSounds,
                            onSoundToggle = { sound -> viewModel.toggleSound(sound) },
                            onFavoriteToggle = { sound -> viewModel.toggleFavorite(sound) },
                            onVolumeChange = { soundId, volume -> viewModel.updateVolume(soundId, volume) }
                        )
                    }
                }
                
                is AmbientSoundUiState.Error -> {
                    ErrorState(message = state.message)
                }
            }
        }
    }
}

@Composable
private fun CategoryFilterRow(
    selectedCategory: AmbientCategory?,
    onCategorySelected: (AmbientCategory?) -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        // All filter chip
        FilterChip(
            selected = selectedCategory == null,
            onClick = { onCategorySelected(null) },
            label = { Text("All") }
        )
        
        // Category filter chips
        AmbientCategory.values().forEach { category ->
            FilterChip(
                selected = selectedCategory == category,
                onClick = { onCategorySelected(category) },
                label = { Text(category.name.lowercase().replaceFirstChar { it.uppercase() }) }
            )
        }
    }
}

@Composable
private fun SoundsGrid(
    sounds: List<AmbientSound>,
    playingSounds: Set<Long>,
    onSoundToggle: (AmbientSound) -> Unit,
    onFavoriteToggle: (AmbientSound) -> Unit,
    onVolumeChange: (Long, Float) -> Unit
) {
    LazyVerticalGrid(
        columns = GridCells.Adaptive(160.dp),
        contentPadding = PaddingValues(16.dp),
        horizontalArrangement = Arrangement.spacedBy(12.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(sounds) { sound ->
            SoundCard(
                sound = sound,
                isPlaying = playingSounds.contains(sound.id),
                onToggle = { onSoundToggle(sound) },
                onFavoriteToggle = { onFavoriteToggle(sound) },
                onVolumeChange = { volume -> onVolumeChange(sound.id, volume) }
            )
        }
    }
}

@Composable
private fun SoundCard(
    sound: AmbientSound,
    isPlaying: Boolean,
    onToggle: () -> Unit,
    onFavoriteToggle: () -> Unit,
    onVolumeChange: (Float) -> Unit
) {
    var showVolumeSlider by remember { mutableStateOf(false) }
    
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .height(180.dp),
        shape = RoundedCornerShape(16.dp),
        colors = CardDefaults.cardColors(
            containerColor = if (isPlaying) 
                MaterialTheme.colorScheme.primaryContainer 
            else 
                MaterialTheme.colorScheme.surface
        )
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.SpaceBetween
        ) {
            // Favorite icon
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.End
            ) {
                IconButton(
                    onClick = onFavoriteToggle,
                    modifier = Modifier.size(32.dp)
                ) {
                    Icon(
                        imageVector = if (sound.isFavorite) Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                        contentDescription = "Favorite",
                        tint = if (sound.isFavorite) Color.Red else LocalContentColor.current,
                        modifier = Modifier.size(20.dp)
                    )
                }
            }
            
            // Play button
            Box(
                modifier = Modifier
                    .size(56.dp)
                    .clip(CircleShape)
                    .background(
                        if (isPlaying) 
                            MaterialTheme.colorScheme.primary 
                        else 
                            MaterialTheme.colorScheme.surfaceVariant
                    ),
                contentAlignment = Alignment.Center
            ) {
                IconButton(onClick = onToggle) {
                    Icon(
                        imageVector = if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                        contentDescription = if (isPlaying) "Pause" else "Play",
                        tint = if (isPlaying) 
                            MaterialTheme.colorScheme.onPrimary 
                        else 
                            MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            // Sound name
            Column(horizontalAlignment = Alignment.CenterHorizontally) {
                Text(
                    text = sound.name,
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Medium,
                    textAlign = TextAlign.Center
                )
                
                Text(
                    text = sound.category.name.lowercase().replaceFirstChar { it.uppercase() },
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant,
                    textAlign = TextAlign.Center
                )
            }
        }
    }
}

@Composable
private fun EmptyState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = PhosphorIcons.Nature,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Text(
                text = "No ambient sounds available",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@Composable
private fun ErrorState(message: String) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Text(
                text = message,
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.error,
                textAlign = TextAlign.Center
            )
        }
    }
}
