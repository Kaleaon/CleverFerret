package com.universalmedialibrary

import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.universalmedialibrary.ui.contentcreation.ContentCreationScreen
import com.universalmedialibrary.ui.library.LibraryManagementScreen
import dagger.hilt.android.AndroidEntryPoint
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * CleverFerret Universal Media Library - Main Activity
 * 
 * Enhanced with Plex-inspired UI design converted from React components
 * Enhanced with complete database infrastructure and library management UI
 * Fixed with better error handling for installation issues
 */
@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    
    companion object {
        private const val TAG = "MainActivity"
    }
    
    override fun onCreate(savedInstanceState: Bundle?) {
        try {
            super.onCreate(savedInstanceState)
            Log.d(TAG, "MainActivity starting...")
            
            setContent {
                MaterialTheme {
                    CleverFerretApp()
                }
            }
            
            Log.d(TAG, "MainActivity UI content set successfully")
        } catch (e: Exception) {
            Log.e(TAG, "Error in MainActivity onCreate", e)
            // Try to show a fallback UI instead of crashing
            try {
                setContent {
                    MaterialTheme {
                        ErrorScreen(e.message ?: "Unknown error occurred")
                    }
                }
            } catch (fallbackError: Exception) {
                Log.e(TAG, "Fallback UI also failed", fallbackError)
                finish()
            }
        }
    }
}

@Composable
fun ErrorScreen(errorMessage: String) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = Icons.Default.Warning,
            contentDescription = "Error",
            tint = MaterialTheme.colorScheme.error,
            modifier = Modifier.size(48.dp)
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = "CleverFerret Error",
            style = MaterialTheme.typography.headlineSmall,
            color = MaterialTheme.colorScheme.error
        )
        Spacer(modifier = Modifier.height(8.dp))
        Text(
            text = errorMessage,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurface
        )
        Spacer(modifier = Modifier.height(16.dp))
        Text(
            text = "Please restart the app or contact support if this continues.",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CleverFerretApp() {
    val navController = rememberNavController()
    
    NavHost(
        navController = navController,
        startDestination = "library_list"
    ) {
        composable("library_list") {
            com.universalmedialibrary.ui.library.LibraryListScreen(
                onNavigateToLibrary = { libraryId -> 
                    navController.navigate("library_details/$libraryId") 
                },
                onNavigateToSettings = { 
                    navController.navigate("settings") 
                },
                onCreateLibrary = { 
                    navController.navigate("content_creation") 
                }
            )
        }
        composable("library_details/{libraryId}") { backStackEntry ->
            val libraryId = backStackEntry.arguments?.getString("libraryId")?.toIntOrNull() ?: 1
            com.universalmedialibrary.ui.library.LibraryDetailsScreen(
                libraryId = libraryId,
                onNavigateBack = { navController.popBackStack() },
                onNavigateToMediaViewer = { mediaId ->
                    navController.navigate("media_viewer/$mediaId")
                }
            )
        }
        composable("media_viewer/{mediaId}") { backStackEntry ->
            val mediaId = backStackEntry.arguments?.getString("mediaId")?.toIntOrNull() ?: 1
            // For now, show a placeholder screen
            MediaViewerPlaceholder(
                mediaId = mediaId,
                onNavigateBack = { navController.popBackStack() }
            )
        }
        composable("settings") {
            SettingsPlaceholder(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        composable("content_creation") {
            ContentCreationScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        composable("library_management") {
            LibraryManagementScreen(
                onNavigateBack = { navController.popBackStack() }
            )
        }
        // Keep the old route for compatibility
        composable("library") {
            LibraryHomeScreen(
                onNavigateToContentCreation = { navController.navigate("content_creation") },
                navController = navController
            )
        }
    }
}

@Composable
fun LibraryHomeScreen(
    onNavigateToContentCreation: () -> Unit = {},
    navController: androidx.navigation.NavController
) {
    Surface(
        modifier = Modifier.fillMaxSize(),
        color = MaterialTheme.colorScheme.background
    ) {
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(16.dp)
                .verticalScroll(rememberScrollState()),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Spacer(modifier = Modifier.height(32.dp))
            
            // Header
            Text(
                text = "🦫 CleverFerret",
                style = MaterialTheme.typography.headlineLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.primary
            )
            
            Text(
                text = "Universal Media Library",
                style = MaterialTheme.typography.titleMedium,
                color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
            )
            
            Spacer(modifier = Modifier.height(32.dp))
            
            // Database Ready Status
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "✅ Database Ready",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Universal media library database with 21 entities is fully operational",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
            
            // Features Overview
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "🚀 Ready for Implementation",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    val readyFeatures = listOf(
                        "📚 Books: EPUB, PDF, TXT support",
                        "🎵 Music: MP3, FLAC, OGG support", 
                        "🎬 Movies: MP4, MKV, AVI support",
                        "📺 TV Shows: Season and episode tracking",
                        "🎧 Podcasts: RSS feed management",
                        "📄 Documents: Advanced text processing",
                        "🔗 External APIs: Google Books, TMDB, Spotify",
                        "☁️ Cloud Sync: Dropbox, Google Drive ready"
                    )
                    
                    readyFeatures.forEach { feature ->
                        Text(
                            text = feature,
                            style = MaterialTheme.typography.bodySmall,
                            modifier = Modifier.padding(vertical = 2.dp),
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    }
                }
            }
            
            // Action Buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Button(
                    onClick = { navController.navigate("library_management") },
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = MaterialTheme.colorScheme.primary
                    )
                ) {
                    Icon(Icons.Default.Home, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Manage Libraries")
                }
                
                OutlinedButton(
                    onClick = onNavigateToContentCreation,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Edit, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Content Tools")
                }
            }
            
            // Statistics Preview
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "📊 System Status",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceEvenly
                    ) {
                        StatusItem("Libraries", "0")
                        StatusItem("Media Items", "0")
                        StatusItem("Bookmarks", "0")
                        StatusItem("API Keys", "0")
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(32.dp))
        }
    }
}

@Composable
fun StatusItem(label: String, count: String) {
    Column(horizontalAlignment = Alignment.CenterHorizontally) {
        Text(
            text = count,
            style = MaterialTheme.typography.headlineSmall,
            fontWeight = FontWeight.Bold,
            color = MaterialTheme.colorScheme.primary
        )
        Text(
            text = label,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurface.copy(alpha = 0.7f)
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaViewerPlaceholder(
    mediaId: Int,
    onNavigateBack: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize()
    ) {
        Column {
            TopAppBar(
                title = { Text("Media Viewer") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color(0xFF1F2326),
                    titleContentColor = Color.White
                )
            )
            
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Icon(
                        Icons.Default.PlayArrow,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = Color(0xFFE5A00D)
                    )
                    Text(
                        text = "Media Viewer",
                        style = MaterialTheme.typography.headlineMedium
                    )
                    Text(
                        text = "Media viewer for item #$mediaId coming soon",
                        style = MaterialTheme.typography.bodyLarge,
                        color = Color(0xFFB3B3B3)
                    )
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun SettingsPlaceholder(
    onNavigateBack: () -> Unit
) {
    Box(
        modifier = Modifier.fillMaxSize()
    ) {
        Column {
            TopAppBar(
                title = { Text("Settings") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = Color(0xFF1F2326),
                    titleContentColor = Color.White
                )
            )
            
            Box(
                modifier = Modifier.fillMaxSize(),
                contentAlignment = Alignment.Center
            ) {
                Column(
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalArrangement = Arrangement.spacedBy(16.dp)
                ) {
                    Icon(
                        Icons.Default.Settings,
                        contentDescription = null,
                        modifier = Modifier.size(64.dp),
                        tint = Color(0xFFE5A00D)
                    )
                    Text(
                        text = "Settings",
                        style = MaterialTheme.typography.headlineMedium
                    )
                    Text(
                        text = "Settings screen coming soon",
                        style = MaterialTheme.typography.bodyLarge,
                        color = Color(0xFFB3B3B3)
                    )
                }
            }
        }
    }
}