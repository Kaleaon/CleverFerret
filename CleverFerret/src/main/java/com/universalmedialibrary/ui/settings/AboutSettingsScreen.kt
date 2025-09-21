package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.navigation.NavController
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors
import com.universalmedialibrary.ui.components.CleverFerretAboutLogo

/**
 * Professional About Settings Screen
 * 
 * Features:
 * - App information and version details
 * - Legal information and licenses
 * - Support and feedback options
 * - Professional navy & gold theme
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AboutSettingsScreen(
    navController: NavController
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { 
                    Text(
                        "About Clever Ferret",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    ) 
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = CleverFerretProfessionalColors.Navy,
                    titleContentColor = Color.White,
                    navigationIconContentColor = Color.White
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
                .background(MaterialTheme.colorScheme.background),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // App Information Header
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surface
                    ),
                    elevation = CardDefaults.cardElevation(defaultElevation = 4.dp),
                    shape = RoundedCornerShape(16.dp)
                ) {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .background(
                                brush = Brush.horizontalGradient(
                                    listOf(
                                        CleverFerretProfessionalColors.DeepNavy.copy(alpha = 0.1f),
                                        CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.05f)
                                    )
                                ),
                                shape = RoundedCornerShape(16.dp)
                            )
                    ) {
                        Column(
                            modifier = Modifier.padding(24.dp),
                            horizontalAlignment = Alignment.CenterHorizontally
                        ) {
                            CleverFerretAboutLogo()
                            
                            Spacer(modifier = Modifier.height(16.dp))
                            
                            Text(
                                text = "Clever Ferret",
                                style = MaterialTheme.typography.headlineMedium,
                                fontWeight = FontWeight.Bold,
                                color = CleverFerretProfessionalColors.DeepNavy
                            )
                            
                            Text(
                                text = "Universal Media Library",
                                style = MaterialTheme.typography.titleMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                            
                            Spacer(modifier = Modifier.height(8.dp))
                            
                            Surface(
                                color = CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.15f),
                                shape = RoundedCornerShape(12.dp)
                            ) {
                                Text(
                                    text = "Version 1.3 Professional",
                                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 6.dp),
                                    style = MaterialTheme.typography.labelMedium,
                                    color = CleverFerretProfessionalColors.DeepNavy,
                                    fontWeight = FontWeight.SemiBold
                                )
                            }
                        }
                    }
                }
            }

            // App Information Section
            item {
                AboutCategoryHeader("Application")
            }

            item {
                AboutInfoCard(
                    title = "Build Information",
                    description = "Build 2025.01.20 • Professional Metadata Edition",
                    icon = Icons.Default.Build
                )
            }

            item {
                AboutInfoCard(
                    title = "Features",
                    description = "16+ Metadata APIs • Plex Integration • Advanced Reader",
                    icon = Icons.Default.Star
                )
            }

            // Legal Section
            item {
                AboutCategoryHeader("Legal & Privacy")
            }

            item {
                AboutActionCard(
                    title = "Open Source Licenses",
                    description = "View third-party libraries and licenses",
                    icon = Icons.Default.Copyright,
                    onClick = { /* Open licenses */ }
                )
            }

            item {
                AboutActionCard(
                    title = "Privacy Policy",
                    description = "Read our privacy and data handling policy",
                    icon = Icons.Default.PrivacyTip,
                    onClick = { /* Open privacy policy */ }
                )
            }

            item {
                AboutActionCard(
                    title = "Terms of Service",
                    description = "Application terms and conditions",
                    icon = Icons.Default.Gavel,
                    onClick = { /* Open terms */ }
                )
            }

            // Support Section
            item {
                AboutCategoryHeader("Support & Feedback")
            }

            item {
                AboutActionCard(
                    title = "Help & Documentation",
                    description = "User guide, tutorials, and FAQ",
                    icon = Icons.Default.Help,
                    onClick = { /* Open help */ }
                )
            }

            item {
                AboutActionCard(
                    title = "Report an Issue",
                    description = "Bug reports and feature requests",
                    icon = Icons.Default.BugReport,
                    onClick = { /* Open issue reporting */ }
                )
            }

            item {
                AboutActionCard(
                    title = "Contact Support",
                    description = "Get direct assistance from our team",
                    icon = Icons.Default.ContactSupport,
                    onClick = { /* Contact support */ }
                )
            }

            // System Information
            item {
                AboutCategoryHeader("System Information")
            }

            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)
                    ),
                    elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
                    shape = RoundedCornerShape(12.dp)
                ) {
                    Column(
                        modifier = Modifier.padding(16.dp)
                    ) {
                        SystemInfoRow("Android Version", "Android 14 (API 34)")
                        SystemInfoRow("Device", "Google Pixel 8 Pro")
                        SystemInfoRow("Architecture", "ARM64")
                        SystemInfoRow("Memory", "12 GB RAM")
                        SystemInfoRow("Storage", "256 GB (15% used)")
                    }
                }
            }
        }
    }
}

@Composable
fun AboutCategoryHeader(title: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Box(
            modifier = Modifier
                .height(2.dp)
                .width(4.dp)
                .background(
                    CleverFerretProfessionalColors.DeepGold,
                    RoundedCornerShape(1.dp)
                )
        )
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            text = title,
            style = MaterialTheme.typography.titleMedium,
            fontWeight = FontWeight.Bold,
            color = CleverFerretProfessionalColors.DeepNavy
        )
    }
}

@Composable
fun AboutInfoCard(
    title: String,
    description: String,
    icon: ImageVector
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(CleverFerretProfessionalColors.NavyMedium.copy(alpha = 0.15f)),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier.size(24.dp),
                    tint = CleverFerretProfessionalColors.DeepNavy
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    color = MaterialTheme.colorScheme.onSurface
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
fun AboutActionCard(
    title: String,
    description: String,
    icon: ImageVector,
    onClick: () -> Unit
) {
    Card(
        onClick = onClick,
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        elevation = CardDefaults.cardElevation(defaultElevation = 3.dp),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(CleverFerretProfessionalColors.DeepGold.copy(alpha = 0.15f)),
                contentAlignment = Alignment.Center
            ) {
                Icon(
                    imageVector = icon,
                    contentDescription = null,
                    modifier = Modifier.size(24.dp),
                    tint = CleverFerretProfessionalColors.DeepNavy
                )
            }
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.SemiBold,
                    color = MaterialTheme.colorScheme.onSurface
                )
                Text(
                    text = description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = null,
                tint = CleverFerretProfessionalColors.DeepGold,
                modifier = Modifier.size(20.dp)
            )
        }
    }
}

@Composable
fun SystemInfoRow(label: String, value: String) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 4.dp),
        horizontalArrangement = Arrangement.SpaceBetween
    ) {
        Text(
            text = label,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        Text(
            text = value,
            style = MaterialTheme.typography.bodyMedium,
            fontWeight = FontWeight.Medium,
            color = MaterialTheme.colorScheme.onSurface
        )
    }
}