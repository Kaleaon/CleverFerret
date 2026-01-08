package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

/**
 * Clean Media-Centric Sync Screen
 * 
 * Manage sync across devices and services:
 * - Reading progress sync
 * - Library sync (Plex, Calibre, etc.)
 * - Cloud backup
 * - Sync status and history
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaSyncScreen(
    state: SyncScreenState,
    onSyncNow: () -> Unit,
    onConfigureService: (SyncService) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            imageVector = Icons.Default.Sync,
                            contentDescription = "Media image",
                            tint = MediaColors.Info,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(MediaSpacing.SM))
                        Text(
                            text = "Sync & Backup",
                            style = MediaTypography.TitleMedium,
                            color = MediaColors.TextPrimary
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = MediaColors.TextPrimary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(MediaSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Sync status card
            item {
                SyncStatusCard(
                    lastSyncTime = state.lastSyncTime,
                    isSyncing = state.isSyncing,
                    onSyncNow = onSyncNow
                )
            }
            
            // Progress sync section
            item {
                SectionHeader(title = "Reading Progress", icon = Icons.Default.MenuBook)
            }
            item {
                SyncServiceCard(
                    service = state.progressSyncService,
                    onConfigure = { onConfigureService(state.progressSyncService) }
                )
            }
            
            // Library sync section
            item {
                SectionHeader(title = "Library Sync", icon = Icons.Default.LibraryBooks)
            }
            items(state.librarySyncServices) { service ->
                SyncServiceCard(
                    service = service,
                    onConfigure = { onConfigureService(service) }
                )
            }
            
            // Cloud backup section
            item {
                SectionHeader(title = "Cloud Backup", icon = Icons.Default.Cloud)
            }
            items(state.cloudServices) { service ->
                SyncServiceCard(
                    service = service,
                    onConfigure = { onConfigureService(service) }
                )
            }
            
            // Sync history
            if (state.syncHistory.isNotEmpty()) {
                item {
                    SectionHeader(title = "Recent Activity", icon = Icons.Default.History)
                }
                items(state.syncHistory.take(5)) { entry ->
                    SyncHistoryItem(entry = entry)
                }
            }
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    icon: ImageVector
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = "Media image",
            tint = MediaColors.AccentPrimary,
            modifier = Modifier.size(20.dp)
        )
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        Text(
            text = title,
            style = MediaTypography.TitleSmall,
            color = MediaColors.TextSecondary
        )
    }
}

@Composable
private fun SyncStatusCard(
    lastSyncTime: String?,
    isSyncing: Boolean,
    onSyncNow: () -> Unit
) {
    Surface(
        shape = RoundedCornerShape(MediaCorners.LG),
        color = MediaColors.BackgroundElevated,
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(modifier = Modifier.padding(MediaSpacing.LG)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Sync Status",
                        style = MediaTypography.TitleSmall,
                        color = MediaColors.TextPrimary
                    )
                    Text(
                        text = if (isSyncing) "Syncing..." 
                               else lastSyncTime?.let { "Last sync: $it" } ?: "Never synced",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextSecondary
                    )
                }
                
                if (isSyncing) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(24.dp),
                        color = MediaColors.AccentPrimary,
                        strokeWidth = 2.dp
                    )
                } else {
                    Surface(
                        shape = CircleShape,
                        color = MediaColors.Success.copy(alpha = 0.2f),
                        modifier = Modifier.size(32.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Check,
                            contentDescription = "Media image",
                            tint = MediaColors.Success,
                            modifier = Modifier.padding(6.dp)
                        )
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(MediaSpacing.MD))
            
            Button(
                onClick = onSyncNow,
                enabled = !isSyncing,
                modifier = Modifier.fillMaxWidth(),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MediaColors.AccentPrimary
                )
            ) {
                Icon(
                    imageVector = Icons.Default.Sync,
                    contentDescription = "Media image",
                    modifier = Modifier.size(20.dp)
                )
                Spacer(modifier = Modifier.width(MediaSpacing.SM))
                Text(if (isSyncing) "Syncing..." else "Sync Now")
            }
        }
    }
}

@Composable
private fun SyncServiceCard(
    service: SyncService,
    onConfigure: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onConfigure),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Service icon
            Surface(
                shape = RoundedCornerShape(MediaCorners.SM),
                color = service.color.copy(alpha = 0.2f),
                modifier = Modifier.size(48.dp)
            ) {
                Icon(
                    imageVector = service.icon,
                    contentDescription = "Media image",
                    tint = service.color,
                    modifier = Modifier.padding(MediaSpacing.SM)
                )
            }
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = service.name,
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = when (service.status) {
                        SyncStatus.CONNECTED -> "Connected"
                        SyncStatus.DISCONNECTED -> "Not connected"
                        SyncStatus.SYNCING -> "Syncing..."
                        SyncStatus.ERROR -> "Connection error"
                    },
                    style = MediaTypography.LabelSmall,
                    color = when (service.status) {
                        SyncStatus.CONNECTED -> MediaColors.Success
                        SyncStatus.ERROR -> MediaColors.Error
                        else -> MediaColors.TextSecondary
                    }
                )
            }
            
            // Status indicator
            Surface(
                shape = CircleShape,
                color = when (service.status) {
                    SyncStatus.CONNECTED -> MediaColors.Success
                    SyncStatus.ERROR -> MediaColors.Error
                    SyncStatus.SYNCING -> MediaColors.Warning
                    SyncStatus.DISCONNECTED -> MediaColors.TextTertiary
                },
                modifier = Modifier.size(10.dp)
            ) {}
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MediaColors.TextTertiary
            )
        }
    }
}

@Composable
private fun SyncHistoryItem(
    entry: SyncHistoryEntry
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = when (entry.type) {
                SyncType.UPLOAD -> Icons.Default.CloudUpload
                SyncType.DOWNLOAD -> Icons.Default.CloudDownload
                SyncType.SYNC -> Icons.Default.Sync
            },
            contentDescription = "Media image",
            tint = when (entry.success) {
                true -> MediaColors.Success
                false -> MediaColors.Error
            },
            modifier = Modifier.size(20.dp)
        )
        
        Spacer(modifier = Modifier.width(MediaSpacing.MD))
        
        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = entry.description,
                style = MediaTypography.BodySmall,
                color = MediaColors.TextPrimary
            )
            Text(
                text = entry.timestamp,
                style = MediaTypography.LabelSmall,
                color = MediaColors.TextTertiary
            )
        }
    }
}

/**
 * Import/Export Screen
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ImportExportScreen(
    state: ImportExportScreenState,
    onImport: (ImportExportType) -> Unit,
    onExport: (ImportExportType) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = "Import & Export",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(Icons.Default.ArrowBack, "Back", tint = MediaColors.TextPrimary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(MediaSpacing.MD),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            // Import section
            item {
                Text(
                    text = "Import",
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.padding(vertical = MediaSpacing.SM)
                )
            }
            
            items(ImportExportType.entries.toTypedArray()) { type ->
                ImportExportCard(
                    type = type,
                    isImport = true,
                    onClick = { onImport(type) }
                )
            }
            
            // Export section
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.MD))
                Text(
                    text = "Export",
                    style = MediaTypography.TitleSmall,
                    color = MediaColors.TextSecondary,
                    modifier = Modifier.padding(vertical = MediaSpacing.SM)
                )
            }
            
            items(ImportExportType.entries.toTypedArray()) { type ->
                ImportExportCard(
                    type = type,
                    isImport = false,
                    onClick = { onExport(type) }
                )
            }
        }
    }
}

@Composable
private fun ImportExportCard(
    type: ImportExportType,
    isImport: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.MD))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = if (isImport) Icons.Default.FileUpload else Icons.Default.FileDownload,
                contentDescription = "Media image",
                tint = MediaColors.AccentPrimary
            )
            
            Spacer(modifier = Modifier.width(MediaSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = "${if (isImport) "Import" else "Export"} ${type.displayName}",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextPrimary
                )
                Text(
                    text = type.description,
                    style = MediaTypography.LabelSmall,
                    color = MediaColors.TextSecondary
                )
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MediaColors.TextTertiary
            )
        }
    }
}

// =============================================================================
// DATA MODELS
// =============================================================================

data class SyncScreenState(
    val lastSyncTime: String? = null,
    val isSyncing: Boolean = false,
    val progressSyncService: SyncService = SyncService.Default,
    val librarySyncServices: List<SyncService> = emptyList(),
    val cloudServices: List<SyncService> = emptyList(),
    val syncHistory: List<SyncHistoryEntry> = emptyList()
)

data class SyncService(
    val id: String,
    val name: String,
    val icon: ImageVector,
    val color: Color,
    val status: SyncStatus
) {
    companion object {
        val Default = SyncService(
            id = "progress",
            name = "Progress Sync",
            icon = Icons.Default.Sync,
            color = MediaColors.Info,
            status = SyncStatus.DISCONNECTED
        )
    }
}

enum class SyncStatus {
    CONNECTED, DISCONNECTED, SYNCING, ERROR
}

data class SyncHistoryEntry(
    val id: String,
    val type: SyncType,
    val description: String,
    val timestamp: String,
    val success: Boolean
)

enum class SyncType {
    UPLOAD, DOWNLOAD, SYNC
}

data class ImportExportScreenState(
    val isProcessing: Boolean = false
)

enum class ImportExportType(val displayName: String, val description: String) {
    CALIBRE_LIBRARY("Calibre Library", "Import books from Calibre"),
    OPML("OPML", "Import/Export podcast subscriptions"),
    GOODREADS("Goodreads", "Import reading list from Goodreads"),
    READING_PROGRESS("Reading Progress", "Backup reading positions"),
    BOOKMARKS("Bookmarks & Annotations", "Backup bookmarks and notes"),
    SETTINGS("App Settings", "Backup app configuration")
}
