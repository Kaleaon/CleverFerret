package com.universalmedialibrary.ui.oldtimeradio

import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.player.ModernAudioPlayerScreen

@Composable
fun OldTimeRadioPlayerLauncher(
    episodeId: Long,
    onNavigateBack: () -> Unit,
    viewModel: OldTimeRadioPlayerViewModel = hiltViewModel()
) {
    LaunchedEffect(episodeId) {
        viewModel.playEpisode(episodeId)
    }
    
    // We reuse the modern audio player screen as the UI
    ModernAudioPlayerScreen(
        onNavigateBack = onNavigateBack
    )
}
