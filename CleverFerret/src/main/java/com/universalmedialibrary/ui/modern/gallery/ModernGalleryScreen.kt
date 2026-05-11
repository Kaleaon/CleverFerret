// ModernGalleryScreen — image grid with section headers per date bucket.
// Tap an image to open it; multi-select via long press is left to the
// caller (return true from onLongPress to prevent default tap).

package com.universalmedialibrary.ui.modern.gallery

import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.combinedClickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.GridItemSpan
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.PhotoLibrary
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Sort
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing

data class UiPhoto(
    val id: String,
    val tint: Color,
    val isVideo: Boolean = false,
    val durationLabel: String? = null,
    val selected: Boolean = false,
)

data class GallerySection(val title: String, val photos: List<UiPhoto>)

data class ModernGalleryUiState(val sections: List<GallerySection> = emptyList())

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun ModernGalleryScreen(
    state: ModernGalleryUiState,
    onBack: () -> Unit,
    onSearch: () -> Unit,
    onSort: () -> Unit,
    onOpen: (UiPhoto) -> Unit,
    onLongPress: (UiPhoto) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Gallery",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onSort)   { Icon(Icons.Default.Sort, contentDescription = "Sort") }
                    IconButton(onClick = onSearch) { Icon(Icons.Default.Search, contentDescription = "Search") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        if (state.sections.isEmpty()) {
            Box(Modifier.fillMaxSize().padding(padding)) {
                CFEmptyState(
                    icon = Icons.Default.PhotoLibrary,
                    title = "No photos found",
                    body = "Add a folder under Settings → Library to scan images.",
                )
            }
            return@Scaffold
        }
        LazyVerticalGrid(
            columns = GridCells.Adaptive(minSize = 100.dp),
            contentPadding = PaddingValues(CFSpacing.sm),
            horizontalArrangement = Arrangement.spacedBy(2.dp),
            verticalArrangement = Arrangement.spacedBy(2.dp),
            modifier = Modifier.fillMaxSize().padding(padding),
        ) {
            state.sections.forEach { section ->
                item(span = { GridItemSpan(maxLineSpan) }) {
                    Text(
                        section.title,
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Black,
                        color = cs.onBackground,
                        modifier = Modifier.padding(horizontal = CFSpacing.sm, vertical = CFSpacing.sm),
                    )
                }
                items(section.photos) { photo ->
                    Box(
                        Modifier
                            .aspectRatio(1f)
                            .clip(RoundedCornerShape(2.dp))
                            .background(Brush.linearGradient(listOf(photo.tint, photo.tint.copy(alpha = 0.5f))))
                            .combinedClickable(
                                onClick = { onOpen(photo) },
                                onLongClick = { onLongPress(photo) },
                            ),
                    ) {
                        if (photo.selected) {
                            Box(Modifier.matchParentSize().background(cs.primary.copy(alpha = 0.35f)))
                        }
                        if (photo.isVideo && photo.durationLabel != null) {
                            Text(
                                photo.durationLabel,
                                style = MaterialTheme.typography.labelSmall,
                                color = Color.White,
                                fontWeight = FontWeight.Black,
                                modifier = Modifier
                                    .align(Alignment.BottomEnd)
                                    .padding(4.dp),
                            )
                        }
                    }
                }
            }
        }
    }
}
