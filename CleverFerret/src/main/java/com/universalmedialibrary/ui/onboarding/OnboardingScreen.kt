package com.universalmedialibrary.ui.onboarding

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
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
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Onboarding / First-Run Experience
 * 
 * Introduces new users to CleverFerret's key features:
 * - Universal media management
 * - Best visualizer on Android
 * - 13 professional widgets
 * - MX Player gestures
 * - Moon Reader e-reader
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OnboardingScreen(
    onComplete: () -> Unit
) {
    var currentPage by remember { mutableStateOf(0) }
    val pages = remember { getOnboardingPages() }
    
    Box(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.background)
    ) {
        Column(
            modifier = Modifier.fillMaxSize()
        ) {
            // Skip button
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.End
            ) {
                TextButton(onClick = onComplete) {
                    Text("Skip")
                }
            }
            
            // Current page
            Box(modifier = Modifier.weight(1f)) {
                OnboardingPage(pages[currentPage])
            }
            
            // Page indicator
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                horizontalArrangement = Arrangement.Center
            ) {
                repeat(pages.size) { index ->
                    Box(
                        modifier = Modifier
                            .padding(4.dp)
                            .size(if (index == currentPage) 12.dp else 8.dp)
                            .clip(CircleShape)
                            .background(
                                if (index == currentPage)
                                    MaterialTheme.colorScheme.primary
                                else
                                    MaterialTheme.colorScheme.onSurface.copy(alpha = 0.3f)
                            )
                    )
                }
            }
            
            // Next/Get Started button
            Button(
                onClick = {
                    if (currentPage < pages.size - 1) {
                        // Go to next page
                        currentPage++
                    } else {
                        // Complete onboarding
                        onComplete()
                    }
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 16.dp, vertical = 24.dp),
                colors = ButtonDefaults.buttonColors(
                    containerColor = MaterialTheme.colorScheme.primary
                )
            ) {
                Text(
                    text = if (currentPage < pages.size - 1) "Next" else "Get Started",
                    fontSize = 16.sp,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.padding(8.dp)
                )
            }
        }
    }
}

@Composable
private fun OnboardingPage(page: OnboardingPageData) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(horizontal = 32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Icon
        Box(
            modifier = Modifier
                .size(120.dp)
                .clip(CircleShape)
                .background(
                    Brush.linearGradient(
                        colors = listOf(
                            page.color.copy(alpha = 0.3f),
                            page.color.copy(alpha = 0.1f)
                        )
                    )
                ),
            contentAlignment = Alignment.Center
        ) {
            Icon(
                imageVector = page.icon,
                contentDescription = null,
                modifier = Modifier.size(64.dp),
                tint = page.color
            )
        }
        
        Spacer(modifier = Modifier.height(32.dp))
        
        // Title
        Text(
            text = page.title,
            fontSize = 28.sp,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center,
            color = MaterialTheme.colorScheme.onBackground
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Description
        Text(
            text = page.description,
            fontSize = 16.sp,
            textAlign = TextAlign.Center,
            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.7f),
            lineHeight = 24.sp
        )
        
        if (page.features.isNotEmpty()) {
            Spacer(modifier = Modifier.height(24.dp))
            
            // Feature bullets
            Column(
                horizontalAlignment = Alignment.Start,
                modifier = Modifier.padding(horizontal = 16.dp)
            ) {
                page.features.forEach { feature ->
                    Row(
                        modifier = Modifier.padding(vertical = 4.dp),
                        verticalAlignment = Alignment.Top
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = null,
                            modifier = Modifier.size(20.dp),
                            tint = page.color
                        )
                        Spacer(modifier = Modifier.width(12.dp))
                        Text(
                            text = feature,
                            fontSize = 14.sp,
                            color = MaterialTheme.colorScheme.onBackground.copy(alpha = 0.8f)
                        )
                    }
                }
            }
        }
    }
}

private data class OnboardingPageData(
    val title: String,
    val description: String,
    val icon: ImageVector,
    val color: Color,
    val features: List<String> = emptyList()
)

private fun getOnboardingPages(): List<OnboardingPageData> {
    return listOf(
        // Welcome
        OnboardingPageData(
            title = "Welcome to CleverFerret",
            description = "The only universal media manager that beats specialist apps at their own game.",
            icon = Icons.Default.Home,
            color = Color(0xFF6200EE),
            features = listOf(
                "All your media in one beautiful app",
                "Audio, video, books, comics & more",
                "Free & open source"
            )
        ),
        
        // Audio
        OnboardingPageData(
            title = "Best Visualizer on Android",
            description = "Poweramp-quality audio with the most advanced visualizer available.",
            icon = Icons.Default.GraphicEq,
            color = Color(0xFFE91E63),
            features = listOf(
                "35 unique visualizations (5 modes × 7 styles)",
                "Hi-Res audio (FLAC, DSD, up to 384kHz)",
                "10-band parametric EQ",
                "USB DAC support with bit-perfect mode"
            )
        ),
        
        // Video
        OnboardingPageData(
            title = "MX Player Video Experience",
            description = "Professional gesture controls and the best playback quality.",
            icon = Icons.Default.OndemandVideo,
            color = Color(0xFF03A9F4),
            features = listOf(
                "Swipe for volume, brightness, seek",
                "Kids Lock (disable touch)",
                "Auto-download subtitles",
                "All codecs supported"
            )
        ),
        
        // Reading
        OnboardingPageData(
            title = "Moon Reader-Level E-Reader",
            description = "Read EPUB, PDF, and comics with full customization.",
            icon = Icons.Default.MenuBook,
            color = Color(0xFF4CAF50),
            features = listOf(
                "EPUB, PDF, CBZ, CBR support",
                "Custom fonts & themes",
                "Text-to-speech",
                "Progress tracking & bookmarks"
            )
        ),
        
        // Widgets
        OnboardingPageData(
            title = "13 Professional Widgets",
            description = "More widgets than all competitors combined. Perfect for Nova Launcher.",
            icon = Icons.Default.Widgets,
            color = Color(0xFFFF9800),
            features = listOf(
                "Universal playback control",
                "Reading progress",
                "Music player",
                "Video, audiobook, podcast & more"
            )
        ),
        
        // Permissions
        OnboardingPageData(
            title = "Grant Permissions",
            description = "CleverFerret needs access to your media files to organize and play them.",
            icon = Icons.Default.Security,
            color = Color(0xFF9C27B0),
            features = listOf(
                "Storage access (for your media)",
                "Notifications (for playback controls)",
                "Optional: Phone state (pause on call)"
            )
        )
    )
}
