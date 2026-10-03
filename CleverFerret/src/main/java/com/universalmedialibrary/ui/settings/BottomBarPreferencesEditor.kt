package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.navigation.NavController
import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.ui.components.NavigationItem
import com.universalmedialibrary.ui.components.orderedForEditor
import com.universalmedialibrary.ui.theme.*
import org.burnoutcrew.reorderable.detectReorderAfterLongPress
import org.burnoutcrew.reorderable.rememberReorderableLazyListState
import org.burnoutcrew.reorderable.reorderable

@Composable
internal fun BottomBarPreferencesEditor(
    availableItems: List<NavigationItem>,
    preferences: BottomBarPreferences,
    onOrderChanged: (List<String>, Set<String>) -> Unit
) {
    val orderedItems = remember(availableItems, preferences) {
        availableItems.orderedForEditor(preferences)
    }
    val editorItems = remember(orderedItems, preferences) {
        mutableStateListOf<BottomBarEditorItem>().apply {
            orderedItems.forEach { item ->
                add(
                    BottomBarEditorItem(
                        item = item,
                        visible = item.preferenceId !in preferences.hidden
                    )
                )
            }
        }
    }

    val reorderState = rememberReorderableLazyListState(onMove = { from, to ->
        editorItems.move(from.index, to.index)
        persistPreferences(editorItems, onOrderChanged)
    })

    LazyColumn(
        modifier = Modifier
            .fillMaxWidth()
            .heightIn(max = 320.dp)
            .reorderable(reorderState),
        state = reorderState.listState,
        verticalArrangement = Arrangement.spacedBy(8.dp),
        userScrollEnabled = editorItems.size > 3
    ) {
        items(editorItems, key = { it.item.preferenceId }) { editorItem ->
            BottomBarEditorRow(
                editorItem = editorItem,
                modifier = Modifier
                    .fillMaxWidth()
                    .detectReorderAfterLongPress(reorderState),
                onVisibilityToggle = { visible ->
                    val index = editorItems.indexOfFirst { it.item.preferenceId == editorItem.item.preferenceId }
                    if (index != -1) {
                        editorItems[index] = editorItems[index].copy(visible = visible)
                        persistPreferences(editorItems, onOrderChanged)
                    }
                }
            )
        }
    }
}
