package com.universalmedialibrary.ui.settings

import android.content.Intent
import android.net.Uri
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiSettingsScreen(
    navController: NavController,
    mediaType: String,
    viewModel: SettingsViewModel = hiltViewModel()
) {
    val apiSettings by viewModel.apiSettings.collectAsState()

    val (title, description, providers) = when (mediaType) {
        "books" -> Triple(
            "Books APIs",
            "Configure metadata sources for books and ebooks",
            getBooksProviders(apiSettings.bookApis)
        )
        "comics" -> Triple(
            "Comics APIs",
            "Configure metadata sources for comics and graphic novels",
            getComicsProviders(apiSettings.comicApis)
        )
        "audiobooks" -> Triple(
            "Audiobooks APIs",
            "Configure metadata sources for audiobooks",
            getAudiobooksProviders(apiSettings.audiobookApis)
        )
        "movies" -> Triple(
            "Movies & TV APIs",
            "Configure metadata sources for movies and TV shows",
            getMoviesProviders(apiSettings.movieTvApis)
        )
        "music" -> Triple(
            "Music APIs",
            "Configure metadata sources for music and albums",
            getMusicProviders(apiSettings.musicApis)
        )
        else -> Triple("Unknown", "", emptyList())
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text(title) },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            item {
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            providers.forEach { provider ->
                item {
                    ApiProviderCard(
                        provider = provider,
                        onToggle = { enabled ->
                            updateProviderSettings(viewModel, mediaType, provider.name, enabled, provider.apiKey)
                        },
                        onApiKeyChange = { apiKey ->
                            updateProviderSettings(viewModel, mediaType, provider.name, provider.isEnabled, apiKey)
                        }
                    )
                }
            }

            if (mediaType == "comics") {
                item {
                    val targetLang = remember { mutableStateOf(apiSettings.comicApis.geminiTargetLanguage) }
                    Card(
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Text("Bubble Translation", style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.SemiBold)
                            Spacer(Modifier.height(8.dp))
                            Text(
                                text = "Target language for translated speech bubbles (ISO 639-1, e.g., en, es, fr, ja)",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            Spacer(Modifier.height(8.dp))
                            OutlinedTextField(
                                value = targetLang.value,
                                onValueChange = {
                                    targetLang.value = it
                                    val current = viewModel.apiSettings.value.comicApis
                                    viewModel.updateComicApiSettings(current.copy(geminiTargetLanguage = it.take(8)))
                                },
                                label = { Text(text = "Target language code") },
                                singleLine = true,
                                modifier = Modifier.fillMaxWidth()
                            )
                        }
                    }
                }
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        Row(
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Info,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = "API Information",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.SemiBold,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                        Spacer(modifier = Modifier.height(8.dp))
                        Text(
                            text = "APIs are checked in priority order. Free APIs are used first when available. API keys are stored securely on your device.",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.onPrimaryContainer
                        )
                    }
                }
            }
        }
    }
}

@Composable
fun ApiProviderCard(
    provider: ApiProvider,
    onToggle: (Boolean) -> Unit,
    onApiKeyChange: (String) -> Unit
) {
    val context = LocalContext.current
    var showApiKey by remember { mutableStateOf(false) }
    var apiKeyText by remember { mutableStateOf(provider.apiKey) }

    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
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
                        text = provider.name,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold
                    )
                    Text(
                        text = provider.description,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }

                Switch(
                    checked = provider.isEnabled,
                    onCheckedChange = onToggle
                )
            }

            if (provider.requiresApiKey && provider.isEnabled) {
                Spacer(modifier = Modifier.height(12.dp))
                OutlinedTextField(
                    value = apiKeyText,
                    onValueChange = {
                        apiKeyText = it
                        onApiKeyChange(it)
                    },
                    label = { Text("API Key") },
                    placeholder = { Text("Enter your ${provider.name} API key") },
                    modifier = Modifier.fillMaxWidth(),
                    visualTransformation = if (showApiKey) VisualTransformation.None else PasswordVisualTransformation(),
                    trailingIcon = {
                        IconButton(onClick = { showApiKey = !showApiKey }) {
                            Icon(
                                imageVector = if (showApiKey) Icons.Default.VisibilityOff else Icons.Default.Visibility,
                                contentDescription = if (showApiKey) "Hide API key" else "Show API key"
                            )
                        }
                    },
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Password),
                    singleLine = true
                )

                if (provider.website.isNotEmpty()) {
                    Spacer(modifier = Modifier.height(8.dp))
                    TextButton(
                        onClick = {
                            try {
                                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(provider.website))
                                context.startActivity(intent)
                            } catch (e: Exception) {
                                // Handle error - could show a toast or snackbar
                            }
                        }
                    ) {
                        Icon(
                            imageVector = Icons.Default.Launch,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Get API Key")
                    }
                }
            }
        }
    }
}

private fun updateProviderSettings(
    viewModel: SettingsViewModel,
    mediaType: String,
    providerName: String,
    enabled: Boolean,
    apiKey: String
) {
    when (mediaType) {
        "books" -> {
            val current = viewModel.apiSettings.value.bookApis
            val updated = when (providerName) {
                "Open Library" -> current.copy(openLibraryEnabled = enabled)
                "Google Books" -> current.copy(googleBooksEnabled = enabled, googleBooksApiKey = apiKey)
                "Hardcover" -> current.copy(hardcoverEnabled = enabled)
                "ISBN DB" -> current.copy(isbnDbEnabled = enabled, isbnDbApiKey = apiKey)
                "Goodreads" -> current.copy(goodreadsEnabled = enabled, goodreadsApiKey = apiKey)
                "Amazon Product Advertising" -> current.copy(amazonEnabled = enabled, amazonApiKey = apiKey)
                "ISFDB" -> current.copy(isfdbEnabled = enabled)
                "Fantastic Fiction" -> current.copy(fantasticFictionEnabled = enabled)
                "FictionDB" -> current.copy(fictionDbEnabled = enabled)
                "Library Thing" -> current.copy(libraryThingEnabled = enabled, libraryThingApiKey = apiKey)
                "WorldCat" -> current.copy(worldCatEnabled = enabled, worldCatApiKey = apiKey)
                else -> current
            }
            viewModel.updateBookApiSettings(updated)
        }
        "comics" -> {
            val current = viewModel.apiSettings.value.comicApis
            val updated = when (providerName) {
                "ComicVine" -> current.copy(comicVineEnabled = enabled, comicVineApiKey = apiKey)
                "Manga Updates" -> current.copy(mangaUpdatesEnabled = enabled)
                "Gemini 2.5 Bubble Translation" -> current.copy(geminiBubbleTranslationEnabled = enabled)
                else -> current
            }
            viewModel.updateComicApiSettings(updated)
        }
        "audiobooks" -> {
            val current = viewModel.apiSettings.value.audiobookApis
            val updated = when (providerName) {
                "OverDrive" -> current.copy(overDriveEnabled = enabled, overDriveApiKey = apiKey)
                "Audible" -> current.copy(audibleEnabled = enabled, audibleApiKey = apiKey)
                "LibriVox" -> current.copy(librivoxEnabled = enabled)
                else -> current
            }
            viewModel.updateAudiobookApiSettings(updated)
        }
        "movies" -> {
            val current = viewModel.apiSettings.value.movieTvApis
            val updated = when (providerName) {
                "TMDB" -> current.copy(tmdbEnabled = enabled, tmdbApiKey = apiKey)
                "OMDb" -> current.copy(omdbEnabled = enabled, omdbApiKey = apiKey)
                "IMDB" -> current.copy(imdbEnabled = enabled, imdbApiKey = apiKey)
                "TVDB" -> current.copy(tvdbEnabled = enabled, tvdbApiKey = apiKey)
                "NYT Movie Reviews" -> current.copy(nytMovieReviewsEnabled = enabled, nytApiKey = apiKey)
                "YouTube Trailers" -> current.copy(youtubeTrailersEnabled = enabled, youtubeApiKey = apiKey)
                "Guidebox" -> current.copy(guideboxEnabled = enabled, guideboxApiKey = apiKey)
                else -> current
            }
            viewModel.updateMovieTvApiSettings(updated)
        }
        "music" -> {
            val current = viewModel.apiSettings.value.musicApis
            val updated = when (providerName) {
                "MusicBrainz" -> current.copy(musicBrainzEnabled = enabled)
                "Spotify" -> current.copy(spotifyEnabled = enabled, spotifyClientId = apiKey)
                "Discogs" -> current.copy(discogsEnabled = enabled, discogsApiKey = apiKey)
                "Last.fm" -> current.copy(lastFmEnabled = enabled, lastFmApiKey = apiKey)
                "Radio Browser" -> current.copy(radioBrowserEnabled = enabled)
                "AudioDB" -> current.copy(audioDBEnabled = enabled, audioDBApiKey = apiKey)
                "Deezer" -> current.copy(deezerEnabled = enabled)
                "Napster" -> current.copy(napsterEnabled = enabled, napsterApiKey = apiKey)
                else -> current
            }
            viewModel.updateMusicApiSettings(updated)
        }
    }
}

private fun getBooksProviders(settings: BookApiSettings): List<ApiProvider> = listOf(
    ApiProvider(
        name = "Open Library",
        description = "Free bibliographic information",
        requiresApiKey = false,
        isEnabled = settings.openLibraryEnabled,
        website = "https://openlibrary.org/developers/api",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Google Books",
        description = "Full-text search and book information",
        requiresApiKey = true,
        isEnabled = settings.googleBooksEnabled,
        apiKey = settings.googleBooksApiKey,
        website = "https://developers.google.com/books",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Hardcover",
        description = "Modern Goodreads alternative",
        requiresApiKey = false,
        isEnabled = settings.hardcoverEnabled,
        website = "https://hardcover.app/graphql",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "ISBN DB",
        description = "ISBN database lookup",
        requiresApiKey = true,
        isEnabled = settings.isbnDbEnabled,
        apiKey = settings.isbnDbApiKey,
        website = "https://isbndb.com/apidocs",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Goodreads",
        description = "Community book recommendations",
        requiresApiKey = true,
        isEnabled = settings.goodreadsEnabled,
        apiKey = settings.goodreadsApiKey,
        website = "https://www.goodreads.com/api",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Amazon Product Advertising",
        description = "Amazon book metadata",
        requiresApiKey = true,
        isEnabled = settings.amazonEnabled,
        apiKey = settings.amazonApiKey,
        website = "https://webservices.amazon.com/paapi5/documentation/",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "ISFDB",
        description = "Internet Speculative Fiction Database",
        requiresApiKey = false,
        isEnabled = settings.isfdbEnabled,
        website = "http://www.isfdb.org/wiki/index.php/Web_API",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Fantastic Fiction",
        description = "Author and series information",
        requiresApiKey = false,
        isEnabled = settings.fantasticFictionEnabled,
        website = "https://www.fantasticfiction.com/",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "FictionDB",
        description = "Romance and fiction database",
        requiresApiKey = false,
        isEnabled = settings.fictionDbEnabled,
        website = "https://www.fictiondb.com/",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "Library Thing",
        description = "Social cataloging website",
        requiresApiKey = true,
        isEnabled = settings.libraryThingEnabled,
        apiKey = settings.libraryThingApiKey,
        website = "https://www.librarything.com/services/",
        mediaType = MediaType.BOOKS
    ),
    ApiProvider(
        name = "WorldCat",
        description = "OCLC global library catalog",
        requiresApiKey = true,
        isEnabled = settings.worldCatEnabled,
        apiKey = settings.worldCatApiKey,
        website = "https://www.oclc.org/developer/develop/web-services.en.html",
        mediaType = MediaType.BOOKS
    )
)

private fun getComicsProviders(settings: ComicApiSettings): List<ApiProvider> = listOf(
    ApiProvider(
        name = "ComicVine",
        description = "Comprehensive comic book database",
        requiresApiKey = true,
        isEnabled = settings.comicVineEnabled,
        apiKey = settings.comicVineApiKey,
        website = "https://comicvine.gamespot.com/api/",
        mediaType = MediaType.COMICS
    ),
    ApiProvider(
        name = "Manga Updates",
        description = "Manga and light novel database",
        requiresApiKey = false,
        isEnabled = settings.mangaUpdatesEnabled,
        website = "https://www.mangaupdates.com/",
        mediaType = MediaType.COMICS
    ),
    ApiProvider(
        name = "Gemini 2.5 Bubble Translation",
        description = "Translate speech bubbles via Gemini 2.5",
        requiresApiKey = false,
        isEnabled = settings.geminiBubbleTranslationEnabled,
        website = "https://ai.google.dev/",
        mediaType = MediaType.COMICS
    )
)

private fun getAudiobooksProviders(settings: AudiobookApiSettings): List<ApiProvider> = listOf(
    ApiProvider(
        name = "OverDrive",
        description = "Audiobook metadata service",
        requiresApiKey = true,
        isEnabled = settings.overDriveEnabled,
        apiKey = settings.overDriveApiKey,
        website = "https://developer.overdrive.com/",
        mediaType = MediaType.AUDIOBOOKS
    ),
    ApiProvider(
        name = "Audible",
        description = "Amazon Audible audiobook database",
        requiresApiKey = true,
        isEnabled = settings.audibleEnabled,
        apiKey = settings.audibleApiKey,
        website = "https://www.audible.com/",
        mediaType = MediaType.AUDIOBOOKS
    ),
    ApiProvider(
        name = "LibriVox",
        description = "Free public domain audiobooks",
        requiresApiKey = false,
        isEnabled = settings.librivoxEnabled,
        website = "https://librivox.org/api/info",
        mediaType = MediaType.AUDIOBOOKS
    )
)

private fun getMoviesProviders(settings: MovieTvApiSettings): List<ApiProvider> = listOf(
    ApiProvider(
        name = "TMDB",
        description = "The Movie Database - community-built",
        requiresApiKey = true,
        isEnabled = settings.tmdbEnabled,
        apiKey = settings.tmdbApiKey,
        website = "https://www.themoviedb.org/documentation/api",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "OMDb",
        description = "The Open Movie Database",
        requiresApiKey = true,
        isEnabled = settings.omdbEnabled,
        apiKey = settings.omdbApiKey,
        website = "https://www.omdbapi.com/",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "IMDB",
        description = "Internet Movie Database",
        requiresApiKey = true,
        isEnabled = settings.imdbEnabled,
        apiKey = settings.imdbApiKey,
        website = "https://developer.imdb.com/",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "TVDB",
        description = "TheTVDB - TV series database",
        requiresApiKey = true,
        isEnabled = settings.tvdbEnabled,
        apiKey = settings.tvdbApiKey,
        website = "https://thetvdb.com/api-information",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "NYT Movie Reviews",
        description = "New York Times movie reviews and critics picks",
        requiresApiKey = true,
        isEnabled = settings.nytMovieReviewsEnabled,
        apiKey = settings.nytApiKey,
        website = "https://developer.nytimes.com/docs/movie-reviews-api/1/overview",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "YouTube Trailers",
        description = "Official movie trailers from YouTube",
        requiresApiKey = true,
        isEnabled = settings.youtubeTrailersEnabled,
        apiKey = settings.youtubeApiKey,
        website = "https://developers.google.com/youtube/v3/getting-started",
        mediaType = MediaType.MOVIES_TV
    ),
    ApiProvider(
        name = "Guidebox",
        description = "Movie trailers and streaming availability",
        requiresApiKey = true,
        isEnabled = settings.guideboxEnabled,
        apiKey = settings.guideboxApiKey,
        website = "https://www.guidebox.com/",
        mediaType = MediaType.MOVIES_TV
    )
)

private fun getMusicProviders(settings: MusicApiSettings): List<ApiProvider> = listOf(
    ApiProvider(
        name = "MusicBrainz",
        description = "Open music encyclopedia",
        requiresApiKey = false,
        isEnabled = settings.musicBrainzEnabled,
        website = "https://musicbrainz.org/doc/Development",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Spotify",
        description = "Comprehensive music data",
        requiresApiKey = true,
        isEnabled = settings.spotifyEnabled,
        apiKey = settings.spotifyClientId,
        website = "https://developer.spotify.com/documentation/web-api",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Discogs",
        description = "Music database and marketplace",
        requiresApiKey = true,
        isEnabled = settings.discogsEnabled,
        apiKey = settings.discogsApiKey,
        website = "https://www.discogs.com/developers",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Last.fm",
        description = "Music metadata and scrobbling",
        requiresApiKey = true,
        isEnabled = settings.lastFmEnabled,
        apiKey = settings.lastFmApiKey,
        website = "https://www.last.fm/api",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Radio Browser",
        description = "Free radio station directory",
        requiresApiKey = false,
        isEnabled = settings.radioBrowserEnabled,
        website = "https://api.radio-browser.info/",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "AudioDB",
        description = "Music and artist metadata database",
        requiresApiKey = true,
        isEnabled = settings.audioDBEnabled,
        apiKey = settings.audioDBApiKey,
        website = "https://www.theaudiodb.com/api_guide.php",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Deezer",
        description = "Music streaming service with free API",
        requiresApiKey = false,
        isEnabled = settings.deezerEnabled,
        website = "https://developers.deezer.com/api",
        mediaType = MediaType.MUSIC
    ),
    ApiProvider(
        name = "Napster",
        description = "Music streaming and metadata",
        requiresApiKey = true,
        isEnabled = settings.napsterEnabled,
        apiKey = settings.napsterApiKey,
        website = "https://developer.napster.com/",
        mediaType = MediaType.MUSIC
    )
)
