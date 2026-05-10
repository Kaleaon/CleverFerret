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

/**
 * Parental Controls Settings Screen
 * 
 * Features:
 * - Enable/disable parental controls
 * - Set/change PIN
 * - Block mature/explicit content
 * - Hide adult content
 * - Require PIN for adult content
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ParentalControlsScreen(
    navController: NavController,
    viewModel: ParentalControlsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    val scrollState = rememberScrollState()
    val snackbarHostState = remember { SnackbarHostState() }

    Scaffold(
        snackbarHost = { SnackbarHost(snackbarHostState) },
        topBar = {
            TopAppBar(
                    title = {
                        Text(
                            "Parental Controls",
                            fontWeight = FontWeight.Medium
                        )
                    },
                    navigationIcon = {
                        IconButton(onClick = { navController.navigateUp() }) {
                            Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                        }
                    },
                    colors = TopAppBarDefaults.topAppBarColors(
                        containerColor = MaterialTheme.colorScheme.surface,
                        titleContentColor = MaterialTheme.colorScheme.onSurface
                    )
                )
            }
        ) { paddingValues ->
            Column(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(paddingValues)
                    .verticalScroll(scrollState)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Header Card
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.primaryContainer
                    )
                ) {
                    Row(
                        modifier = Modifier.padding(16.dp),
                        horizontalArrangement = Arrangement.spacedBy(12.dp),
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Icon(
                            Icons.Default.FamilyRestroom,
                            contentDescription = "Media image",
                            modifier = Modifier.size(48.dp),
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Column {
                            Text(
                                "Family-Friendly Protection",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Bold
                            )
                            Text(
                                "Control access to mature content",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }

                // Master Enable Switch
                Card(modifier = Modifier.fillMaxWidth()) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Column(modifier = Modifier.weight(1f)) {
                            Text(
                                "Enable Parental Controls",
                                style = MaterialTheme.typography.titleMedium,
                                fontWeight = FontWeight.Medium
                            )
                            Text(
                                if (uiState.state.enabled) "Protection active" else "No restrictions",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant
                            )
                        }
                        Switch(
                            checked = uiState.state.enabled,
                            onCheckedChange = { viewModel.toggleParentalControls() }
                        )
                    }
                }

                // PIN Setup
                if (uiState.state.enabled) {
                    PinSetupCard(
                        hasPinSet = uiState.state.hasPinSet,
                        onSetPin = { viewModel.showPinDialog(PinDialogType.SET) },
                        onChangePin = { viewModel.showPinDialog(PinDialogType.CHANGE) },
                        onClearPin = { viewModel.showPinDialog(PinDialogType.CLEAR) }
                    )
                }

                // Content Restrictions
                if (uiState.state.enabled) {
                    val ratingLimitsAreUnrestricted =
                        uiState.state.movieRatingLimit == ParentalControlsSettings.MovieRatingLevel.UNRESTRICTED &&
                        uiState.state.tvRatingLimit == ParentalControlsSettings.TvRatingLevel.UNRESTRICTED &&
                        uiState.state.gameRatingLimit == ParentalControlsSettings.GameRatingLevel.UNRESTRICTED &&
                        uiState.state.bookRatingLimit == ParentalControlsSettings.BookRatingLevel.UNRESTRICTED

                    val canToggleAdultSources =
                        !uiState.state.blockExplicit &&
                        !uiState.state.hideAdultContent &&
                        ratingLimitsAreUnrestricted

                    val adultSourceDisabledReason = when {
                        uiState.state.blockExplicit || uiState.state.hideAdultContent ->
                            "Disabled while explicit content is blocked or hidden."
                        !ratingLimitsAreUnrestricted ->
                            "Increase each rating limit to \"Allow All\" before enabling adult sources."
                        else -> null
                    }

                    ContentRestrictionsCard(
                        blockMature = uiState.state.blockMature,
                        blockExplicit = uiState.state.blockExplicit,
                        hideAdultContent = uiState.state.hideAdultContent,
                        requirePinForAdult = uiState.state.requirePinForAdult && uiState.state.hasPinSet,
                        allowAdultSources = uiState.state.allowAdultSources,
                        canToggleAdultSources = canToggleAdultSources,
                        adultSourcesDisabledReason = adultSourceDisabledReason,
                        hasPinSet = uiState.state.hasPinSet,
                        onBlockMatureChange = { viewModel.setBlockMature(it) },
                        onBlockExplicitChange = { viewModel.setBlockExplicit(it) },
                        onHideAdultContentChange = { viewModel.setHideAdultContent(it) },
                        onAllowAdultSourcesChange = { viewModel.setAllowAdultSources(it) },
                        onRequirePinChange = { viewModel.setRequirePinForAdult(it) }
                    )

                    MediaRatingsCard(
                        movieLimit = uiState.state.movieRatingLimit,
                        tvLimit = uiState.state.tvRatingLimit,
                        gameLimit = uiState.state.gameRatingLimit,
                        bookLimit = uiState.state.bookRatingLimit,
                        onMovieLimitChange = viewModel::setMovieRatingLimit,
                        onTvLimitChange = viewModel::setTvRatingLimit,
                        onGameLimitChange = viewModel::setGameRatingLimit,
                        onBookLimitChange = viewModel::setBookRatingLimit
                    )

                    TagBlockingCard(
                        selectedCategories = uiState.state.blockedTagCategories,
                        blockedTags = uiState.state.blockedTags,
                        onToggleCategory = viewModel::toggleTagCategory,
                        onAddTag = viewModel::addBlockedTag,
                        onRemoveTag = viewModel::removeBlockedTag
                    )
                }

                // Additional Settings
                if (uiState.state.enabled) {
                    AdditionalSettingsCard(
                        lockSettings = uiState.state.lockSettings,
                        onLockSettingsChange = { viewModel.setLockSettings(it) }
                    )
                }

                // Info Card
                InfoCard()
            }
        }

        // PIN Dialog
        if (uiState.showPinDialog) {
            val dialogType = uiState.pinDialogType
            var dialogTitle = "Enter PIN"
            var initialPrompt = "Enter your PIN to continue."
            var confirmPrompt: String? = null
            var supportingText: String? = null

            when (dialogType) {
                PinDialogType.SET -> {
                    dialogTitle = "Set PIN"
                    initialPrompt = "Choose a new 4-digit PIN."
                    confirmPrompt = "Confirm your new PIN."
                    supportingText = "PIN must be exactly four digits."
                }
                PinDialogType.CHANGE -> {
                    dialogTitle = "Change PIN"
                    initialPrompt = "Enter your new 4-digit PIN."
                    confirmPrompt = "Confirm your new PIN."
                    supportingText = "PIN must be exactly four digits."
                }
                PinDialogType.CLEAR -> {
                    dialogTitle = "Clear PIN"
                    initialPrompt = "Enter your current PIN to clear it."
                }
                PinDialogType.VERIFY -> {
                    dialogTitle = "Enter PIN"
                    initialPrompt = "Enter your PIN to continue."
                }
            }

            PinEntryDialog(
                title = dialogTitle,
                initialPrompt = initialPrompt,
                confirmPrompt = confirmPrompt,
                supportingText = supportingText,
                error = uiState.pinError,
                onDismiss = { viewModel.dismissPinDialog() },
                onPinComplete = { pin -> viewModel.handlePinDialog(pin) }
            )
        }

    // Success Message
    uiState.successMessage?.let { message ->
        LaunchedEffect(message) {
            snackbarHostState.showSnackbar(
                message = message,
                duration = SnackbarDuration.Short
            )
            viewModel.clearSuccess()
        }
    }
}



@Composable
private fun AdditionalSettingsCard(
    lockSettings: Boolean,
    onLockSettingsChange: (Boolean) -> Unit
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
                    Icons.Default.Settings,
                    contentDescription = "Media image"
                )
                Text(
                    "Additional Settings",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            SwitchSettingItem(
                title = "Lock Settings",
                description = "Require PIN to change parental control settings",
                checked = lockSettings,
                onCheckedChange = onLockSettingsChange,
                icon = Icons.Default.Lock
            )
        }
    }
}


@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun <T : Enum<T>> RatingLimitSelector(
    icon: ImageVector,
    title: String,
    subtitle: String,
    options: Array<T>,
    selected: T,
    labelProvider: (T) -> String,
    onSelected: (T) -> Unit
) {
    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Icon(
                icon,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.primary,
                modifier = Modifier.size(28.dp)
            )
            Column {
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
        }

        FlowRow(
            horizontalArrangement = Arrangement.spacedBy(8.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            options.forEach { option ->
                FilterChip(
                    selected = option == selected,
                    onClick = { onSelected(option) },
                    label = { Text(labelProvider(option)) }
                )
            }
        }
    }
}




enum class PinDialogType {
    SET, CHANGE, CLEAR, VERIFY
}
