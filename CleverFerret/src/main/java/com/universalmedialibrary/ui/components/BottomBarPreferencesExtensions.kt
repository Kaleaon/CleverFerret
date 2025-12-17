package com.universalmedialibrary.ui.components

import com.universalmedialibrary.data.settings.BottomBarPreferences

/**
 * Applies stored preferences to the runtime list of navigation items.
 */
fun List<NavigationItem>.applyBottomBarPreferences(
    preferences: BottomBarPreferences
): List<NavigationItem> {
    if (isEmpty() || (preferences.order.isEmpty() && preferences.hidden.isEmpty())) {
        return this
    }

    val originalOrder = this
        .mapIndexed { index, item -> item.preferenceId to index }
        .toMap()
    val preferredPositions = preferences.order
        .withIndex()
        .associate { it.value to it.index }

    return this
        .filter { item -> item.preferenceId !in preferences.hidden }
        .sortedWith(
            compareBy(
                { preferredPositions[it.preferenceId] ?: Int.MAX_VALUE },
                { originalOrder[it.preferenceId] ?: Int.MAX_VALUE }
            )
        )
}

/**
 * Produces a complete list of items ordered according to preferences,
 * including entries that are currently hidden. Used by editor UI.
 */
fun List<NavigationItem>.orderedForEditor(
    preferences: BottomBarPreferences
): List<NavigationItem> {
    if (isEmpty()) return emptyList()
    if (preferences.order.isEmpty()) return this

    val idToItem = associateBy { it.preferenceId }
    val ordered = preferences.order.mapNotNull { idToItem[it] }.toMutableList()
    this.forEach { item ->
        if (item.preferenceId !in preferences.order) {
            ordered += item
        }
    }
    return ordered
}
