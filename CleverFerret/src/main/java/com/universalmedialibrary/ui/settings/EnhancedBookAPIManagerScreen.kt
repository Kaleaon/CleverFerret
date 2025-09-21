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
 * Enhanced Book API Manager based on Top 9 Book APIs for 2025
 * 
 * Comprehensive integration for book metadata and library management:
 * - Professional Book Databases
 * - Academic and Research APIs
 * - Dictionary and Language APIs  
 * - Accessibility-focused APIs
 * - Commercial Book APIs
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedBookAPIManagerScreen(
    onNavigateBack: () -> Unit
) {
    var selectedCategory by remember { mutableStateOf(BookAPICategory.DATABASE) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Enhanced Book APIs",
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
                            Icons.Default.MenuBook,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary,
                            modifier = Modifier.size(32.dp)
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Column {
                            Text(
                                text = "Top 9 Book APIs - 2025 Edition",
                                style = MaterialTheme.typography.titleLarge,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                text = "Professional book metadata and library management systems",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Text(
                        text = "43M+ books • 19 data points • Since 2001",
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
                BookAPICategory.values().forEach { category ->
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
                items(getBookAPIsByCategory(selectedCategory)) { apiConfig ->
                    EnhancedBookAPICard(apiConfig = apiConfig)
                }
            }
        }
    }
}

enum class BookAPICategory(
    val displayName: String,
    val icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    DATABASE("Database", Icons.Default.Storage),
    ACADEMIC("Academic", Icons.Default.School),
    LANGUAGE("Language", Icons.Default.Translate),
    ACCESSIBILITY("Accessibility", Icons.Default.Accessibility),
    COMMERCIAL("Commercial", Icons.Default.ShoppingCart)
}

data class EnhancedBookAPIConfig(
    val key: String,
    val displayName: String,
    val description: String,
    val website: String,
    val category: BookAPICategory,
    val isFree: Boolean,
    val isRecommended: Boolean = false,
    val features: List<String>,
    val setupComplexity: String, // "Easy", "Medium", "Complex"
    val dataQuality: String, // "High", "Medium", "Basic"
    val dataSize: String = "", // e.g., "43M+ books", "30M+ titles"
    val specialFeatures: List<String> = emptyList()
)

@Composable
fun EnhancedBookAPICard(apiConfig: EnhancedBookAPIConfig) {
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
                    
                    if (apiConfig.dataSize.isNotEmpty()) {
                        Text(
                            text = apiConfig.dataSize,
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.primary,
                            fontWeight = FontWeight.Medium,
                            modifier = Modifier.padding(top = 2.dp)
                        )
                    }
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

fun getBookAPIsByCategory(category: BookAPICategory): List<EnhancedBookAPIConfig> {
    return when (category) {
        BookAPICategory.DATABASE -> getDatabaseBookAPIs()
        BookAPICategory.ACADEMIC -> getAcademicBookAPIs()
        BookAPICategory.LANGUAGE -> getLanguageAPIs()
        BookAPICategory.ACCESSIBILITY -> getAccessibilityAPIs()
        BookAPICategory.COMMERCIAL -> getCommercialBookAPIs()
    }
}

fun getDatabaseBookAPIs(): List<EnhancedBookAPIConfig> = listOf(
    EnhancedBookAPIConfig(
        key = "isbndb",
        displayName = "ISBNdb API",
        description = "Oldest book database with comprehensive book metadata and pricing",
        website = "https://isbndb.com/",
        category = BookAPICategory.DATABASE,
        isFree = false,
        isRecommended = true,
        features = listOf("43M+ book titles", "19 data points", "Price comparison", "ISBN validation", "Publisher data", "Weight & dimensions"),
        setupComplexity = "Easy",
        dataQuality = "High",
        dataSize = "43M+ books since 2001",
        specialFeatures = listOf("Oldest book database", "Price comparison", "Professional metadata", "3 pricing tiers")
    ),
    EnhancedBookAPIConfig(
        key = "google_books",
        displayName = "Google Books API",
        description = "World's largest digital library with full-text search and previews",
        website = "https://developers.google.com/books",
        category = BookAPICategory.DATABASE,
        isFree = true,
        isRecommended = true,
        features = listOf("Largest digital library", "Full-text search", "Book previews", "Ratings & reviews", "Author information", "Comprehensive docs"),
        setupComplexity = "Easy",
        dataQuality = "High",
        dataSize = "World's largest collection",
        specialFeatures = listOf("Full-text search", "Book embedding", "Preview functionality", "OAuth & API key auth")
    ),
    EnhancedBookAPIConfig(
        key = "open_library", 
        displayName = "Open Library API",
        description = "Free, open-source digital library with 30M+ titles from Internet Archive",
        website = "https://openlibrary.org/developers/api",
        category = BookAPICategory.DATABASE,
        isFree = true,
        features = listOf("30M+ titles", "Cover images", "Book contents", "Subject headings", "Search within books", "Multiple formats"),
        setupComplexity = "Easy",
        dataQuality = "High",
        dataSize = "30M+ titles",
        specialFeatures = listOf("Completely free", "Open source", "Internet Archive powered", "JSON/YAML/XML")
    )
)

fun getAcademicBookAPIs(): List<EnhancedBookAPIConfig> = listOf(
    EnhancedBookAPIConfig(
        key = "internet_archive",
        displayName = "Internet Archive API",
        description = "Vast digital archive with rare and out-of-print academic titles",
        website = "https://archive.org/",
        category = BookAPICategory.ACADEMIC,
        isFree = true,
        isRecommended = true,
        features = listOf("41M+ books & texts", "4,300 books/day", "18 global locations", "Rare & out-of-print", "Academic papers", "Historical documents"),
        setupComplexity = "Medium",
        dataQuality = "High",
        dataSize = "41M+ books and texts",
        specialFeatures = listOf("Historical preservation", "Academic focus", "Rare manuscripts", "Global scanning network")
    )
)

fun getLanguageAPIs(): List<EnhancedBookAPIConfig> = listOf(
    EnhancedBookAPIConfig(
        key = "merriam_webster",
        displayName = "Merriam-Webster API",
        description = "Authoritative dictionary and thesaurus with audio pronunciations",
        website = "https://dictionaryapi.com/",
        category = BookAPICategory.LANGUAGE,
        isFree = true,
        features = listOf("Dictionary & thesaurus", "Audio pronunciations", "Example sentences", "Word origins", "Synonyms & antonyms", "Developer key required"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Audio pronunciations", "Etymology", "Free for non-commercial", "Language learning focus")
    ),
    EnhancedBookAPIConfig(
        key = "oxford_dictionaries",
        displayName = "Oxford Dictionaries API",
        description = "Comprehensive language analysis with 350,000+ phrases and bilingual support",
        website = "https://developer.oxforddictionaries.com/",
        category = BookAPICategory.LANGUAGE,
        isFree = false,
        isRecommended = true,
        features = listOf("350K+ phrases", "Bilingual dictionaries", "Language translation", "Advanced search", "AI/bot integration", "Cultural analysis"),
        setupComplexity = "Medium",
        dataQuality = "High",
        dataSize = "350K+ phrases and words",
        specialFeatures = listOf("Academic authority", "Multilingual support", "Cultural context", "Professional linguistics")
    )
)

fun getAccessibilityAPIs(): List<EnhancedBookAPIConfig> = listOf(
    EnhancedBookAPIConfig(
        key = "bookshare",
        displayName = "Bookshare API",
        description = "Accessible books library for people with visual impairments and disabilities",
        website = "https://www.bookshare.org/cms/bookshare-api-v10-getting-started",
        category = BookAPICategory.ACCESSIBILITY,
        isFree = true,
        isRecommended = true,
        features = listOf("Accessible formats", "Visual impairment support", "Reading lists", "User roles", "Membership management", "Cover images"),
        setupComplexity = "Medium",
        dataQuality = "High",
        specialFeatures = listOf("Disability-focused", "Accessible formats", "Community driven", "Educational support")
    )
)

fun getCommercialBookAPIs(): List<EnhancedBookAPIConfig> = listOf(
    EnhancedBookAPIConfig(
        key = "amazon_books",
        displayName = "Amazon Books API",
        description = "Product Advertising API for Amazon's vast book catalog and marketplace",
        website = "https://webservices.amazon.com/paapi5/documentation/",
        category = BookAPICategory.COMMERCIAL,
        isFree = false,
        features = listOf("Amazon catalog", "Product data", "Pricing information", "Customer reviews", "Affiliate program", "Multiple variables"),
        setupComplexity = "Complex",
        dataQuality = "High",
        specialFeatures = listOf("E-commerce integration", "Affiliate earnings", "Real-time pricing", "Customer insights")
    ),
    EnhancedBookAPIConfig(
        key = "nyt_books",
        displayName = "NY Times Books API",
        description = "Bestseller lists, professional book reviews, and editorial recommendations",
        website = "https://developer.nytimes.com/apis",
        category = BookAPICategory.COMMERCIAL,
        isFree = true,
        features = listOf("Bestseller lists", "Professional reviews", "Author articles", "Historical data", "4,000 requests/day", "Editorial content"),
        setupComplexity = "Easy",
        dataQuality = "High",
        specialFeatures = listOf("Authoritative reviews", "Bestseller tracking", "Editorial expertise", "Cultural impact")
    )
)