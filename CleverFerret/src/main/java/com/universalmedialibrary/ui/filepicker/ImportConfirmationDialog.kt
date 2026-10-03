package com.universalmedialibrary.ui.filepicker

import android.os.Environment
import androidx.compose.foundation.ExperimentalFoundationApi
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.selection.selectable
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.InsertDriveFile
import androidx.compose.material.icons.automirrored.filled.ViewList
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.semantics.Role
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import kotlinx.coroutines.launch
import java.io.File
import java.text.SimpleDateFormat
import java.util.*
import kotlin.math.log10
import kotlin.math.pow

@Composable
internal fun ImportConfirmationDialog(
    selectedFiles: List<File>,
    selectedFolders: List<File>,
    onConfirm: (includeSubfolders: Boolean, validateFiles: Boolean) -> Unit,
    onDismiss: () -> Unit
) {
    var includeSubfolders by remember { mutableStateOf(true) }
    var validateFiles by remember { mutableStateOf(true) }
    
    val totalFiles = selectedFiles.size
    val totalFolders = selectedFolders.size
    val estimatedFiles = totalFiles + (totalFolders * 50) // Rough estimate
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { 
            Text("Import Selection") 
        },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Text(
                    text = "You've selected:",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                // Selection summary
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(12.dp),
                        verticalArrangement = Arrangement.spacedBy(4.dp)
                    ) {
                        Text("• $totalFiles files")
                        Text("• $totalFolders folders")
                        if (includeSubfolders) {
                            Text(
                                "• Estimated ~$estimatedFiles total files (including subfolders)",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
                
                // Options
                if (totalFolders > 0) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                text = "Include subfolders",
                                style = MaterialTheme.typography.bodyMedium
                            )
                            Text(
                                text = "Recursively add all files in subfolders",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Switch(
                            checked = includeSubfolders,
                            onCheckedChange = { includeSubfolders = it }
                        )
                    }
                }
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Column(modifier = Modifier.weight(1f)) {
                        Text(
                            text = "Validate file types",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = "Only import supported media files",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    Switch(
                        checked = validateFiles,
                        onCheckedChange = { validateFiles = it }
                    )
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    onConfirm(includeSubfolders, validateFiles)
                }
            ) {
                Icon(Icons.Default.ImportExport, contentDescription = "Import or export")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Import")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
