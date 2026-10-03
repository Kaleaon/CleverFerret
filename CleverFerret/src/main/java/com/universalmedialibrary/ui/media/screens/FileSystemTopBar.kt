package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun FileSystemTopBar(
    currentPath: String,
    isMultiSelectMode: Boolean,
    selectedCount: Int,
    onBack: () -> Unit,
    onSelectAll: () -> Unit,
    onClearSelection: () -> Unit,
    onSearch: (String) -> Unit
) {
    var showSearch by remember { mutableStateOf(false) }
    var searchQuery by remember { mutableStateOf("") }
    
    TopAppBar(
        title = {
            if (showSearch) {
                OutlinedTextField(
                    value = searchQuery,
                    onValueChange = {
                        searchQuery = it
                        onSearch(it)
                    },
                    placeholder = { 
                        Text("Search in folder...", color = MediaColors.TextTertiary) 
                    },
                    singleLine = true,
                    colors = OutlinedTextFieldDefaults.colors(
                        focusedBorderColor = MediaColors.AccentPrimary,
                        unfocusedBorderColor = Color.Transparent,
                        focusedContainerColor = MediaColors.BackgroundSurface,
                        unfocusedContainerColor = MediaColors.BackgroundSurface
                    ),
                    modifier = Modifier.fillMaxWidth()
                )
            } else if (isMultiSelectMode) {
                Text(
                    "$selectedCount selected",
                    style = MediaTypography.TitleMedium,
                    color = MediaColors.TextPrimary
                )
            } else {
                Column {
                    Text(
                        "Browse Files",
                        style = MediaTypography.TitleMedium,
                        color = MediaColors.TextPrimary
                    )
                    Text(
                        currentPath.split("/").lastOrNull() ?: "Storage",
                        style = MediaTypography.LabelSmall,
                        color = MediaColors.TextTertiary,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
            }
        },
        navigationIcon = {
            IconButton(onClick = {
                if (showSearch) {
                    showSearch = false
                    searchQuery = ""
                    onSearch("")
                } else {
                    onBack()
                }
            }) {
                Icon(
                    if (showSearch) Icons.Default.Close else Icons.Default.ArrowBack,
                    "Back",
                    tint = MediaColors.TextPrimary
                )
            }
        },
        actions = {
            if (isMultiSelectMode) {
                IconButton(onClick = onSelectAll) {
                    Icon(Icons.Default.SelectAll, "Select All", tint = MediaColors.TextSecondary)
                }
                IconButton(onClick = onClearSelection) {
                    Icon(Icons.Default.Clear, "Clear Selection", tint = MediaColors.TextSecondary)
                }
            } else {
                IconButton(onClick = { showSearch = !showSearch }) {
                    Icon(Icons.Default.Search, "Search", tint = MediaColors.TextSecondary)
                }
            }
        },
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MediaColors.BackgroundElevated
        )
    )
}
