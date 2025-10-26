package com.universalmedialibrary.ui.music

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.data.music.MusicTag
import com.universalmedialibrary.data.music.MusicTagRepository
import com.universalmedialibrary.data.music.TagCategory
import com.universalmedialibrary.services.music.MusicTagService
import com.universalmedialibrary.services.music.SuggestedTag
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Dialog for managing tags on a track
 */
@Composable
fun TagManagementDialog(
    track: Track,
    onDismiss: () -> Unit,
    viewModel: TagManagementViewModel = hiltViewModel()
) {
    val appliedTags by viewModel.appliedTags.collectAsState()
    val availableTags by viewModel.availableTags.collectAsState()
    val suggestedTags by viewModel.suggestedTags.collectAsState()
    val isLoadingSuggestions by viewModel.isLoadingSuggestions.collectAsState()
    
    var showCreateDialog by remember { mutableStateOf(false) }
    var selectedCategory by remember { mutableStateOf(TagCategory.CUSTOM) }

    LaunchedEffect(track) {
        viewModel.loadTagsForTrack(track.id)
        viewModel.loadAllTags()
        viewModel.loadSuggestions(track)
    }

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = Modifier
                .fillMaxWidth()
                .heightIn(max = 600.dp),
            shape = RoundedCornerShape(16.dp)
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                // Header
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Manage Tags",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold
                    )
                    IconButton(onClick = onDismiss) {
                        Icon(Icons.Default.Close, "Close")
                    }
                }

                // Track info
                Text(
                    text = track.title ?: "Unknown",
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.SemiBold
                )
                Text(
                    text = track.displayArtist,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )

                Divider()

                // Applied tags section
                Text(
                    text = "Applied Tags",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )

                if (appliedTags.isEmpty()) {
                    Text(
                        text = "No tags applied",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        modifier = Modifier.padding(8.dp)
                    )
                } else {
                    LazyRow(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(appliedTags) { tag ->
                            TagChip(
                                tag = tag,
                                isApplied = true,
                                onClick = { viewModel.removeTagFromTrack(track.id, tag.id) }
                            )
                        }
                    }
                }

                Divider()

                // AI Suggestions
                if (suggestedTags.isNotEmpty()) {
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Row(
                            horizontalArrangement = Arrangement.spacedBy(4.dp),
                            verticalAlignment = Alignment.CenterVertically
                        ) {
                            Icon(
                                Icons.Default.AutoAwesome,
                                contentDescription = null,
                                modifier = Modifier.size(16.dp),
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                text = "AI Suggestions",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold,
                                color = MaterialTheme.colorScheme.primary
                            )
                        }
                        if (isLoadingSuggestions) {
                            CircularProgressIndicator(
                                modifier = Modifier.size(16.dp),
                                strokeWidth = 2.dp
                            )
                        }
                    }

                    LazyRow(
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        items(suggestedTags) { suggestion ->
                            SuggestedTagChip(
                                suggestion = suggestion,
                                onClick = {
                                    viewModel.applySuggestedTag(track.id, suggestion)
                                }
                            )
                        }
                    }

                    Divider()
                }

                // Category filter
                ScrollableTabRow(
                    selectedTabIndex = TagCategory.values().indexOf(selectedCategory),
                    edgePadding = 0.dp
                ) {
                    TagCategory.values().forEach { category ->
                        Tab(
                            selected = selectedCategory == category,
                            onClick = { selectedCategory = category },
                            text = { Text(category.name.replace("_", " ")) }
                        )
                    }
                }

                // Available tags
                LazyColumn(
                    modifier = Modifier.weight(1f),
                    verticalArrangement = Arrangement.spacedBy(4.dp)
                ) {
                    val filteredTags = availableTags
                        .filter { it.category == selectedCategory }
                        .filter { tag -> !appliedTags.any { it.id == tag.id } }

                    if (filteredTags.isEmpty()) {
                        item {
                            Text(
                                text = "No tags in this category",
                                style = MaterialTheme.typography.bodySmall,
                                color = MaterialTheme.colorScheme.onSurfaceVariant,
                                modifier = Modifier.padding(8.dp)
                            )
                        }
                    }

                    items(filteredTags) { tag ->
                        TagListItem(
                            tag = tag,
                            onClick = { viewModel.addTagToTrack(track.id, tag.id) }
                        )
                    }
                }

                // Create new tag button
                OutlinedButton(
                    onClick = { showCreateDialog = true },
                    modifier = Modifier.fillMaxWidth()
                ) {
                    Icon(Icons.Default.Add, null)
                    Spacer(Modifier.width(8.dp))
                    Text("Create New Tag")
                }
            }
        }
    }

    if (showCreateDialog) {
        CreateTagDialog(
            category = selectedCategory,
            onDismiss = { showCreateDialog = false },
            onCreate = { name, category, color ->
                viewModel.createTag(name, category, color)
                showCreateDialog = false
            }
        )
    }
}

@Composable
private fun TagChip(
    tag: MusicTag,
    isApplied: Boolean,
    onClick: () -> Unit
) {
    val backgroundColor = if (tag.color != null) {
        try {
            Color(android.graphics.Color.parseColor(tag.color))
        } catch (e: Exception) {
            MaterialTheme.colorScheme.primaryContainer
        }
    } else {
        MaterialTheme.colorScheme.primaryContainer
    }

    FilterChip(
        selected = isApplied,
        onClick = onClick,
        label = { Text(tag.name) },
        trailingIcon = if (isApplied) {
            { Icon(Icons.Default.Close, null, modifier = Modifier.size(16.dp)) }
        } else null,
        colors = FilterChipDefaults.filterChipColors(
            containerColor = backgroundColor.copy(alpha = 0.3f),
            selectedContainerColor = backgroundColor
        )
    )
}

@Composable
private fun SuggestedTagChip(
    suggestion: SuggestedTag,
    onClick: () -> Unit
) {
    AssistChip(
        onClick = onClick,
        label = { Text(suggestion.name) },
        leadingIcon = {
            Icon(
                Icons.Default.AutoAwesome,
                contentDescription = null,
                modifier = Modifier.size(16.dp)
            )
        },
        colors = AssistChipDefaults.assistChipColors(
            containerColor = MaterialTheme.colorScheme.tertiaryContainer
        )
    )
}

@Composable
private fun TagListItem(
    tag: MusicTag,
    onClick: () -> Unit
) {
    ListItem(
        headlineContent = { Text(tag.name) },
        supportingContent = { Text(tag.category.name.replace("_", " ")) },
        leadingContent = {
            if (tag.color != null) {
                Box(
                    modifier = Modifier
                        .size(24.dp)
                        .background(
                            color = try {
                                Color(android.graphics.Color.parseColor(tag.color))
                            } catch (e: Exception) {
                                MaterialTheme.colorScheme.primary
                            },
                            shape = RoundedCornerShape(4.dp)
                        )
                )
            }
        },
        trailingContent = {
            Icon(Icons.Default.Add, "Add tag")
        },
        modifier = Modifier.clickable(onClick = onClick)
    )
}

@Composable
private fun CreateTagDialog(
    category: TagCategory,
    onDismiss: () -> Unit,
    onCreate: (name: String, category: TagCategory, color: String?) -> Unit
) {
    var tagName by remember { mutableStateOf("") }
    var selectedCategory by remember { mutableStateOf(category) }
    var selectedColor by remember { mutableStateOf<String?>(null) }

    val predefinedColors = listOf(
        "#F44336", "#E91E63", "#9C27B0", "#673AB7", "#3F51B5",
        "#2196F3", "#03A9F4", "#00BCD4", "#009688", "#4CAF50",
        "#8BC34A", "#CDDC39", "#FFEB3B", "#FFC107", "#FF9800",
        "#FF5722", "#795548", "#9E9E9E", "#607D8B"
    )

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create New Tag") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = tagName,
                    onValueChange = { tagName = it },
                    label = { Text("Tag Name") },
                    modifier = Modifier.fillMaxWidth()
                )

                ExposedDropdownMenuBox(
                    expanded = false,
                    onExpandedChange = {}
                ) {
                    OutlinedTextField(
                        value = selectedCategory.name.replace("_", " "),
                        onValueChange = {},
                        readOnly = true,
                        label = { Text("Category") },
                        modifier = Modifier.fillMaxWidth()
                    )
                }

                Text(
                    text = "Color (optional)",
                    style = MaterialTheme.typography.bodySmall
                )

                LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                    items(predefinedColors) { color ->
                        Box(
                            modifier = Modifier
                                .size(32.dp)
                                .background(
                                    color = Color(android.graphics.Color.parseColor(color)),
                                    shape = RoundedCornerShape(4.dp)
                                )
                                .clickable { selectedColor = color }
                        ) {
                            if (selectedColor == color) {
                                Icon(
                                    Icons.Default.Check,
                                    contentDescription = null,
                                    tint = Color.White,
                                    modifier = Modifier.align(Alignment.Center)
                                )
                            }
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    if (tagName.isNotBlank()) {
                        onCreate(tagName, selectedCategory, selectedColor)
                    }
                },
                enabled = tagName.isNotBlank()
            ) {
                Text("Create")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@HiltViewModel
class TagManagementViewModel @Inject constructor(
    private val tagRepository: MusicTagRepository,
    private val tagService: MusicTagService
) : ViewModel() {

    private val _appliedTags = MutableStateFlow<List<MusicTag>>(emptyList())
    val appliedTags: StateFlow<List<MusicTag>> = _appliedTags.asStateFlow()

    private val _availableTags = MutableStateFlow<List<MusicTag>>(emptyList())
    val availableTags: StateFlow<List<MusicTag>> = _availableTags.asStateFlow()

    private val _suggestedTags = MutableStateFlow<List<SuggestedTag>>(emptyList())
    val suggestedTags: StateFlow<List<SuggestedTag>> = _suggestedTags.asStateFlow()

    private val _isLoadingSuggestions = MutableStateFlow(false)
    val isLoadingSuggestions: StateFlow<Boolean> = _isLoadingSuggestions.asStateFlow()

    init {
        viewModelScope.launch {
            tagService.initialize()
        }
    }

    fun loadTagsForTrack(trackId: Long) {
        viewModelScope.launch {
            _appliedTags.value = tagRepository.getTagsForTrack(trackId)
        }
    }

    fun loadAllTags() {
        viewModelScope.launch {
            tagRepository.getAllTags().collect { tags ->
                _availableTags.value = tags
            }
        }
    }

    fun loadSuggestions(track: Track) {
        if (!tagService.isInitialized()) return

        viewModelScope.launch {
            _isLoadingSuggestions.value = true
            try {
                val result = tagService.suggestTagsForTrack(track)
                if (result.success) {
                    _suggestedTags.value = result.suggestedTags
                }
            } catch (e: Exception) {
                // Silently fail
            } finally {
                _isLoadingSuggestions.value = false
            }
        }
    }

    fun addTagToTrack(trackId: Long, tagId: Long) {
        viewModelScope.launch {
            tagRepository.addTagToTrack(trackId, tagId)
            loadTagsForTrack(trackId)
        }
    }

    fun removeTagFromTrack(trackId: Long, tagId: Long) {
        viewModelScope.launch {
            tagRepository.removeTagFromTrack(trackId, tagId)
            loadTagsForTrack(trackId)
        }
    }

    fun createTag(name: String, category: TagCategory, color: String?) {
        viewModelScope.launch {
            tagRepository.createTag(name, category, color)
        }
    }

    fun applySuggestedTag(trackId: Long, suggestion: SuggestedTag) {
        viewModelScope.launch {
            // Create tag if doesn't exist
            val tagId = tagRepository.createTag(
                name = suggestion.name,
                category = suggestion.category
            )
            // Add to track
            tagRepository.addTagToTrack(trackId, tagId)
            // Remove from suggestions
            _suggestedTags.value = _suggestedTags.value.filter { it != suggestion }
            // Reload applied tags
            loadTagsForTrack(trackId)
        }
    }
}
