package com.universalmedialibrary.ui.components.permission

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.FolderSpecial
import androidx.compose.material.icons.filled.Lock
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.MusicNote
import androidx.compose.material.icons.filled.PhotoLibrary
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Non-modal inline banner displayed within local media or storage screens
 * when local storage permission has not been granted.
 *
 * Keeps top navigation, bottom navigation bar, and drawer navigation fully accessible.
 */
@Composable
fun StoragePermissionBanner(
    onRequestPermission: () -> Unit,
    modifier: Modifier = Modifier,
    title: String = "Storage Access Required",
    message: String = "Storage access is needed to browse and play local media files stored on your device.",
    icon: ImageVector = Icons.Default.FolderSpecial,
    actionText: String = "Grant Access",
    onDismiss: (() -> Unit)? = null
) {
    Card(
        modifier = modifier
            .fillMaxWidth()
            .padding(16.dp),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        ),
        shape = RoundedCornerShape(12.dp),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.Top
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary,
                    modifier = Modifier
                        .size(40.dp)
                        .padding(end = 12.dp)
                )

                Column(
                    modifier = Modifier.weight(1f)
                ) {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )

                    Spacer(modifier = Modifier.height(4.dp))

                    Text(
                        text = message,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.8f)
                    )
                }

                if (onDismiss != null) {
                    IconButton(
                        onClick = onDismiss,
                        modifier = Modifier.size(24.dp)
                    ) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Dismiss",
                            tint = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(12.dp))

            Button(
                onClick = onRequestPermission,
                colors = ButtonDefaults.buttonColors(
                    containerColor = MaterialTheme.colorScheme.primary
                )
            ) {
                Icon(
                    imageVector = Icons.Default.Lock,
                    contentDescription = null,
                    modifier = Modifier.size(18.dp)
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(text = actionText)
            }
        }
    }
}

/**
 * Contextual permission banner presets for specific media domains.
 */
object StoragePermissionBannerDefaults {

    @Composable
    fun BookshelfPermissionBanner(
        onRequestPermission: () -> Unit,
        modifier: Modifier = Modifier
    ) {
        StoragePermissionBanner(
            onRequestPermission = onRequestPermission,
            modifier = modifier,
            title = "Bookshelf Access Required",
            message = "Storage permission is needed to locate and load EPUBs, PDFs, and local ebooks into your bookshelf.",
            icon = Icons.Default.MenuBook,
            actionText = "Grant Bookshelf Access"
        )
    }

    @Composable
    fun GalleryPermissionBanner(
        onRequestPermission: () -> Unit,
        modifier: Modifier = Modifier
    ) {
        StoragePermissionBanner(
            onRequestPermission = onRequestPermission,
            modifier = modifier,
            title = "Photos & Media Access Required",
            message = "Storage permission is required to view, organize, and play photo and video collections.",
            icon = Icons.Default.PhotoLibrary,
            actionText = "Grant Gallery Access"
        )
    }

    @Composable
    fun AutoScanPermissionBanner(
        onRequestPermission: () -> Unit,
        modifier: Modifier = Modifier
    ) {
        StoragePermissionBanner(
            onRequestPermission = onRequestPermission,
            modifier = modifier,
            title = "Auto-Scan Permission Required",
            message = "Storage permission is needed to automatically scan your device directories for new media files in the background.",
            icon = Icons.Default.Search,
            actionText = "Grant Scanner Access"
        )
    }

    @Composable
    fun MusicPermissionBanner(
        onRequestPermission: () -> Unit,
        modifier: Modifier = Modifier
    ) {
        StoragePermissionBanner(
            onRequestPermission = onRequestPermission,
            modifier = modifier,
            title = "Music Library Access Required",
            message = "Storage access is needed to index and play local audio tracks, albums, and playlists.",
            icon = Icons.Default.MusicNote,
            actionText = "Grant Music Access"
        )
    }
}

