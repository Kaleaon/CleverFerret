package com.cleverferret.v2.core.ui.migration

object ScreenMigrationChecklistV1 {
    data class Item(val name: String, val required: Boolean = true)

    val REQUIRED_ITEMS = listOf(
        Item("Colors"),
        Item("Typography"),
        Item("Spacing"),
        Item("Radius"),
        Item("Motion"),
        Item("State colors"),
    )

    data class ScreenChecklist(
        val screenRoute: String,
        val completedItems: Set<String>,
    ) {
        fun missingItems(): Set<String> = REQUIRED_ITEMS.map { it.name }.toSet() - completedItems
    }
}
