package com.universalmedialibrary.ui.settings

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.layout.*
import com.universalmedialibrary.ui.icons.PhosphorIcons
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import dagger.hilt.android.EntryPointAccessors
import com.universalmedialibrary.services.audio.AudioPlaybackManager

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlaylistSettingsScreen(
    onBack: () -> Unit
) {
    val context = androidx.compose.ui.platform.LocalContext.current
    val appContext = context.applicationContext
    val audio = remember {
        EntryPointAccessors.fromApplication(appContext, PlaylistEntryPoint::class.java).audioManager()
    }
    var status by remember { mutableStateOf("") }

    val exportLauncher = rememberLauncherForActivityResult(ActivityResultContracts.CreateDocument("audio/x-mpegurl")) { uri: Uri? ->
        if (uri != null) {
            val ok = audio.exportQueueAsM3U(context, uri)
            status = if (ok) "Exported playlist successfully." else "Failed to export playlist."
        }
    }

    val importLauncher = rememberLauncherForActivityResult(ActivityResultContracts.OpenDocument()) { uri: Uri? ->
        if (uri != null) {
            val ok = audio.importM3UToQueue(context, uri, playWhenReady = false)
            status = if (ok) "Imported playlist successfully." else "Failed to import playlist."
        }
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Playlists") },
                navigationIcon = { IconButton(onClick = onBack) { Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back") } }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Text("Import or export playlists using M3U format.")
            Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
                Button(onClick = { exportLauncher.launch("playlist.m3u") }) { Text("Export Current Queue (M3U)") }
                OutlinedButton(onClick = { importLauncher.launch(arrayOf("audio/x-mpegurl", "application/vnd.apple.mpegurl", "text/plain")) }) { Text("Import M3U") }
            }
            if (status.isNotBlank()) {
                Text(status)
            }
        }
    }
}

@dagger.hilt.EntryPoint
@dagger.hilt.InstallIn(dagger.hilt.components.SingletonComponent::class)
interface PlaylistEntryPoint {
    fun audioManager(): AudioPlaybackManager
}
