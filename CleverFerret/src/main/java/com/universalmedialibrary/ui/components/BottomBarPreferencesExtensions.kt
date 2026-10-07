package com.universalmedialibrary.ui.components

import com.universalmedialibrary.data.settings.BottomBarPreferences

/**
 * Partition of navigation items into up to 4 primary pinned slots and remaining overflow items.
 */
data class BottomBarLayout<T>(
    val primaryItems: List<T>,
    val overflowItems: List<T>
)

/**
 * Resolves bottom bar layout into up to 4 primary pinned items and overflow items.
 */
fun List<NavigationItem>.resolveBottomBarLayout(
    preferences: BottomBarPreferences
): BottomBarLayout<NavigationItem> {
    val visibleItems = this.filter { it.preferenceId !in preferences.hidden }
    if (visibleItems.isEmpty()) {
        return BottomBarLayout(emptyList(), emptyList())
    }

    val itemMap = visibleItems.associateBy { it.preferenceId }

    val pinnedIds = when {
        preferences.pinned.isNotEmpty() -> preferences.pinned.filter { it !in preferences.hidden }
        preferences.order.isNotEmpty() -> preferences.order.filter { it !in preferences.hidden }
        else -> BottomBarPreferences.DefaultPinnedRoutes
    }

    val primaryList = mutableListOf<NavigationItem>()
    val usedIds = mutableSetOf<String>()

    // Select primary items matching pinned IDs
    for (id in pinnedIds) {
        if (primaryList.size >= 4) break
        val item = itemMap[id] ?: visibleItems.firstOrNull { it.route == id }
        if (item != null && usedIds.add(item.preferenceId)) {
            primaryList.add(item)
        }
    }

    // Fill up to 4 using defaults if needed
    val defaultFallback = BottomBarPreferences.DefaultPinnedRoutes
    for (id in defaultFallback) {
        if (primaryList.size >= 4) break
        val item = itemMap[id] ?: visibleItems.firstOrNull { it.route == id }
        if (item != null && usedIds.add(item.preferenceId)) {
            primaryList.add(item)
        }
    }

    // Fill remaining up to 4 from visible items
    for (item in visibleItems) {
        if (primaryList.size >= 4) break
        if (usedIds.add(item.preferenceId)) {
            primaryList.add(item)
        }
    }

    val overflowList = visibleItems.filter { it.preferenceId !in usedIds }
    return BottomBarLayout(primaryItems = primaryList, overflowItems = overflowList)
}

/**
 * Applies stored preferences to return the list of primary navigation items (up to 4).
 */
fun List<NavigationItem>.applyBottomBarPreferences(
    preferences: BottomBarPreferences
): List<NavigationItem> {
    return resolveBottomBarLayout(preferences).primaryItems
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
