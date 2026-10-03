package com.universalmedialibrary.ui.webfiction

import androidx.compose.animation.*
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.ArrowForward
import androidx.compose.material.icons.automirrored.filled.LibraryBooks
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.services.webfiction.*
import com.universalmedialibrary.ui.components.PinAccessDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale
import com.universalmedialibrary.ui.fanfiction.FanfictionViewModel
import com.universalmedialibrary.data.local.entity.FanfictionStoryEntity
import com.universalmedialibrary.ui.fanfiction.FilterType
import com.universalmedialibrary.ui.icons.PhosphorIcons

/**
 * Unified Fanfiction Hub - All-in-one interface for fanfiction discovery, download, and management.
 * 
 * Streamlined experience combining:
 * - Site selection & Tag-based browsing
 * - Direct story download
 * - Library management (My Library)
 * - Update checker
 * 
 * No more jumping between screens! Reading is handled by the separate eReader.
 */

// Tab indices for the unified fanfiction hub
@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun SiteSelectorCard(
    selectedSite: WebFictionSiteType?,
    adultSitesEnabled: Boolean,
    onSiteSelected: (WebFictionSiteType) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.secondaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Select a Site",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                if (selectedSite != null) {
                    FilterChip(
                        selected = false,
                        onClick = { onSiteSelected(selectedSite) },
                        label = { Text(selectedSite.displayName) },
                        leadingIcon = {
                            Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp))
                        }
                    )
                }
            }
            
            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                items(
                    items = WebFictionSiteType.entries.toTypedArray(),
                    key = { siteType -> siteType.name }
                ) { siteType ->
                    val isAdult = siteType.isAdultSite()
                    val isEnabled = !isAdult || adultSitesEnabled
                    
                    FilterChip(
                        selected = selectedSite == siteType,
                        onClick = { if (isEnabled) onSiteSelected(siteType) },
                        label = { Text(siteType.displayName) },
                        enabled = isEnabled,
                        leadingIcon = if (selectedSite == siteType) {
                            { Icon(Icons.Default.Check, null, modifier = Modifier.size(18.dp)) }
                        } else null
                    )
                }
            }
            
            if (!adultSitesEnabled) {
                Text(
                    "Some sites require enabling Adult Content in Parental Controls",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}
