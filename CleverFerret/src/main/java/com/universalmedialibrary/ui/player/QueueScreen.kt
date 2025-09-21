package com.universalmedialibrary.ui.player

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.itemsIndexed
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

/**
 * A screen that displays the current playback queue.
 *
 * @param viewModel The view model for this screen.
 */
@Composable
fun QueueScreen(
    viewModel: QueueViewModel = hiltViewModel()
) {
    val state by viewModel.state.collectAsState()
    Scaffold(topBar = { TopAppBar(title = { Text("Up Next") }) }) { padding ->
        LazyColumn(modifier = Modifier.fillMaxSize().padding(padding), contentPadding = PaddingValues(16.dp), verticalArrangement = Arrangement.spacedBy(8.dp)) {
            itemsIndexed(state.queue) { index, title ->
                ListItem(
                    headlineContent = { Text(title) },
                    trailingContent = {
                        Row {
                            IconButton(onClick = { viewModel.moveUp(index) }, enabled = index > 0) { Icon(Icons.Default.KeyboardArrowUp, contentDescription = null) }
                            IconButton(onClick = { viewModel.moveDown(index) }, enabled = index < state.queue.lastIndex) { Icon(Icons.Default.KeyboardArrowDown, contentDescription = null) }
                            IconButton(onClick = { viewModel.remove(index) }) { Icon(Icons.Default.Delete, contentDescription = null) }
                        }
                    }
                )
                Divider()
            }
        }
    }
}

/**
 * The view model for the queue screen.
 *
 * @param playback The audio playback manager.
 */
@HiltViewModel
class QueueViewModel @Inject constructor(
    private val playback: AudioPlaybackManager
) : androidx.lifecycle.ViewModel() {
    val state = playback.state
    /** Moves an item up in the queue. */
    fun moveUp(index: Int) { if (index > 0) playback.moveQueueItem(index, index - 1) }
    /** Moves an item down in the queue. */
    fun moveDown(index: Int) { if (index < state.value.queue.lastIndex) playback.moveQueueItem(index, index + 1) }
    /** Removes an item from the queue. */
    fun remove(index: Int) { playback.removeFromQueue(index) }
}