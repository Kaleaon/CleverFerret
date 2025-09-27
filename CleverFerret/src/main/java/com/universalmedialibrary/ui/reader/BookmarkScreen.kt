package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
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
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.local.entity.TextAnnotation
import kotlinx.coroutines.launch

/**
 * Screen for managing bookmarks, highlights, and annotations
 */
@OptIn(ExperimentalMaterial3Api::class, ExperimentalFoundationApi::class)
@Composable
fun BookmarkScreen(
    mediaId: Long,
    onNavigateBack: () -> Unit,
    onBookmarkClick: (TextAnnotation) -> Unit,
    modifier: Modifier = Modifier,
    viewModel: BookmarkViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()
    val pagerState = rememberPagerState(pageCount = { 3 })
    val scope = rememberCoroutineScope()
    
    LaunchedEffect(mediaId) {
        viewModel.loadBookmarks(mediaId)
    }
    
    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = { Text("Bookmarks & Notes") },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                }
            },
            actions = {
                IconButton(
                    onClick = { viewModel.toggleSelectionMode() }
                ) {
                    Icon(
                        if (uiState.isSelectionMode) Icons.Default.Close else Icons.Default.CheckCircle,
                        contentDescription = if (uiState.isSelectionMode) "Cancel Selection" else "Select Items"
                    )
                }
                
                if (uiState.isSelectionMode && uiState.selectedItems.isNotEmpty()) {
                    IconButton(
                        onClick = { viewModel.deleteSelectedItems() }
                    ) {
                        Icon(Icons.Default.Delete, contentDescription = "Delete Selected")
                    }
                }
            }
        )
        
        // Tab Row
        TabRow(
            selectedTabIndex = pagerState.currentPage
        ) {
            listOf("Bookmarks", "Highlights", "Notes").forEachIndexed { index, title ->
                Tab(
                    selected = pagerState.currentPage == index,
                    onClick = {
                        scope.launch {
                            pagerState.animateScrollToPage(index)
                        }
                    },
                    text = { Text(title) }
                )
            }
        }
        
        // Content Pager
        HorizontalPager(
            state = pagerState,
            modifier = Modifier.fillMaxSize()
        ) { page ->
            when (page) {
                0 -> BookmarkList(
                    bookmarks = uiState.bookmarks,
                    selectedItems = uiState.selectedItems,
                    isSelectionMode = uiState.isSelectionMode,
                    onBookmarkClick = onBookmarkClick,
                    onBookmarkLongClick = { viewModel.toggleItemSelection(it.annotationId) },
                    onBookmarkSelect = { viewModel.toggleItemSelection(it.annotationId) }
                )
                1 -> HighlightList(
                    highlights = uiState.highlights,
                    selectedItems = uiState.selectedItems,
                    isSelectionMode = uiState.isSelectionMode,
                    onHighlightClick = onBookmarkClick,
                    onHighlightLongClick = { viewModel.toggleItemSelection(it.annotationId) },
                    onHighlightSelect = { viewModel.toggleItemSelection(it.annotationId) }
                )
                2 -> NoteList(
                    notes = uiState.notes,
                    selectedItems = uiState.selectedItems,
                    isSelectionMode = uiState.isSelectionMode,
                    onNoteClick = onBookmarkClick,
                    onNoteLongClick = { viewModel.toggleItemSelection(it.annotationId) },
                    onNoteSelect = { viewModel.toggleItemSelection(it.annotationId) }
                )
            }
        }
    }
}

@Composable
private fun BookmarkList(
    bookmarks: List<TextAnnotation>,
    selectedItems: Set<Long>,
    isSelectionMode: Boolean,
    onBookmarkClick: (TextAnnotation) -> Unit,
    onBookmarkLongClick: (Annotation) -> Unit,
    onBookmarkSelect: (Annotation) -> Unit
) {
    if (bookmarks.isEmpty()) {
        EmptyState(
            icon = Icons.Default.BookmarkAdd,
            title = "No Bookmarks",
            description = "Tap and hold in the reader to create a bookmark"
        )
    } else {
        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(bookmarks) { bookmark ->
                BookmarkItem(
                    bookmark = bookmark,
                    isSelected = selectedItems.contains(bookmark.annotationId),
                    isSelectionMode = isSelectionMode,
                    onClick = { onBookmarkClick(bookmark) },
                    onLongClick = { onBookmarkLongClick(bookmark) },
                    onSelect = { onBookmarkSelect(bookmark) }
                )
            }
        }
    }
}

@Composable
private fun HighlightList(
    highlights: List<TextAnnotation>,
    selectedItems: Set<Long>,
    isSelectionMode: Boolean,
    onHighlightClick: (Annotation) -> Unit,
    onHighlightLongClick: (Annotation) -> Unit,
    onHighlightSelect: (Annotation) -> Unit
) {
    if (highlights.isEmpty()) {
        EmptyState(
            icon = Icons.Default.Lightbulb,
            title = "No Highlights",
            description = "Select text in the reader and choose highlight to create highlights"
        )
    } else {
        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(highlights) { highlight ->
                HighlightItem(
                    highlight = highlight,
                    isSelected = selectedItems.contains(highlight.annotationId),
                    isSelectionMode = isSelectionMode,
                    onClick = { onHighlightClick(highlight) },
                    onLongClick = { onHighlightLongClick(highlight) },
                    onSelect = { onHighlightSelect(highlight) }
                )
            }
        }
    }
}

@Composable
private fun NoteList(
    notes: List<TextAnnotation>,
    selectedItems: Set<Long>,
    isSelectionMode: Boolean,
    onNoteClick: (Annotation) -> Unit,
    onNoteLongClick: (Annotation) -> Unit,
    onNoteSelect: (Annotation) -> Unit
) {
    if (notes.isEmpty()) {
        EmptyState(
            icon = Icons.Default.Note,
            title = "No Notes",
            description = "Select text in the reader and choose note to create annotations"
        )
    } else {
        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(notes) { note ->
                NoteItem(
                    note = note,
                    isSelected = selectedItems.contains(note.annotationId),
                    isSelectionMode = isSelectionMode,
                    onClick = { onNoteClick(note) },
                    onLongClick = { onNoteLongClick(note) },
                    onSelect = { onNoteSelect(note) }
                )
            }
        }
    }
}

@Composable
private fun BookmarkItem(
    bookmark: Annotation,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    onSelect: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable {
                if (isSelectionMode) onSelect() else onClick()
            },
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isSelectionMode) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = { onSelect() }
                )
                Spacer(modifier = Modifier.width(8.dp))
            }
            
            Icon(
                Icons.Default.Bookmark,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = bookmark.chapterTitle ?: "Chapter ${bookmark.chapterIndex + 1}",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                
                if (bookmark.selectedText.isNotEmpty()) {
                    Text(
                        text = bookmark.selectedText,
                        style = MaterialTheme.typography.bodyMedium,
                        maxLines = 2,
                        overflow = TextOverflow.Ellipsis,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun HighlightItem(
    highlight: Annotation,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    onSelect: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable {
                if (isSelectionMode) onSelect() else onClick()
            },
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier.padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            if (isSelectionMode) {
                Checkbox(
                    checked = isSelected,
                    onCheckedChange = { onSelect() }
                )
                Spacer(modifier = Modifier.width(8.dp))
            }
            
            // Color indicator
            Box(
                modifier = Modifier
                    .size(20.dp)
                    .clip(CircleShape)
                    .background(Color(android.graphics.Color.parseColor(highlight.highlightColor)))
            )
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = highlight.chapterTitle ?: "Chapter ${highlight.chapterIndex + 1}",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                
                Text(
                    text = highlight.selectedText,
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 3,
                    overflow = TextOverflow.Ellipsis,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun NoteItem(
    note: Annotation,
    isSelected: Boolean,
    isSelectionMode: Boolean,
    onClick: () -> Unit,
    onLongClick: () -> Unit,
    onSelect: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable {
                if (isSelectionMode) onSelect() else onClick()
            },
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                if (isSelectionMode) {
                    Checkbox(
                        checked = isSelected,
                        onCheckedChange = { onSelect() }
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                }
                
                Icon(
                    Icons.Default.Note,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.secondary,
                    modifier = Modifier.size(20.dp)
                )
                
                Spacer(modifier = Modifier.width(8.dp))
                
                Text(
                    text = note.chapterTitle ?: "Chapter ${note.chapterIndex + 1}",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Selected text
            Text(
                text = "\"${note.selectedText}\"",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier
                    .background(
                        MaterialTheme.colorScheme.surfaceVariant,
                        RoundedCornerShape(4.dp)
                    )
                    .padding(8.dp)
            )
            
            // Note text
            note.noteText?.let { noteText ->
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = noteText,
                    style = MaterialTheme.typography.bodyMedium,
                    maxLines = 4,
                    overflow = TextOverflow.Ellipsis
                )
            }
        }
    }
}

@Composable
private fun EmptyState(
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    title: String,
    description: String
) {
    Box(
        modifier = Modifier.fillMaxSize(),
        contentAlignment = Alignment.Center
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Icon(
                icon,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}