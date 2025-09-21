package com.universalmedialibrary.ui.screens

import android.Manifest
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.Settings
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors
import com.universalmedialibrary.ui.settings.EnhancedSettingsScreen
import com.universalmedialibrary.ui.components.CleverFerretLogo
import com.universalmedialibrary.viewmodel.MainViewModel

/**
 * Main screen with proper navigation implementation
 * This replaces the MainActivity composable with bulletproof navigation
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MainScreen(
    onNavigateToApiSettings: () -> Unit = {},
    onNavigateToReaderSettings: () -> Unit = {},
    onNavigateToSecuritySettings: () -> Unit = {},
    onNavigateToGeneralSettings: () -> Unit = {},
    onNavigateToIntegrationSettings: () -> Unit = {},
    onNavigateToPlexCalibre: () -> Unit = {},
    viewModel: MainViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()
    
    // Permission launchers
    val permissionLauncher = rememberLauncherForActivityResult(
        ActivityResultContracts.RequestMultiplePermissions()
    ) { permissions ->
        val hasStoragePermission = permissions[Manifest.permission.READ_MEDIA_IMAGES] == true ||
                permissions[Manifest.permission.READ_MEDIA_VIDEO] == true ||
                permissions[Manifest.permission.READ_MEDIA_AUDIO] == true ||
                permissions[Manifest.permission.READ_EXTERNAL_STORAGE] == true

        if (hasStoragePermission) {
            viewModel.startMediaScan()
        }
    }

    val storageAccessLauncher = rememberLauncherForActivityResult(
        ActivityResultContracts.OpenDocumentTree()
    ) { uri ->
        uri?.let {
            // Handle Storage Access Framework
            viewModel.startSAFScan(it)
        }
    }

    CleverFerretTheme {
        val tabTitles = listOf("Library", "Plex & Calibre", "Scanning", "Settings")

        Column(
            modifier = Modifier
                .fillMaxSize()
                .background(MaterialTheme.colorScheme.background)
        ) {
            // Top App Bar
            TopAppBar(
                title = {
                    CleverFerretLogo(
                        size = 32.dp,
                        showText = true,
                        textStyle = MaterialTheme.typography.headlineSmall
                    )
                },
                actions = {
                    IconButton(onClick = { 
                        viewModel.requestPermissionsAndScan(
                            launcher = permissionLauncher,
                            context = context
                        )
                    }) {
                        Icon(
                            if (uiState.isScanning) Icons.Default.Refresh else Icons.Default.Search,
                            contentDescription = if (uiState.isScanning) "Scanning..." else "Scan Media"
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )

            // Tab Row
            TabRow(
                selectedTabIndex = uiState.selectedTab,
                containerColor = MaterialTheme.colorScheme.surface
            ) {
                tabTitles.forEachIndexed { index, title ->
                    Tab(
                        selected = uiState.selectedTab == index,
                        onClick = { viewModel.selectTab(index) },
                        text = { Text(title) }
                    )
                }
            }

            // Tab Content
            when (uiState.selectedTab) {
                0 -> LibraryTabContent(uiState = uiState, viewModel = viewModel)
                1 -> PlexCalibreTabContent(onNavigateToPlexCalibre = onNavigateToPlexCalibre)
                2 -> ScanningTabContent(uiState = uiState)
                3 -> EnhancedSettingsScreen(
                    onNavigateBack = { /* Handle back if needed */ },
                    onNavigateToApiSettings = onNavigateToApiSettings,
                    onNavigateToReaderSettings = onNavigateToReaderSettings,
                    onNavigateToSecuritySettings = onNavigateToSecuritySettings,
                    onNavigateToGeneralSettings = onNavigateToGeneralSettings,
                    onNavigateToIntegrationSettings = onNavigateToIntegrationSettings
                )
            }
        }
    }
}

@Composable
fun LibraryTabContent(
    uiState: MainUiState,
    viewModel: MainViewModel
) {
    if (uiState.mediaItems.isEmpty() && !uiState.isScanning) {
        EmptyStateContent(
            onScanClick = { viewModel.requestPermissionsAndScan() },
            onLoadSampleData = { viewModel.loadSampleData() }
        )
    } else {
        LazyColumn(
            modifier = Modifier.fillMaxSize(),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(uiState.mediaItems) { item ->
                MediaItemCard(item = item)
            }
        }
    }
}

@Composable
fun EmptyStateContent(
    onScanClick: () -> Unit,
    onLoadSampleData: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            Icons.Default.LibraryBooks,
            contentDescription = null,
            modifier = Modifier.size(120.dp),
            tint = MaterialTheme.colorScheme.primary
        )

        Spacer(modifier = Modifier.height(24.dp))

        Text(
            "Welcome to Clever Ferret!",
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center
        )

        Spacer(modifier = Modifier.height(16.dp))

        Text(
            "Your Universal Media Library is empty.\nLet's discover your media files!",
            style = MaterialTheme.typography.bodyLarge,
            textAlign = TextAlign.Center,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )

        Spacer(modifier = Modifier.height(32.dp))

        Column(
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Button(
                onClick = onScanClick,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Search, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Scan Device for Media")
            }

            OutlinedButton(
                onClick = onLoadSampleData,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Preview, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Load Sample Data")
            }
        }
    }
}

@Composable
fun PlexCalibreTabContent(
    onNavigateToPlexCalibre: () -> Unit
) {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Default.AutoAwesome,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(32.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                "Professional Metadata Integration",
                                style = MaterialTheme.typography.headlineSmall,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                "Plex & Calibre level metadata management",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                    }
                }
            }
        }

        item {
            Button(
                onClick = onNavigateToPlexCalibre,
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.Launch, contentDescription = null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("Open Professional Metadata Manager")
            }
        }
    }
}

@Composable
fun ScanningTabContent(
    uiState: MainUiState
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        Card(
            modifier = Modifier.fillMaxWidth(),
            elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
        ) {
            Column(
                modifier = Modifier.padding(16.dp)
            ) {
                Row(
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        if (uiState.isScanning) Icons.Default.Search else Icons.Default.CheckCircle,
                        contentDescription = null,
                        tint = if (uiState.isScanning) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.secondary
                    )
                    Spacer(modifier = Modifier.width(12.dp))
                    Text(
                        if (uiState.isScanning) "Scanning in Progress..." else "Scan Status: Ready",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Medium
                    )
                }

                Spacer(modifier = Modifier.height(16.dp))

                if (uiState.isScanning) {
                    LinearProgressIndicator(
                        modifier = Modifier.fillMaxWidth()
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                }

                Text(
                    uiState.scanProgress.ifEmpty { "Ready to scan your media files" },
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }

        Spacer(modifier = Modifier.height(16.dp))

        MediaTypesOverview(uiState.mediaItems)
    }
}

@Composable
fun MediaTypesOverview(mediaItems: List<MediaItemInfo>) {
    LazyColumn(
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(MediaType.values().toList()) { mediaType ->
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        mediaType.getIcon(),
                        style = MaterialTheme.typography.headlineMedium
                    )
                    Spacer(modifier = Modifier.width(16.dp))
                    Column {
                        Text(
                            mediaType.getDisplayName(),
                            style = MaterialTheme.typography.bodyLarge,
                            fontWeight = FontWeight.Medium
                        )
                        Text(
                            "${mediaItems.count { it.mediaType == mediaType }} items",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun MediaItemCard(item: MediaItemInfo) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                item.mediaType.getIcon(),
                style = MaterialTheme.typography.headlineMedium
            )

            Spacer(modifier = Modifier.width(16.dp))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    item.title,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    item.author ?: item.mediaType.getDisplayName(),
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            if (item.isFavorite) {
                Icon(
                    Icons.Default.Favorite,
                    contentDescription = "Favorite",
                    tint = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

// Data classes
data class MediaItemInfo(
    val id: Long,
    val title: String,
    val mediaType: MediaType,
    val author: String? = null,
    val isFavorite: Boolean = false
)

data class MainUiState(
    val selectedTab: Int = 0,
    val hasStoragePermission: Boolean = false,
    val hasNotificationPermission: Boolean = false,
    val isScanning: Boolean = false,
    val scanProgress: String = "",
    val mediaItems: List<MediaItemInfo> = emptyList(),
    val error: String? = null
)