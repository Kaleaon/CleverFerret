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
 * Enhanced Movie API Manager based on 9 Best Movie APIs for 2024
 * 
 * Comprehensive integration for movie and TV show metadata collection:
 * - Streaming Availability APIs
 * - Movie Database APIs  
 * - Professional Movie Analytics
 * - Video Content APIs
 * - Entertainment Data APIs
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedMovieAPIManagerScreen(
    onNavigateBack: () -> Unit
) {
    var selectedCategory by remember { mutableStateOf(MovieAPICategory.DATABASE) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Enhanced Movie APIs",
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
                            Icons.Default.Movie,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(32.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                text = "9 Best Movie APIs - 2024 Edition",
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Professional movie and TV show metadata with streaming availability",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Text(
                        text = "Market Size: $169 billion by 2030",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer,
                        fontWeight = FontWeight.Medium
                    )
                }
            }

            // Category Tabs
            ScrollableTabRow(
                selectedTabIndex = selectedCategory.ordinal,
                containerColor = MaterialTheme.colorScheme.surface
            ) {
                MovieAPICategory.values().forEach { category ->
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
                items(getMovieAPIsByCategory(selectedCategory)) { apiConfig ->
                    EnhancedMovieAPICard(apiConfig = apiConfig)
                }
            }
        }
    }
}

enum class MovieAPICategory(
    val displayName: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    DATABASE("Database", Icons.Default.Storage),
    STREAMING("Streaming", Icons.Default.Tv),
    VIDEO("Video", Icons.Default.VideoLibrary),
    ENTERTAINMENT("Entertainment", Icons.Default.TheaterComedy)
}

data class EnhancedMovieAPIConfig(
    val key: String,
    val displayName: String,
    val description: String,
    val website: String,
    val category: MovieAPICategory,
    val isFree: Boolean,
    val isRecommended: Boolean = false,
    val features: List<String>,
    val setupComplexity: String, // "Easy", "Medium", "Complex"
    val dataQuality: String, // "High", "Medium", "Basic"
    val specialFeatures: List<String> = emptyList()
)

@Composable
fun EnhancedMovieAPICard(apiConfig: EnhancedMovieAPIConfig) {
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
                            APIBadge(text = "TOP PICK", color = MaterialTheme.colorScheme.secondaryContainer)
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
            
            // Special Features
            if (apiConfig.specialFeatures.isNotEmpty()) {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Special Features:",
                    style = MaterialTheme.typography.labelMedium,
                    fontWeight = FontWeight.Medium,
                    color = MaterialTheme.colorScheme.primary
                )
                
                apiConfig.specialFeatures.forEach { feature ->
                    Row(
                        modifier = Modifier.padding(vertical = 2.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.Star,
                            contentDescription = null,
                            modifier = Modifier.size(12.dp),
                            tint = MaterialTheme.colorScheme.secondary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            text = feature,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary
                        )
                    }
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
                    Text("Docs")
                }
                
                Button(
                    onClick = { /* Configure API */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Settings, contentDescription = null, modifier = Modifier.size(16.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Setup")
                }
            }
        }
    }
}

fun getMovieAPIsByCategory(category: MovieAPICategory): List<EnhancedMovieAPIConfig> {
    return when (category) {
        MovieAPICategory.DATABASE -> getDatabaseAPIs()
        MovieAPICategory.STREAMING -> getStreamingAPIs()
        MovieAPICategory.VIDEO -> getVideoAPIs()
        MovieAPICategory.ENTERTAINMENT -> getEntertainmentAPIs()
    }
}

fun getDatabaseAPIs(): List<EnhancedMovieAPIConfig> = listOf(
    EnhancedMovieAPIConfig(
        key = "tmdb",
        displayName = "The Movie Database (TMDB)",
        description = "Complete and updated data for 9+ million titles with 11+ million cast members",
        website = "https://developer.themoviedb.org/reference/intro/getting-started",
        category = MovieAPICategory.DATABASE,
        isFree = true,
        isRecommended = true,
        features = listOf("9M+ titles", "11M+ cast members", "YouTube trailers", "Multi-language support", "Awards data", "Full biographies"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Most comprehensive movie database", "Real-time updates", "Professional grade metadata")
    ),
    EnhancedMovieAPIConfig(
        key = "omdb",
        displayName = "OMDb API",
        description = "Open Movie Database with community-maintained content and comprehensive ratings",
        website = "https://www.omdbapi.com/",
        category = MovieAPICategory.DATABASE,
        isFree = true,
        isRecommended = true,
        features = listOf("RESTful web service", "Multiple ratings sources", "IMDb & Rotten Tomatoes", "Flexible search", "JSON responses", "Community maintained"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Completely free", "No commercial restrictions", "Community driven")
    ),
    EnhancedMovieAPIConfig(
        key = "imdb_api",
        displayName = "IMDb API",
        description = "World's most authoritative entertainment data through GraphQL interface",
        website = "https://help.imdb.com/article/imdb/general-information/introducing-the-imdb-api/",
        category = MovieAPICategory.DATABASE,
        isFree = false,
        isRecommended = true,
        features = listOf("GraphQL interface", "Simplified JSON", "Single call retrieval", "Customizable requests", "Multiple entities", "Authoritative data"),
        setupComplexity = "Complex",
        dataQuality = "High",
        specialFeatures = listOf("Official IMDb data source", "Powers IMDb website", "GraphQL optimization")
    )
)

fun getStreamingAPIs(): List<EnhancedMovieAPIConfig> = listOf(
    EnhancedMovieAPIConfig(
        key = "gowatch",
        displayName = "GoWatch API",
        description = "Streaming links and availability across multiple platforms using IMDb ID",
        website = "https://github.com/Lds20k/Gowatch",
        category = MovieAPICategory.STREAMING,
        isFree = true,
        isRecommended = true,
        features = listOf("IMDb ID integration", "Multi-platform support", "iTunes & Apple TV+", "Microsoft Store", "Channel management", "Spring/Java based"),
        setupComplexity = "Medium",
        dataQuality = "High",
        specialFeatures = listOf("Real-time streaming links", "Platform aggregation", "Developer-friendly")
    ),
    EnhancedMovieAPIConfig(
        key = "ott_details",
        displayName = "OTT Details API",
        description = "150+ streaming platforms in US and India including HBO, Netflix, Prime Video",
        website = "https://www.producthunt.com/products/api-movie-ott-details",
        category = MovieAPICategory.STREAMING,
        isFree = false,
        features = listOf("150+ platforms", "US & India support", "HBO, Netflix, Prime", "Hotstar, Hulu", "Basic movie details", "Global reach"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Largest platform coverage", "Regional specialization", "Commercial grade")
    ),
    EnhancedMovieAPIConfig(
        key = "streaming_availability",
        displayName = "Streaming Availability API",
        description = "20+ streaming services across 60 countries with deep links and pricing",
        website = "https://www.movieofthenight.com/about/api/",
        category = MovieAPICategory.STREAMING,
        isFree = true,
        features = listOf("20+ services", "60 countries", "Deep links", "Video qualities", "Pricing info", "Subscription details"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Comprehensive pricing data", "Quality specifications", "Global coverage")
    ),
    EnhancedMovieAPIConfig(
        key = "unogs",
        displayName = "uNoGS API",
        description = "Netflix-specific API for global catalog search and deleted titles tracking",
        website = "https://unogs.com/",
        category = MovieAPICategory.STREAMING,
        isFree = false,
        features = listOf("Netflix focus", "Country-specific search", "Deleted titles tracking", "Comprehensive details", "Multiple plans", "High performance"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Netflix specialization", "Deletion tracking", "Country-specific catalogs")
    ),
    EnhancedMovieAPIConfig(
        key = "utelly",
        displayName = "Utelly API",
        description = "Content discovery across Netflix, Prime, iTunes, BBC iPlayer and more",
        website = "https://www.utelly.com/media-and-entertainment-solutions/use-cases/developers",
        category = MovieAPICategory.STREAMING,
        isFree = false,
        features = listOf("Multi-platform search", "Personalized recommendations", "Content promotion", "JSON output", "Advanced search", "Public examples"),
        setupComplexity = "Medium",
        dataQuality = "High",
        specialFeatures = listOf("AI recommendations", "Content promotion tools", "Developer resources")
    )
)

fun getVideoAPIs(): List<EnhancedMovieAPIConfig> = listOf(
    EnhancedMovieAPIConfig(
        key = "vimeo",
        displayName = "Vimeo API",
        description = "High-quality video integration with customizable player and management tools",
        website = "https://developer.vimeo.com/",
        category = MovieAPICategory.VIDEO,
        isFree = true,
        features = listOf("Customizable player", "Video management", "Community access", "OAuth 2 security", "Multi-platform SDKs", "Comprehensive docs"),
        setupComplexity = "Medium",
        dataQuality = "High",
        specialFeatures = listOf("Professional video hosting", "Creative community", "High-quality streaming")
    )
)

fun getEntertainmentAPIs(): List<EnhancedMovieAPIConfig> = listOf(
    EnhancedMovieAPIConfig(
        key = "nyt_books",
        displayName = "NY Times Bestsellers API",
        description = "Access to NY Times bestseller lists, reviews, and book recommendations",
        website = "https://developer.nytimes.com/apis",
        category = MovieAPICategory.ENTERTAINMENT,
        isFree = true,
        features = listOf("Bestseller lists", "Book reviews", "Author articles", "RESTful architecture", "4,000 requests/day", "Historical data"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Authoritative bestseller data", "Professional reviews", "Historical tracking")
    )
)