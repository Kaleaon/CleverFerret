package com.universalmedialibrary.ui.home

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.repository.ReadingProgressRepository
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn

@HiltViewModel
class ContinueReadingViewModel @Inject constructor(
    private val repository: ReadingProgressRepository
) : ViewModel() {
    val recent: StateFlow<List<ReadingProgress>> = repository.getRecentlyRead(10)
        .stateIn(
            scope = viewModelScope,
            started = SharingStarted.WhileSubscribed(5000),
            initialValue = emptyList()
        )
}

@Composable
fun ContinueReadingSection(
    onOpenItem: (Long) -> Unit,
    viewModel: ContinueReadingViewModel = hiltViewModel()
) {
    val items by viewModel.recent.collectAsState()
    if (items.isEmpty()) return

    Column(modifier = Modifier.fillMaxWidth()) {
        Text(
            text = "Continue Reading",
            style = MaterialTheme.typography.titleMedium,
            modifier = Modifier.padding(horizontal = 16.dp)
        )
        Spacer(Modifier.height(8.dp))
        LazyRow(contentPadding = PaddingValues(horizontal = 16.dp), horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            items(items) { progress ->
                ContinueCard(progress = progress, onOpenItem = onOpenItem)
            }
        }
        Spacer(Modifier.height(8.dp))
        HorizontalDivider()
    }
}

@Composable
private fun ContinueCard(progress: ReadingProgress, onOpenItem: (Long) -> Unit) {
    Card(
        modifier = Modifier
            .width(200.dp)
            .clickable { onOpenItem(progress.itemId) }
    ) {
        Column(modifier = Modifier.padding(12.dp)) {
            Text("Item #${progress.itemId}", style = MaterialTheme.typography.titleSmall)
            Spacer(Modifier.height(6.dp))
            LinearProgressIndicator(progress = { (progress.percentage / 100f).coerceIn(0f, 1f) })
            Spacer(Modifier.height(4.dp))
            Text("${progress.percentage.toInt()}%", style = MaterialTheme.typography.labelSmall)
        }
    }
}
