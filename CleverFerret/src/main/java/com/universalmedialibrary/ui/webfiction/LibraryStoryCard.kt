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
@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun LibraryStoryCard(
    story: FanfictionStoryEntity,
    onClick: () -> Unit,
    onUpdateClick: () -> Unit,
    onDeleteClick: () -> Unit
) {
    var showMenu by rememberSaveable(story.id) { mutableStateOf(false) }
    
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            // Title and menu
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    story.title,
                    style = MaterialTheme.typography.titleMedium,
                    maxLines = 2,
                    overflow = TextOverflow.Ellipsis,
                    modifier = Modifier.weight(1f)
                )
                
                Box {
                    IconButton(onClick = { showMenu = true }) {
                        Icon(Icons.Default.MoreVert, "Menu")
                    }
                    
                    DropdownMenu(
                        expanded = showMenu,
                        onDismissRequest = { showMenu = false }
                    ) {
                        if (story.status == "IN_PROGRESS") {
                            DropdownMenuItem(
                                text = { Text("Check for Updates") },
                                onClick = {
                                    onUpdateClick()
                                    showMenu = false
                                },
                                leadingIcon = {
                                    Icon(Icons.Default.Refresh, null)
                                }
                            )
                        }
                        DropdownMenuItem(
                            text = { Text("Delete") },
                            onClick = {
                                onDeleteClick()
                                showMenu = false
                            },
                            leadingIcon = {
                                Icon(Icons.Default.Delete, null)
                            }
                        )
                    }
                }
            }
            
            // Author
            Text(
                "by ${story.author}",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(8.dp))
            
            // Summary
            Text(
                story.summary,
                style = MaterialTheme.typography.bodySmall,
                maxLines = 3,
                overflow = TextOverflow.Ellipsis,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            
            Spacer(Modifier.height(12.dp))
            
            // Stats
            Row(
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    "${story.chapterCount} ch",
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    formatNumber(story.wordCount),
                    style = MaterialTheme.typography.bodySmall
                )
                Text(
                    story.sourceSite,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.primary
                )
            }
        }
    }
}
