package com.universalmedialibrary.ui.media.screens

import androidx.compose.animation.*
import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.platform.LocalFocusManager
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.ImeAction
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import coil.compose.AsyncImage
import com.universalmedialibrary.ui.components.TagChip
import com.universalmedialibrary.ui.media.components.*
import com.universalmedialibrary.ui.media.theme.*

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun SearchTopBar(
    query: String,
    onQueryChange: (String) -> Unit,
    onSearch: () -> Unit,
    onClear: () -> Unit,
    onVoiceSearch: () -> Unit,
    onBackClick: () -> Unit,
    focusRequester: FocusRequester
) {
    Surface(
        color = MediaColors.BackgroundElevated,
        tonalElevation = MediaElevation.SM
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(
                    horizontal = MediaSpacing.SM,
                    vertical = MediaSpacing.SM
                ),
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(onClick = onBackClick) {
                Icon(
                    imageVector = Icons.Default.ArrowBack,
                    contentDescription = "Back",
                    tint = MediaColors.TextSecondary
                )
            }
            
            OutlinedTextField(
                value = query,
                onValueChange = onQueryChange,
                modifier = Modifier
                    .weight(1f)
                    .focusRequester(focusRequester),
                placeholder = {
                    Text(
                        text = "Search library & more...",
                        color = MediaColors.TextTertiary
                    )
                },
                leadingIcon = {
                    Icon(
                        imageVector = Icons.Default.Search,
                        contentDescription = "Media image",
                        tint = MediaColors.TextTertiary
                    )
                },
                trailingIcon = {
                    Row {
                        if (query.isNotEmpty()) {
                            IconButton(onClick = onClear) {
                                Icon(
                                    imageVector = Icons.Default.Close,
                                    contentDescription = "Clear",
                                    tint = MediaColors.TextSecondary
                                )
                            }
                        }
                        IconButton(onClick = onVoiceSearch) {
                            Icon(
                                imageVector = Icons.Default.Mic,
                                contentDescription = "Voice search",
                                tint = MediaColors.TextSecondary
                            )
                        }
                    }
                },
                singleLine = true,
                keyboardOptions = KeyboardOptions(
                    imeAction = ImeAction.Search
                ),
                keyboardActions = KeyboardActions(
                    onSearch = { onSearch() }
                ),
                colors = OutlinedTextFieldDefaults.colors(
                    focusedBorderColor = MediaColors.AccentPrimary,
                    unfocusedBorderColor = MediaColors.Border,
                    focusedTextColor = MediaColors.TextPrimary,
                    unfocusedTextColor = MediaColors.TextPrimary,
                    cursorColor = MediaColors.AccentPrimary
                ),
                shape = RoundedCornerShape(MediaCorners.Full)
            )
        }
    }
}
