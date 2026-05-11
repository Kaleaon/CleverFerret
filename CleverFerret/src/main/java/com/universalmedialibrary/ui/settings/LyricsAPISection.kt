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
internal fun LyricsAPISection(
    settings: LyricsApiSettings,
    onSave: (LyricsApiSettings) -> Unit
) {
    var musix by remember { mutableStateOf(settings.musixmatchEnabled) }
    var musixKey by remember { mutableStateOf(settings.musixmatchApiKey) }
    var genius by remember { mutableStateOf(settings.geniusEnabled) }
    var geniusKey by remember { mutableStateOf(settings.geniusApiKey) }
    val context = LocalContext.current
    var showMusixInfo by remember { mutableStateOf(false) }
    var showGeniusInfo by remember { mutableStateOf(false) }

    Card(modifier = Modifier.fillMaxWidth()) {
        Column(modifier = Modifier.padding(16.dp)) {
            Text("Lyrics Providers", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Bold)
            Spacer(Modifier.height(8.dp))

            Row(verticalAlignment = Alignment.CenterVertically) {
                Switch(checked = musix, onCheckedChange = { musix = it })
                Spacer(Modifier.width(8.dp))
                Text("Musixmatch")
                Spacer(Modifier.width(8.dp))
                IconButton(onClick = { showMusixInfo = !showMusixInfo }) { Icon(PhosphorIcons.Info, contentDescription = "Information") }
            }
            if (musix) {
                OutlinedTextField(value = musixKey, onValueChange = { musixKey = it }, label = { Text("Musixmatch API Key") }, modifier = Modifier.fillMaxWidth())
                if (showMusixInfo) {
                    Spacer(Modifier.height(6.dp))
                    Card { Column(Modifier.padding(12.dp)) {
                        Text("Apply for an API key from Musixmatch.")
                        Spacer(Modifier.height(6.dp))
                        TextButton(onClick = {
                            val url = "https://developer.musixmatch.com/"
                            context.startActivity(android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri()))
                        }) { Text("Open Musixmatch Developer") }
                    } }
                }
            }

            Spacer(Modifier.height(8.dp))
            Row(verticalAlignment = Alignment.CenterVertically) {
                Switch(checked = genius, onCheckedChange = { genius = it })
                Spacer(Modifier.width(8.dp))
                Text("Genius")
                Spacer(Modifier.width(8.dp))
                IconButton(onClick = { showGeniusInfo = !showGeniusInfo }) { Icon(PhosphorIcons.Info, contentDescription = "Information") }
            }
            if (genius) {
                OutlinedTextField(value = geniusKey, onValueChange = { geniusKey = it }, label = { Text("Genius API Key") }, modifier = Modifier.fillMaxWidth())
                if (showGeniusInfo) {
                    Spacer(Modifier.height(6.dp))
                    Card { Column(Modifier.padding(12.dp)) {
                        Text("Create a client and get credentials at Genius.")
                        Spacer(Modifier.height(6.dp))
                        TextButton(onClick = {
                            val url = "https://genius.com/api-clients"
                            context.startActivity(android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri()))
                        }) { Text("Open Genius API") }
                    } }
                }
            }

            Spacer(Modifier.height(12.dp))
            Button(onClick = { onSave(LyricsApiSettings(musix, musixKey, genius, geniusKey)) }) { Text("Save Lyrics Settings") }
        }
    }
}
