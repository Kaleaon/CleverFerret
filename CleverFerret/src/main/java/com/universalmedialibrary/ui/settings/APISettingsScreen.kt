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

/**
 * API Settings Screen for managing external API keys
 *
 * Allows users to securely input and manage API keys for:
 * - Google Gemini AI (for OCR and book identification)
 * - Cloud TTS services
 * - Other external integrations (TMDB, MusicBrainz, etc.)
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun APISettingsScreen(
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: APISettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsStateWithLifecycle()

    LaunchedEffect(Unit) {
        viewModel.loadSettings()
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

            // === AI & Recommendations ===
            Text("AI & Recommendations", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)
            
            // Gemini AI Section
            GeminiAPISection(
                apiKey = uiState.geminiApiKey ?: "",
                onSaveKey = { viewModel.saveGeminiApiKey(it) },
                onTestKey = { viewModel.testGeminiApiKey(it) },
                isLoading = uiState.isLoading,
                testResult = uiState.geminiTestResult
            )
            
            // TasteDive Section
            GenericApiKeySection(
                title = "TasteDive",
                description = "Music, movie, and book recommendations.",
                apiKey = uiState.tastediveApiKey ?: "",
                onSaveKey = { viewModel.saveTasteDiveApiKey(it) },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://tastedive.com/read/api",
                placeholder = "Enter TasteDive API Key"
            )

            // === Metadata Providers ===
            HorizontalDivider()
            Text("Metadata Providers", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)

            // TMDB
            GenericApiKeySection(
                title = "TheMovieDB (TMDB)",
                description = "Movie and TV show metadata and posters.",
                apiKey = uiState.tmdbApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("tmdb", it, "MOVIES_TV", "TMDB") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://www.themoviedb.org/settings/api",
                placeholder = "Enter TMDB API Key"
            )

            // OMDb
            GenericApiKeySection(
                title = "OMDb",
                description = "Open Movie Database metadata.",
                apiKey = uiState.omdbApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("omdb", it, "MOVIES_TV", "OMDb") },
                isLoading = uiState.isLoading,
                getKeyUrl = "http://www.omdbapi.com/apikey.aspx",
                placeholder = "Enter OMDb API Key"
            )

            // TVDB
            GenericApiKeySection(
                title = "TheTVDB",
                description = "TV show metadata.",
                apiKey = uiState.tvdbApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("tvdb", it, "MOVIES_TV", "TVDB") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://thetvdb.com/api-information",
                placeholder = "Enter TVDB API Key"
            )

            // MusicBrainz
            GenericApiKeySection(
                title = "MusicBrainz",
                description = "Music metadata database.",
                apiKey = uiState.musicBrainzApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("musicbrainz", it, "MUSIC", "MusicBrainz") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://musicbrainz.org/doc/MusicBrainz_API",
                placeholder = "Enter MusicBrainz Token (Optional)",
                note = "Optional: Improves rate limits."
            )

            // Discogs
            GenericApiKeySection(
                title = "Discogs",
                description = "Music database and marketplace.",
                apiKey = uiState.discogsApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("discogs_token", it, "MUSIC", "Discogs") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://www.discogs.com/settings/developers",
                placeholder = "Enter Discogs Personal Access Token"
            )

            // Google Books
            GenericApiKeySection(
                title = "Google Books",
                description = "Book metadata and covers.",
                apiKey = uiState.googleBooksApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("google_books", it, "BOOKS", "Google Books") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://console.cloud.google.com/apis/credentials",
                placeholder = "Enter Google Books API Key"
            )
            
            // Open Library
            GenericApiKeySection(
                title = "Open Library",
                description = "Free book metadata.",
                apiKey = uiState.openLibraryApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("open_library", it, "BOOKS", "Open Library") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://openlibrary.org/developers/api",
                placeholder = "Enter Open Library API Key (Optional)",
                note = "Usually not required, but helps with rate limits."
            )

            // Goodreads
            GenericApiKeySection(
                title = "Goodreads",
                description = "Book reviews and metadata (Legacy).",
                apiKey = uiState.goodreadsApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("goodreads", it, "BOOKS", "Goodreads") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://www.goodreads.com/api",
                placeholder = "Enter Goodreads API Key"
            )

            // NYT
            GenericApiKeySection(
                title = "NYT Books",
                description = "New York Times Best Sellers lists.",
                apiKey = uiState.nytApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("nyt", it, "BOOKS", "NYT") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://developer.nytimes.com/get-started",
                placeholder = "Enter NYT API Key"
            )

            // ComicVine
            GenericApiKeySection(
                title = "ComicVine",
                description = "Comics and manga metadata.",
                apiKey = uiState.comicVineApiKey ?: "",
                onSaveKey = { viewModel.saveComicVineApiKey(it) },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://comicvine.gamespot.com/api/",
                placeholder = "Enter ComicVine API Key"
            )

            // === Podcasts ===
            HorizontalDivider()
            Text("Podcasts", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)

            // Podcast Index
            GenericApiKeySection(
                title = "Podcast Index",
                description = "Open podcast directory.",
                apiKey = uiState.podcastIndexApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("podcast_index", it, "PODCASTS", "Podcast Index") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://api.podcastindex.org/signup",
                placeholder = "key:secret",
                note = "Format: apiKey:apiSecret"
            )
            
            // Listen Notes
            GenericApiKeySection(
                title = "Listen Notes",
                description = "Podcast search engine.",
                apiKey = uiState.listenNotesApiKey ?: "",
                onSaveKey = { viewModel.saveApiKey("listen_notes", it, "PODCASTS", "Listen Notes") },
                isLoading = uiState.isLoading,
                getKeyUrl = "https://www.listennotes.com/api/",
                placeholder = "Enter Listen Notes API Key"
            )

            // === Artwork & Lyrics ===
            HorizontalDivider()
            Text("Artwork & Lyrics", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)

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

            // === AI Generation ===
            HorizontalDivider()
            Text("Generation & Features", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)

            // Image Generator Selection Section
            ImageGeneratorSection(
                selectedType = uiState.imageGeneratorType,
                onTypeSelected = { viewModel.updateImageGeneratorType(it) },
                isLoading = uiState.isLoading
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

            // === Development & Debugging (Debug builds only) ===
            if (com.universalmedialibrary.BuildConfig.DEBUG) {
                HorizontalDivider()
                Text("Development & Debugging", style = MaterialTheme.typography.headlineSmall, color = MaterialTheme.colorScheme.primary)
                
                // GitHub API Token for Bug Reports
                GitHubTokenSection(
                    apiKey = uiState.githubApiKey ?: "",
                    onSaveKey = { viewModel.saveGitHubApiKey(it) },
                    isLoading = uiState.isLoading
                )
            }

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
                text = "API keys are stored securely on your device using Android Keystore encryption. " +
                        "They are never shared with third parties except the respective API providers.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onErrorContainer
            )
        }
    }
}

@Composable
private fun GenericApiKeySection(
    title: String,
    description: String,
    apiKey: String,
    onSaveKey: (String) -> Unit,
    isLoading: Boolean,
    getKeyUrl: String? = null,
    placeholder: String = "Enter API Key",
    note: String? = null
) {
    var currentKey by remember(apiKey) { mutableStateOf(apiKey) }
    var showKey by remember { mutableStateOf(false) }
    val context = LocalContext.current

    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = title,
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )

            Spacer(modifier = Modifier.height(8.dp))

            Text(
                text = description,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // API Key Input
            OutlinedTextField(
                value = currentKey,
                onValueChange = { currentKey = it },
                label = { Text("$title Key") },
                placeholder = { Text(placeholder) },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        if (getKeyUrl != null) {
                            IconButton(onClick = {
                                val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, getKeyUrl.toUri())
                                context.startActivity(intent)
                            }) {
                                Icon(PhosphorIcons.Info, contentDescription = "Get API Key")
                            }
                        }
                        IconButton(onClick = { showKey = !showKey }) {
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
            
            if (note != null) {
                Spacer(modifier = Modifier.height(4.dp))
                Text(
                    text = note,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            Spacer(modifier = Modifier.height(16.dp))

            Button(
                onClick = { onSaveKey(currentKey) },
                enabled = !isLoading && currentKey.isNotBlank(),
                modifier = Modifier.fillMaxWidth()
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
        }
    }
}

@Composable
private fun GeminiAPISection(
    apiKey: String,
    onSaveKey: (String) -> Unit,
    onTestKey: (String) -> Unit,
    isLoading: Boolean,
    testResult: String?
) {
    var currentKey by remember(apiKey) { mutableStateOf(apiKey) }
    var showKey by remember { mutableStateOf(false) }
    val context = LocalContext.current

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
                text = "Enable OCR, book identification, and AI-powered metadata enhancement.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Spacer(modifier = Modifier.height(16.dp))

            // API Key Input + Info
            OutlinedTextField(
                value = currentKey,
                onValueChange = { currentKey = it },
                label = { Text("Gemini API Key") },
                placeholder = { Text("Enter your Gemini API key") },
                visualTransformation = if (showKey) VisualTransformation.None else PasswordVisualTransformation(),
                trailingIcon = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        IconButton(onClick = {
                            val url = "https://ai.google.dev/"
                            val intent = android.content.Intent(android.content.Intent.ACTION_VIEW, url.toUri())
                            context.startActivity(intent)
                        }) {
                            Icon(
                                imageVector = PhosphorIcons.Info,
                                contentDescription = "Where to get a key"
                            )
                        }
                        IconButton(onClick = { showKey = !showKey }) {
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

            Spacer(modifier = Modifier.height(16.dp))

            // Action Buttons
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = { onSaveKey(currentKey) },
                    enabled = !isLoading && currentKey.isNotBlank(),
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
                    onClick = { onTestKey(currentKey) },
                    enabled = !isLoading && currentKey.isNotBlank(),
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

/**
 * GitHub Token Section for Debug Bug Reporting
 * 
 * Only shown in debug builds. Allows configuration of GitHub personal
 * access token for automatic bug report issue creation.
 */
@Composable
private fun GitHubTokenSection(
    apiKey: String,
    onSaveKey: (String) -> Unit,
    isLoading: Boolean
) {
    var keyValue by remember(apiKey) { mutableStateOf(apiKey) }
    var showKey by remember { mutableStateOf(false) }
    val context = LocalContext.current

    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "GitHub API Token",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "For automatic bug report issue creation",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                TextButton(
                    onClick = {
                        val intent = android.content.Intent(
                            android.content.Intent.ACTION_VIEW,
                            "https://github.com/settings/tokens/new?scopes=repo&description=CleverFerret%20Bug%20Reporter".toUri()
                        )
                        context.startActivity(intent)
                    }
                ) {
                    Text("Get Token")
                }
            }

            OutlinedTextField(
                value = keyValue,
                onValueChange = { keyValue = it },
                modifier = Modifier.fillMaxWidth(),
                label = { Text("Personal Access Token") },
                placeholder = { Text("ghp_xxxxxxxxxxxx") },
                visualTransformation = if (showKey) {
                    VisualTransformation.None
                } else {
                    PasswordVisualTransformation()
                },
                keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                trailingIcon = {
                    IconButton(onClick = { showKey = !showKey }) {
                        Icon(
                            imageVector = if (showKey) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                            contentDescription = if (showKey) "Hide" else "Show"
                        )
                    }
                },
                singleLine = true
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Requires 'repo' scope for issue creation",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                Button(
                    onClick = { onSaveKey(keyValue) },
                    enabled = keyValue.isNotBlank() && keyValue != apiKey && !isLoading
                ) {
                    Text("Save")
                }
            }
            
            // Show debug notice
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
                )
            ) {
                Row(
                    modifier = Modifier.padding(12.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.Top
                ) {
                    Icon(
                        imageVector = Icons.Default.BugReport,
                        contentDescription = "Media image",
                        tint = MaterialTheme.colorScheme.onSecondaryContainer,
                        modifier = Modifier.size(20.dp)
                    )
                    Column {
                        Text(
                            text = "Debug Bug Reporter",
                            style = MaterialTheme.typography.labelMedium,
                            fontWeight = FontWeight.SemiBold,
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                        Text(
                            text = "Tap the bug button in the bottom-left corner to capture screenshots, logs, and create GitHub issues for automated bug tracking.",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    }
                }
            }
        }
    }
}
