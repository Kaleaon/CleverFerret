package com.universalmedialibrary.ui.detail

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.platform.LocalContext
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import coil.request.ImageRequest
import com.universalmedialibrary.data.local.entity.UnifiedTag
import java.text.DecimalFormat
import kotlin.math.log10
import kotlin.math.pow

@Composable
fun AddToCollectionDialog(
    collections: List<com.universalmedialibrary.data.local.entity.UnifiedCollection>,
    onDismiss: () -> Unit,
    onAddToCollection: (Long) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(Icons.Default.PlaylistAdd, contentDescription = "Add to playlist")
                Text("Add to Collection")
            }
        },
        text = {
            if (collections.isEmpty()) {
                Text("No collections found. Create a collection first.")
            } else {
                LazyColumn(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 400.dp)
                ) {
                    items(collections) { collection ->
                        Card(
                            modifier = Modifier
                                .fillMaxWidth()
                                .padding(vertical = 4.dp)
                                .clickable {
                                    onAddToCollection(collection.collectionId)
                                    onDismiss()
                                },
                            colors = CardDefaults.cardColors(
                                containerColor = MaterialTheme.colorScheme.surfaceVariant
                            )
                        ) {
                            Row(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(16.dp),
                                horizontalArrangement = Arrangement.spacedBy(12.dp),
                                verticalAlignment = Alignment.CenterVertically
                            ) {
                                Icon(
                                    imageVector = when (collection.type) {
                                        com.universalmedialibrary.data.local.entity.CollectionType.PLAYLIST -> Icons.Default.PlaylistPlay
                                        com.universalmedialibrary.data.local.entity.CollectionType.SERIES -> Icons.Default.ViewList
                                        com.universalmedialibrary.data.local.entity.CollectionType.READING_LIST -> Icons.AutoMirrored.Filled.MenuBook
                                        com.universalmedialibrary.data.local.entity.CollectionType.WATCH_LIST -> Icons.Default.Visibility
                                        com.universalmedialibrary.data.local.entity.CollectionType.USER_DEFINED -> Icons.Default.Folder
                                        com.universalmedialibrary.data.local.entity.CollectionType.SMART -> Icons.Default.AutoAwesome
                                    },
                                    contentDescription = "Media image"
                                )
                                Column(modifier = Modifier.weight(1f)) {
                                    Text(
                                        text = collection.name,
                                        style = MaterialTheme.typography.titleMedium
                                    )
                                    Text(
                                        text = "${collection.type.name.replace('_', ' ').lowercase().replaceFirstChar { it.uppercase() }} • ${collection.itemCount} items",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.onSurfaceVariant
                                    )
                                }
                                Icon(Icons.Default.ChevronRight, contentDescription = "Navigate")
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
