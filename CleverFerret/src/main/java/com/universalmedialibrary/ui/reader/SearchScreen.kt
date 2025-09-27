package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalSoftwareKeyboardController
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.icons.PhosphorIcons
import com.universalmedialibrary.services.reader.SearchResult

/**
 * Search screen for finding text within books
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SearchScreen(
    mediaId: Long,
    onNavigateBack: () -> Unit,
    onSearchResultClick: (SearchResult) -> Unit,
    modifier: Modifier = Modifier,
    viewModel: SearchViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val keyboardController = LocalSoftwareKeyboardController.current
    
    LaunchedEffect(mediaId) {
        viewModel.setMediaId(mediaId)
    }
    
    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = { Text("Search") },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                }
            },
            actions = {
                if (uiState.searchHistory.isNotEmpty()) {
                    IconButton(onClick = { viewModel.clearSearchHistory() }) {
                        Icon(Icons.Default.Clear, contentDescription = "Clear History")
                    }
                }
            }
        )
        
        // Search Input
        OutlinedTextField(
            value = uiState.query,
            onValueChange = viewModel::updateQuery,
            label = { Text("Search in book") },
            leadingIcon = {
                Icon(Icons.Default.Search, contentDescription = null)
            },
            trailingIcon = {
                if (uiState.query.isNotEmpty()) {
                    IconButton(onClick = { viewModel.clearQuery() }) {
                        Icon(Icons.Default.Clear, contentDescription = "Clear")
                    }
                }
            },
            keyboardOptions = KeyboardOptions(
                imeAction = ImeAction.Search
            ),
            keyboardActions = KeyboardActions(
                onSearch = {
                    viewModel.performSearch()
                    keyboardController?.hide()
                }
            ),
            singleLine = true,
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        )
        
        // Search Options
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(horizontal = 16.dp),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            FilterChip(
                selected = uiState.searchInCurrentBook,
                onClick = { viewModel.toggleSearchScope() },
                label = { Text("Current Book") }
            )
            FilterChip(
                selected = uiState.caseSensitive,
                onClick = { viewModel.toggleCaseSensitive() },
                label = { Text("Case Sensitive") }
            )
            FilterChip(
                selected = uiState.wholeWords,
                onClick = { viewModel.toggleWholeWords() },
                label = { Text("Whole Words") }
            )
        }
        
        when {
            uiState.isSearching -> {
                Box(
                    modifier = Modifier.fillMaxSize(),
                    contentAlignment = Alignment.Center
                ) {
                    CircularProgressIndicator()
                }
            }
            uiState.searchResults.isNotEmpty() -> {
                SearchResults(
                    results = uiState.searchResults,
                    onResultClick = onSearchResultClick,
                    modifier = Modifier.fillMaxSize()
                )
            }
            uiState.query.isEmpty() && uiState.searchHistory.isNotEmpty() -> {
                SearchHistory(
                    history = uiState.searchHistory,
                    onHistoryClick = { query ->
                        viewModel.updateQuery(query)
                        viewModel.performSearch()
                    },
                    onDeleteHistoryItem = viewModel::removeFromHistory,
                    modifier = Modifier.fillMaxSize()
                )
            }
            uiState.hasSearched && uiState.searchResults.isEmpty() -> {
                NoResultsMessage(
                    query = uiState.query,
                    modifier = Modifier.fillMaxSize()
                )
            }
        }
    }
}

@Composable
private fun SearchResults(
    results: List<SearchResult>,
    onResultClick: (SearchResult) -> Unit,
    modifier: Modifier = Modifier
) {
    LazyColumn(
        modifier = modifier,
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                text = "${results.size} results found",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        
        items(results) { result ->
            SearchResultItem(
                result = result,
                onClick = { onResultClick(result) }
            )
        }
    }
}

@Composable
private fun SearchResultItem(
    result: SearchResult,
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .clickable { onClick() },
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            // Chapter title
            Text(
                text = result.chapterTitle ?: "Chapter ${result.chapterIndex + 1}",
                style = MaterialTheme.typography.titleSmall,
                color = MaterialTheme.colorScheme.primary,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(4.dp))
            
            // Matched text with highlighting
            Text(
                text = result.matchedText,
                style = MaterialTheme.typography.bodyMedium,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@Composable
private fun SearchHistory(
    history: List<String>,
    onHistoryClick: (String) -> Unit,
    onDeleteHistoryItem: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    LazyColumn(
        modifier = modifier,
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        item {
            Text(
                text = "Recent Searches",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
        
        items(history) { query ->
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .clickable { onHistoryClick(query) }
                    .padding(vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    PhosphorIcons.History,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp),
                    tint = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Text(
                    text = query,
                    style = MaterialTheme.typography.bodyLarge,
                    modifier = Modifier.weight(1f)
                )
                
                IconButton(
                    onClick = { onDeleteHistoryItem(query) }
                ) {
                    Icon(
                        Icons.Default.Close,
                        contentDescription = "Remove",
                        modifier = Modifier.size(18.dp)
                    )
                }
            }
        }
    }
}

@Composable
private fun NoResultsMessage(
    query: String,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                Icons.Default.Search,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Text(
                text = "No results found for \"$query\"",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = "Try different keywords or check spelling",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}