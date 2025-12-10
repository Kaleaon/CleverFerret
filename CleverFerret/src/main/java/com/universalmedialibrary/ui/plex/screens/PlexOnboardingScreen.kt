package com.universalmedialibrary.ui.plex.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.pager.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
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
import com.universalmedialibrary.ui.plex.theme.*
import kotlinx.coroutines.launch

/**
 * Plex-Style Onboarding Screen
 * 
 * Welcome new users with:
 * - App introduction
 * - Key features showcase
 * - Storage permission setup
 * - Library folder selection
 * - Optional account setup (Plex, cloud services)
 * - Theme selection
 */

@OptIn(ExperimentalFoundationApi::class)
@Composable
fun PlexOnboardingScreen(
    onComplete: () -> Unit,
    modifier: Modifier = Modifier
) {
    val pages = listOf(
        OnboardingPage.Welcome,
        OnboardingPage.Features,
        OnboardingPage.Storage,
        OnboardingPage.Accounts,
        OnboardingPage.Theme,
        OnboardingPage.Ready
    )
    
    val pagerState = rememberPagerState(pageCount = { pages.size })
    val coroutineScope = rememberCoroutineScope()
    
    Box(
        modifier = modifier
            .fillMaxSize()
            .background(
                Brush.verticalGradient(
                    colors = listOf(
                        PlexColors.Background,
                        PlexColors.BackgroundElevated
                    )
                )
            )
    ) {
        // Page content
        HorizontalPager(
            state = pagerState,
            modifier = Modifier.fillMaxSize()
        ) { pageIndex ->
            when (pages[pageIndex]) {
                OnboardingPage.Welcome -> WelcomePage()
                OnboardingPage.Features -> FeaturesPage()
                OnboardingPage.Storage -> StoragePage()
                OnboardingPage.Accounts -> AccountsPage()
                OnboardingPage.Theme -> ThemePage()
                OnboardingPage.Ready -> ReadyPage()
            }
        }
        
        // Bottom navigation
        Column(
            modifier = Modifier
                .align(Alignment.BottomCenter)
                .padding(PlexSpacing.XL),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            // Page indicators
            Row(
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                repeat(pages.size) { index ->
                    val isSelected = pagerState.currentPage == index
                    Box(
                        modifier = Modifier
                            .padding(horizontal = 4.dp)
                            .size(if (isSelected) 10.dp else 8.dp)
                            .clip(CircleShape)
                            .background(
                                if (isSelected) PlexColors.AccentPrimary
                                else PlexColors.TextTertiary
                            )
                    )
                }
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.LG))
            
            // Navigation buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                // Back/Skip button
                if (pagerState.currentPage > 0) {
                    TextButton(
                        onClick = {
                            coroutineScope.launch {
                                pagerState.animateScrollToPage(pagerState.currentPage - 1)
                            }
                        }
                    ) {
                        Icon(Icons.Default.ChevronLeft, null)
                        Text("Back")
                    }
                } else {
                    TextButton(
                        onClick = onComplete
                    ) {
                        Text("Skip")
                    }
                }
                
                // Next/Done button
                Button(
                    onClick = {
                        if (pagerState.currentPage == pages.size - 1) {
                            onComplete()
                        } else {
                            coroutineScope.launch {
                                pagerState.animateScrollToPage(pagerState.currentPage + 1)
                            }
                        }
                    },
                    colors = ButtonDefaults.buttonColors(
                        containerColor = PlexColors.AccentPrimary
                    )
                ) {
                    Text(
                        text = if (pagerState.currentPage == pages.size - 1) "Get Started" else "Next",
                        fontWeight = FontWeight.SemiBold
                    )
                    if (pagerState.currentPage < pages.size - 1) {
                        Icon(Icons.Default.ChevronRight, null)
                    }
                }
            }
        }
    }
}

// =============================================================================
// ONBOARDING PAGES
// =============================================================================

private enum class OnboardingPage {
    Welcome, Features, Storage, Accounts, Theme, Ready
}

@Composable
private fun WelcomePage() {
    OnboardingPageContent(
        icon = Icons.Default.AutoAwesome,
        iconColor = PlexColors.AccentPrimary,
        title = "Welcome to Clever Ferret",
        description = "Your universal media library, beautifully organized. " +
                "Books, audiobooks, music, podcasts, comics, movies, and more – all in one elegant app."
    ) {
        // Logo or animation could go here
        Surface(
            shape = CircleShape,
            color = PlexColors.AccentPrimary.copy(alpha = 0.1f),
            modifier = Modifier.size(160.dp)
        ) {
            Icon(
                imageVector = Icons.Default.Pets, // Ferret-like icon
                contentDescription = null,
                tint = PlexColors.AccentPrimary,
                modifier = Modifier.padding(PlexSpacing.XL)
            )
        }
    }
}

@Composable
private fun FeaturesPage() {
    OnboardingPageContent(
        icon = Icons.Default.Dashboard,
        iconColor = PlexColors.Info,
        title = "Everything You Need",
        description = "A complete media experience with powerful features"
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
            modifier = Modifier.padding(horizontal = PlexSpacing.LG)
        ) {
            FeatureItem(
                icon = Icons.Default.MenuBook,
                title = "Universal Reader",
                description = "EPUB, PDF, Comics, Documents"
            )
            FeatureItem(
                icon = Icons.Default.Headphones,
                title = "Audio Player",
                description = "Music, Audiobooks, Podcasts"
            )
            FeatureItem(
                icon = Icons.Default.Movie,
                title = "Video Player",
                description = "Movies, TV Shows with subtitles"
            )
            FeatureItem(
                icon = Icons.Default.Cloud,
                title = "Sync & Backup",
                description = "Progress synced across devices"
            )
        }
    }
}

@Composable
private fun StoragePage() {
    var hasPermission by remember { mutableStateOf(false) }
    var selectedFolders by remember { mutableStateOf(listOf<String>()) }
    
    OnboardingPageContent(
        icon = Icons.Default.Folder,
        iconColor = PlexColors.Warning,
        title = "Set Up Your Library",
        description = "Grant storage access to scan your media files"
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
        ) {
            if (!hasPermission) {
                Button(
                    onClick = { hasPermission = true },
                    colors = ButtonDefaults.buttonColors(
                        containerColor = PlexColors.AccentPrimary
                    )
                ) {
                    Icon(Icons.Default.Security, null)
                    Spacer(modifier = Modifier.width(PlexSpacing.SM))
                    Text("Grant Storage Access")
                }
            } else {
                Surface(
                    shape = RoundedCornerShape(PlexCorners.MD),
                    color = PlexColors.Success.copy(alpha = 0.1f),
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Row(
                        modifier = Modifier.padding(PlexSpacing.MD),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            imageVector = Icons.Default.CheckCircle,
                            contentDescription = null,
                            tint = PlexColors.Success
                        )
                        Spacer(modifier = Modifier.width(PlexSpacing.SM))
                        Text(
                            text = "Storage access granted!",
                            color = PlexColors.Success
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(PlexSpacing.MD))
                
                OutlinedButton(
                    onClick = { selectedFolders = selectedFolders + "/storage/emulated/0/Books" }
                ) {
                    Icon(Icons.Default.Add, null)
                    Spacer(modifier = Modifier.width(PlexSpacing.SM))
                    Text("Add Library Folder")
                }
                
                selectedFolders.forEach { folder ->
                    Surface(
                        shape = RoundedCornerShape(PlexCorners.SM),
                        color = PlexColors.BackgroundElevated,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Row(
                            modifier = Modifier.padding(PlexSpacing.MD),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                imageVector = Icons.Default.Folder,
                                contentDescription = null,
                                tint = PlexColors.AccentPrimary
                            )
                            Spacer(modifier = Modifier.width(PlexSpacing.SM))
                            Text(
                                text = folder.substringAfterLast("/"),
                                color = PlexColors.TextPrimary,
                                modifier = Modifier.weight(1f)
                            )
                            IconButton(onClick = { selectedFolders = selectedFolders - folder }) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Remove",
                                    tint = PlexColors.TextTertiary
                                )
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun AccountsPage() {
    OnboardingPageContent(
        icon = Icons.Default.AccountCircle,
        iconColor = PlexColors.MediaMovie,
        title = "Connect Your Accounts",
        description = "Optional: Connect services for enhanced features"
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.MD),
            modifier = Modifier.fillMaxWidth()
        ) {
            AccountOption(
                icon = Icons.Default.Cloud,
                name = "Plex",
                description = "Sync with your Plex server"
            )
            AccountOption(
                icon = Icons.Default.CloudQueue,
                name = "Google Drive",
                description = "Backup and sync files"
            )
            AccountOption(
                icon = Icons.Default.Book,
                name = "Goodreads",
                description = "Import reading list"
            )
            AccountOption(
                icon = Icons.Default.MusicNote,
                name = "Last.fm",
                description = "Scrobble your music"
            )
        }
    }
}

@Composable
private fun ThemePage() {
    var selectedTheme by remember { mutableStateOf("dark") }
    var selectedAccent by remember { mutableStateOf("gold") }
    
    OnboardingPageContent(
        icon = Icons.Default.Palette,
        iconColor = PlexColors.MediaMusic,
        title = "Choose Your Style",
        description = "Customize the app appearance"
    ) {
        Column(
            verticalArrangement = Arrangement.spacedBy(PlexSpacing.LG)
        ) {
            // Theme selection
            Text(
                text = "Theme",
                style = PlexTypography.LabelMedium,
                color = PlexColors.TextSecondary
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                ThemeOption(
                    name = "Dark",
                    color = PlexColors.Background,
                    isSelected = selectedTheme == "dark",
                    onClick = { selectedTheme = "dark" }
                )
                ThemeOption(
                    name = "Light",
                    color = Color.White,
                    isSelected = selectedTheme == "light",
                    onClick = { selectedTheme = "light" }
                )
                ThemeOption(
                    name = "AMOLED",
                    color = Color.Black,
                    isSelected = selectedTheme == "amoled",
                    onClick = { selectedTheme = "amoled" }
                )
            }
            
            Spacer(modifier = Modifier.height(PlexSpacing.MD))
            
            // Accent color selection
            Text(
                text = "Accent Color",
                style = PlexTypography.LabelMedium,
                color = PlexColors.TextSecondary
            )
            
            Row(
                horizontalArrangement = Arrangement.spacedBy(PlexSpacing.MD)
            ) {
                AccentOption(
                    color = PlexColors.AccentPrimary,
                    isSelected = selectedAccent == "gold",
                    onClick = { selectedAccent = "gold" }
                )
                AccentOption(
                    color = Color(0xFFE50914),
                    isSelected = selectedAccent == "red",
                    onClick = { selectedAccent = "red" }
                )
                AccentOption(
                    color = Color(0xFF1DB954),
                    isSelected = selectedAccent == "green",
                    onClick = { selectedAccent = "green" }
                )
                AccentOption(
                    color = Color(0xFF3B82F6),
                    isSelected = selectedAccent == "blue",
                    onClick = { selectedAccent = "blue" }
                )
                AccentOption(
                    color = Color(0xFFA855F7),
                    isSelected = selectedAccent == "purple",
                    onClick = { selectedAccent = "purple" }
                )
            }
        }
    }
}

@Composable
private fun ReadyPage() {
    OnboardingPageContent(
        icon = Icons.Default.Celebration,
        iconColor = PlexColors.Success,
        title = "You're All Set!",
        description = "Your library is ready. Enjoy your media collection!"
    ) {
        Surface(
            shape = CircleShape,
            color = PlexColors.Success.copy(alpha = 0.1f),
            modifier = Modifier.size(120.dp)
        ) {
            Icon(
                imageVector = Icons.Default.CheckCircle,
                contentDescription = null,
                tint = PlexColors.Success,
                modifier = Modifier.padding(PlexSpacing.XL)
            )
        }
    }
}

// =============================================================================
// HELPER COMPONENTS
// =============================================================================

@Composable
private fun OnboardingPageContent(
    icon: ImageVector,
    iconColor: Color,
    title: String,
    description: String,
    content: @Composable () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(PlexSpacing.XL)
            .padding(bottom = 120.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Icon(
            imageVector = icon,
            contentDescription = null,
            tint = iconColor,
            modifier = Modifier.size(48.dp)
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.LG))
        
        Text(
            text = title,
            style = PlexTypography.TitleLarge,
            color = PlexColors.TextPrimary,
            textAlign = TextAlign.Center,
            fontWeight = FontWeight.Bold
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.SM))
        
        Text(
            text = description,
            style = PlexTypography.BodyMedium,
            color = PlexColors.TextSecondary,
            textAlign = TextAlign.Center
        )
        
        Spacer(modifier = Modifier.height(PlexSpacing.XL))
        
        content()
    }
}

@Composable
private fun FeatureItem(
    icon: ImageVector,
    title: String,
    description: String
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Surface(
            shape = RoundedCornerShape(PlexCorners.SM),
            color = PlexColors.AccentPrimary.copy(alpha = 0.1f),
            modifier = Modifier.size(48.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = PlexColors.AccentPrimary,
                modifier = Modifier.padding(PlexSpacing.SM)
            )
        }
        
        Spacer(modifier = Modifier.width(PlexSpacing.MD))
        
        Column {
            Text(
                text = title,
                style = PlexTypography.BodyMedium,
                color = PlexColors.TextPrimary,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = description,
                style = PlexTypography.LabelSmall,
                color = PlexColors.TextSecondary
            )
        }
    }
}

@Composable
private fun AccountOption(
    icon: ImageVector,
    name: String,
    description: String
) {
    var connected by remember { mutableStateOf(false) }
    
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable { connected = !connected },
        color = PlexColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(PlexSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                tint = if (connected) PlexColors.AccentPrimary else PlexColors.TextSecondary
            )
            
            Spacer(modifier = Modifier.width(PlexSpacing.MD))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = name,
                    style = PlexTypography.BodyMedium,
                    color = PlexColors.TextPrimary
                )
                Text(
                    text = description,
                    style = PlexTypography.LabelSmall,
                    color = PlexColors.TextSecondary
                )
            }
            
            if (connected) {
                Icon(
                    imageVector = Icons.Default.CheckCircle,
                    contentDescription = "Connected",
                    tint = PlexColors.Success
                )
            } else {
                Icon(
                    imageVector = Icons.Default.ChevronRight,
                    contentDescription = null,
                    tint = PlexColors.TextTertiary
                )
            }
        }
    }
}

@Composable
private fun ThemeOption(
    name: String,
    color: Color,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .size(80.dp)
            .clip(RoundedCornerShape(PlexCorners.MD))
            .clickable(onClick = onClick)
            .border(
                width = if (isSelected) 2.dp else 0.dp,
                color = if (isSelected) PlexColors.AccentPrimary else Color.Transparent,
                shape = RoundedCornerShape(PlexCorners.MD)
            ),
        color = color
    ) {
        Box(contentAlignment = Alignment.Center) {
            Text(
                text = name,
                style = PlexTypography.LabelMedium,
                color = if (color == Color.White) Color.Black else Color.White
            )
        }
    }
}

@Composable
private fun AccentOption(
    color: Color,
    isSelected: Boolean,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .size(48.dp)
            .clip(CircleShape)
            .clickable(onClick = onClick)
            .border(
                width = if (isSelected) 3.dp else 0.dp,
                color = if (isSelected) Color.White else Color.Transparent,
                shape = CircleShape
            ),
        color = color
    ) {
        if (isSelected) {
            Icon(
                imageVector = Icons.Default.Check,
                contentDescription = "Selected",
                tint = Color.White,
                modifier = Modifier.padding(PlexSpacing.SM)
            )
        }
    }
}
