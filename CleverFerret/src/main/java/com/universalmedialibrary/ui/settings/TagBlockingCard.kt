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

@OptIn(ExperimentalLayoutApi::class)
@Composable
internal fun TagBlockingCard(
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
                    contentDescription = "Media image",
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
                                    contentDescription = "Media image",
                                    modifier = Modifier.size(18.dp)
                                )
                            }
                        }
                    )
                }
            }

            HorizontalDivider()

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
                                        contentDescription = "Media image",
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
