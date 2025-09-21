package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ApiSettingsScreen(
    onNavigateBack: () -> Unit,
    onNavigateToAPIKeysManager: () -> Unit = {},
    onNavigateToGeminiSettings: () -> Unit = {}
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "API Settings",
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
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                Text(
                    text = "Configure API keys and metadata settings for enhanced content discovery",
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            item {
                ApiSettingsCard(
                    title = "API Keys Manager",
                    subtitle = "Configure 65+ metadata providers (TMDB, Google Books, MusicBrainz, etc.)",
                    icon = Icons.Default.Key,
                    onClick = onNavigateToAPIKeysManager
                )
            }

            item {
                ApiSettingsCard(
                    title = "Gemini AI Integration",
                    subtitle = "Configure Google Gemini API for OCR and Text-to-Speech",
                    icon = Icons.Default.Psychology,
                    onClick = onNavigateToGeminiSettings
                )
            }

            item {
                ApiSettingsCard(
                    title = "Metadata Quality",
                    subtitle = "Set quality preferences and confidence thresholds",
                    icon = Icons.Default.HighQuality,
                    onClick = { /* Navigate to metadata quality settings */ }
                )
            }

            item {
                ApiSettingsCard(
                    title = "Source Priority",
                    subtitle = "Customize metadata source priority and fallback options",
                    icon = Icons.Default.Sort,
                    onClick = { /* Navigate to source priority settings */ }
                )
            }

            item {
                ApiSettingsCard(
                    title = "Rate Limiting",
                    subtitle = "Configure API request limits and caching settings",
                    icon = Icons.Default.Speed,
                    onClick = { /* Navigate to rate limiting settings */ }
                )
            }

            item {
                ApiSettingsCard(
                    title = "Batch Processing",
                    subtitle = "Settings for bulk metadata enhancement operations",
                    icon = Icons.Default.BatchPrediction,
                    onClick = { /* Navigate to batch processing settings */ }
                )
            }
        }
    }
}

@Composable
fun ApiSettingsCard(
    title: String,
    subtitle: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(24.dp)
            )
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null,
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}