package com.universalmedialibrary.ui.filepicker

import android.net.Uri
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.CompletableDeferred
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import java.text.SimpleDateFormat
import java.util.*

@Composable
internal fun FileBrowserSettingsDialog(
    settings: FileBrowserSettings,
    onSettingsChange: (FileBrowserSettings) -> Unit,
    onDismiss: () -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("File Browser Settings") },
        text = {
            Column(
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // File type filters
                Text("File Types", style = MaterialTheme.typography.titleSmall)
                FileTypeFilterSection(
                    selectedTypes = settings.selectedFileTypes,
                    onTypesChange = { onSettingsChange(settings.copy(selectedFileTypes = it)) }
                )
                
                HorizontalDivider()
                
                // File size filter
                Text("File Size (KB)", style = MaterialTheme.typography.titleSmall)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedTextField(
                        value = settings.minFileSizeKB.toString(),
                        onValueChange = { 
                            onSettingsChange(settings.copy(minFileSizeKB = it.toIntOrNull() ?: 0))
                        },
                        label = { Text("Min") },
                        modifier = Modifier.weight(1f)
                    )
                    OutlinedTextField(
                        value = if (settings.maxFileSizeKB == Int.MAX_VALUE) "" else settings.maxFileSizeKB.toString(),
                        onValueChange = { 
                            onSettingsChange(settings.copy(maxFileSizeKB = it.toIntOrNull() ?: Int.MAX_VALUE))
                        },
                        label = { Text("Max") },
                        modifier = Modifier.weight(1f)
                    )
                }
                
                HorizontalDivider()
                
                // Show hidden files
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Show Hidden Files")
                    Switch(
                        checked = settings.showHidden,
                        onCheckedChange = { onSettingsChange(settings.copy(showHidden = it)) }
                    )
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) { Text("Done") }
        }
    )
}
