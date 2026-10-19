package com.universalmedialibrary

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.res.stringResource
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.ui.main.MainViewModel
import com.universalmedialibrary.ui.media.MediaMainActivity
import com.universalmedialibrary.ui.open.MediaOpenScreen
import com.universalmedialibrary.ui.reader.EnhancedEReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.modern.reader.ModernComicReaderScreen
import com.universalmedialibrary.ui.theme.CleverFerretTheme
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
        maybePersistIncomingUriPermission(fileUri)
        
        if (fileUri == null && intent?.action != Intent.ACTION_VIEW) {
            // No file intent - redirect to main app
            redirectToMainApp()
            return
        }
        
        setContent {
            val mainViewModel: MainViewModel = hiltViewModel()
            val selectedTheme by mainViewModel.selectedTheme.collectAsStateWithLifecycle(CleverFerretTheme.NAVY_GOLD)
            val darkMode by mainViewModel.darkMode.collectAsStateWithLifecycle(true)
            
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
        maybePersistIncomingUriPermission(intent.data)
        // Recreate to handle new file
        recreate()
    }

    private fun maybePersistIncomingUriPermission(fileUri: Uri?) {
        if (fileUri == null || fileUri.scheme != "content") return
        val flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
        runCatching {
            contentResolver.takePersistableUriPermission(fileUri, flags)
        }.onFailure {
            Log.d("MainActivity", "URI permission not persistable for $fileUri")
        }
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
            ModernComicReaderScreen(
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
            Text(stringResource(R.string.unsupported_file_type, mimeType))
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
                title = { Text(stringResource(R.string.open_file_title)) },
                navigationIcon = {
                    IconButton(onClick = onClose) {
                        Icon(Icons.Default.ArrowBack, contentDescription = stringResource(R.string.action_close))
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
                text = stringResource(R.string.unknown_file_type),
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(16.dp))
            Text(
                text = stringResource(R.string.unable_to_open_file),
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
                    Text(stringResource(R.string.action_close))
                }
                Button(onClick = onOpenInApp) {
                    Text(stringResource(R.string.open_clever_ferret))
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
            TopAppBar(title = { Text(stringResource(R.string.app_name)) })
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
                text = stringResource(R.string.no_file_to_open),
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(16.dp))
            Button(onClick = onOpenApp) {
                Text(stringResource(R.string.open_clever_ferret_app))
            }
        }
    }
}
