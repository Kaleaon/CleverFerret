package com.universalmedialibrary.ui.library

import android.app.Activity
import android.content.Intent
import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.lazy.grid.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog

/**
 * Dialog for creating a new media library
 * Provides media type selection and folder picker functionality
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CreateLibraryDialog(
    onDismiss: () -> Unit,
    onCreateLibrary: (name: String, type: String, path: String) -> Unit
) {
    var libraryName by remember { mutableStateOf("") }
    var selectedType by remember { mutableStateOf("BOOK") }
    var selectedPath by remember { mutableStateOf("") }
    var showTypeSelection by remember { mutableStateOf(false) }
    
    val context = LocalContext.current
    
    val folderPicker = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            result.data?.data?.let { uri ->
                selectedPath = uri.path ?: uri.toString()
            }
        }
    }
    
    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            shape = RoundedCornerShape(16.dp),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surface
            )
        ) {
            Column(
                modifier = Modifier.padding(24.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    text = "Create New Library",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.onSurface
                )
                
                // Library Name Input
                OutlinedTextField(
                    value = libraryName,
                    onValueChange = { libraryName = it },
                    label = { Text("Library Name") },
                    placeholder = { Text("e.g., My Books, Action Movies, Jazz Collection") },
                    modifier = Modifier.fillMaxWidth(),
                    leadingIcon = {
                        Icon(Icons.Default.Edit, contentDescription = null)
                    }
                )
                
                // Media Type Selection
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Select Media Type",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        
                        Spacer(modifier = Modifier.height(12.dp))
                        
                        LazyVerticalGrid(
                            columns = GridCells.Fixed(2),
                            horizontalArrangement = Arrangement.spacedBy(8.dp),
                            verticalArrangement = Arrangement.spacedBy(8.dp),
                            modifier = Modifier.height(200.dp)
                        ) {
                            items(getMediaTypes()) { mediaType ->
                                MediaTypeChip(
                                    mediaType = mediaType,
                                    isSelected = selectedType == mediaType.value,
                                    onClick = { selectedType = mediaType.value }
                                )
                            }
                        }
                    }
                }
                
                // Folder Selection
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Text(
                            text = "Library Location",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.SemiBold
                        )
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        if (selectedPath.isNotEmpty()) {
                            Text(
                                text = "Selected: ${selectedPath.takeLast(50)}",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(modifier = Modifier.height(8.dp))
                        }
                        
                        Button(
                            onClick = {
                                try {
                                    val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
                                        addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                                        addFlags(Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                                    }
                                    folderPicker.launch(intent)
                                } catch (e: Exception) {
                                    // Fallback - use a default path
                                    selectedPath = "/storage/emulated/0/${getMediaTypeDisplayName(selectedType)}"
                                }
                            },
                            modifier = Modifier.fillMaxWidth(),
                            colors = ButtonDefaults.buttonColors(
                                containerColor = MaterialTheme.colorScheme.primary
                            )
                        ) {
                            Icon(Icons.Default.List, contentDescription = null)
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(if (selectedPath.isEmpty()) "Choose Folder" else "Change Folder")
                        }
                        
                        Text(
                            text = "Optional: Select a folder containing your media files",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                // Action Buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    OutlinedButton(
                        onClick = onDismiss,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Cancel")
                    }
                    
                    Button(
                        onClick = {
                            if (libraryName.isNotBlank()) {
                                val finalPath = selectedPath.ifEmpty { 
                                    "/storage/emulated/0/${getMediaTypeDisplayName(selectedType)}"
                                }
                                onCreateLibrary(libraryName.trim(), selectedType, finalPath)
                            }
                        },
                        enabled = libraryName.isNotBlank(),
                        modifier = Modifier.weight(1f),
                        colors = ButtonDefaults.buttonColors(
                            containerColor = MaterialTheme.colorScheme.primary
                        )
                    ) {
                        Icon(Icons.Default.Add, contentDescription = null)
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Create")
                    }
                }
            }
        }
    }
}

@Composable
private fun MediaTypeChip(
    mediaType: MediaTypeInfo,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    FilterChip(
        onClick = onClick,
        label = {
            Column(
                horizontalAlignment = Alignment.CenterHorizontally,
                modifier = Modifier.padding(4.dp)
            ) {
                Icon(
                    imageVector = mediaType.icon,
                    contentDescription = null,
                    modifier = Modifier.size(20.dp)
                )
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = mediaType.label,
                    style = MaterialTheme.typography.bodySmall
                )
            }
        },
        selected = isSelected,
        modifier = Modifier.fillMaxWidth()
    )
}

private data class MediaTypeInfo(
    val value: String,
    val label: String,
    val icon: ImageVector
)

private fun getMediaTypes(): List<MediaTypeInfo> {
    return listOf(
        MediaTypeInfo("BOOK", "Books", Icons.Default.List),
        MediaTypeInfo("MOVIE", "Movies", Icons.Default.PlayArrow),
        MediaTypeInfo("MUSIC_TRACK", "Music", Icons.Default.PlayArrow),
        MediaTypeInfo("TV_SHOW", "TV Shows", Icons.Default.PlayArrow),
        MediaTypeInfo("PODCAST_EPISODE", "Podcasts", Icons.Default.PlayArrow),
        MediaTypeInfo("DOCUMENT", "Documents", Icons.Default.List),
        MediaTypeInfo("COMIC", "Comics", Icons.Default.List),
        MediaTypeInfo("AUDIOBOOK", "Audiobooks", Icons.Default.PlayArrow)
    )
}

private fun getMediaTypeDisplayName(type: String): String {
    return when (type.uppercase()) {
        "BOOK" -> "Books"
        "MOVIE" -> "Movies"
        "MUSIC_TRACK" -> "Music"
        "TV_SHOW" -> "TV Shows"
        "PODCAST_EPISODE" -> "Podcasts"
        "DOCUMENT" -> "Documents"
        "COMIC" -> "Comics"
        "AUDIOBOOK" -> "Audiobooks"
        else -> type.lowercase().replaceFirstChar { it.uppercase() }
    }
}