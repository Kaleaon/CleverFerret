package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.lazy.grid.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric OPDS Browser Screen
 * 
 * Browse and download from OPDS/Atom catalogs:
 * - Standard Ebooks
 * - Project Gutenberg
 * - Feedbooks
 * - Calibre servers
 * - Custom catalogs
 * 
 * Features:
 * - Hierarchical navigation
 * - Search within catalogs
 * - Download management
 * - Add custom catalogs
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OPDSBrowserScreen(
    state: OPDSScreenState,
    onCatalogClick: (OPDSCatalog) -> Unit,
    onEntryClick: (OPDSEntry) -> Unit,
    onSearch: (String) -> Unit,
    onAddCatalog: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    var showAddDialog by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    var isSearching by remember { mutableStateOf(false) }
    
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            OPDSTopBar(
                currentPath = state.currentPath,
                isSearching = isSearching,
                searchQuery = searchQuery,
                onSearchQueryChange = { searchQuery = it },
                onSearchToggle = { isSearching = !isSearching },
                onSearch = { onSearch(searchQuery) },
                onAddCatalog = { showAddDialog = true },
                onBackClick = onBackClick
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Breadcrumb navigation
            if (state.navigationStack.size > 1) {
                BreadcrumbNavigation(
                    path = state.navigationStack,
                    onNavigateToIndex = { index ->
                        // Navigate back to specific level
                    }
                )
            }
            
            when {
                state.isLoading -> {
                    OPDSLoadingState()
                }
                state.error != null -> {
                    OPDSErrorState(
                        error = state.error,
                        onRetry = { /* Retry */ }
                    )
                }
                state.currentPath.isEmpty() -> {
                    // Show catalog list
                    CatalogListView(
                        catalogs = state.catalogs,
                        onCatalogClick = onCatalogClick,
                        onRemoveCatalog = { /* Remove catalog */ }
                    )
                }
                else -> {
                    // Show entries
                    OPDSEntriesView(
                        entries = state.entries,
                        onEntryClick = onEntryClick
                    )
                }
            }
        }
    }
    
    // Add Catalog Dialog
    if (showAddDialog) {
        AddCatalogDialog(
            onDismiss = { showAddDialog = false },
            onAdd = { url ->
                onAddCatalog(url)
                showAddDialog = false
            }
        )
    }
}

// =============================================================================
// TOP BAR
// =============================================================================

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun OPDSTopBar(
    currentPath: String,
    isSearching: Boolean,
    searchQuery: String,
    onSearchQueryChange: (String) -> Unit,
    onSearchToggle: () -> Unit,
    onSearch: () -> Unit,
    onAddCatalog: () -> Unit,
    onBackClick: () -> Unit
) {
    TopAppBar(
        title = {
            if (isSearching) {
                OutlinedTextField(
                    value = searchQuery,
                    onValueChange = onSearchQueryChange,
                    modifier = Modifier.fillMaxWidth(),
                    placeholder = { Text("Search catalog...", color = MediaColors.TextTertiary) },
                    singleLine = true,
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = MediaColors.AccentPrimary,
                        unfocusedBorderColor = Color.Transparent,
                        focusedTextColor = MediaColors.TextPrimary,
                        cursorColor = MediaColors.AccentPrimary
                    ),
                    keyboardActions = androidx.compose.foundation.text.KeyboardActions(
                        onSearch = { onSearch() }
                    ),
                    keyboardOptions = androidx.compose.foundation.text.KeyboardOptions(
                        imeAction = androidx.compose.ui.text.input.ImeAction.Search
                    )
                )
            } else {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Icon(
                        imageVector = Icons.Default.LibraryBooks,
                        contentDescription = null,
                        tint = MediaColors.MediaTypes.Book,
                        modifier = Modifier.size(24.dp)
                    )
                    Spacer(modifier = Modifier.width(MediaSpacing.SM))
                    Text(
                        text = if (currentPath.isEmpty()) "OPDS Catalogs" else currentPath,
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
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
            IconButton(onClick = onSearchToggle) {
                Icon(
                    imageVector = if (isSearching) Icons.Default.Close else Icons.Default.Search,
                    contentDescription = if (isSearching) "Close search" else "Search",
                    tint = MediaColors.TextSecondary
                )
            }
            if (!isSearching && currentPath.isEmpty()) {
                IconButton(onClick = onAddCatalog) {
                    Icon(
                        imageVector = Icons.Default.Add,
                        contentDescription = "Add Catalog",
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
// BREADCRUMB NAVIGATION
// =============================================================================

@Composable
private fun BreadcrumbNavigation(
    path: List<String>,
    onNavigateToIndex: (Int) -> Unit
) {
    LazyRow(
        modifier = Modifier
            .fillMaxWidth()
            .background(MediaColors.BackgroundElevated)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        itemsIndexed(path) { index, item ->
            if (index > 0) {
                Icon(
                    imageVector = Icons.Default.ChevronRight,
                    contentDescription = null,
                    tint = MediaColors.TextTertiary,
                    modifier = Modifier.size(16.dp)
                )
            }
            
            TextButton(
                onClick = { onNavigateToIndex(index) },
                colors = ButtonDefaults.textButtonColors(
                    contentColor = if (index == path.lastIndex)
                        MediaColors.TextPrimary
                    else
                        MediaColors.AccentPrimary
                )
            ) {
                Text(
                    text = item,
                    style = MediaTypography.LabelMedium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

// =============================================================================
// CATALOG LIST
// =============================================================================

@Composable
private fun CatalogListView(
    catalogs: List<OPDSCatalog>,
    onCatalogClick: (OPDSCatalog) -> Unit,
    onRemoveCatalog: (OPDSCatalog) -> Unit
) {
    LazyColumn(
        contentPadding = PaddingValues(MediaSpacing.MD),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        // Built-in catalogs
        item {
            Text(
                text = "Featured Catalogs",
                style = MediaTypography.TitleSmall,
                color = MediaColors.TextSecondary,
                modifier = Modifier.padding(vertical = MediaSpacing.SM)
            )
        }
        
        items(catalogs.filter { it.isBuiltIn }) { catalog ->
            CatalogCard(
                catalog = catalog,
                onClick = { onCatalogClick(catalog) },
                onRemove = null
            )
        }
        
        // Custom catalogs
        val customCatalogs = catalogs.filter { !it.isBuiltIn }
        if (customCatalogs.isNotEmpty()) {
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                Text(
                    text = "My Catalogs",
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.padding(vertical = MediaSpacing.SM)
                )
            }
            
            items(customCatalogs) { catalog ->
                CatalogCard(
                    catalog = catalog,
                    onClick = { onCatalogClick(catalog) },
                    onRemove = { onRemoveCatalog(catalog) }
                )
            }
        }
    }
}

@Composable
private fun CatalogCard(
    catalog: OPDSCatalog,
    onClick: () -> Unit,
    onRemove: (() -> Unit)?
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Catalog icon
            Surface(
                shape = RoundedCornerShape(MediaCorners.SM),
                color = catalog.color.copy(alpha = 0.2f),
                modifier = Modifier.size(56.dp)
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = catalog.icon,
                        contentDescription = null,
                        tint = catalog.color,
                        modifier = Modifier.size(28.dp)
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = catalog.name,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = catalog.description,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            if (onRemove != null) {
                IconButton(onClick = onRemove) {
                    Icon(
                        imageVector = Icons.Default.Delete,
                        contentDescription = "Remove",
                        tint = MediaColors.TextTertiary
                    )
                }
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null,
                tint = MediaColors.TextTertiary
            )
        }
    }
}

// =============================================================================
// ENTRIES VIEW
// =============================================================================

@Composable
private fun OPDSEntriesView(
    entries: List<OPDSEntry>,
    onEntryClick: (OPDSEntry) -> Unit
) {
    val navigationEntries = entries.filter { it.isNavigation }
    val bookEntries = entries.filter { !it.isNavigation }
    
    LazyColumn(
        contentPadding = PaddingValues(vertical = MediaSpacing.MD),
        modifier = Modifier.fillMaxSize()
    ) {
        // Navigation entries (categories, search, etc.)
        if (navigationEntries.isNotEmpty()) {
            items(navigationEntries) { entry ->
                NavigationEntryItem(
                    entry = entry,
                    onClick = { onEntryClick(entry) }
                )
            }
            
            item {
                HorizontalDivider(
                    color = MediaColors.Border,
                    modifier = Modifier.padding(vertical = MediaSpacing.MD)
                )
            }
        }
        
        // Book entries
        if (bookEntries.isNotEmpty()) {
            items(bookEntries) { entry ->
                BookEntryItem(
                    entry = entry,
                    onClick = { onEntryClick(entry) }
                )
            }
        }
    }
}

@Composable
private fun NavigationEntryItem(
    entry: OPDSEntry,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = Icons.Default.Folder,
            contentDescription = null,
            tint = MediaColors.AccentPrimary,
            modifier = Modifier.size(24.dp)
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Text(
            text = entry.title,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextPrimary,
            modifier = Modifier.weight(1f)
        )
        
        Icon(
            imageVector = Icons.Default.ChevronRight,
            contentDescription = null,
            tint = MediaColors.TextTertiary
        )
    }
}

@Composable
private fun BookEntryItem(
    entry: OPDSEntry,
    onClick: () -> Unit
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick)
            .padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.Top
    ) {
        // Cover
        Surface(
            modifier = Modifier
                .size(width = 60.dp, height = 90.dp)
                .clip(RoundedCornerShape(MediaCorners.XS)),
            color = MediaColors.BackgroundSurface
        ) {
            if (entry.coverUrl != null) {
                AsyncImage(
                    
                    model = entry.coverUrl,
                    contentDescription = null,
                    contentScale = ContentScale.Crop,
                    modifier = Modifier.fillMaxSize()
                )
            } else {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = Icons.Default.Book,
                        contentDescription = null,
                        tint = MediaColors.TextTertiary,
                        modifier = Modifier.size(32.dp)
                    )
                }
            }
        }
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = entry.title,
                style = MediaTypography.BodyMedium,
                color = MediaColors.TextPrimary,
                maxLines = 2,
                overflow = TextOverflow.Ellipsis,
                fontWeight = FontWeight.Medium
            )
            
            entry.author?.let { author ->
                Text(
                    text = author,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            entry.summary?.let { summary ->
                Spacer(modifier = Modifier.height(MediaSpacing.XS))
                Text(
                    text = summary,
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextTertiary,
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis
                )
            }
            
            // Format badges
            if (entry.formats.isNotEmpty()) {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Row(horizontalArrangement = Arrangement.spacedBy(MediaSpacing.XS)) {
                    entry.formats.forEach { format ->
                        Surface(
                            shape = RoundedCornerShape(MediaCorners.XS),
                            color = MediaColors.BackgroundElevated
                        ) {
                            Text(
                                text = format.uppercase(),
                                style = MediaTypography.LabelSmall,
                                color = MediaColors.TextSecondary,
                                modifier = Modifier.padding(
                                    horizontal = MediaSpacing.SM,
                                    vertical = 2.dp
                                )
                            )
                        }
                    }
                }
            }
        }
        
        // Download button
        if (entry.isDownloadable) {
            IconButton(onClick = onClick) {
                Icon(
                    imageVector = Icons.Default.Download,
                    contentDescription = "Download",
                    tint = MediaColors.AccentPrimary
                )
            }
        }
    }
}

// =============================================================================
// DIALOGS
// =============================================================================

@Composable
private fun AddCatalogDialog(
    onDismiss: () -> Unit,
    onAdd: (String) -> Unit
) {
    var url by remember { mutableStateOf("") }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Add OPDS Catalog", color = MediaColors.TextPrimary)
        },
        text = {
            Column {
                Text(
                    text = "Enter the URL of the OPDS catalog feed",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary
                )
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                OutlinedTextField(
                    value = url,
                    onValueChange = { url = it },
                    label = { Text("Catalog URL") },
                    placeholder = { Text("https://example.com/opds") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth(),
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = MediaColors.AccentPrimary,
                        focusedLabelColor = MediaColors.AccentPrimary
                    )
                )
            }
        },
        confirmButton = {
            Button(
                onClick = { onAdd(url) },
                enabled = url.isNotBlank(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Text("Add")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel", color = MediaColors.TextSecondary)
            }
        },
        containerColor = MediaColors.BackgroundElevated
    )
}

// =============================================================================
// STATES
// =============================================================================

@Composable
private fun OPDSLoadingState() {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        CircularProgressIndicator(color = MediaColors.AccentPrimary)
    }
}

@Composable
private fun OPDSErrorState(
    error: String,
    onRetry: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Outlined.Error,
            contentDescription = null,
            tint = MediaColors.Error,
            modifier = Modifier.size(64.dp)
        )
        Spacer(modifier = Modifier.height(MediaSpacing.MD))
        Text(
            text = "Failed to load catalog",
            style = MediaTypography.TitleMedium,
            color = MediaColors.TextPrimary
        )
        Spacer(modifier = Modifier.height(MediaSpacing.SM))
        Text(
            text = error,
            style = MediaTypography.BodyMedium,
            color = MediaColors.TextSecondary,
            textAlign = androidx.compose.ui.text.style.TextAlign.Center
        )
        Spacer(modifier = Modifier.height(MediaSpacing.LG))
        Button(
            onClick = onRetry,
            colors = ButtonDefaults.buttonColors(
                containerColor = MediaColors.AccentPrimary
            )
        ) {
            Icon(Icons.Default.Refresh, null)
            Spacer(modifier = Modifier.width(MediaSpacing.SM))
            Text("Retry")
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class OPDSScreenState(
    val catalogs: List<OPDSCatalog> = emptyList(),
    val entries: List<OPDSEntry> = emptyList(),
    val navigationStack: List<String> = emptyList(),
    val currentPath: String = "",
    val isLoading: Boolean = false,
    val error: String? = null
)

data class OPDSCatalog(
    val id: String,
    val name: String,
    val url: String,
    val description: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector = Icons.Default.LibraryBooks,
    val color: Color = MediaColors.MediaTypes.Book,
    val isBuiltIn: Boolean = false
)

data class OPDSEntry(
    val id: String,
    val title: String,
    val author: String? = null,
    val summary: String? = null,
    val coverUrl: String? = null,
    val formats: List<String> = emptyList(),
    val downloadLinks: Map<String, String> = emptyMap(),
    val isNavigation: Boolean = false,
    val isDownloadable: Boolean = false,
    val navigationUrl: String? = null
)
