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
internal fun FileIcon(file: File) {
    val (icon, gradient) = when {
        file.isDirectory -> Icons.Default.Folder to listOf(Color(0xFFFFA726), Color(0xFFFF6F00))
        file.extension.lowercase() in listOf("epub", "pdf", "txt", "mobi") -> 
            Icons.Default.Book to listOf(Color(0xFF1B5E20), Color(0xFF4CAF50))
        file.extension.lowercase() in listOf("mp3", "m4a", "flac", "wav") -> 
            Icons.Default.MusicNote to listOf(Color(0xFF4A148C), Color(0xFF9C27B0))
        file.extension.lowercase() in listOf("mp4", "mkv", "avi", "mov") -> 
            Icons.Default.Movie to listOf(Color(0xFF0D47A1), Color(0xFF2196F3))
        file.extension.lowercase() in listOf("cbz", "cbr", "cb7") -> 
            Icons.Default.AutoStories to listOf(Color(0xFFE65100), Color(0xFFFF9800))
        file.extension.lowercase() in listOf("jpg", "jpeg", "png", "gif") -> 
            Icons.Default.Image to listOf(Color(0xFF006064), Color(0xFF00BCD4))
        else -> Icons.AutoMirrored.Filled.InsertDriveFile to listOf(Color(0xFF37474F), Color(0xFF78909C))
    }

    Box(
        modifier = Modifier
            .size(48.dp)
            .clip(CircleShape)
            .background(Brush.linearGradient(gradient)),
        contentAlignment = Alignment.Center
    ) {
        Icon(
            icon,
            contentDescription = "Media image",
            tint = Color.White,
            modifier = Modifier.size(24.dp)
        )
    }
}
