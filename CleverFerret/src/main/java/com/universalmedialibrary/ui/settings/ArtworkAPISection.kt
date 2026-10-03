package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.BugReport
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.data.settings.ImageGeneratorType
import com.universalmedialibrary.data.settings.ArtworkApiSettings
import com.universalmedialibrary.data.settings.LyricsApiSettings
import androidx.compose.ui.platform.LocalContext
import androidx.core.net.toUri
import com.universalmedialibrary.ui.icons.PhosphorIcons

@Composable
internal fun ArtworkAPISection(
    settings: ArtworkApiSettings,
    onSave: (ArtworkApiSettings) -> Unit
) {
    var fanart by remember { mutableStateOf(settings.fanartTvEnabled) }
    var fanartKey by remember { mutableStateOf(settings.fanartTvApiKey) }
    var lastfm by remember { mutableStateOf(settings.lastFmEnabled) }
    var lastfmKey by remember { mutableStateOf(settings.lastFmApiKey) }
    var caa by remember { mutableStateOf(settings.coverArtArchiveEnabled) }
    val context = LocalContext.current
    var showFanartInfo by remember { mutableStateOf(false) }
    var showLastfmInfo by remember { mutableStateOf(false) }

    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text("Artwork Providers", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
            Spacer(Modifier.height(8.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Switch(checked = fanart, onCheckedChange = { fanart = it })
                Spacer(Modifier.width(8.dp))
                Text("Fanart.tv")
                Spacer(Modifier.width(8.dp))
                IconButton(onClick = { showFanartInfo = !showFanartInfo }) { Icon(PhosphorIcons.Info, contentDescription = "Information") }
            }
            if (fanart) {
                OutlinedTextField(value = fanartKey, onValueChange = { fanartKey = it }, label = { Text("Fanart.tv API Key") }, modifier = Modifier.fillMaxWidth())
                if (showFanartInfo) {
                    Spacer(Modifier.height(6.dp))
                    Card { Column(Modifier.padding(12.dp)) {
                        Text("Get your key at Fanart.tv")
                        Spacer(Modifier.height(6.dp))
                        TextButton(onClick = {
                            val url = "https://fanart.tv/get-an-api-key/"
                        context.startActivity(android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri()))
                        }) { Text("Open Fanart.tv") }
                    } }
                }
            }
            Spacer(Modifier.height(8.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Switch(checked = lastfm, onCheckedChange = { lastfm = it })
                Spacer(Modifier.width(8.dp))
                Text("Last.fm")
                Spacer(Modifier.width(8.dp))
                IconButton(onClick = { showLastfmInfo = !showLastfmInfo }) { Icon(PhosphorIcons.Info, contentDescription = "Information") }
            }
            if (lastfm) {
                OutlinedTextField(value = lastfmKey, onValueChange = { lastfmKey = it }, label = { Text("Last.fm API Key") }, modifier = Modifier.fillMaxWidth())
                if (showLastfmInfo) {
                    Spacer(Modifier.height(6.dp))
                    Card { Column(Modifier.padding(12.dp)) {
                        Text("Get your key at Last.fm")
                        Spacer(Modifier.height(6.dp))
                        TextButton(onClick = {
                            val url = "https://www.last.fm/api/account/create"
                        context.startActivity(android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri()))
                        }) { Text("Open Last.fm") }
                    } }
                }
            }

            Spacer(Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically) {
                Switch(checked = caa, onCheckedChange = { caa = it })
                Spacer(Modifier.width(8.dp))
                Text("Cover Art Archive")
            }

            Spacer(Modifier.height(12.dp))
            Button(onClick = { onSave(ArtworkApiSettings(fanart, fanartKey, lastfm, lastfmKey, caa)) }) { Text("Save Artwork Settings") }
        }
    }
}
