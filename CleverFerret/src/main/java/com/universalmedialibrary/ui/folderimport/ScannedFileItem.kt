package com.universalmedialibrary.ui.folderimport

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateContentSize
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.Sort
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.documentfile.provider.DocumentFile
import androidx.hilt.navigation.compose.hiltViewModel
import coil.compose.AsyncImage
import kotlinx.coroutines.launch
import java.net.URI

@Composable
internal fun ScannedFileItem(
    file: ScannedFile,
    isSelected: Boolean,
    onToggleSelect: () -> Unit,
    onFetchMetadata: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = 16.dp, vertical = 4.dp)
            .clickable(onClick = onToggleSelect),
        colors = CardDefaults.cardColors(
            containerColor = if (isSelected) 
                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
            else 
                MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Checkbox
            Checkbox(
                checked = isSelected,
                onCheckedChange = { onToggleSelect() }
            )
            
            // Cover/icon
            Box(
                modifier = Modifier
                    .size(56.dp)
                    .clip(RoundedCornerShape(4.dp))
                    .background(MaterialTheme.colorScheme.surfaceVariant),
                contentAlignment = Alignment.Center
            ) {
                if (file.metadata?.coverUrl != null) {
                    AsyncImage(
                        model = file.metadata.coverUrl,
                        contentDescription = null,
                        modifier = Modifier.fillMaxSize(),
                        contentScale = ContentScale.Crop
                    )
                } else {
                    Icon(
                        imageVector = file.type.icon,
                        contentDescription = null,
                        modifier = Modifier.size(28.dp),
                        tint = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            // File info
            Column(
                modifier = Modifier.weight(1f)
            ) {
                Text(
                    text = file.metadata?.title ?: file.name,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )
                
                // Show authors for books, artist for audio
                val secondaryText = when (file.type) {
                    ScannedFileType.MUSIC, ScannedFileType.AUDIOBOOK -> {
                        buildString {
                            file.metadata?.authors?.firstOrNull()?.let { append(it) }
                            file.metadata?.album?.let { 
                                if (isNotEmpty()) append(" • ")
                                append(it)
                            }
                        }.ifEmpty { null }
                    }
                    else -> {
                        file.metadata?.authors?.takeIf { it.isNotEmpty() }?.joinToString(", ")
                    }
                }
                
                if (!secondaryText.isNullOrBlank()) {
                    Text(
                        text = secondaryText,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                
                Row(
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    // File type badge
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = file.type.color.copy(alpha = 0.2f)
                    ) {
                        Text(
                            text = file.extension.uppercase(),
                            style = MaterialTheme.typography.labelSmall,
                            color = file.type.color,
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
                        )
                    }
                    
                    // File size
                    Text(
                        text = file.sizeFormatted,
                        style = MaterialTheme.typography.labelSmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    // Metadata status
                    if (file.metadata != null) {
                        Icon(
                            Icons.Default.CheckCircle,
                            contentDescription = "Metadata loaded",
                            modifier = Modifier.size(14.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            }
            
            // Fetch metadata button - for books and audio without metadata
            if ((file.type == ScannedFileType.BOOK || file.type == ScannedFileType.MUSIC || file.type == ScannedFileType.AUDIOBOOK) && file.metadata == null) {
                IconButton(onClick = onFetchMetadata) {
                    Icon(
                        Icons.Default.Search,
                        contentDescription = "Fetch metadata",
                        tint = MaterialTheme.colorScheme.primary
                    )
                }
            }
        }
    }
}
