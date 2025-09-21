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

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PlexCalibreIntegrationScreen(
    onNavigateBack: () -> Unit
) {
    var selectedTab by remember { mutableStateOf(0) }
    val tabTitles = listOf("Plex Server", "Calibre Setup", "Integration Status")

    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "Plex & Calibre Integration",
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
            // Tab Row
            TabRow(
                selectedTabIndex = selectedTab,
                containerColor = MaterialTheme.colorScheme.surface
            ) {
                tabTitles.forEachIndexed { index, title ->
                    Tab(
                        selected = selectedTab == index,
                        onClick = { selectedTab = index },
                        text = { Text(title) }
                    )
                }
            }

            // Tab Content
            when (selectedTab) {
                0 -> PlexServerTab()
                1 -> CalibreSetupTab()
                2 -> IntegrationStatusTab()
            }
        }
    }
}

@Composable
fun PlexServerTab() {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
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
                            Icons.Default.Cloud,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            text = "Plex Server Connection",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Connect to your Plex Media Server for enhanced metadata and library management",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                }
            }
        }

        item {
            OutlinedTextField(
                value = "",
                onValueChange = { },
                label = { Text("Plex Server URL") },
                placeholder = { Text("http://192.168.1.100:32400") },
                modifier = Modifier.fillMaxWidth(),
                leadingIcon = {
                    Icon(Icons.Default.Link, contentDescription = null)
                }
            )
        }

        item {
            OutlinedTextField(
                value = "",
                onValueChange = { },
                label = { Text("Plex Token") },
                placeholder = { Text("Your Plex authentication token") },
                modifier = Modifier.fillMaxWidth(),
                leadingIcon = {
                    Icon(Icons.Default.Key, contentDescription = null)
                }
            )
        }

        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Button(
                    onClick = { /* Test connection */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Wifi, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Test Connection")
                }
                
                OutlinedButton(
                    onClick = { /* Save settings */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Save, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Save")
                }
            }
        }

        item {
            PlexFeaturesList()
        }
    }
}

@Composable
fun CalibreSetupTab() {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Card(
                modifier = Modifier.fillMaxWidth(),
                colors = CardDefaults.cardColors(
                    containerColor = MaterialTheme.colorScheme.secondaryContainer
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
                            tint = MaterialTheme.colorScheme.secondary
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            text = "Calibre Content Server",
                            style = MaterialTheme.typography.titleMedium,
                            fontWeight = FontWeight.Medium
                        )
                    }
                    Spacer(modifier = Modifier.height(8.dp))
                    Text(
                        text = "Connect to your Calibre library for professional book management",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSecondaryContainer
                    )
                }
            }
        }

        item {
            OutlinedTextField(
                value = "",
                onValueChange = { },
                label = { Text("Calibre Server URL") },
                placeholder = { Text("http://192.168.1.100:8080") },
                modifier = Modifier.fillMaxWidth(),
                leadingIcon = {
                    Icon(Icons.Default.Link, contentDescription = null)
                }
            )
        }

        item {
            OutlinedTextField(
                value = "",
                onValueChange = { },
                label = { Text("Username (Optional)") },
                placeholder = { Text("Leave blank if no authentication") },
                modifier = Modifier.fillMaxWidth(),
                leadingIcon = {
                    Icon(Icons.Default.Person, contentDescription = null)
                }
            )
        }

        item {
            OutlinedTextField(
                value = "",
                onValueChange = { },
                label = { Text("Password (Optional)") },
                placeholder = { Text("Leave blank if no authentication") },
                modifier = Modifier.fillMaxWidth(),
                leadingIcon = {
                    Icon(Icons.Default.Lock, contentDescription = null)
                }
            )
        }

        item {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Button(
                    onClick = { /* Connect to Calibre */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Sync, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Connect")
                }
                
                OutlinedButton(
                    onClick = { /* Import OPDS */ },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.ImportExport, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Import OPDS")
                }
            }
        }

        item {
            CalibreFeaturesList()
        }
    }
}

@Composable
fun IntegrationStatusTab() {
    LazyColumn(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        item {
            Text(
                text = "Integration Status Overview",
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold
            )
        }

        item {
            IntegrationStatusCard(
                title = "Plex Connection",
                status = "Not Connected",
                isConnected = false,
                details = "Configure your Plex server connection in the Plex Server tab"
            )
        }

        item {
            IntegrationStatusCard(
                title = "Calibre Content Server",
                status = "Not Connected",
                isConnected = false,
                details = "Set up Calibre server connection in the Calibre Setup tab"
            )
        }

        item {
            IntegrationStatusCard(
                title = "Metadata Enhancement",
                status = "Ready",
                isConnected = true,
                details = "16+ metadata sources configured and ready for use"
            )
        }

        item {
            Card(
                modifier = Modifier.fillMaxWidth()
            ) {
                Column(
                    modifier = Modifier.padding(16.dp)
                ) {
                    Text(
                        text = "Available Features",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    IntegrationFeature("✅ Enhanced Metadata Collection", "16+ sources active")
                    IntegrationFeature("✅ Professional Theming", "Navy & Gold color scheme")
                    IntegrationFeature("✅ Multi-format Support", "Books, Movies, Music, Podcasts")
                    IntegrationFeature("⏳ Plex Integration", "Requires server connection")
                    IntegrationFeature("⏳ Calibre Integration", "Requires server setup")
                    IntegrationFeature("✅ AI-Powered Enhancements", "Smart metadata processing")
                }
            }
        }
    }
}

@Composable
fun PlexFeaturesList() {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "🎬 Plex Integration Features",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(12.dp))

            val features = listOf(
                "Connect to Multiple Plex Servers" to "Manage remote Plex libraries",
                "AI-Enhanced Metadata" to "Improve existing metadata with AI analysis",
                "Duplicate Detection" to "Find and manage duplicate content",
                "Smart Collections" to "Auto-create themed collections",
                "Library Analytics" to "Comprehensive library health monitoring",
                "Artwork Management" to "High-quality poster and backdrop management"
            )

            features.forEach { (title, description) ->
                FeatureItem(title, description, Icons.Default.CheckCircle)
            }
        }
    }
}

@Composable
fun CalibreFeaturesList() {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "📚 Calibre Integration Features",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )
            Spacer(modifier = Modifier.height(12.dp))

            val features = listOf(
                "Calibre Content Server" to "Connect to your Calibre library",
                "OPDS Integration" to "Support for OPDS feeds and catalogs",
                "Series Detection" to "Automatic series recognition and ordering",
                "Author Disambiguation" to "Advanced author matching and biography",
                "Multi-ISBN Support" to "ISBN-10, ISBN-13, and ASIN lookup",
                "Publisher Metadata" to "Complete publisher information and tracking"
            )

            features.forEach { (title, description) ->
                FeatureItem(title, description, Icons.Default.MenuBook)
            }
        }
    }
}

@Composable
fun IntegrationStatusCard(
    title: String,
    status: String,
    isConnected: Boolean,
    details: String
) {
    Card(
        modifier = Modifier.fillMaxWidth()
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = if (isConnected) Icons.Default.CheckCircle else Icons.Default.Error,
                contentDescription = null,
                tint = if (isConnected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error,
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
                    text = status,
                    style = MaterialTheme.typography.bodyMedium,
                    color = if (isConnected) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
                Text(
                    text = details,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
fun IntegrationFeature(title: String, status: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Text(
            text = title,
            style = MaterialTheme.typography.bodyMedium,
            modifier = Modifier.weight(1f)
        )
        Text(
            text = status,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
fun FeatureItem(
    title: String,
    description: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        verticalAlignment = Alignment.Top
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = MaterialTheme.colorScheme.primary,
            modifier = Modifier.size(16.dp)
        )
        Spacer(modifier = Modifier.width(8.dp))
        Column {
            Text(
                text = title,
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = description,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}