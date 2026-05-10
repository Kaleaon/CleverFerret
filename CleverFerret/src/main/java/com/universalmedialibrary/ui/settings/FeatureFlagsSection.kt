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
internal fun FeatureFlagsSection(
    geminiEnabled: Boolean,
    exoPlayerEnabled: Boolean,
    podcastsEnabled: Boolean,
    onGeminiToggle: (Boolean) -> Unit,
    onExoPlayerToggle: (Boolean) -> Unit,
    onPodcastsToggle: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Feature Controls",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Gemini Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Gemini AI Integration",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "OCR and book identification",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = geminiEnabled,
                    onCheckedChange = onGeminiToggle
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // ExoPlayer Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Advanced Media Player",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "ExoPlayer for better audio/video",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = exoPlayerEnabled,
                    onCheckedChange = onExoPlayerToggle
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Podcasts Toggle
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Podcast Features",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "Discovery and download management",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = podcastsEnabled,
                    onCheckedChange = onPodcastsToggle
                )
            }
        }
    }
}
