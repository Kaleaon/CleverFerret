package com.universalmedialibrary.ui.webfiction

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.automirrored.filled.List
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import coil.compose.AsyncImage
import com.universalmedialibrary.services.webfiction.WebFictionService
import com.universalmedialibrary.services.webfiction.WebFictionSite
import com.universalmedialibrary.services.webfiction.WebFictionSiteType
import com.universalmedialibrary.services.webfiction.isAdultSite
import com.universalmedialibrary.services.webfiction.WebFictionStory
import com.universalmedialibrary.services.webfiction.StoryStatus
import com.universalmedialibrary.ui.components.UserFeedbackMessage
import com.universalmedialibrary.ui.components.UserFeedbackSeverity
import com.universalmedialibrary.ui.components.UserFeedbackSnackbarHost
import com.universalmedialibrary.ui.components.showUserFeedback
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import kotlinx.coroutines.launch

@Composable
fun SupportedSitesDialog(
    adultSitesEnabled: Boolean,
    onDismiss: () -> Unit,
    onSiteClick: (WebFictionSite) -> Unit
) {
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text(
                "Supported Web Fiction Sites",
                fontWeight = FontWeight.Medium
            )
        },
        text = {
            LazyColumn(
                modifier = Modifier.height(400.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    items = WebFictionSiteType.values().filter { it != WebFictionSiteType.GENERIC },
                    key = { siteType -> siteType.name }
                ) { siteType ->
                    val enabled = adultSitesEnabled || !siteType.isAdultSite()
                    Card(
                        modifier = Modifier
                            .fillMaxWidth()
                            .alpha(if (enabled) 1f else 0.6f)
                            .clickable(enabled = enabled) { onSiteClick(createWebFictionSiteFromType(siteType)) },
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.surfaceVariant
                        )
                    ) {
                        Row(
                            modifier = Modifier.padding(12.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.Language,
                                contentDescription = "Media image",
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(12.dp))
                            Column {
                                Text(
                                    text = getSiteDisplayName(siteType),
                                    style = MaterialTheme.typography.titleSmall,
                                    fontWeight = FontWeight.Medium
                                )
                                Text(
                                    text = getSiteBaseUrl(siteType),
                                    style = MaterialTheme.typography.bodySmall,
                                    color = MaterialTheme.colorScheme.onSurfaceVariant
                                )
                                if (siteType.isAdultSite()) {
                                    Spacer(modifier = Modifier.height(6.dp))
                                    AssistChip(
                                        onClick = {},
                                        enabled = false,
                                        label = { Text("Adult Source") },
                                        leadingIcon = {
                                            Icon(
                                                Icons.Default.Warning,
                                                contentDescription = "Media image",
                                                tint = MaterialTheme.colorScheme.tertiary
                                            )
                                        },
                                        colors = AssistChipDefaults.assistChipColors(
                                            containerColor = MaterialTheme.colorScheme.secondaryContainer,
                                            labelColor = MaterialTheme.colorScheme.onSecondaryContainer
                                        )
                                    )
                                }
                                if (!enabled && siteType.isAdultSite()) {
                                    Spacer(modifier = Modifier.height(6.dp))
                                    Text(
                                        text = "Enable in Parental Controls to view.",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = MaterialTheme.colorScheme.error
                                    )
                                }
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}
