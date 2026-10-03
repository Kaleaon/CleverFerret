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

internal fun loadFileItems(directory: File, settings: FileBrowserSettings): List<FileItem> {
    return try {
        if (!directory.exists() || !directory.isDirectory) {
            return emptyList()
        }
        
        val files = directory.listFiles() ?: return emptyList()
        
        val filteredFiles = files.filter { file ->
            if (!settings.showHidden && file.name.startsWith(".")) {
                return@filter false
            }
            
            if (file.isDirectory) {
                true
            } else {
                val fileType = FileType.fromFile(file)
                val sizeKB = file.length() / 1024
                
                fileType in settings.selectedFileTypes &&
                sizeKB >= settings.minFileSizeKB &&
                sizeKB <= settings.maxFileSizeKB
            }
        }
    
        val sortedFiles = when (settings.sortMode) {
            SortMode.BY_TIME -> filteredFiles.sortedByDescending { it.lastModified() }
            SortMode.BY_FILENAME -> filteredFiles.sortedBy { it.name.lowercase() }
            SortMode.BY_SIZE -> filteredFiles.sortedByDescending { it.length() }
            SortMode.BY_LOCATION -> filteredFiles.sortedBy { it.absolutePath }
        }
        
        return sortedFiles.map { file ->
            FileItem(
                file = file,
                name = file.name,
                isDirectory = file.isDirectory,
                size = file.length(),
                modifiedDate = file.lastModified(),
                fileType = FileType.fromFile(file)
            )
        }
    } catch (e: SecurityException) {
        throw SecurityException("Permission denied: ${e.message}", e)
    } catch (e: Exception) {
        throw Exception("Error loading files", e)
    }
}
