package com.universalmedialibrary.ui.oldtimeradio

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
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
import com.universalmedialibrary.data.oldtimeradio.OTRCategory
import com.universalmedialibrary.data.oldtimeradio.OTRSeries
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioDao
import com.universalmedialibrary.data.oldtimeradio.OldTimeRadioEpisode
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Old Time Radio screen
 * For classic radio dramas, soap operas, and shows from 1930s-1960s
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OldTimeRadioScreen(
    onNavigateBack: () -> Unit,
    onNavigateToSeries: (String) -> Unit,
    onNavigateToEpisode: (Long) -> Unit,
    viewModel: OldTimeRadioViewModel = hiltViewModel()
) {
    val series by viewModel.series.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    var selectedTab by remember { mutableStateOf(0) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Old Time Radio") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { /* Import */ }) {
                        Icon(Icons.Default.Add, "Import Episodes")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            // Tabs
            PrimaryTabRow(selectedTabIndex = selectedTab) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    text = { Text("Series") },
                    icon = { Icon(Icons.Default.Mic, null) }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    text = { Text("Categories") },
                    icon = { Icon(Icons.Default.Category, null) }
                )
                Tab(
                    selected = selectedTab == 2,
                    onClick = { selectedTab = 2 },
                    text = { Text("Favorites") },
                    icon = { Icon(Icons.Default.Favorite, null) }
                )
            }

            // Content
            if (isLoading) {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            } else if (series.isEmpty()) {
                OTREmptyState(
                    onImport = { /* Import */ }
                )
            } else {
                when (selectedTab) {
                    0 -> SeriesTab(series, onNavigateToSeries)
                    1 -> CategoriesTab(series, onNavigateToSeries)
                    2 -> FavoritesTab()
                }
            }
        }
    }
}

@Composable
private fun OTREmptyState(onImport: () -> Unit) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp),
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Mic,
                contentDescription = "Media image",
                modifier = Modifier.size(80.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Text(
                text = "No Old Time Radio Shows",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = "Import classic radio dramas, soap operas, and shows from the golden age of radio (1930s-1960s)",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                textAlign = androidx.compose.ui.text.style.TextAlign.Center
            )
            
            Button(onClick = onImport) {
                Icon(Icons.Default.Add, null)
                Spacer(Modifier.width(8.dp))
                Text("Import Episodes")
            }
            
            HorizontalDivider(modifier = Modifier.padding(vertical = 16.dp))
            
            Column(
                verticalArrangement = Arrangement.spacedBy(8.dp),
                modifier = Modifier.fillMaxWidth(0.8f)
            ) {
                Text(
                    text = "Popular Series:",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                Text("• The Shadow", style = MaterialTheme.typography.bodySmall)
                Text("• Suspense", style = MaterialTheme.typography.bodySmall)
                Text("• Gunsmoke", style = MaterialTheme.typography.bodySmall)
                Text("• The Guiding Light", style = MaterialTheme.typography.bodySmall)
                Text("• Jack Benny Program", style = MaterialTheme.typography.bodySmall)
            }
        }
    }
}

@Composable
private fun SeriesTab(
    series: List<OTRSeries>,
    onNavigateToSeries: (String) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        items(series) { seriesItem ->
            OTRSeriesCard(
                series = seriesItem,
                onClick = { onNavigateToSeries(seriesItem.seriesTitle) }
            )
        }
    }
}

@Composable
private fun CategoriesTab(
    series: List<OTRSeries>,
    onNavigateToSeries: (String) -> Unit
) {
    val groupedSeries = series.groupBy { it.category }
    
    LazyColumn(
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        groupedSeries.forEach { (category, seriesList) ->
            item {
                Text(
                    text = category.displayName,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(vertical = 8.dp)
                )
            }
            
            items(seriesList) { seriesItem ->
                OTRSeriesCard(
                    series = seriesItem,
                    onClick = { onNavigateToSeries(seriesItem.seriesTitle) }
                )
            }
        }
    }
}

@Composable
private fun FavoritesTab() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Icon(
                Icons.Default.Favorite,
                contentDescription = "Media image",
                modifier = Modifier.size(48.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Text("No favorite episodes yet")
        }
    }
}

@Composable
private fun OTRSeriesCard(
    series: OTRSeries,
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
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Surface(
                color = MaterialTheme.colorScheme.secondaryContainer,
                shape = RoundedCornerShape(8.dp),
                modifier = Modifier.size(56.dp)
            ) {
                Icon(
                    Icons.Default.Mic,
                    contentDescription = "Media image",
                    modifier = Modifier.padding(12.dp),
                    tint = MaterialTheme.colorScheme.onSecondaryContainer
                )
            }

            Column(
                modifier = Modifier.weight(1f),
                verticalArrangement = Arrangement.spacedBy(4.dp)
            ) {
                Text(
                    text = series.seriesTitle,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "${series.category.displayName} • ${series.displayYears}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Text(
                    text = "${series.episodeCount} episodes • ${series.network ?: "Unknown Network"}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Icon(
                Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

@HiltViewModel
class OldTimeRadioViewModel @Inject constructor(
    private val oldTimeRadioDao: OldTimeRadioDao,
    private val importService: com.universalmedialibrary.services.oldtimeradio.OldTimeRadioImportService
) : ViewModel() {

    private val _series = MutableStateFlow<List<OTRSeries>>(emptyList())
    val series: StateFlow<List<OTRSeries>> = _series.asStateFlow()

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    init {
        viewModelScope.launch {
            val count = oldTimeRadioDao.getEpisodeCount()
            if (count == 0) {
                runCatching { importService.importFeaturedEpisodes() }
            }
            loadSeries()
        }
    }

    private fun loadSeries() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val seriesInfoList = oldTimeRadioDao.getAllSeries()
                
                // Convert SeriesInfo to OTRSeries with episodes
                val seriesList = seriesInfoList.map { info ->
                    val episodes = oldTimeRadioDao.getEpisodesBySeries(info.series_title)
                    OTRSeries(
                        seriesTitle = info.series_title,
                        episodeCount = info.episodeCount,
                        category = info.category,
                        genre = info.genre,
                        network = info.network,
                        firstAirDate = info.firstAirDate,
                        lastAirDate = info.lastAirDate,
                        episodes = emptyList() // Episodes loaded on-demand via Flow
                    )
                }
                
                _series.value = seriesList
            } catch (e: Exception) {
                // Handle error - could emit error state
                _series.value = emptyList()
            } finally {
                _isLoading.value = false
            }
        }
    }
}
