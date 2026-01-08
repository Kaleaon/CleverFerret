package com.universalmedialibrary.ui.media.screens

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.navigation.MediaRoutes
import com.universalmedialibrary.ui.media.theme.MediaColors
import com.universalmedialibrary.ui.media.theme.MediaCorners
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.media.theme.MediaTypography

/**
 * Media-centric "Discover / Display" screen.
 *
 * Intent: show off everything the app can do (podcasts, internet radio, free ebooks, etc.)
 * in one place, even if the local library is empty.
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MediaDiscoverScreen(
    onNavigate: (String) -> Unit,
    onBackClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    Scaffold(
        modifier = modifier.background(MediaColors.Background),
        containerColor = MediaColors.Background,
        topBar = {
            TopAppBar(
                title = {
                    Text(
                        text = "Discover",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                },
                navigationIcon = {
                    IconButton(onClick = onBackClick) {
                        Icon(
                            imageVector = Icons.Default.ArrowBack,
                            contentDescription = "Back",
                            tint = MediaColors.TextPrimary
                        )
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MediaColors.BackgroundElevated
                )
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(MediaSpacing.ScreenHorizontal),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
        ) {
            item {
                Spacer(modifier = Modifier.height(MediaSpacing.SM))
                Text(
                    text = "Explore content sources and formats",
                    style = MediaTypography.BodyMedium,
                    color = MediaColors.TextSecondary
                )
            }

            item {
                SectionHeader(title = "Free & Online", icon = Icons.Outlined.Public)
            }

            item {
                FeatureCard(
                    title = "Free eBooks (OPDS)",
                    subtitle = "Browse OPDS catalogs and download ebooks",
                    icon = Icons.Outlined.CloudDownload,
                    iconTint = MediaColors.AccentSecondary,
                    onClick = { onNavigate(MediaRoutes.OPDS_BROWSER) }
                )
            }

            item {
                FeatureCard(
                    title = "Podcasts",
                    subtitle = "Subscriptions, episodes, downloads, OPML",
                    icon = Icons.Outlined.Podcasts,
                    iconTint = MediaColors.MediaTypes.Podcast,
                    onClick = { onNavigate(MediaRoutes.PODCASTS) }
                )
            }

            item {
                FeatureCard(
                    title = "Internet Radio",
                    subtitle = "Browse stations, favorites, categories",
                    icon = Icons.Outlined.Radio,
                    iconTint = MediaColors.MediaTypes.Radio,
                    onClick = { onNavigate(MediaRoutes.RADIO) }
                )
            }

            item {
                FeatureCard(
                    title = "Web Fiction",
                    subtitle = "Track web serials and fanfiction updates",
                    icon = Icons.Outlined.Language,
                    iconTint = MediaColors.MediaTypes.Fanfiction,
                    onClick = { onNavigate(MediaRoutes.WEB_FICTION) }
                )
            }

            item {
                FeatureCard(
                    title = "Ambient Sounds",
                    subtitle = "Soundscapes for focus and sleep",
                    icon = Icons.Outlined.Spa,
                    iconTint = MediaColors.AccentTertiary,
                    onClick = { onNavigate(MediaRoutes.AMBIENT_SOUNDS) }
                )
            }

            item {
                SectionHeader(title = "Tools", icon = Icons.Outlined.Build)
            }

            item {
                FeatureCard(
                    title = "Visualizer",
                    subtitle = "Live audio visualizations (requires microphone permission)",
                    icon = Icons.Outlined.Equalizer,
                    iconTint = MediaColors.Info,
                    onClick = { onNavigate(MediaRoutes.VISUALIZER) }
                )
            }

            item {
                FeatureCard(
                    title = "Sync & Backup",
                    subtitle = "Sync progress and libraries across services",
                    icon = Icons.Outlined.Sync,
                    iconTint = MediaColors.Info,
                    onClick = { onNavigate(MediaRoutes.SYNC) }
                )
            }

            item {
                FeatureCard(
                    title = "Import & Export",
                    subtitle = "OPML, Goodreads, progress, settings backups",
                    icon = Icons.Outlined.ImportExport,
                    iconTint = MediaColors.AccentPrimary,
                    onClick = { onNavigate(MediaRoutes.IMPORT_EXPORT) }
                )
            }

            item {
                FeatureCard(
                    title = "File Browser",
                    subtitle = "Browse folders (ebooks, documents, comics)",
                    icon = Icons.Outlined.Folder,
                    iconTint = MediaColors.AccentSecondary,
                    onClick = { onNavigate(MediaRoutes.FILE_BROWSER) }
                )
            }

            item {
                Spacer(modifier = Modifier.height(MediaSpacing.Huge))
            }
        }
    }
}

@Composable
private fun SectionHeader(
    title: String,
    icon: ImageVector
) {
    Row(
        modifier = Modifier
            .fillMaxWidth()
            .padding(top = MediaSpacing.MD, bottom = MediaSpacing.XS),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Icon(
            imageVector = icon,
            contentDescription = "Media image",
            tint = MediaColors.TextSecondary,
            modifier = Modifier.size(18.dp)
        )
        Spacer(modifier = Modifier.width(MediaSpacing.SM))
        Text(
            text = title.uppercase(),
            style = MediaTypography.LabelSmall,
            color = MediaColors.TextTertiary,
            fontWeight = FontWeight.SemiBold
        )
    }
}

@Composable
private fun FeatureCard(
    title: String,
    subtitle: String,
    icon: ImageVector,
    iconTint: Color,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(MediaCorners.Card))
            .clickable(onClick = onClick),
        color = MediaColors.BackgroundElevated
    ) {
        Row(
            modifier = Modifier.padding(MediaSpacing.MD),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Surface(
                modifier = Modifier.size(44.dp),
                color = iconTint.copy(alpha = 0.15f),
                shape = RoundedCornerShape(MediaCorners.SM)
            ) {
                Box(contentAlignment = Alignment.Center) {
                    Icon(
                        imageVector = icon,
                        contentDescription = "Media image",
                        tint = iconTint,
                        modifier = Modifier.size(22.dp)
                    )
                }
            }

            Spacer(modifier = Modifier.width(MediaSpacing.MD))

            Column(modifier = Modifier.weight(1f)) {
                Text(
                    text = title,
                    style = MediaTypography.BodyLarge,
                    color = MediaColors.TextPrimary,
                    fontWeight = FontWeight.Medium
                )
                Text(
                    text = subtitle,
                    style = MediaTypography.BodySmall,
                    color = MediaColors.TextSecondary
                )
            }

            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Media image",
                tint = MediaColors.TextTertiary
            )
        }
    }
}

