package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.runtime.saveable.rememberSaveable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.ui.components.PinEntryDialog
import com.universalmedialibrary.ui.theme.CleverFerretTheme
import com.universalmedialibrary.ui.theme.ThemePalette
import java.util.Locale

@Composable
internal fun ContentRestrictionsCard(
    blockMature: Boolean,
    blockExplicit: Boolean,
    hideAdultContent: Boolean,
    requirePinForAdult: Boolean,
    allowAdultSources: Boolean,
    canToggleAdultSources: Boolean,
    adultSourcesDisabledReason: String?,
    hasPinSet: Boolean,
    onBlockMatureChange: (Boolean) -> Unit,
    onBlockExplicitChange: (Boolean) -> Unit,
    onHideAdultContentChange: (Boolean) -> Unit,
    onAllowAdultSourcesChange: (Boolean) -> Unit,
    onRequirePinChange: (Boolean) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Block,
                    contentDescription = "Media image",
                    tint = MaterialTheme.colorScheme.error
                )
                Text(
                    "Content Restrictions",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            // Block Explicit
            SwitchSettingItem(
                title = "Block Explicit Content",
                description = "Block stories rated Explicit/Adult/NC-17",
                checked = blockExplicit,
                onCheckedChange = onBlockExplicitChange,
                icon = Icons.Default.Warning
            )

            HorizontalDivider()

            // Block Mature
            SwitchSettingItem(
                title = "Block Mature Content",
                description = "Block stories rated Mature/M/R",
                checked = blockMature,
                onCheckedChange = onBlockMatureChange,
                icon = Icons.Default.WarningAmber
            )

            HorizontalDivider()

            // Hide Adult Content
            SwitchSettingItem(
                title = "Hide Adult Content",
                description = "Completely hide blocked content from library and searches",
                checked = hideAdultContent,
                onCheckedChange = onHideAdultContentChange,
                icon = Icons.Default.VisibilityOff
            )

            HorizontalDivider()

            // Adult Content Sources toggle
            val adultDescription = if (canToggleAdultSources) {
                "Allow searching and downloading from adult-oriented fiction sites"
            } else {
                adultSourcesDisabledReason ?: "Currently disabled by parental control settings"
            }
            SwitchSettingItem(
                title = "Enable Adult Story Sources",
                description = adultDescription,
                checked = allowAdultSources && canToggleAdultSources,
                onCheckedChange = onAllowAdultSourcesChange,
                icon = Icons.Default.Explicit,
                enabled = canToggleAdultSources
            )

            if (!canToggleAdultSources) {
                Text(
                    text = adultSourcesDisabledReason ?: "Adult site access is disabled by current settings.",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            HorizontalDivider()

            // Require PIN for Adult
            SwitchSettingItem(
                title = "Require PIN for Adult Content",
                description = if (hasPinSet) "PIN required to access mature/explicit content" else "Set a PIN first to enable",
                checked = requirePinForAdult,
                onCheckedChange = onRequirePinChange,
                icon = Icons.Default.Lock,
                enabled = hasPinSet
            )
        }
    }
}
