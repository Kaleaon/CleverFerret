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
internal fun QuickAccessBar(
    onPathSelected: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    val externalStorage = Environment.getExternalStorageDirectory().absolutePath
    val downloadsDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
        .absolutePath
    val documentsDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS)
        .absolutePath
    val dcimDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM)
        .absolutePath
    val musicDir = Environment
        .getExternalStoragePublicDirectory(Environment.DIRECTORY_MUSIC)
        .absolutePath

    Row(
        modifier = modifier
            .padding(8.dp)
            .horizontalScroll(rememberScrollState()),
        horizontalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        QuickAccessChip(
            label = "Internal",
            icon = Icons.Default.PhoneAndroid,
            onClick = { onPathSelected(externalStorage) }
        )
        QuickAccessChip(
            label = "Downloads",
            icon = Icons.Default.Download,
            onClick = { onPathSelected(downloadsDir) }
        )
        QuickAccessChip(
            label = "Documents",
            icon = Icons.Default.Folder,
            onClick = { onPathSelected(documentsDir) }
        )
        QuickAccessChip(
            label = "DCIM",
            icon = Icons.Default.PhotoLibrary,
            onClick = { onPathSelected(dcimDir) }
        )
        QuickAccessChip(
            label = "Music",
            icon = Icons.Default.MusicNote,
            onClick = { onPathSelected(musicDir) }
        )
    }
}
