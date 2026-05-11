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
internal fun BreadcrumbNavigation(
    currentPath: String,
    onPathClick: (String) -> Unit,
    onQuickAccessClick: (String) -> Unit
) {
    val context = LocalContext.current
    val pathParts = currentPath.split("/").filter { it.isNotEmpty() }
    
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.surfaceVariant
    ) {
        Column(modifier = Modifier.padding(8.dp)) {
            // Quick access buttons
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                contentPadding = PaddingValues(horizontal = 8.dp)
            ) {
                item {
                    QuickAccessButton(
                        label = "Downloads",
                        icon = Icons.Default.Download,
                        onClick = {
                            try {
                                val downloads = android.os.Environment.getExternalStoragePublicDirectory(
                                    android.os.Environment.DIRECTORY_DOWNLOADS
                                )
                                if (downloads.exists() || downloads.mkdirs()) {
                                    onQuickAccessClick(downloads.absolutePath)
                                }
                            } catch (e: Exception) {
                                android.util.Log.e("FileBrowser", "Failed to access Downloads: ${e.message}")
                            }
                        }
                    )
                }
                item {
                    QuickAccessButton(
                        label = "SD Card",
                        icon = Icons.Default.Storage,
                        onClick = {
                            try {
                                val sdCard = android.os.Environment.getExternalStorageDirectory()
                                if (sdCard.exists()) {
                                    onQuickAccessClick(sdCard.absolutePath)
                                }
                            } catch (e: Exception) {
                                android.util.Log.e("FileBrowser", "Failed to access SD Card: ${e.message}")
                            }
                        }
                    )
                }
                item {
                    QuickAccessButton(
                        label = "Documents",
                        icon = Icons.Default.Folder,
                        onClick = {
                            try {
                                val documents = android.os.Environment.getExternalStoragePublicDirectory(
                                    android.os.Environment.DIRECTORY_DOCUMENTS
                                )
                                if (documents.exists() || documents.mkdirs()) {
                                    onQuickAccessClick(documents.absolutePath)
                                }
                            } catch (e: Exception) {
                                android.util.Log.e("FileBrowser", "Failed to access Documents: ${e.message}")
                            }
                        }
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Breadcrumb trail
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(4.dp),
                contentPadding = PaddingValues(horizontal = 8.dp)
            ) {
                item {
                    TextButton(
                        onClick = { onPathClick("/") },
                        modifier = Modifier.height(32.dp)
                    ) {
                        Icon(Icons.Default.Home, null, modifier = Modifier.size(16.dp))
                    }
                }
                
                items(pathParts.size) { index ->
                    val path = "/" + pathParts.take(index + 1).joinToString("/")
                    TextButton(
                        onClick = { onPathClick(path) },
                        modifier = Modifier.height(32.dp)
                    ) {
                        Text(
                            text = pathParts[index],
                            maxLines = 1,
                            overflow = TextOverflow.Ellipsis
                        )
                    }
                }
            }
        }
    }
}
