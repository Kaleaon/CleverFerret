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
internal fun SelectionBar(
    selectedCount: Int,
    onCopy: () -> Unit,
    onMove: () -> Unit,
    onDelete: () -> Unit,
    onCancel: () -> Unit
) {
    Surface(
        modifier = Modifier.fillMaxWidth(),
        color = MaterialTheme.colorScheme.surfaceVariant,
        tonalElevation = 8.dp
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(8.dp),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text("$selectedCount selected", style = MaterialTheme.typography.bodyMedium)
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onCopy) { Text("Copy") }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onMove) { Text("Move") }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onDelete) { 
                Text("Delete", color = MaterialTheme.colorScheme.error)
            }
            Text("|", color = MaterialTheme.colorScheme.onSurfaceVariant)
            TextButton(onClick = onCancel) { Text("Cancel") }
        }
    }
}
