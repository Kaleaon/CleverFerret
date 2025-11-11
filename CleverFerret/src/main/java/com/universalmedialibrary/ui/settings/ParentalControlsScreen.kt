package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.layout.ExperimentalLayoutApi
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
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
    CleverFerretTheme(palette = ThemePalette.NAVY_GOLD) {
        val uiState by viewModel.uiState.collectAsState()
        val scrollState = rememberScrollState()

        Scaffold(
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
                            Icon(Icons.Default.ArrowBack, contentDescription = "Back")
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
                            contentDescription = null,
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
                kotlinx.coroutines.delay(2000)
                viewModel.clearSuccess()
            }
            Snackbar(
                modifier = Modifier.padding(16.dp)
            ) {
                Text(message)
            }
        }
    }
}

@Composable
private fun PinSetupCard(
    hasPinSet: Boolean,
    onSetPin: () -> Unit,
    onChangePin: () -> Unit,
    onClearPin: () -> Unit
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
                    if (hasPinSet) Icons.Default.Lock else Icons.Default.LockOpen,
                    contentDescription = null,
                    tint = if (hasPinSet) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.error
                )
                Text(
                    "PIN Protection",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium
                )
            }

            Text(
                if (hasPinSet) "PIN is set and protecting your content" else "Set a PIN to lock adult content and settings",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                if (!hasPinSet) {
                    Button(
                        onClick = onSetPin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Add, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Set PIN")
                    }
                } else {
                    OutlinedButton(
                        onClick = onChangePin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Edit, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Change")
                    }
                    OutlinedButton(
                        onClick = onClearPin,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(Icons.Default.Delete, contentDescription = null, modifier = Modifier.size(18.dp))
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Clear")
                    }
                }
            }
        }
    }
}

@Composable
private fun ContentRestrictionsCard(
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
                    contentDescription = null,
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

            Divider()

            // Block Mature
            SwitchSettingItem(
                title = "Block Mature Content",
                description = "Block stories rated Mature/M/R",
                checked = blockMature,
                onCheckedChange = onBlockMatureChange,
                icon = Icons.Default.WarningAmber
            )

            Divider()

            // Hide Adult Content
            SwitchSettingItem(
                title = "Hide Adult Content",
                description = "Completely hide blocked content from library and searches",
                checked = hideAdultContent,
                onCheckedChange = onHideAdultContentChange,
                icon = Icons.Default.VisibilityOff
            )

            Divider()

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

            Divider()

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
                    contentDescription = null
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
private fun MediaRatingsCard(
    movieLimit: ParentalControlsSettings.MovieRatingLevel,
    tvLimit: ParentalControlsSettings.TvRatingLevel,
    gameLimit: ParentalControlsSettings.GameRatingLevel,
    bookLimit: ParentalControlsSettings.BookRatingLevel,
    onMovieLimitChange: (ParentalControlsSettings.MovieRatingLevel) -> Unit,
    onTvLimitChange: (ParentalControlsSettings.TvRatingLevel) -> Unit,
    onGameLimitChange: (ParentalControlsSettings.GameRatingLevel) -> Unit,
    onBookLimitChange: (ParentalControlsSettings.BookRatingLevel) -> Unit
) {
    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(20.dp)
        ) {
            RatingLimitSelector<ParentalControlsSettings.MovieRatingLevel>(
                icon = Icons.Default.Movie,
                title = "Films & Movies",
                subtitle = "Set the highest MPAA rating that can be accessed.",
                options = ParentalControlsSettings.MovieRatingLevel.values(),
                selected = movieLimit,
                labelProvider = { it.displayName },
                onSelected = onMovieLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.TvRatingLevel>(
                icon = Icons.Default.Tv,
                title = "TV & Streaming",
                subtitle = "Choose the maximum TV rating (TV-Y through TV-MA).",
                options = ParentalControlsSettings.TvRatingLevel.values(),
                selected = tvLimit,
                labelProvider = { it.displayName },
                onSelected = onTvLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.GameRatingLevel>(
                icon = Icons.Default.SportsEsports,
                title = "Games & Interactive Media",
                subtitle = "Limit ESRB ratings for games and interactive content.",
                options = ParentalControlsSettings.GameRatingLevel.values(),
                selected = gameLimit,
                labelProvider = { it.displayName },
                onSelected = onGameLimitChange
            )

            RatingLimitSelector<ParentalControlsSettings.BookRatingLevel>(
                icon = Icons.Default.MenuBook,
                title = "Books & Stories",
                subtitle = "Control access to Mature or Explicit fiction.",
                options = ParentalControlsSettings.BookRatingLevel.values(),
                selected = bookLimit,
                labelProvider = { it.displayName },
                onSelected = onBookLimitChange
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
                contentDescription = null,
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

@OptIn(ExperimentalLayoutApi::class)
@Composable
private fun TagBlockingCard(
    selectedCategories: Set<ParentalControlsSettings.TagBlockCategory>,
    blockedTags: Set<String>,
    onToggleCategory: (ParentalControlsSettings.TagBlockCategory) -> Unit,
    onAddTag: (String) -> Unit,
    onRemoveTag: (String) -> Unit
) {
    var newTag by rememberSaveable { mutableStateOf("") }
    val sortedBlockedTags = remember(blockedTags) { blockedTags.toList().sorted() }

    Card(modifier = Modifier.fillMaxWidth()) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Icon(
                    Icons.Default.Sell,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.primary
                )
                Column {
                    Text(
                        text = "Tag Restrictions",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = "Block content by sensitive tag categories or specific keywords.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }

            FlowRow(
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                ParentalControlsSettings.TagBlockCategory.values().forEach { category ->
                    val isSelected = selectedCategories.contains(category)
                    FilterChip(
                        selected = isSelected,
                        onClick = { onToggleCategory(category) },
                        label = { Text(category.displayName) },
                        leadingIcon = {
                            if (isSelected) {
                                Icon(
                                    Icons.Default.VisibilityOff,
                                    contentDescription = null,
                                    modifier = Modifier.size(18.dp)
                                )
                            }
                        }
                    )
                }
            }

            Divider()

            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text(
                    text = "Custom blocked tags",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    OutlinedTextField(
                        value = newTag,
                        onValueChange = { newTag = it },
                        label = { Text("Add keyword") },
                        singleLine = true,
                        modifier = Modifier.weight(1f),
                        keyboardOptions = KeyboardOptions.Default.copy(
                            imeAction = ImeAction.Done
                        ),
                        keyboardActions = KeyboardActions(onDone = {
                            val trimmed = newTag.trim()
                            if (trimmed.isNotEmpty()) {
                                onAddTag(trimmed)
                                newTag = ""
                            }
                        })
                    )
                    Button(
                        onClick = {
                            val trimmed = newTag.trim()
                            if (trimmed.isNotEmpty()) {
                                onAddTag(trimmed)
                                newTag = ""
                            }
                        },
                        enabled = newTag.trim().isNotEmpty()
                    ) {
                        Text("Add")
                    }
                }

                if (sortedBlockedTags.isEmpty()) {
                    Text(
                        text = "No custom tags blocked yet.",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                } else {
                    FlowRow(
                        horizontalArrangement = Arrangement.spacedBy(8.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        sortedBlockedTags.forEach { tag ->
                            val display = tag.split(" ").joinToString(" ") {
                                it.replaceFirstChar { ch ->
                                    if (ch.isLowerCase()) ch.titlecase(Locale.getDefault()) else ch.toString()
                                }
                            }
                            AssistChip(
                                onClick = { onRemoveTag(tag) },
                                leadingIcon = {
                                    Icon(
                                        Icons.Default.Clear,
                                        contentDescription = null,
                                        modifier = Modifier.size(16.dp)
                                    )
                                },
                                label = { Text(display) }
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun SwitchSettingItem(
    title: String,
    description: String,
    checked: Boolean,
    onCheckedChange: (Boolean) -> Unit,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    enabled: Boolean = true
) {
    Row(
        modifier = Modifier.fillMaxWidth(),
        horizontalArrangement = Arrangement.SpaceBetween,
        verticalAlignment = Alignment.CenterVertically
    ) {
        Row(
            modifier = Modifier.weight(1f),
            horizontalArrangement = Arrangement.spacedBy(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            Icon(
                icon,
                contentDescription = null,
                modifier = Modifier.size(20.dp),
                tint = if (enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = 0.38f)
            )
            Column {
                Text(
                    title,
                    style = MaterialTheme.typography.bodyLarge,
                    color = if (enabled) MaterialTheme.colorScheme.onSurface else MaterialTheme.colorScheme.onSurface.copy(alpha = 0.38f)
                )
                Text(
                    description,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
        Switch(
            checked = checked,
            onCheckedChange = onCheckedChange,
            enabled = enabled
        )
    }
}

@Composable
private fun InfoCard() {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surfaceVariant
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(
                    Icons.Default.Info,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.tertiary
                )
                Text(
                    "How It Works",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Medium
                )
            }
            Text(
                "• Parental controls protect your family from inappropriate content\n" +
                        "• Set a 4-digit PIN to lock settings and adult content\n" +
                        "• Choose to hide or lock mature/explicit rated stories\n" +
                        "• Applies to all fanfiction sites and downloads\n" +
                        "• PIN uses secure encryption (SHA-256)",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

enum class PinDialogType {
    SET, CHANGE, CLEAR, VERIFY
}
