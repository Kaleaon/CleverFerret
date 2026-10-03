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

