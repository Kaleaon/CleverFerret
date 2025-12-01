package com.universalmedialibrary.ui.opds

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import coil.compose.AsyncImage
import com.universalmedialibrary.data.local.dao.OPDSCatalogDao
import com.universalmedialibrary.data.local.entity.OPDSCatalog
import com.universalmedialibrary.services.opds.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.*
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * OPDS Catalog Browser Screen
 * 
 * Browse and download books from OPDS catalogs
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OPDSCatalogBrowserScreen(
    onBack: () -> Unit,
    viewModel: OPDSCatalogBrowserViewModel = hiltViewModel()
) {
    val catalogs by viewModel.catalogs.collectAsState()
    val selectedCatalog by viewModel.selectedCatalog.collectAsState()
    val feedResult by viewModel.currentFeed.collectAsState()
    val downloads by viewModel.activeDownloads.collectAsState()
    val searchQuery by viewModel.searchQuery.collectAsState()
    
    var showAddCatalogDialog by remember { mutableStateOf(false) }
    var showSearchDialog by remember { mutableStateOf(false) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        text = selectedCatalog?.name ?: "OPDS Catalogs",
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                },
                navigationIcon = {
                    IconButton(onClick = {
                        if (selectedCatalog != null) {
                            viewModel.clearSelection()
                        } else {
                            onBack()
                        }
                    }) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    if (selectedCatalog != null) {
                        // Search icon
                        if (selectedCatalog?.searchUrl != null) {
                            IconButton(onClick = { showSearchDialog = true }) {
                                Icon(Icons.Default.Search, "Search")
                            }
                        }
                        
                        // Refresh icon
                        IconButton(onClick = { viewModel.refreshFeed() }) {
                            Icon(Icons.Default.Refresh, "Refresh")
                        }
                    } else {
                        // Add catalog icon
                        IconButton(onClick = { showAddCatalogDialog = true }) {
                            Icon(Icons.Default.Add, "Add Catalog")
                        }
                    }
                    
                    // Downloads icon with badge
                    IconButton(onClick = { }) {
                        BadgedBox(
                            badge = {
                                if (downloads.isNotEmpty()) {
                                    Badge { Text("${downloads.size}") }
                                }
                            }
                        ) {
                            Icon(Icons.Default.Download, "Downloads")
                        }
                    }
                }
            )
        }
    ) { padding ->
        Box(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
        ) {
            when {
                selectedCatalog == null -> {
                    // Show catalog list
                    CatalogListView(
                        catalogs = catalogs,
                        onCatalogClick = { viewModel.selectCatalog(it) },
                        onCatalogRemove = { viewModel.removeCatalog(it) }
                    )
                }
                
                feedResult != null -> {
                    val result = feedResult!!
                    when {
                        result.isSuccess -> {
                            val feed = result.getOrNull()!!
                            PublicationListView(
                                entries = feed.entries,
                                navigationLinks = feed.navigation,
                                onPublicationClick = { entry ->
                                    viewModel.downloadPublication(selectedCatalog!!.id, entry)
                                },
                                onNavigationClick = { url ->
                                    viewModel.navigateToUrl(url)
                                }
                            )
                        }
                        result.isFailure -> {
                            val error = result.exceptionOrNull()
                            ErrorView(
                                message = error?.message ?: "Unknown error",
                                onRetry = { viewModel.refreshFeed() }
                            )
                        }
                    }
                }
                
                else -> {
                    // Show loading
                    LoadingView()
                }
            }
        }
    }

    // Add catalog dialog
    if (showAddCatalogDialog) {
        AddCatalogDialog(
            onDismiss = { showAddCatalogDialog = false },
            onAdd = { name, url ->
                viewModel.addCustomCatalog(name, url)
                showAddCatalogDialog = false
            }
        )
    }

    // Search dialog
    if (showSearchDialog) {
        SearchDialog(
            currentQuery = searchQuery,
            onDismiss = { showSearchDialog = false },
            onSearch = { query ->
                viewModel.searchCatalog(query)
                showSearchDialog = false
            }
        )
    }
}

@Composable
private fun CatalogListView(
    catalogs: List<OPDSCatalog>,
    onCatalogClick: (OPDSCatalog) -> Unit,
    onCatalogRemove: (OPDSCatalog) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        item {
            Text(
                text = "Browse thousands of free books from online catalogs",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(Modifier.height(8.dp))
        }

        items(catalogs) { catalog ->
            CatalogCard(
                catalog = catalog,
                onClick = { onCatalogClick(catalog) },
                onRemove = if (catalog.isDefault) null else { { onCatalogRemove(catalog) } }
            )
        }
    }
}

@Composable
private fun CatalogCard(
    catalog: OPDSCatalog,
    onClick: () -> Unit,
    onRemove: (() -> Unit)?
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = catalog.name,
                    style = MaterialTheme.typography.titleMedium
                )
                if (catalog.description != null) {
                    Text(
                        text = catalog.description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                if (catalog.accessCount > 0) {
                    Text(
                        text = "Accessed ${catalog.accessCount} times",
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.primary
                    )
                }
            }
            
            Row {
                Icon(
                    Icons.Default.ChevronRight,
                    contentDescription = "Browse",
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
                if (onRemove != null) {
                    IconButton(onClick = onRemove) {
                        Icon(Icons.Default.Delete, "Remove")
                    }
                }
            }
        }
    }
}

@Composable
private fun PublicationListView(
    entries: List<OPDSEntry>,
    navigationLinks: List<OPDSLink> = emptyList(),
    onPublicationClick: (OPDSEntry) -> Unit,
    onNavigationClick: (String) -> Unit = {}
) {
    // Find next and previous links
    val nextLink = navigationLinks.find { link -> 
        link.rel.any { it.contains("next") }
    }
    val prevLink = navigationLinks.find { link ->
        link.rel.any { it.contains("previous") || it.contains("prev") }
    }

    Column(modifier = Modifier.fillMaxSize()) {
        // Navigation buttons at top
        if (prevLink != null || nextLink != null) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                if (prevLink != null) {
                    OutlinedButton(onClick = { onNavigationClick(prevLink.href) }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = null)
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Previous")
                    }
                } else {
                    Spacer(modifier = Modifier.width(1.dp))
                }
                
                if (nextLink != null) {
                    Button(onClick = { onNavigationClick(nextLink.href) }) {
                        Text("Next")
                        Spacer(modifier = Modifier.width(4.dp))
                        Icon(Icons.Default.ArrowForward, contentDescription = null)
                    }
                } else {
                    Spacer(modifier = Modifier.width(1.dp))
                }
            }
        }

        LazyColumn(
            modifier = Modifier.weight(1f),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            items(entries) { entry ->
                PublicationCard(
                    entry = entry,
                    onClick = { onPublicationClick(entry) }
                )
            }
        }

        // Navigation buttons at bottom
        if (prevLink != null || nextLink != null) {
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 8.dp),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                if (prevLink != null) {
                    OutlinedButton(onClick = { onNavigationClick(prevLink.href) }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = null)
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Previous")
                    }
                } else {
                    Spacer(modifier = Modifier.width(1.dp))
                }
                
                if (nextLink != null) {
                    Button(onClick = { onNavigationClick(nextLink.href) }) {
                        Text("Next")
                        Spacer(modifier = Modifier.width(4.dp))
                        Icon(Icons.Default.ArrowForward, contentDescription = null)
                    }
                } else {
                    Spacer(modifier = Modifier.width(1.dp))
                }
            }
        }
    }
}

@Composable
private fun PublicationCard(
    entry: OPDSEntry,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp)
        ) {
            // Cover image
            if (entry.coverUrl != null) {
                AsyncImage(
                    model = entry.coverUrl,
                    contentDescription = "Cover",
                    modifier = Modifier
                        .width(60.dp)
                        .height(90.dp),
                    contentScale = ContentScale.Crop
                )
                Spacer(Modifier.width(12.dp))
            }
            
            // Publication info
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = entry.title,
                    style = MaterialTheme.typography.titleSmall,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
                
                if (entry.authors.isNotEmpty()) {
                    Text(
                        text = entry.authors.joinToString(", "),
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                if (entry.summary != null) {
                    Text(
                        text = entry.summary,
                        style = MaterialTheme.typography.bodySmall,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
                
                // Download formats
                if (entry.acquisitionLinks.isNotEmpty()) {
                    Text(
                        text = entry.acquisitionLinks.joinToString(" • ") {
                            when {
                                it.href.contains("epub", ignoreCase = true) -> "EPUB"
                                it.href.contains("pdf", ignoreCase = true) -> "PDF"
                                it.href.contains("mobi", ignoreCase = true) -> "MOBI"
                                else -> "Book"
                            }
                        },
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.primary,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
            }
            
            Icon(
                Icons.Default.Download,
                contentDescription = "Download",
                tint = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
private fun LoadingView() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(horizontalAlignment = Alignment.CenterHorizontally) {
            CircularProgressIndicator()
            Spacer(Modifier.height(16.dp))
            Text("Loading catalog...")
        }
    }
}

@Composable
private fun ErrorView(message: String, onRetry: () -> Unit) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            modifier = Modifier.padding(32.dp)
        ) {
            Icon(
                Icons.Default.Error,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.error
            )
            Spacer(Modifier.height(16.dp))
            Text(
                text = "Error loading catalog",
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = message,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(Modifier.height(16.dp))
            Button(onClick = onRetry) {
                Text("Retry")
            }
        }
    }
}

@Composable
private fun AddCatalogDialog(
    onDismiss: () -> Unit,
    onAdd: (name: String, url: String) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var url by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Add OPDS Catalog") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Catalog Name") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Catalog URL") },
                    placeholder = { Text("https://example.com/catalog.atom") },
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(name, url) },
                enabled = name.isNotBlank() && url.isNotBlank()
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
private fun SearchDialog(
    currentQuery: String,
    onDismiss: () -> Unit,
    onSearch: (String) -> Unit
) {
    var query by remember { mutableStateOf(currentQuery) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Search Catalog") },
        text = {
            OutlinedTextField(
                value = query,
                onValueChange = { query = it },
                label = { Text("Search query") },
                modifier = Modifier.fillMaxWidth()
            )
        },
        confirmButton = {
            Button(
                onClick = { onSearch(query) },
                enabled = query.isNotBlank()
            ) {
                Text("Search")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@HiltViewModel
class OPDSCatalogBrowserViewModel @Inject constructor(
    private val catalogDao: OPDSCatalogDao,
    private val opdsCatalogService: OPDSCatalogService,
    private val downloadService: OPDSDownloadService
) : ViewModel() {

    val catalogs = catalogDao.getAllCatalogs()
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    private val _selectedCatalog = MutableStateFlow<OPDSCatalog?>(null)
    val selectedCatalog = _selectedCatalog.asStateFlow()

    private val _currentFeed = MutableStateFlow<Result<OPDSFeed>?>(null)
    val currentFeed = _currentFeed.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery = _searchQuery.asStateFlow()

    val activeDownloads = MutableStateFlow<List<Any>>(emptyList())
        .stateIn(viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList())

    init {
        viewModelScope.launch {
            opdsCatalogService.ensureDefaultCatalogs()
        }
    }

    fun selectCatalog(catalog: OPDSCatalog) {
        _selectedCatalog.value = catalog
        refreshFeed()
    }

    fun clearSelection() {
        _selectedCatalog.value = null
        _currentFeed.value = null
        _searchQuery.value = ""
    }

    fun refreshFeed() {
        val catalog = _selectedCatalog.value ?: return
        
        viewModelScope.launch {
            _currentFeed.value = null // Show loading
            _currentFeed.value = opdsCatalogService.browseCatalog(catalog)
        }
    }

    fun searchCatalog(query: String) {
        val catalog = _selectedCatalog.value ?: return
        _searchQuery.value = query
        
        viewModelScope.launch {
            _currentFeed.value = null
            _currentFeed.value = opdsCatalogService.searchCatalog(catalog, query)
        }
    }

    fun downloadPublication(catalogId: Long, entry: OPDSEntry) {
        viewModelScope.launch {
            downloadService.queueDownload(catalogId, entry)
        }
    }

    fun navigateToUrl(url: String) {
        viewModelScope.launch {
            _currentFeed.value = null // Show loading
            try {
                val feed = opdsCatalogService.fetchUrl(url)
                _currentFeed.value = Result.success(feed)
            } catch (e: Exception) {
                _currentFeed.value = Result.failure(e)
            }
        }
    }

    fun addCustomCatalog(name: String, url: String) {
        viewModelScope.launch {
            val catalog = OPDSCatalog(
                name = name,
                url = url,
                isDefault = false,
                isEnabled = true
            )
            opdsCatalogService.addCatalog(catalog)
        }
    }

    fun removeCatalog(catalog: OPDSCatalog) {
        viewModelScope.launch {
            opdsCatalogService.deleteCatalog(catalog)
        }
    }
}
