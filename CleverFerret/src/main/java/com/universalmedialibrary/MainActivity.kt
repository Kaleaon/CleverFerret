package com.universalmedialibrary

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.media.MediaMainActivity
import com.universalmedialibrary.ui.open.MediaOpenScreen
import com.universalmedialibrary.ui.reader.EnhancedEReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.ComicReaderScreen
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import com.universalmedialibrary.utils.ScreenTimeoutManager
import dagger.hilt.android.AndroidEntryPoint

/**
 * MainActivity - File Intent Handler
 * 
 * This activity ONLY handles external file intents (ACTION_VIEW) for:
 * - EPUB files
 * - PDF files
 * - Comic archives (CBZ, CBR)
 * - Text documents
 * - HTML files
 * - DOCX files
 * 
 * The main app UI is handled by [MediaMainActivity] which is the primary launcher.
 * This activity opens the appropriate reader for external files.
 */
@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    
    lateinit var screenTimeoutManager: ScreenTimeoutManager
        private set
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        screenTimeoutManager = ScreenTimeoutManager(this)
        
        // Check if we have a file to open
        val fileUri = intent?.data
        
        if (fileUri == null && intent?.action != Intent.ACTION_VIEW) {
            // No file intent - redirect to main app
            redirectToMainApp()
            return
        }
        
        setContent {
            val mainViewModel: MainViewModel = hiltViewModel()
            val selectedTheme by mainViewModel.selectedTheme.collectAsState(ThemePalette.NAVY_GOLD)
            val darkMode by mainViewModel.darkMode.collectAsState(true)
            
            CleverFerretTheme(palette = selectedTheme, darkTheme = darkMode) {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    if (fileUri != null) {
                        FileReaderScreen(
                            fileUri = fileUri,
                            onClose = { finish() },
                            onOpenInApp = { redirectToMainApp() }
                        )
                    } else {
                        // Should not reach here, but handle gracefully
                        NoFileScreen(
                            onOpenApp = { redirectToMainApp() }
                        )
                    }
                }
            }
        }
    }
    
    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        // Recreate to handle new file
        recreate()
    }
    
    override fun onUserInteraction() {
        super.onUserInteraction()
        if (::screenTimeoutManager.isInitialized) {
            screenTimeoutManager.onUserInteraction()
        }
    }
    
    override fun onDestroy() {
        super.onDestroy()
        if (::screenTimeoutManager.isInitialized) {
            screenTimeoutManager.cleanup()
        }
    }
    
    private fun redirectToMainApp() {
        val mainIntent = Intent(this, MediaMainActivity::class.java)
        mainIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
        startActivity(mainIntent)
        finish()
    }
}

/**
 * Determines file type and shows appropriate reader
 */
@Composable
private fun FileReaderScreen(
    fileUri: Uri,
    onClose: () -> Unit,
    onOpenInApp: () -> Unit
) {
    val uriString = fileUri.toString()
    val fileName = remember(fileUri) {
        fileUri.lastPathSegment ?: "unknown_file"
    }
    
    val mimeType = remember(fileUri) {
        uriString.lowercase().let { path ->
            when {
                path.endsWith(".epub") -> "application/epub+zip"
                path.endsWith(".pdf") -> "application/pdf"
                path.endsWith(".cbz") -> "application/x-cbz"
                path.endsWith(".cbr") -> "application/x-cbr"
                path.endsWith(".txt") -> "text/plain"
                path.endsWith(".html") || path.endsWith(".htm") -> "text/html"
                path.endsWith(".docx") -> "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
                else -> "unknown"
            }
        }
    }
    
    when (mimeType) {
        "application/epub+zip" -> {
            EnhancedEReaderScreen(
                bookFilePath = uriString,
                onBack = onClose
            )
        }
        "application/pdf" -> {
            DocumentReaderScreen(
                uriString = uriString,
                fileName = fileName,
                onBack = onClose
            )
        }
        "application/x-cbz", "application/x-cbr" -> {
            ComicReaderScreen(
                uriString = uriString,
                fileName = fileName,
                onBack = onClose
            )
        }
        "text/plain", "text/html", 
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" -> {
            DocumentReaderScreen(
                uriString = uriString,
                fileName = fileName,
                onBack = onClose
            )
        }
        else -> {
            // Unsupported file type - show error
            Text("Unsupported file type: $mimeType")
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun UnknownFileScreen(
    fileUri: Uri,
    onClose: () -> Unit,
    onOpenInApp: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Open File") },
                navigationIcon = {
                    IconButton(onClick = onClose) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Close")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(
                text = "Unknown File Type",
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = "Unable to determine how to open this file.",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = fileUri.lastPathSegment ?: fileUri.toString(),
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Spacer(modifier = Modifier.height(32.dp))
            Row(horizontalArrangement = Arrangement.spacedBy(16.dp)) {
                OutlinedButton(onClick = onClose) {
                    Text("Close")
                }
                Button(onClick = onOpenInApp) {
                    Text("Open CleverFerret")
                }
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun NoFileScreen(onOpenApp: () -> Unit) {
    Scaffold(
        topBar = {
            TopAppBar(title = { Text("CleverFerret") })
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(24.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.Center
        ) {
            Text(
                text = "No file to open",
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(16.dp))
            Button(onClick = onOpenApp) {
                Text("Open CleverFerret App")
            }
        }
    }
}
