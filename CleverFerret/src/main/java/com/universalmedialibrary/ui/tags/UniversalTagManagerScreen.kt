package com.universalmedialibrary.ui.tags

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import java.net.URLEncoder
import com.universalmedialibrary.data.local.entity.TagType
import com.universalmedialibrary.data.local.entity.UnifiedTag
import com.universalmedialibrary.data.local.entity.TagCategory

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun UniversalTagManagerScreen(
    navController: NavController,
    viewModel: UniversalTagManagerViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    var showCreateTagDialog by remember { mutableStateOf(false) }
    var showCreateCategoryDialog by remember { mutableStateOf(false) }
    var editingTag by remember { mutableStateOf<UnifiedTag?>(null) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = {
                    Column {
                        Text("Tag Manager", fontWeight = FontWeight.SemiBold)
                        Text(
                            "${uiState.tags.size} tags, ${uiState.categories.size} categories",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                },
                navigationIcon = {
                    IconButton(onClick = { navController.navigateUp() }) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showCreateCategoryDialog = true }) {
                        Icon(Icons.Default.CreateNewFolder, "New Category")
                    }
                    IconButton(onClick = { showCreateTagDialog = true }) {
                        Icon(Icons.Default.Add, "New Tag")
                    }
                }
            )
        }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Search bar
            item {
                OutlinedTextField(
                    value = uiState.searchQuery,
                    onValueChange = viewModel::updateSearchQuery,
                    modifier = Modifier.fillMaxWidth(),
                    placeholder = { Text("Search tags...") },
                    leadingIcon = { Icon(Icons.Default.Search, null) },
                    trailingIcon = {
                        if (uiState.searchQuery.isNotEmpty()) {
                            IconButton(onClick = { viewModel.updateSearchQuery("") }) {
                                Icon(Icons.Default.Clear, "Clear")
                            }
                        }
                    },
                    singleLine = true
                )
            }

            // Category filter chips
            item {
                LazyRow(
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    item {
                        FilterChip(
                            selected = uiState.selectedCategory == null,
                            onClick = { viewModel.selectCategory(null) },
                            label = { Text("All") }
                        )
                    }
                    items(uiState.categories) { category ->
                        FilterChip(
                            selected = uiState.selectedCategory?.categoryId == category.categoryId,
                            onClick = { viewModel.selectCategory(category) },
                            label = { Text(category.displayName) },
                            leadingIcon = category.color?.let { colorStr ->
                                {
                                    Box(
                                        modifier = Modifier
                                            .size(12.dp)
                                            .clip(CircleShape)
                                            .background(parseColorSafe(colorStr))
                                    )
                                }
                            }
                        )
                    }
                }
            }

            // Tag type filter
            item {
                Row(
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text("Type:", style = MaterialTheme.typography.labelMedium)
                    FilterChip(
                        selected = uiState.selectedTagType == null,
                        onClick = { viewModel.selectTagType(null) },
                        label = { Text("All") }
                    )
                    TagType.entries.forEach { type ->
                        FilterChip(
                            selected = uiState.selectedTagType == type,
                            onClick = { viewModel.selectTagType(type) },
                            label = { Text(type.displayName()) }
                        )
                    }
                }
            }

            // Suggested new tags section
            if (uiState.suggestedNewTags.isNotEmpty()) {
                item {
                    Card(
                        modifier = Modifier.fillMaxWidth(),
                        colors = CardDefaults.cardColors(
                            containerColor = MaterialTheme.colorScheme.secondaryContainer
                        )
                    ) {
                        Column(modifier = Modifier.padding(16.dp)) {
                            Row(
                                verticalAlignment = Alignment.CenterVertically,
                                horizontalArrangement = Arrangement.SpaceBetween,
                                modifier = Modifier.fillMaxWidth()
                            ) {
                                Text(
                                    "Suggested Tags",
                                    style = MaterialTheme.typography.titleMedium,
                                    fontWeight = FontWeight.SemiBold
                                )
                                Icon(
                                    Icons.Default.AutoAwesome,
                                    contentDescription = "Media image",
                                    tint = MaterialTheme.colorScheme.primary
                                )
                            }
                            Spacer(modifier = Modifier.height(8.dp))
                            LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                                items(uiState.suggestedNewTags) { suggestion ->
                                    SuggestionChip(
                                        onClick = { viewModel.createTagFromSuggestion(suggestion) },
                                        label = { Text(suggestion.suggestedName) },
                                        icon = { Icon(Icons.Default.Add, null) }
                                    )
                                }
                            }
                        }
                    }
                }
            }

            // Tags list grouped by category
            if (uiState.selectedCategory == null) {
                // Show uncategorized tags first
                val uncategorizedTags = uiState.filteredTags.filter { tag ->
                    uiState.tagCategories[tag.tagId]?.isEmpty() != false
                }
                if (uncategorizedTags.isNotEmpty()) {
                    item {
                        Text(
                            "Uncategorized",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.SemiBold,
                            modifier = Modifier.padding(vertical = 8.dp)
                        )
                    }
                    items(uncategorizedTags) { tag ->
                        TagRow(
                            tag = tag,
                            onEdit = { editingTag = tag },
                            onDelete = { viewModel.deleteTag(tag) },
                            onClick = { 
                                val encodedTag = URLEncoder.encode(tag.name, "UTF-8")
                                navController.navigate("enhanced_search?tags=$encodedTag") 
                            }
                        )
                    }
                }

                // Show tags by category
                uiState.categories.forEach { category ->
                    val categoryTags = uiState.filteredTags.filter { tag ->
                        uiState.tagCategories[tag.tagId]?.contains(category.categoryId) == true
                    }
                    if (categoryTags.isNotEmpty()) {
                        item {
                            CategoryHeader(
                                category = category,
                                tagCount = categoryTags.size
                            )
                        }
                        items(categoryTags) { tag ->
                            TagRow(
                                tag = tag,
                                onEdit = { editingTag = tag },
                                onDelete = { viewModel.deleteTag(tag) },
                                onClick = { 
                                    val encodedTag = URLEncoder.encode(tag.name, "UTF-8")
                                    navController.navigate("enhanced_search?tags=$encodedTag") 
                                }
                            )
                        }
                    }
                }
            } else {
                // Show only tags in selected category
                items(uiState.filteredTags) { tag ->
                    TagRow(
                        tag = tag,
                        onEdit = { editingTag = tag },
                        onDelete = { viewModel.deleteTag(tag) },
                        onClick = { 
                            val encodedTag = URLEncoder.encode(tag.name, "UTF-8")
                            navController.navigate("enhanced_search?tags=$encodedTag") 
                        }
                    )
                }
            }
        }
    }

    // Create Tag Dialog
    if (showCreateTagDialog) {
        CreateTagDialog(
            categories = uiState.categories,
            onDismiss = { showCreateTagDialog = false },
            onCreate = { name, type, color, description, categoryId ->
                viewModel.createTag(name, type, color, description, categoryId)
                showCreateTagDialog = false
            }
        )
    }

    // Create Category Dialog
    if (showCreateCategoryDialog) {
        CreateCategoryDialog(
            onDismiss = { showCreateCategoryDialog = false },
            onCreate = { name, displayName, color, description ->
                viewModel.createCategory(name, displayName, color, description)
                showCreateCategoryDialog = false
            }
        )
    }

    // Edit Tag Dialog
    editingTag?.let { tag ->
        EditTagDialog(
            tag = tag,
            categories = uiState.categories,
            currentCategoryIds = uiState.tagCategories[tag.tagId] ?: emptyList(),
            onDismiss = { editingTag = null },
            onSave = { updatedTag, categoryIds ->
                viewModel.updateTag(updatedTag, categoryIds)
                editingTag = null
            }
        )
    }
}

@Composable
private fun CategoryHeader(category: TagCategory, tagCount: Int) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = Modifier
            .fillMaxWidth()
            .padding(vertical = 8.dp)
    ) {
        category.color?.let { colorStr ->
            Box(
                modifier = Modifier
                    .size(16.dp)
                    .clip(CircleShape)
                    .background(parseColorSafe(colorStr))
            )
            Spacer(modifier = Modifier.width(8.dp))
        }
        Text(
            category.displayName,
            style = MaterialTheme.typography.titleSmall,
            fontWeight = FontWeight.SemiBold
        )
        Spacer(modifier = Modifier.width(8.dp))
        Text(
            "($tagCount)",
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun TagRow(
    tag: UnifiedTag,
    onEdit: () -> Unit,
    onDelete: () -> Unit,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier
            .fillMaxWidth()
            .clickable(onClick = onClick),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(12.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            // Color indicator
            tag.color?.let { colorStr ->
                Box(
                    modifier = Modifier
                        .size(12.dp)
                        .clip(CircleShape)
                        .background(parseColorSafe(colorStr))
                )
                Spacer(modifier = Modifier.width(12.dp))
            }

            // Tag info
            Column(modifier = Modifier.weight(1f)) {
                Row(verticalAlignment = Alignment.CenterVertically) {
                    Text(
                        tag.name,
                        style = MaterialTheme.typography.bodyLarge,
                        fontWeight = FontWeight.Medium
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Surface(
                        shape = RoundedCornerShape(4.dp),
                        color = MaterialTheme.colorScheme.primaryContainer
                    ) {
                        Text(
                            tag.type.displayName(),
                            modifier = Modifier.padding(horizontal = 6.dp, vertical = 2.dp),
                            style = MaterialTheme.typography.labelSmall
                        )
                    }
                }
                if (tag.description != null) {
                    Text(
                        tag.description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                Text(
                    "${tag.usageCount} items",
                    style = MaterialTheme.typography.labelSmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }

            // Actions
            IconButton(onClick = onEdit) {
                Icon(Icons.Default.Edit, "Edit")
            }
            IconButton(onClick = onDelete) {
                Icon(Icons.Default.Delete, "Delete", tint = MaterialTheme.colorScheme.error)
            }
        }
    }
    Spacer(modifier = Modifier.height(8.dp))
}

@Composable
private fun CreateTagDialog(
    categories: List<TagCategory>,
    onDismiss: () -> Unit,
    onCreate: (String, TagType, String?, String?, Long?) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var type by remember { mutableStateOf(TagType.USER_DEFINED) }
    var color by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }
    var selectedCategoryId by remember { mutableStateOf<Long?>(null) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create New Tag") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Tag Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description (optional)") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = color,
                    onValueChange = { color = it },
                    label = { Text("Color (e.g., #FF5722)") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                if (categories.isNotEmpty()) {
                    Text("Category:", style = MaterialTheme.typography.labelMedium)
                    LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        item {
                            FilterChip(
                                selected = selectedCategoryId == null,
                                onClick = { selectedCategoryId = null },
                                label = { Text("None") }
                            )
                        }
                        items(categories) { category ->
                            FilterChip(
                                selected = selectedCategoryId == category.categoryId,
                                onClick = { selectedCategoryId = category.categoryId },
                                label = { Text(category.displayName) }
                            )
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onCreate(
                        name,
                        type,
                        color.ifBlank { null },
                        description.ifBlank { null },
                        selectedCategoryId
                    )
                },
                enabled = name.isNotBlank()
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

@Composable
private fun CreateCategoryDialog(
    onDismiss: () -> Unit,
    onCreate: (String, String, String?, String?) -> Unit
) {
    var name by remember { mutableStateOf("") }
    var displayName by remember { mutableStateOf("") }
    var color by remember { mutableStateOf("") }
    var description by remember { mutableStateOf("") }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Create Tag Category") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Category ID") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = displayName,
                    onValueChange = { displayName = it },
                    label = { Text("Display Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = color,
                    onValueChange = { color = it },
                    label = { Text("Color (e.g., #4CAF50)") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onCreate(
                        name,
                        displayName.ifBlank { name },
                        color.ifBlank { null },
                        description.ifBlank { null }
                    )
                },
                enabled = name.isNotBlank()
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

@Composable
private fun EditTagDialog(
    tag: UnifiedTag,
    categories: List<TagCategory>,
    currentCategoryIds: List<Long>,
    onDismiss: () -> Unit,
    onSave: (UnifiedTag, List<Long>) -> Unit
) {
    var name by remember { mutableStateOf(tag.name) }
    var color by remember { mutableStateOf(tag.color ?: "") }
    var description by remember { mutableStateOf(tag.description ?: "") }
    var selectedCategoryIds by remember { mutableStateOf(currentCategoryIds.toSet()) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Edit Tag") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
                OutlinedTextField(
                    value = name,
                    onValueChange = { name = it },
                    label = { Text("Tag Name") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = description,
                    onValueChange = { description = it },
                    label = { Text("Description") },
                    modifier = Modifier.fillMaxWidth()
                )
                OutlinedTextField(
                    value = color,
                    onValueChange = { color = it },
                    label = { Text("Color") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )

                if (categories.isNotEmpty()) {
                    Text("Categories:", style = MaterialTheme.typography.labelMedium)
                    LazyRow(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        items(categories) { category ->
                            FilterChip(
                                selected = category.categoryId in selectedCategoryIds,
                                onClick = {
                                    selectedCategoryIds = if (category.categoryId in selectedCategoryIds) {
                                        selectedCategoryIds - category.categoryId
                                    } else {
                                        selectedCategoryIds + category.categoryId
                                    }
                                },
                                label = { Text(category.displayName) }
                            )
                        }
                    }
                }
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    onSave(
                        tag.copy(
                            name = name,
                            color = color.ifBlank { null },
                            description = description.ifBlank { null }
                        ),
                        selectedCategoryIds.toList()
                    )
                },
                enabled = name.isNotBlank()
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

private fun TagType.displayName(): String = when (this) {
    TagType.USER_DEFINED -> "User"
    TagType.AUTO_GENERATED -> "Auto"
    TagType.IMPORTED_PLEX -> "Plex"
    TagType.IMPORTED_CALIBRE -> "Calibre"
    TagType.IMPORTED_JELLYFIN -> "Jellyfin"
}

private fun parseColorSafe(colorStr: String): Color {
    return try {
        Color(android.graphics.Color.parseColor(colorStr))
    } catch (e: Exception) {
        Color.Gray
    }
}
