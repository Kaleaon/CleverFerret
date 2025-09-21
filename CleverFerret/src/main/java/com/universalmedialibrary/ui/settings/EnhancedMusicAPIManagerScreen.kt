package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

/**
 * Enhanced Music API Manager based on 47 Music Data APIs from SoundCharts 2025 Guide
 * 
 * Comprehensive integration for music metadata collection from multiple categories:
 * - Music Metadata APIs
 * - DSP (Digital Service Provider) APIs  
 * - Music Analytics APIs
 * - Audio Analysis APIs
 * - Lyrics APIs
 * - Audio Content APIs
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedMusicAPIManagerScreen(
    onNavigateBack: () -> Unit
) {
    var selectedCategory by remember { mutableStateOf(MusicAPICategory.METADATA) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Enhanced Music APIs",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(
                            Icons.AutoMirrored.Filled.ArrowBack, 
                            contentDescription = "Back"
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Info Card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
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
                            Icons.Default.LibraryMusic,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(32.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                text = "47 Music Data APIs - 2025 Edition",
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Professional music metadata collection from multiple specialized sources",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }
            }

            // Category Tabs
            ScrollableTabRow(
                selectedTabIndex = selectedCategory.ordinal,
                containerColor = MaterialTheme.colorScheme.surface
            ) {
                MusicAPICategory.values().forEach { category ->
                    Tab(
                        selected = selectedCategory == category,
                        onClick = { selectedCategory = category },
                        text = { 
                            Text(
                                category.displayName,
                                style = MaterialTheme.typography.labelMedium
                            )
                        },
                        icon = {
                            Icon(
                                category.icon,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    )
                }
            }

            // API List by Category
            LazyColumn(
                modifier = Modifier.fillMaxSize(),
                contentPadding = PaddingValues(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(getMusicAPIsByCategory(selectedCategory)) { apiConfig ->
                    EnhancedMusicAPICard(apiConfig = apiConfig)
                }
            }
        }
    }
}

enum class MusicAPICategory(
    val displayName: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    METADATA("Metadata", Icons.Default.Label),
    DSP("Streaming", Icons.Default.CloudQueue),
    ANALYTICS("Analytics", Icons.Default.Analytics),
    AUDIO_ANALYSIS("Audio Analysis", Icons.Default.Waveform),
    LYRICS("Lyrics", Icons.Default.Notes),
    AUDIO_CONTENT("Audio Content", Icons.Default.AudioFile)
}

data class EnhancedMusicAPIConfig(
    val key: String,
    val displayName: String,
    val description: String,
    val website: String,
    val category: MusicAPICategory,
    val isFree: Boolean,
    val isRecommended: Boolean = false,
    val features: List<String>,
    val setupComplexity: String, // "Easy", "Medium", "Complex"
    val dataQuality: String // "High", "Medium", "Basic"
)

@Composable
fun EnhancedMusicAPICard(apiConfig: EnhancedMusicAPIConfig) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 4.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            // Header Row
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column(modifier = Modifier.weight(1f)) {
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = apiConfig.displayName,
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Bold
                        )
                        
                        Spacer(modifier = Modifier.width(8.dp))
                        
                        if (apiConfig.isFree) {
                            APIBadge(text = "FREE", color = MaterialTheme.colorScheme.primaryContainer)
                        }
                        
                        if (apiConfig.isRecommended) {
                            APIBadge(text = "RECOMMENDED", color = MaterialTheme.colorScheme.secondaryContainer)
                        }
                    }
                    
                    Text(
                        text = apiConfig.description,
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(top = 4.dp)
                    )
                }
                
                Column(
                    horizontalAlignment = Alignment.End
                ) {
                    APIQualityChip(apiConfig.dataQuality)
                    Spacer(modifier = Modifier.height(4.dp))
                    APIComplexityChip(apiConfig.setupComplexity)
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Features
            Text(
                text = "Key Features:",
                style = MaterialTheme.typography.labelMedium,
                fontWeight = FontWeight.Medium
            )
            
            apiConfig.features.forEach { feature ->
                Row(
                    modifier = Modifier.padding(vertical = 2.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Icon(
                        Icons.Default.CheckCircle,
                        contentDescription = null,
                        modifier = Modifier.size(12.dp),
                        tint = MaterialTheme.colorScheme.primary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text(
                        text = feature,
                        style = MaterialTheme.typography.bodySmall
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Action Buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = { /* Open website */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.OpenInNew, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Visit")
                }
                
                Button(
                    onClick = { /* Configure API */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Settings, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Configure")
                }
            }
        }
    }
}

@Composable
fun APIBadge(text: String, color: androidx.compose.ui.graphics.Color) {
    Surface(
        color = color,
        shape = MaterialTheme.shapes.small
    ) {
        Text(
            text = text,
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
        )
    }
}

@Composable
fun APIQualityChip(quality: String) {
    val color = when (quality) {
        "High" -> MaterialTheme.colorScheme.primaryContainer
        "Medium" -> MaterialTheme.colorScheme.secondaryContainer
        else -> MaterialTheme.colorScheme.surfaceVariant
    }
    
    Surface(
        color = color,
        shape = MaterialTheme.shapes.small
    ) {
        Text(
            text = "Quality: $quality",
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
        )
    }
}

@Composable
fun APIComplexityChip(complexity: String) {
    val color = when (complexity) {
        "Easy" -> MaterialTheme.colorScheme.primaryContainer
        "Medium" -> MaterialTheme.colorScheme.secondaryContainer
        else -> MaterialTheme.colorScheme.errorContainer
    }
    
    Surface(
        color = color,
        shape = MaterialTheme.shapes.small
    ) {
        Text(
            text = "Setup: $complexity",
            style = MaterialTheme.typography.labelSmall,
            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp)
        )
    }
}

fun getMusicAPIsByCategory(category: MusicAPICategory): List<EnhancedMusicAPIConfig> {
    return when (category) {
        MusicAPICategory.METADATA -> getMetadataAPIs()
        MusicAPICategory.DSP -> getDSPAPIs()
        MusicAPICategory.ANALYTICS -> getAnalyticsAPIs()
        MusicAPICategory.AUDIO_ANALYSIS -> getAudioAnalysisAPIs()
        MusicAPICategory.LYRICS -> getLyricsAPIs()
        MusicAPICategory.AUDIO_CONTENT -> getAudioContentAPIs()
    }
}

fun getMetadataAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "musicbrainz",
        displayName = "MusicBrainz",
        description = "Open music encyclopedia with comprehensive metadata collection",
        website = "https://musicbrainz.org/doc/MusicBrainz_API",
        category = MusicAPICategory.METADATA,
        isFree = true,
        isRecommended = true,
        features = listOf("Artist info", "Album details", "Track metadata", "Release relationships", "Cover art"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "discogs",
        displayName = "Discogs",
        description = "Comprehensive music database and marketplace with detailed discography",
        website = "https://www.discogs.com/developers/",
        category = MusicAPICategory.METADATA,
        isFree = true,
        isRecommended = true,
        features = listOf("Detailed discography", "Marketplace data", "Release versions", "Label information", "Artist credits"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "lastfm",
        displayName = "Last.fm",
        description = "Music statistics and recommendation system with social features",
        website = "https://www.last.fm/api",
        category = MusicAPICategory.METADATA,
        isFree = true,
        features = listOf("Scrobbling data", "Artist bio", "Similar artists", "Top tracks", "User statistics"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "theaudiodb",
        displayName = "TheAudioDB",
        description = "Community database with music artwork, metadata and charts",
        website = "https://www.theaudiodb.com/api_guide.php",
        category = MusicAPICategory.METADATA,
        isFree = true,
        features = listOf("High-quality artwork", "Biography", "Charts data", "Album reviews", "Music videos"),
        setupComplexity = "Easy",
        dataQuality = "Medium"
    ),
    EnhancedMusicAPIConfig(
        key = "gracenote",
        displayName = "Gracenote",
        description = "Professional music recognition and metadata platform",
        website = "https://developer.tmsapi.com/",
        category = MusicAPICategory.METADATA,
        isFree = false,
        isRecommended = true,
        features = listOf("Audio fingerprinting", "Professional metadata", "Genre classification", "Mood detection", "Content recognition"),
        setupComplexity = "Complex",
        dataQuality = "High"
    )
)

fun getDSPAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "spotify",
        displayName = "Spotify Web API",
        description = "Access Spotify's music catalog, playlists, and user data",
        website = "https://developer.spotify.com/documentation/web-api/",
        category = MusicAPICategory.DSP,
        isFree = true,
        isRecommended = true,
        features = listOf("Music catalog", "Playlists", "Audio features", "User data", "Search functionality"),
        setupComplexity = "Medium",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "apple_music",
        displayName = "Apple Music API",
        description = "Apple's music streaming service integration",
        website = "https://developer.apple.com/documentation/applemusicapi",
        category = MusicAPICategory.DSP,
        isFree = true,
        features = listOf("Apple Music catalog", "User library", "Playlists", "Recommendations", "Charts"),
        setupComplexity = "Complex",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "deezer",
        displayName = "Deezer API",
        description = "French digital music streaming platform",
        website = "https://developers.deezer.com/api",
        category = MusicAPICategory.DSP,
        isFree = true,
        features = listOf("Music catalog", "Radio stations", "Playlists", "Charts", "User favorites"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "soundcloud",
        displayName = "SoundCloud API",
        description = "Audio platform for creators and independent artists",
        website = "https://developers.soundcloud.com/",
        category = MusicAPICategory.DSP,
        isFree = true,
        features = listOf("Independent music", "Podcasts", "User uploads", "Comments", "Social features"),
        setupComplexity = "Medium",
        dataQuality = "Medium"
    )
)

fun getAnalyticsAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "soundcharts",
        displayName = "Soundcharts API",
        description = "Unified music industry analytics from 35+ sources",
        website = "https://soundcharts.com/api-data-for-music-industry",
        category = MusicAPICategory.ANALYTICS,
        isFree = false,
        isRecommended = true,
        features = listOf("Multi-platform analytics", "Chart performance", "Social media metrics", "Radio airplay", "Playlist tracking"),
        setupComplexity = "Medium",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "chartmetric",
        displayName = "Chartmetric API",
        description = "Music analytics from streaming platforms and social media",
        website = "https://api.chartmetric.com/apidoc/",
        category = MusicAPICategory.ANALYTICS,
        isFree = false,
        features = listOf("Streaming analytics", "Social media tracking", "Playlist monitoring", "Market insights", "A&R tools"),
        setupComplexity = "Medium",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "songstats",
        displayName = "Songstats API",
        description = "Performance tracking across streaming services",
        website = "https://docs.songstats.com/",
        category = MusicAPICategory.ANALYTICS,
        isFree = false,
        features = listOf("Performance tracking", "Revenue analytics", "Platform comparison", "Growth metrics", "Artist insights"),
        setupComplexity = "Easy",
        dataQuality = "High"
    )
)

fun getAudioAnalysisAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "auphonic",
        displayName = "Auphonic API",
        description = "Automatic audio post-production for podcasts and music",
        website = "https://auphonic.com/help/api/",
        category = MusicAPICategory.AUDIO_ANALYSIS,
        isFree = false,
        features = listOf("Audio leveling", "Noise reduction", "Speech enhancement", "Automatic mastering", "Quality analysis"),
        setupComplexity = "Medium",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "ai_mastering",
        displayName = "AI Mastering API",
        description = "AI-powered audio mastering and quality improvement",
        website = "https://aimastering.com/api_docs/",
        category = MusicAPICategory.AUDIO_ANALYSIS,
        isFree = false,
        features = listOf("AI mastering", "Audio analysis", "Quality enhancement", "Loudness optimization", "EQ suggestions"),
        setupComplexity = "Easy",
        dataQuality = "High"
    )
)

fun getLyricsAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "musixmatch",
        displayName = "Musixmatch API",
        description = "World's largest lyrics database with AI technology",
        website = "https://developer.musixmatch.com/",
        category = MusicAPICategory.LYRICS,
        isFree = true,
        isRecommended = true,
        features = listOf("Lyrics database", "Translations", "Synced lyrics", "Mood detection", "Language detection"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "genius",
        displayName = "Genius API",
        description = "Lyrics with annotations and cultural context",
        website = "https://docs.genius.com/",
        category = MusicAPICategory.LYRICS,
        isFree = true,
        features = listOf("Annotated lyrics", "Song meanings", "Artist info", "Cultural context", "User contributions"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "lyrics_ovh",
        displayName = "Lyrics.ovh API",
        description = "Simple and fast lyrics retrieval service",
        website = "https://lyricsovh.docs.apiary.io/",
        category = MusicAPICategory.LYRICS,
        isFree = true,
        features = listOf("Fast lyrics search", "Clean API", "No registration", "Simple integration", "Reliable uptime"),
        setupComplexity = "Easy",
        dataQuality = "Medium"
    )
)

fun getAudioContentAPIs(): List<EnhancedMusicAPIConfig> = listOf(
    EnhancedMusicAPIConfig(
        key = "freesound",
        displayName = "Freesound API",
        description = "Collaborative database of Creative Commons sounds",
        website = "https://freesound.org/docs/api/",
        category = MusicAPICategory.AUDIO_CONTENT,
        isFree = true,
        isRecommended = true,
        features = listOf("Creative Commons audio", "Sound effects", "Samples", "Field recordings", "User uploads"),
        setupComplexity = "Easy",
        dataQuality = "High"
    ),
    EnhancedMusicAPIConfig(
        key = "jamendo",
        displayName = "Jamendo API",
        description = "Independent music platform with free and licensed tracks",
        website = "https://developer.jamendo.com/v3.0/docs",
        category = MusicAPICategory.AUDIO_CONTENT,
        isFree = true,
        features = listOf("Independent music", "Creative Commons", "Commercial licenses", "Mood-based search", "Genre filtering"),
        setupComplexity = "Easy",
        dataQuality = "Medium"
    ),
    EnhancedMusicAPIConfig(
        key = "ccmixter",
        displayName = "ccMixter API",
        description = "Remix culture community with Creative Commons content",
        website = "http://ccmixter.org/query-api",
        category = MusicAPICategory.AUDIO_CONTENT,
        isFree = true,
        features = listOf("Remix culture", "Samples", "Acappella tracks", "Creative Commons", "Collaboration tools"),
        setupComplexity = "Easy",
        dataQuality = "Medium"
    )
)