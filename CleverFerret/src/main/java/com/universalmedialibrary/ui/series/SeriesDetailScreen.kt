package com.universalmedialibrary.ui.series

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.local.entity.Series
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.repository.LibraryRepository
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

@HiltViewModel
class SeriesDetailViewModel @Inject constructor(
    private val mediaItemDao: MediaItemDao,
    private val metadataDao: MetadataDao
) : ViewModel() {
    private val _series = MutableStateFlow<Series?>(null)
    val series: StateFlow<Series?> = _series.asStateFlow()

    private val _items = MutableStateFlow<List<MediaItem>>(emptyList())
    val items: StateFlow<List<MediaItem>> = _items.asStateFlow()

    fun load(series: Series, items: List<MediaItem>) {
        _series.value = series
        _items.value = items
    }
}

@Composable
fun SeriesDetailScreen(
    series: Series,
    books: List<MediaItem>,
    viewModel: SeriesDetailViewModel = hiltViewModel()
) {
    LaunchedEffect(series.seriesId) {
        viewModel.load(series, books)
    }

    val uiSeries by viewModel.series.collectAsState()
    val uiItems by viewModel.items.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(title = { Text(uiSeries?.name ?: "Series") })
        }
    ) { padding ->
        LazyColumn(modifier = Modifier.fillMaxSize().padding(padding)) {
            item {
                SeriesHeader(series = uiSeries)
            }
            items(uiItems.size) { index ->
                val item = uiItems[index]
                ListItem(headlineContent = { Text(item.fileName) })
                Divider()
            }
        }
    }
}

@Composable
private fun SeriesHeader(series: Series?) {
    if (series == null) return
    Column(modifier = Modifier.fillMaxWidth().padding(16.dp)) {
        Text(series.name, style = MaterialTheme.typography.titleLarge)
        Spacer(Modifier.height(6.dp))
        if (series.publisher != null) Text("Publisher: ${series.publisher}")
        if (series.ageRating != null) Text("Age: ${series.ageRating}")
        if (series.description != null) {
            Spacer(Modifier.height(6.dp))
            Text(series.description)
        }
    }
}
