package com.universalmedialibrary.ui.aientertainment

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.animateColorAsState
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.ChatPreset
import com.universalmedialibrary.data.aientertainment.PresetTemplates

/**
 * Chat Presets Screen - Manage AI chat configurations
 * 
 * Features inspired by oxproxion:
 * - Quick preset switching
 * - Template-based creation
 * - Model/provider selection
 * - Feature toggles (streaming, reasoning, web search)
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ChatPresetsScreen(
    onNavigateBack: () -> Unit,
    onPresetSelected: (Long) -> Unit,
    viewModel: ChatPresetsViewModel = hiltViewModel()
) {
    val presets by viewModel.presets.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    var showCreateDialog by remember { mutableStateOf(false) }
    var showTemplatesSheet by remember { mutableStateOf(false) }
    var editingPreset by remember { mutableStateOf<ChatPreset?>(null) }

    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null, tint = SynthColors.textPrimary)
                    }
                },
                title = {
                    Row(verticalAlignment = Alignment.CenterVertically) {
                        Icon(
                            Icons.Outlined.Tune,
                            null,
                            tint = SynthColors.primary,
                            modifier = Modifier.size(24.dp)
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text("Chat Presets", color = SynthColors.textPrimary)
                    }
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary
                ),
                actions = {
                    IconButton(onClick = { showTemplatesSheet = true }) {
                        Icon(Icons.Outlined.AutoAwesome, "Templates", tint = SynthColors.primary)
                    }
                }
            )
        },
        floatingActionButton = {
            ExtendedFloatingActionButton(
                onClick = { showCreateDialog = true },
                containerColor = SynthColors.primary,
                contentColor = Color.White
            ) {
                Icon(Icons.Default.Add, null)
                Spacer(modifier = Modifier.width(8.dp))
                Text("New Preset")
            }
        },
        containerColor = SynthColors.background
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = SynthColors.primary)
            }
        } else if (presets.isEmpty()) {
            EmptyPresetsState(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                onCreateClick = { showCreateDialog = true },
                onTemplatesClick = { showTemplatesSheet = true }
            )
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // Favorites section
                val favorites = presets.filter { it.isFavorite }
                if (favorites.isNotEmpty()) {
                    item {
                        Text(
                            "Favorites",
                            style = MaterialTheme.typography.titleSmall,
                            color = SynthColors.textSecondary,
                            modifier = Modifier.padding(bottom = 8.dp)
                        )
                    }
                    items(favorites) { preset ->
                        PresetCard(
                            preset = preset,
                            onClick = { onPresetSelected(preset.id) },
                            onEdit = { editingPreset = preset },
                            onToggleFavorite = { viewModel.toggleFavorite(preset.id) },
                            onDelete = { viewModel.deletePreset(preset.id) }
                        )
                    }
                    item { Spacer(modifier = Modifier.height(8.dp)) }
                }

                // All presets
                val nonFavorites = presets.filter { !it.isFavorite }
                if (nonFavorites.isNotEmpty()) {
                    item {
                        Text(
                            if (favorites.isNotEmpty()) "All Presets" else "Your Presets",
                            style = MaterialTheme.typography.titleSmall,
                            color = SynthColors.textSecondary,
                            modifier = Modifier.padding(bottom = 8.dp)
                        )
                    }
                    items(nonFavorites) { preset ->
                        PresetCard(
                            preset = preset,
                            onClick = { onPresetSelected(preset.id) },
                            onEdit = { editingPreset = preset },
                            onToggleFavorite = { viewModel.toggleFavorite(preset.id) },
                            onDelete = { viewModel.deletePreset(preset.id) }
                        )
                    }
                }

                // Bottom padding for FAB
                item { Spacer(modifier = Modifier.height(80.dp)) }
            }
        }
    }

    // Create/Edit dialog
    if (showCreateDialog || editingPreset != null) {
        PresetEditDialog(
            preset = editingPreset,
            onDismiss = {
                showCreateDialog = false
                editingPreset = null
            },
            onSave = { preset ->
                if (editingPreset != null) {
                    viewModel.updatePreset(preset)
                } else {
                    viewModel.createPreset(preset)
                }
                showCreateDialog = false
                editingPreset = null
            }
        )
    }

    // Templates bottom sheet
    if (showTemplatesSheet) {
        TemplatesBottomSheet(
            onDismiss = { showTemplatesSheet = false },
            onTemplateSelected = { template ->
                viewModel.createFromTemplate(template)
                showTemplatesSheet = false
            }
        )
    }
}

@Composable
private fun EmptyPresetsState(
    modifier: Modifier = Modifier,
    onCreateClick: () -> Unit,
    onTemplatesClick: () -> Unit
) {
    Column(
        modifier = modifier.padding(32.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        Box(
            modifier = Modifier
                .size(100.dp)
                .clip(CircleShape)
                .background(SynthColors.primary.copy(alpha = 0.1f)),
            contentAlignment = Alignment.Center
        ) {
            Icon(
                Icons.Outlined.Tune,
                null,
                modifier = Modifier.size(50.dp),
                tint = SynthColors.primary
            )
        }

        Spacer(modifier = Modifier.height(24.dp))

        Text(
            "No Presets Yet",
            style = MaterialTheme.typography.headlineSmall,
            color = SynthColors.textPrimary
        )

        Spacer(modifier = Modifier.height(8.dp))

        Text(
            "Create presets to quickly switch between AI models, personas, and settings",
            style = MaterialTheme.typography.bodyMedium,
            color = SynthColors.textSecondary,
            modifier = Modifier.padding(horizontal = 32.dp)
        )

        Spacer(modifier = Modifier.height(32.dp))

        Row(horizontalArrangement = Arrangement.spacedBy(12.dp)) {
            OutlinedButton(
                onClick = onTemplatesClick,
                colors = ButtonDefaults.outlinedButtonColors(
                    contentColor = SynthColors.primary
                ),
                border = BorderStroke(1.dp, SynthColors.primary)
            ) {
                Icon(Icons.Outlined.AutoAwesome, null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(8.dp))
                Text("Use Template")
            }

            Button(
                onClick = onCreateClick,
                colors = ButtonDefaults.buttonColors(containerColor = SynthColors.primary)
            ) {
                Icon(Icons.Default.Add, null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(8.dp))
                Text("Create New")
            }
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PresetCard(
    preset: ChatPreset,
    onClick: () -> Unit,
    onEdit: () -> Unit,
    onToggleFavorite: () -> Unit,
    onDelete: () -> Unit
) {
    var showMenu by remember { mutableStateOf(false) }
    val presetColor = Color(preset.color)

    Card(
        onClick = onClick,
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(12.dp),
        border = BorderStroke(1.dp, SynthColors.border)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Icon
            Box(
                modifier = Modifier
                    .size(48.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(
                        Brush.linearGradient(
                            colors = listOf(presetColor, presetColor.copy(alpha = 0.7f))
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Text(preset.icon, fontSize = 24.sp)
            }

            Spacer(modifier = Modifier.width(16.dp))

            // Info
            Column(modifier = Modifier.weight(1f)) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(
                        preset.title,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.SemiBold,
                        color = SynthColors.textPrimary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    if (preset.isFavorite) {
                        Spacer(modifier = Modifier.width(8.dp))
                        Icon(
                            Icons.Filled.Star,
                            null,
                            modifier = Modifier.size(16.dp),
                            tint = SynthColors.warning
                        )
                    }
                }

                Spacer(modifier = Modifier.height(4.dp))

                Text(
                    preset.configurationSummary,
                    style = MaterialTheme.typography.bodySmall,
                    color = SynthColors.textSecondary,
                    maxLines = 1,
                    overflow = TextOverflow.Ellipsis
                )

                if (preset.description.isNotEmpty()) {
                    Spacer(modifier = Modifier.height(2.dp))
                    Text(
                        preset.description,
                        style = MaterialTheme.typography.bodySmall,
                        color = SynthColors.textMuted,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }

            // Features chips
            Column(
                horizontalAlignment = Alignment.End,
                modifier = Modifier.padding(start = 8.dp)
            ) {
                Row(horizontalArrangement = Arrangement.spacedBy(4.dp)) {
                    if (preset.streamingEnabled) {
                        FeatureChip("⚡", "Streaming")
                    }
                    if (preset.reasoningEnabled) {
                        FeatureChip("🧠", "Reasoning")
                    }
                    if (preset.webSearchEnabled) {
                        FeatureChip("🔍", "Web")
                    }
                    if (preset.conversationModeEnabled) {
                        FeatureChip("🎙️", "Voice")
                    }
                    if (preset.isLocalModel) {
                        FeatureChip("🏠", "Local")
                    }
                }
            }

            // Menu
            Box {
                IconButton(onClick = { showMenu = true }) {
                    Icon(Icons.Default.MoreVert, null, tint = SynthColors.textMuted)
                }

                DropdownMenu(
                    expanded = showMenu,
                    onDismissRequest = { showMenu = false }
                ) {
                    DropdownMenuItem(
                        text = { Text("Edit") },
                        onClick = {
                            showMenu = false
                            onEdit()
                        },
                        leadingIcon = { Icon(Icons.Outlined.Edit, null) }
                    )
                    DropdownMenuItem(
                        text = { Text(if (preset.isFavorite) "Remove from Favorites" else "Add to Favorites") },
                        onClick = {
                            showMenu = false
                            onToggleFavorite()
                        },
                        leadingIcon = {
                            Icon(
                                if (preset.isFavorite) Icons.Filled.Star else Icons.Outlined.StarBorder,
                                null
                            )
                        }
                    )
                    DropdownMenuItem(
                        text = { Text("Delete", color = SynthColors.error) },
                        onClick = {
                            showMenu = false
                            onDelete()
                        },
                        leadingIcon = { Icon(Icons.Outlined.Delete, null, tint = SynthColors.error) }
                    )
                }
            }
        }
    }
}

@Composable
private fun FeatureChip(emoji: String, label: String) {
    Surface(
        shape = RoundedCornerShape(4.dp),
        color = SynthColors.backgroundSecondary
    ) {
        Text(
            emoji,
            fontSize = 12.sp,
            modifier = Modifier.padding(horizontal = 4.dp, vertical = 2.dp)
        )
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun TemplatesBottomSheet(
    onDismiss: () -> Unit,
    onTemplateSelected: (ChatPreset) -> Unit
) {
    ModalBottomSheet(
        onDismissRequest = onDismiss,
        containerColor = SynthColors.surface
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Preset Templates",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                color = SynthColors.textPrimary
            )

            Text(
                "Choose a template to get started quickly",
                style = MaterialTheme.typography.bodyMedium,
                color = SynthColors.textSecondary
            )

            Spacer(modifier = Modifier.height(16.dp))

            LazyRow(
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                items(PresetTemplates.allTemplates) { template ->
                    TemplateCard(
                        template = template,
                        onClick = { onTemplateSelected(template) }
                    )
                }
            }

            Spacer(modifier = Modifier.height(32.dp))
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun TemplateCard(
    template: ChatPreset,
    onClick: () -> Unit
) {
    val templateColor = Color(template.color)

    Card(
        onClick = onClick,
        colors = CardDefaults.cardColors(containerColor = SynthColors.backgroundSecondary),
        shape = RoundedCornerShape(12.dp),
        modifier = Modifier.width(160.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Box(
                modifier = Modifier
                    .size(56.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(
                        Brush.linearGradient(
                            colors = listOf(templateColor, templateColor.copy(alpha = 0.7f))
                        )
                    ),
                contentAlignment = Alignment.Center
            ) {
                Text(template.icon, fontSize = 28.sp)
            }

            Spacer(modifier = Modifier.height(12.dp))

            Text(
                template.title,
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.SemiBold,
                color = SynthColors.textPrimary,
                maxLines = 1
            )

            Spacer(modifier = Modifier.height(4.dp))

            Text(
                template.description,
                style = MaterialTheme.typography.bodySmall,
                color = SynthColors.textSecondary,
                maxLines = 2,
                minLines = 2
            )
        }
    }
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
private fun PresetEditDialog(
    preset: ChatPreset?,
    onDismiss: () -> Unit,
    onSave: (ChatPreset) -> Unit
) {
    val isNew = preset == null
    var title by remember { mutableStateOf(preset?.title ?: "") }
    var description by remember { mutableStateOf(preset?.description ?: "") }
    var icon by remember { mutableStateOf(preset?.icon ?: "🤖") }
    var providerId by remember { mutableStateOf(preset?.providerId ?: "OPENROUTER") }
    var modelId by remember { mutableStateOf(preset?.modelId ?: "openai/gpt-4o-mini") }
    var systemMessage by remember { mutableStateOf(preset?.systemMessage ?: "") }
    var temperature by remember { mutableFloatStateOf(preset?.temperature ?: 0.7f) }
    var maxTokens by remember { mutableIntStateOf(preset?.maxTokens ?: 1024) }
    var streamingEnabled by remember { mutableStateOf(preset?.streamingEnabled ?: true) }
    var reasoningEnabled by remember { mutableStateOf(preset?.reasoningEnabled ?: false) }
    var webSearchEnabled by remember { mutableStateOf(preset?.webSearchEnabled ?: false) }
    var conversationModeEnabled by remember { mutableStateOf(preset?.conversationModeEnabled ?: false) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text(if (isNew) "Create Preset" else "Edit Preset") },
        text = {
            Column(
                modifier = Modifier
                    .verticalScroll(rememberScrollState())
                    .fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Basic Info
                OutlinedTextField(
                    value = title,
                    onValueChange = { title = it },
                    label = { Text("Title") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )

                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description") },
                    modifier = Modifier.fillMaxWidth(),
                    maxLines = 2
                )

                // Provider selection
                Text("Provider", style = MaterialTheme.typography.labelMedium, color = SynthColors.textSecondary)
                Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    listOf(
                        "OPENROUTER" to "OpenRouter",
                        "OPENAI" to "OpenAI",
                        "GEMINI" to "Gemini",
                        "LOCAL_LLM" to "Local"
                    ).forEach { (id, name) ->
                        FilterChip(
                            selected = providerId == id,
                            onClick = { providerId = id },
                            label = { Text(name, fontSize = 12.sp) }
                        )
                    }
                }

                // Model
                OutlinedTextField(
                    value = modelId,
                    onValueChange = { modelId = it },
                    label = { Text("Model ID") },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )

                // System Message
                OutlinedTextField(
                    value = systemMessage,
                    onValueChange = { systemMessage = it },
                    label = { Text("System Message") },
                    modifier = Modifier.fillMaxWidth(),
                    maxLines = 4
                )

                // Temperature
                Column {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween
                    ) {
                        Text("Temperature", color = SynthColors.textPrimary)
                        Text(
                            "%.1f".format(temperature),
                            color = SynthColors.primary,
                            fontWeight = FontWeight.SemiBold
                        )
                    }
                    Slider(
                        value = temperature,
                        onValueChange = { temperature = it },
                        valueRange = 0f..1f,
                        steps = 9
                    )
                }

                // Feature toggles
                Text("Features", style = MaterialTheme.typography.labelMedium, color = SynthColors.textSecondary)

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Streaming", color = SynthColors.textPrimary)
                    Switch(checked = streamingEnabled, onCheckedChange = { streamingEnabled = it })
                }

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Reasoning Mode", color = SynthColors.textPrimary)
                    Switch(checked = reasoningEnabled, onCheckedChange = { reasoningEnabled = it })
                }

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Web Search", color = SynthColors.textPrimary)
                    Switch(checked = webSearchEnabled, onCheckedChange = { webSearchEnabled = it })
                }

                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Conversation Mode", color = SynthColors.textPrimary)
                    Switch(checked = conversationModeEnabled, onCheckedChange = { conversationModeEnabled = it })
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    val newPreset = (preset ?: ChatPreset(userId = 0, title = "")).copy(
                        title = title,
                        description = description,
                        icon = icon,
                        providerId = providerId,
                        modelId = modelId,
                        systemMessage = systemMessage,
                        temperature = temperature,
                        maxTokens = maxTokens,
                        streamingEnabled = streamingEnabled,
                        reasoningEnabled = reasoningEnabled,
                        webSearchEnabled = webSearchEnabled,
                        conversationModeEnabled = conversationModeEnabled,
                        updatedAt = System.currentTimeMillis()
                    )
                    onSave(newPreset)
                },
                enabled = title.isNotBlank() && modelId.isNotBlank()
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        },
        containerColor = SynthColors.surface
    )
}
