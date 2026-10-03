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

@Composable
internal fun SearchResultsList(
    results: List<SearchResult>,
    groupedResults: Map<SearchCategory, List<SearchResult>>,
    onResultClick: (SearchResult) -> Unit,
    onCategoryFilterChange: (SearchCategory?) -> Unit,
    onCategoryNavigate: (SearchCategory) -> Unit,
    showGrouped: Boolean
) {
    if (showGrouped && groupedResults.isNotEmpty()) {
        // Grouped by category
        LazyColumn(
            contentPadding = PaddingValues(bottom = MediaSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            groupedResults.forEach { (category, categoryResults) ->
                item {
                    ResultCategoryHeader(
                        category = category,
                        count = categoryResults.size
                    )
                }
                
                items(categoryResults.take(5)) { result ->
                    SearchResultItem(
                        result = result,
                        onClick = { onResultClick(result) }
                    )
                }
                
                if (categoryResults.size > 5) {
                    item {
                        TextButton(
                            onClick = { 
                                onCategoryFilterChange(category)
                                onCategoryNavigate(category)
                            },
                            modifier = Modifier.padding(
                                horizontal = MediaSpacing.MD,
                                vertical = MediaSpacing.SM
                            )
                        ) {
                            Text(
                                text = "See all ${categoryResults.size} ${category.displayName.lowercase()}",
                                color = MediaColors.AccentPrimary
                            )
                        }
                    }
                }
                
                item {
                    HorizontalDivider(
                        color = MediaColors.Border,
                        modifier = Modifier.padding(vertical = MediaSpacing.SM)
                    )
                }
            }
        }
    } else {
        // Flat list
        LazyColumn(
            contentPadding = PaddingValues(bottom = MediaSpacing.XL),
            modifier = Modifier.fillMaxSize()
        ) {
            items(results) { result ->
                SearchResultItem(
                    result = result,
                    onClick = { onResultClick(result) }
                )
            }
        }
    }
}
