package com.universalmedialibrary.ui.media.screens

import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.widthIn
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.layout.FlowRow
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ChevronRight
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.CloudDownload
import androidx.compose.material.icons.filled.FolderOpen
import androidx.compose.material.icons.filled.LibraryBooks
import androidx.compose.material.icons.filled.Podcasts
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.theme.MediaCorners
import com.universalmedialibrary.ui.media.theme.MediaSizes
import com.universalmedialibrary.ui.media.theme.MediaSpacing
import com.universalmedialibrary.ui.media.theme.MediaTypography

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun EmptySectionGuidanceRow(
    emptySections: List<EmptySectionHint>,
    onSectionClick: (String) -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal),
        verticalArrangement = Arrangement.spacedBy(MediaSpacing.MD)
    ) {
        Text(
            text = "Add more to your library",
            style = MediaTypography.TitleSmall,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.SemiBold
        )

        FlowRow(
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM),
            verticalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            emptySections.forEach { emptySection ->
                EmptySectionCard(
                    section = emptySection,
                    onClick = { onSectionClick(emptySection.route) }
                )
            }
        }
    }
}

@Composable
internal fun EmptySectionCard(
    section: EmptySectionHint,
    onClick: () -> Unit
) {
    Surface(
        modifier = Modifier
            .widthIn(min = 150.dp)
            .clickable(onClick = onClick),
        shape = RoundedCornerShape(MediaCorners.Card),
        color = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.7f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = MediaSpacing.MD, vertical = MediaSpacing.SM),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(MediaSpacing.SM)
        ) {
            Icon(
                imageVector = section.icon,
                contentDescription = section.name,
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(MediaSizes.IconSM)
            )
            Text(
                text = "Browse ${section.name}",
                style = MediaTypography.LabelMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant,
                maxLines = 1,
                overflow = TextOverflow.Ellipsis
            )
        }
    }
}

@Composable
internal fun WelcomeSection(
    onSearchClick: () -> Unit,
    onBrowseClick: () -> Unit,
    onAddLocalFilesClick: () -> Unit,
    onSubscribePodcastsClick: () -> Unit,
    canDismiss: Boolean = false,
    onDismiss: () -> Unit = {}
) {
    Column(
        modifier = Modifier
            .fillMaxWidth()
            .padding(horizontal = MediaSpacing.ScreenHorizontal)
            .padding(top = MediaSpacing.LG, bottom = MediaSpacing.XL),
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Surface(
            modifier = Modifier.size(80.dp),
            shape = CircleShape,
            color = MaterialTheme.colorScheme.primary.copy(alpha = 0.15f)
        ) {
            Icon(
                imageVector = Icons.Default.LibraryBooks,
                contentDescription = "Library icon",
                modifier = Modifier
                    .padding(MediaSpacing.LG)
                    .fillMaxSize(),
                tint = MaterialTheme.colorScheme.primary
            )
        }

        Spacer(modifier = Modifier.height(MediaSpacing.LG))

        Text(
            text = "Welcome to CleverFerret",
            style = MediaTypography.TitleLarge,
            color = MaterialTheme.colorScheme.onBackground,
            fontWeight = FontWeight.Bold,
            textAlign = TextAlign.Center
        )

        Spacer(modifier = Modifier.height(MediaSpacing.SM))

        Text(
            text = "Your universal media library",
            style = MediaTypography.BodyLarge,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )

        Spacer(modifier = Modifier.height(MediaSpacing.MD))

        if (canDismiss) {
            TextButton(onClick = onDismiss) {
                Icon(
                    imageVector = Icons.Default.Close,
                    contentDescription = "Dismiss onboarding tips"
                )
                Spacer(modifier = Modifier.width(MediaSpacing.XS))
                Text("Dismiss onboarding tips")
            }
        }

        Spacer(modifier = Modifier.height(MediaSpacing.XL))

        Surface(
            modifier = Modifier.fillMaxWidth(),
            shape = RoundedCornerShape(MediaCorners.Card),
            color = MaterialTheme.colorScheme.surfaceVariant,
            tonalElevation = 2.dp
        ) {
            Column(modifier = Modifier.padding(MediaSpacing.LG)) {
                Text(
                    text = "Get Started",
                    style = MediaTypography.TitleSmall,
                    color = MaterialTheme.colorScheme.onSurface,
                    fontWeight = FontWeight.SemiBold
                )

                Spacer(modifier = Modifier.height(MediaSpacing.MD))

                GettingStartedItem(
                    icon = Icons.Default.FolderOpen,
                    title = "Add Local Files",
                    description = "Import books, music, and videos from your device",
                    onClick = onAddLocalFilesClick
                )

                Spacer(modifier = Modifier.height(MediaSpacing.SM))

                GettingStartedItem(
                    icon = Icons.Default.CloudDownload,
                    title = "Browse OPDS Catalogs",
                    description = "Discover free ebooks from online libraries",
                    onClick = onBrowseClick
                )

                Spacer(modifier = Modifier.height(MediaSpacing.SM))

                GettingStartedItem(
                    icon = Icons.Default.Podcasts,
                    title = "Subscribe to Podcasts",
                    description = "Add your favorite podcast feeds",
                    onClick = onSubscribePodcastsClick
                )

                Spacer(modifier = Modifier.height(MediaSpacing.SM))

                GettingStartedItem(
                    icon = Icons.Default.Search,
                    title = "Search & Discover",
                    description = "Find content across all your media",
                    onClick = onSearchClick
                )
            }
        }

        Spacer(modifier = Modifier.height(MediaSpacing.XL))

        Text(
            text = "Explore the categories below to start building your library",
            style = MediaTypography.BodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}

@Composable
internal fun GettingStartedItem(
    icon: ImageVector,
    title: String,
    description: String,
    onClick: (() -> Unit)? = null
) {
    val interactionModifier = if (onClick != null) {
        Modifier.clickable(onClick = onClick)
    } else {
        Modifier
    }

    Row(
        modifier = interactionModifier
            .fillMaxWidth()
            .padding(vertical = MediaSpacing.SM),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Surface(
            modifier = Modifier.size(40.dp),
            shape = RoundedCornerShape(MediaCorners.SM),
            color = MaterialTheme.colorScheme.primary.copy(alpha = 0.1f)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = title,
                modifier = Modifier
                    .padding(MediaSpacing.SM)
                    .fillMaxSize(),
                tint = MaterialTheme.colorScheme.primary
            )
        }

        Spacer(modifier = Modifier.width(MediaSpacing.MD))

        Column(modifier = Modifier.weight(1f)) {
            Text(
                text = title,
                style = MediaTypography.BodyMedium,
                color = MaterialTheme.colorScheme.onSurface,
                fontWeight = FontWeight.Medium
            )
            Text(
                text = description,
                style = MediaTypography.BodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }

        if (onClick != null) {
            Icon(
                imageVector = Icons.Default.ChevronRight,
                contentDescription = "Navigate to $title",
                modifier = Modifier.size(MediaSizes.IconMD),
                tint = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}
