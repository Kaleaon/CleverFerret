package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
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

/**
 * API Settings Screen for managing external API keys
 *
 * Allows users to securely input and manage API keys for:
 * - Google Gemini AI (for OCR and book identification)
 * - Cloud TTS services
 * - Other external integrations
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun APISettingsScreen(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: APISettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    var showGeminiKey by remember { mutableStateOf(false) }
    var geminiKey by remember { mutableStateOf("") }

    LaunchedEffect(Unit) {
        viewModel.loadSettings()
        geminiKey = uiState.geminiApiKey ?: ""
    }

    Column(
        modifier = modifier.fillMaxSize()
    ) {
        // Top App Bar
        TopAppBar(
            title = { Text("API Settings") },
            navigationIcon = {
                IconButton(onClick = onNavigateBack) {
                    Icon(PhosphorIcons.ArrowLeft, contentDescription = "Back")
                }
            }
        )

        // Settings Content
        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Security Notice
            SecurityNoticeCard()

            // Gemini AI Section
            GeminiAPISection(
                apiKey = geminiKey,
                showKey = showGeminiKey,
                onKeyChanged = { geminiKey = it },
                onShowKeyToggle = { showGeminiKey = !showGeminiKey },
                onSaveKey = { viewModel.saveGeminiApiKey(geminiKey) },
                onTestKey = { viewModel.testGeminiApiKey(geminiKey) },
                isLoading = uiState.isLoading,
                testResult = uiState.geminiTestResult
            )

            // Image Generator Selection Section
            ImageGeneratorSection(
                selectedType = uiState.imageGeneratorType,
                onTypeSelected = { viewModel.updateImageGeneratorType(it) },
                isLoading = uiState.isLoading
            )

            // Artwork APIs Section
            ArtworkAPISection(
                settings = uiState.artworkApis,
                onSave = { viewModel.saveArtworkApis(it) }
            )

            // Lyrics APIs Section
            LyricsAPISection(
                settings = uiState.lyricsApis,
                onSave = { viewModel.saveLyricsApis(it) }
            )

            // Cloud TTS Section
            CloudTTSSection(
                isEnabled = uiState.cloudTTSEnabled,
                onEnabledChanged = { viewModel.setCloudTTSEnabled(it) }
            )

            // Feature Flags Section
            FeatureFlagsSection(
                geminiEnabled = uiState.geminiEnabled,
                exoPlayerEnabled = uiState.exoPlayerEnabled,
                podcastsEnabled = uiState.podcastsEnabled,
                onGeminiToggle = { viewModel.setGeminiEnabled(it) },
                onExoPlayerToggle = { viewModel.setExoPlayerEnabled(it) },
                onPodcastsToggle = { viewModel.setPodcastsEnabled(it) }
            )

            // Status Section
            uiState.statusMessage?.let { message ->
                StatusMessageCard(
                    message = message,
                    isError = uiState.hasError
                )
            }
        }
    }
}

@Composable
private fun SecurityNoticeCard() {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.errorContainer
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "🔐 Security Notice",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "API keys are stored securely on your device and never shared. " +
                        "Images and text sent to AI services are processed according to their privacy policies. " +
                        "You can disable these features at any time.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}

@Composable
private fun GeminiAPISection(
    apiKey: String,
    showKey: Boolean,
    onKeyChanged: (String) -> Unit,
    onShowKeyToggle: () -> Unit,
    onSaveKey: () -> Unit,
    onTestKey: () -> Unit,
    isLoading: Boolean,
    testResult: String?
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Google Gemini AI",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = "Enable OCR, book identification, and AI-powered metadata enhancement. " +
                        "Get your API key from Google AI Studio.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // API Key Input + Info
            val context = LocalContext.current
            var showInfo by remember { mutableStateOf(false) }
            OutlinedTextField(
                value = apiKey,
                onValueChange = onKeyChanged,
                label = { Text("Gemini API Key") },
                placeholder = { Text("Enter your Gemini API key") },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        IconButton(onClick = { showInfo = !showInfo }) {
                            Icon(
                                imageVector = PhosphorIcons.Info,
                                contentDescription = "Where to get a key"
                            )
                        }
                        IconButton(onClick = onShowKeyToggle) {
                            Icon(
                                imageVector = if (showKey) PhosphorIcons.Warning else PhosphorIcons.Star,
                                contentDescription = if (showKey) "Hide key" else "Show key"
                            )
                        }
                    }
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                modifier = Modifier.fillMaxWidth(),
                singleLine = true
            )
            if (showInfo) {
                Spacer(modifier = Modifier.height(8.dp))
                Card(modifier = Modifier.fillMaxWidth()) {
                    Column(modifier = Modifier.padding(12.dp)) {
                        Text("Get a Gemini API key from Google AI Studio.")
                        Spacer(Modifier.height(8.dp))
                        TextButton(onClick = {
                            val url = "https://ai.google.dev/"
                            val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri())
                            context.startActivity(intent)
                        }) { Text("Open Google AI Studio") }
                    }
                }
            }

            Spacer(modifier = Modifier.height(16.dp))

            // Action Buttons
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = onSaveKey,
                    enabled = !isLoading && apiKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    if (isLoading) {
                        CircularProgressIndicator(
                            modifier = Modifier.size(16.dp),
                            strokeWidth = 2.dp
                        )
                    } else {
                        Text("Save Key")
                    }
                }

                OutlinedButton(
                    onClick = onTestKey,
                    enabled = !isLoading && apiKey.isNotBlank(),
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Test Key")
                }
            }

            // Test Result
            if (testResult != null) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = testResult,
                    style = MaterialTheme.typography.bodySmall,
                    color = if (testResult.contains("success", ignoreCase = true)) {
                        MaterialTheme.colorScheme.primary
                    } else {
                        MaterialTheme.colorScheme.error
                    }
                )
            }
        }
    }
}

@Composable
private fun CloudTTSSection(
    isEnabled: Boolean,
    onEnabledChanged: (Boolean) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = "Cloud Text-to-Speech",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "Enable cloud-based TTS for higher quality voices",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                Switch(
                    checked = isEnabled,
                    onCheckedChange = onEnabledChanged
                )
            }
        }
    }
}

@Composable
private fun FeatureFlagsSection(
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

@Composable
private fun ImageGeneratorSection(
    selectedType: ImageGeneratorType,
    onTypeSelected: (ImageGeneratorType) -> Unit,
    isLoading: Boolean
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Image Generator",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = "Choose which image generation model to use for creating book covers",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // Imagen Option
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                RadioButton(
                    selected = selectedType == ImageGeneratorType.IMAGEN,
                    onClick = { if (!isLoading) onTypeSelected(ImageGeneratorType.IMAGEN) },
                    enabled = !isLoading
                )
                Column(
                    modifier = Modifier
                        .weight(1f)
                        .padding(start = 8.dp)
                ) {
                    Text(
                        text = "Gemini Imagen (Dedicated)",
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Higher quality, optimized for book covers",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            // Gemini Built-in Option
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(vertical = 8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                RadioButton(
                    selected = selectedType == ImageGeneratorType.GEMINI_BUILTIN,
                    onClick = { if (!isLoading) onTypeSelected(ImageGeneratorType.GEMINI_BUILTIN) },
                    enabled = !isLoading
                )
                Column(
                    modifier = Modifier
                        .weight(1f)
                        .padding(start = 8.dp)
                ) {
                    Text(
                        text = "Gemini Built-in",
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Native multimodal, faster generation",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun ArtworkAPISection(
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
                IconButton(onClick = { showFanartInfo = !showFanartInfo }) { Icon(PhosphorIcons.Info, contentDescription = null) }
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
                IconButton(onClick = { showLastfmInfo = !showLastfmInfo }) { Icon(PhosphorIcons.Info, contentDescription = null) }
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

@Composable
private fun LyricsAPISection(
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
                IconButton(onClick = { showMusixInfo = !showMusixInfo }) { Icon(PhosphorIcons.Info, contentDescription = null) }
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
                IconButton(onClick = { showGeniusInfo = !showGeniusInfo }) { Icon(PhosphorIcons.Info, contentDescription = null) }
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

@Composable
private fun StatusMessageCard(
    message: String,
    isError: Boolean
) {
    Card(
        colors = CardDefaults.cardColors(
            containerColor = if (isError) {
                MaterialTheme.colorScheme.errorContainer
            } else {
                MaterialTheme.colorScheme.primaryContainer
            }
        ),
        modifier = Modifier.fillMaxWidth()
    ) {
        Text(
            text = message,
            style = MaterialTheme.typography.bodyMedium,
            color = if (isError) {
                MaterialTheme.colorScheme.onErrorContainer
            } else {
                MaterialTheme.colorScheme.onPrimaryContainer
            },
            modifier = Modifier.padding(16.dp)
        )
    }
}
