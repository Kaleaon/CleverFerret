package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Backup
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Settings
import androidx.compose.material.icons.filled.Visibility
import androidx.compose.material.icons.filled.VisibilityOff
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.text.input.VisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController

/**
 * API Settings Screen
 * 
 * Configure API keys for external services organized by category:
 * - Text-to-Speech APIs
 * - Metadata APIs
 * - Podcast APIs
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiSettingsScreen(
    navController: NavController,
    viewModel: ApiSettingsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val scrollState = rememberScrollState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("API Keys & Services") },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    // Backup settings button
                    IconButton(onClick = { viewModel.backupSettings() }) {
                        Icon(
                            Icons.Default.Backup,
                            contentDescription = "Backup Settings",
                            tint = MaterialTheme.colorScheme.primary
                        )
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .verticalScroll(scrollState)
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            // Intro text
            Card(
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            ) {
                Column(
                    modifier = Modifier.padding(16.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = "External API Configuration",
                        style = MaterialTheme.typography.titleMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Text(
                        text = "Configure API keys for external services. All keys are stored securely using encrypted storage.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
            
            // === TEXT-TO-SPEECH SECTION ===
            SectionHeader(
                title = "Text-to-Speech APIs",
                subtitle = "Premium voice synthesis services"
            )

            // Gemini AI
            ApiKeySection(
                title = "Gemini (Google AI)",
                description = "High-quality multilingual TTS with natural voices",
                apiKey = uiState.geminiApiKey,
                onApiKeyChange = { viewModel.setGeminiApiKey(it) },
                isConfigured = uiState.isGeminiConfigured,
                getKeyUrl = "https://aistudio.google.com/app/apikey",
                docsUrl = "https://ai.google.dev/gemini-api/docs/text-generation"
            )

            Divider()

            // OpenAI
            ApiKeySection(
                title = "OpenAI",
                description = "Premium TTS with multiple voice options (alloy, echo, fable, onyx, nova, shimmer)",
                apiKey = uiState.openaiApiKey,
                onApiKeyChange = { viewModel.setOpenAiApiKey(it) },
                isConfigured = uiState.isOpenAiConfigured,
                getKeyUrl = "https://platform.openai.com/api-keys",
                docsUrl = "https://platform.openai.com/docs/guides/text-to-speech"
            )

            Divider()

            // ElevenLabs
            ApiKeySection(
                title = "ElevenLabs",
                description = "Ultra-realistic AI voices with emotion and inflection",
                apiKey = uiState.elevenLabsApiKey,
                onApiKeyChange = { viewModel.setElevenLabsApiKey(it) },
                isConfigured = uiState.isElevenLabsConfigured,
                getKeyUrl = "https://elevenlabs.io/app/settings/api-keys",
                docsUrl = "https://elevenlabs.io/docs/api-reference/text-to-speech"
            )

            Divider()

            // Google Cloud TTS
            ApiKeySection(
                title = "Google Cloud TTS",
                description = "Professional-grade TTS with 380+ voices in 50+ languages",
                apiKey = uiState.googleCloudApiKey,
                onApiKeyChange = { viewModel.setGoogleCloudApiKey(it) },
                isConfigured = uiState.isGoogleCloudConfigured,
                getKeyUrl = "https://console.cloud.google.com/apis/credentials",
                docsUrl = "https://cloud.google.com/text-to-speech/docs"
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // === METADATA SECTION ===
            SectionHeader(
                title = "Metadata APIs",
                subtitle = "Enhanced media information and artwork"
            )

            // TheMovieDB
            ApiKeySection(
                title = "TheMovieDB (TMDB)",
                description = "Movie and TV show metadata, posters, and information",
                apiKey = uiState.tmdbApiKey,
                onApiKeyChange = { viewModel.setTmdbApiKey(it) },
                isConfigured = uiState.isTmdbConfigured,
                getKeyUrl = "https://www.themoviedb.org/settings/api",
                docsUrl = "https://developers.themoviedb.org/3"
            )

            Divider()

            // MusicBrainz
            ApiKeySection(
                title = "MusicBrainz",
                description = "Music metadata, album information, and artist details",
                apiKey = uiState.musicBrainzApiKey,
                onApiKeyChange = { viewModel.setMusicBrainzApiKey(it) },
                isConfigured = uiState.isMusicBrainzConfigured,
                getKeyUrl = "https://musicbrainz.org/doc/MusicBrainz_API",
                docsUrl = "https://musicbrainz.org/doc/MusicBrainz_API",
                note = "Optional: Improves rate limits"
            )

            Divider()

            // Google Books
            ApiKeySection(
                title = "Google Books API",
                description = "Book metadata, covers, descriptions, and ISBNs",
                apiKey = uiState.googleBooksApiKey,
                onApiKeyChange = { viewModel.setGoogleBooksApiKey(it) },
                isConfigured = uiState.isGoogleBooksConfigured,
                getKeyUrl = "https://console.cloud.google.com/apis/credentials",
                docsUrl = "https://developers.google.com/books/docs/v1/using"
            )

            Divider()

            // Open Library
            ApiKeySection(
                title = "Open Library",
                description = "Free book metadata and cover images",
                apiKey = uiState.openLibraryApiKey,
                onApiKeyChange = { viewModel.setOpenLibraryApiKey(it) },
                isConfigured = uiState.isOpenLibraryConfigured,
                getKeyUrl = "https://openlibrary.org/developers/api",
                docsUrl = "https://openlibrary.org/developers/api",
                note = "No API key required (rate-limited)"
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // === PODCAST SECTION ===
            SectionHeader(
                title = "Podcast APIs",
                subtitle = "Podcast discovery and metadata"
            )

            // Podcast Index
            ApiKeySection(
                title = "Podcast Index",
                description = "Open podcast directory with 4M+ podcasts",
                apiKey = uiState.podcastIndexApiKey,
                onApiKeyChange = { viewModel.setPodcastIndexApiKey(it) },
                isConfigured = uiState.isPodcastIndexConfigured,
                getKeyUrl = "https://api.podcastindex.org/signup",
                docsUrl = "https://podcastindex-org.github.io/docs-api/"
            )

            Divider()

            // iTunes/Apple Podcasts
            ApiKeySection(
                title = "iTunes Podcast API",
                description = "Apple's podcast directory and metadata",
                apiKey = uiState.itunesApiKey,
                onApiKeyChange = { viewModel.setItunesApiKey(it) },
                isConfigured = uiState.isItunesConfigured,
                getKeyUrl = "https://developer.apple.com/",
                docsUrl = "https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/",
                note = "No API key required (rate-limited)"
            )

            Divider()

            // ListenNotes
            ApiKeySection(
                title = "Listen Notes",
                description = "Podcast search engine and database",
                apiKey = uiState.listenNotesApiKey,
                onApiKeyChange = { viewModel.setListenNotesApiKey(it) },
                isConfigured = uiState.isListenNotesConfigured,
                getKeyUrl = "https://www.listennotes.com/api/",
                docsUrl = "https://www.listennotes.com/api/docs/"
            )

            // Save/Backup status
            if (uiState.saveSuccess) {
                Spacer(modifier = Modifier.height(8.dp))
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Check,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onTertiaryContainer
                        )
                        Text(
                            text = "API keys saved successfully",
                            color = MaterialTheme.colorScheme.onTertiaryContainer
                        )
                    }
                }
            }
            
            // Backup success message
            uiState.backupMessage?.let { message ->
                Spacer(modifier = Modifier.height(8.dp))
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = if (uiState.backupSuccess) 
                            MaterialTheme.colorScheme.tertiaryContainer 
                        else 
                            MaterialTheme.colorScheme.errorContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            if (uiState.backupSuccess) Icons.Default.Check else Icons.Default.Backup,
                            contentDescription = null,
                            tint = if (uiState.backupSuccess) 
                                MaterialTheme.colorScheme.onTertiaryContainer 
                            else 
                                MaterialTheme.colorScheme.onErrorContainer
                        )
                        Text(
                            text = message,
                            color = if (uiState.backupSuccess) 
                                MaterialTheme.colorScheme.onTertiaryContainer 
                            else 
                                MaterialTheme.colorScheme.onErrorContainer
                        )
                    }
                }
            }

            Spacer(modifier = Modifier.height(32.dp))
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    subtitle: String
) {
    Column(
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        Text(
            text = title,
            style = MaterialTheme.typography.headlineSmall,
            color = MaterialTheme.colorScheme.primary
        )
        Text(
            text = subtitle,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun ApiKeySection(
    title: String,
    description: String,
    apiKey: String,
    onApiKeyChange: (String) -> Unit,
    isConfigured: Boolean,
    getKeyUrl: String,
    docsUrl: String,
    note: String? = null
) {
    var isPasswordVisible by remember { mutableStateOf(false) }

    Column(
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        // Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Column(modifier = Modifier.weight(1f)) {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = title,
                        style = MaterialTheme.typography.titleMedium
                    )
                    
                    // Gear icon for unconfigured APIs
                    if (!isConfigured) {
                        Icon(
                            Icons.Default.Settings,
                            contentDescription = "Needs configuration",
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(20.dp)
                        )
                    }
                }
                
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            if (isConfigured) {
                AssistChip(
                    onClick = { },
                    label = { Text("Configured") },
                    leadingIcon = {
                        Icon(
                            Icons.Default.Check,
                            contentDescription = null,
                            modifier = Modifier.size(16.dp)
                        )
                    },
                    colors = AssistChipDefaults.assistChipColors(
                        containerColor = MaterialTheme.colorScheme.tertiaryContainer
                    )
                )
            }
        }

        // API Key input
        OutlinedTextField(
            value = apiKey,
            onValueChange = onApiKeyChange,
            label = { Text("API Key") },
            placeholder = { Text("sk-...") },
            modifier = Modifier.fillMaxWidth(),
            visualTransformation = if (isPasswordVisible) 
                VisualTransformation.None 
            else 
                PasswordVisualTransformation(),
            trailingIcon = {
                IconButton(onClick = { isPasswordVisible = !isPasswordVisible }) {
                    Icon(
                        if (isPasswordVisible) Icons.Default.Visibility else Icons.Default.VisibilityOff,
                        contentDescription = if (isPasswordVisible) "Hide" else "Show"
                    )
                }
            },
            singleLine = true
        )

        // Note (if provided)
        note?.let {
            Text(
                text = it,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                modifier = Modifier.padding(top = 4.dp)
            )
        }

        // Links
        Row(
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            TextButton(
                onClick = { 
                    // Open URL in browser
                    val intent = android.content.Intent(
                        android.content.Intent.ACTION_VIEW,
                        android.net.Uri.parse(getKeyUrl)
                    )
                    intent.flags = android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                    androidx.compose.ui.platform.LocalContext.current.startActivity(intent)
                }
            ) {
                Text("Get API Key →")
            }
            
            TextButton(
                onClick = { 
                    // Open documentation in browser
                    val intent = android.content.Intent(
                        android.content.Intent.ACTION_VIEW,
                        android.net.Uri.parse(docsUrl)
                    )
                    intent.flags = android.content.Intent.FLAG_ACTIVITY_NEW_TASK
                    androidx.compose.ui.platform.LocalContext.current.startActivity(intent)
                }
            ) {
                Text("Documentation")
            }
        }
    }
}
