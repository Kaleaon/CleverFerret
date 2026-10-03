package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.automirrored.filled.LibraryBooks
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale
import com.universalmedialibrary.ui.fanfiction.FanfictionViewModel
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.ui.fanfiction.FilterType
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Unified Fanfiction Hub - All-in-one interface for fanfiction discovery, download, and management.
 * 
 * Streamlined experience combining:
 * - Site selection & Tag-based browsing
 * - Direct story download
 * - Library management (My Library)
 * - Update checker
 * 
 * No more jumping between screens! Reading is handled by the separate eReader.
 */

// Tab indices for the unified fanfiction hub
@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun AvailableTagsCard(
    tags: List<WebFictionTag>,
    selectedTags: List<String>,
    onTagToggle: (WebFictionTag) -> Unit
) {
    Card {
        Column(modifier = Modifier.padding(12.dp)) {
            Text(
                "Browse Tags",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(8.dp))
            
            if (tags.isEmpty()) {
                Text(
                    "Select a site to see available tags",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            } else {
                FlowRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    tags.take(50).forEach { tag ->
                        FilterChip(
                            selected = tag.name in selectedTags,
                            onClick = { onTagToggle(tag) },
                            label = { Text(tag.name) }
                        )
                    }
                }
                
                if (tags.size > 50) {
                    Text(
                        "... and ${tags.size - 50} more tags",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(top = 8.dp)
                    )
                }
            }
        }
    }
}
