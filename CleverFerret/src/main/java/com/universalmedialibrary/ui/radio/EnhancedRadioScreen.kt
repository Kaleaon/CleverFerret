package com.universalmedialibrary.ui.radio

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.radio.FMRadioService
import com.universalmedialibrary.services.radio.NowPlayingInfo
import com.universalmedialibrary.services.radio.RadioIdentificationService
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Enhanced radio screen with:
 * - Song identification
 * - Now playing display
 * - FM radio support
 * - Old Time Radio section
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedRadioScreen(
    onNavigateBack: () -> Unit,
    onNavigateToOTR: () -> Unit,
    viewModel: EnhancedRadioViewModel = hiltViewModel()
) {
    val nowPlaying by viewModel.nowPlaying.collectAsState()
    val isIdentifying by viewModel.isIdentifying.collectAsState()
    val fmAvailable by viewModel.fmRadioAvailable.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    if (isIdentifying) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(24.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        IconButton(onClick = { viewModel.identifySong() }) {
                            Icon(Icons.Default.Search, "Identify Song")
                        }
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Now Playing Card
            item {
                AnimatedVisibility(
                    visible = nowPlaying != null,
                    enter = slideInVertically() + fadeIn(),
                    exit = slideOutVertically() + fadeOut()
                ) {
                    NowPlayingCard(
                        info = nowPlaying,
                        onIdentify = { viewModel.identifySong() }
                    )
                }
            }

            // Radio Categories
            item {
                RadioCategoryCard(
                    title = "Internet Radio",
                    subtitle = "Stream online radio stations",
                    icon = Icons.Default.Radio,
                    onClick = { /* Navigate to internet radio */ }
                )
            }

            if (fmAvailable) {
                item {
                    RadioCategoryCard(
                        title = "FM Radio",
                        subtitle = "Tune to local FM stations",
                        icon = Icons.Default.SignalCellularAlt,
                        onClick = { /* Navigate to FM radio */ }
                    )
                }
            }

            item {
                RadioCategoryCard(
                    title = "Old Time Radio",
                    subtitle = "Classic dramas from the 1930s-1960s",
                    icon = Icons.Default.Mic,
                    onClick = onNavigateToOTR
                )
            }
        }
    }
}

@Composable
private fun NowPlayingCard(
    info: NowPlayingInfo?,
    onIdentify: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Now Playing",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
                
                IconButton(onClick = onIdentify) {
                    Icon(
                        Icons.Default.Search,
                        "Identify Song",
                        tint = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }

            if (info != null) {
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    Icon(
                        Icons.Default.MusicNote,
                        contentDescription = null,
                        modifier = Modifier.size(48.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    
                    Column(
                        modifier = Modifier.weight(1f),
                        verticalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Text(
                            text = info.title,
                            style = MaterialTheme.typography.bodyLarge,
                            fontWeight = FontWeight.SemiBold,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                        Text(
                            text = info.artist,
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                        )
                        Text(
                            text = "Source: ${info.source} • ${(info.confidence * 100).toInt()}%",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.5f)
                        )
                    }
                }
            } else {
                Text(
                    text = "No song information available",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                )
            }
        }
    }
}

@Composable
private fun RadioCategoryCard(
    title: String,
    subtitle: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Surface(
                color = MaterialTheme.colorScheme.primaryContainer,
                shape = RoundedCornerShape(12.dp),
                modifier = Modifier.size(64.dp)
            ) {
                Icon(
                    icon,
                    contentDescription = null,
                    modifier = Modifier.padding(16.dp),
                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }

            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = subtitle,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Icon(
                Icons.Default.ChevronRight,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@HiltViewModel
class EnhancedRadioViewModel @Inject constructor(
    private val radioIdentificationService: RadioIdentificationService,
    private val fmRadioService: FMRadioService
) : ViewModel() {

    val nowPlaying = radioIdentificationService.nowPlaying
    val isIdentifying = radioIdentificationService.isIdentifying
    val fmRadioAvailable = fmRadioService.isAvailable

    init {
        viewModelScope.launch {
            radioIdentificationService.initialize()
        }
    }

    fun identifySong() {
        viewModelScope.launch {
            // This would capture audio and identify it
            // Requires ACRCloud or similar SDK
            
            // For now, just simulate
            radioIdentificationService.updateNowPlaying(
                NowPlayingInfo(
                    artist = "Identifying...",
                    title = "Please wait",
                    source = "Processing",
                    confidence = 0.0f,
                    timestamp = System.currentTimeMillis()
                )
            )
        }
    }
}
