package com.cleverferret.v2.core.ui.components

enum class Category {
    CARDS,
    PLAYERS,
    READER_CONTROLS,
    CHIPS,
    DIALOGS,
}

data class ComponentSpec(
    val name: String,
    val category: Category,
)

object ComponentCatalogV1 {
    val requiredComponents: List<ComponentSpec> = listOf(
        ComponentSpec("MediaCard", Category.CARDS),
        ComponentSpec("CollectionCard", Category.CARDS),
        ComponentSpec("StatCard", Category.CARDS),
        ComponentSpec("ActionCard", Category.CARDS),
        ComponentSpec("MiniPlayerBar", Category.PLAYERS),
        ComponentSpec("NowPlayingPanel", Category.PLAYERS),
        ComponentSpec("QueueSheet", Category.PLAYERS),
        ComponentSpec("TransportControls", Category.PLAYERS),
        ComponentSpec("ReaderTopBar", Category.READER_CONTROLS),
        ComponentSpec("ReaderBottomBar", Category.READER_CONTROLS),
        ComponentSpec("ReaderProgressScrubber", Category.READER_CONTROLS),
        ComponentSpec("ReaderDisplaySettingsSheet", Category.READER_CONTROLS),
        ComponentSpec("FilterChip", Category.CHIPS),
        ComponentSpec("SelectableChip", Category.CHIPS),
        ComponentSpec("TagChip", Category.CHIPS),
        ComponentSpec("StatusChip", Category.CHIPS),
        ComponentSpec("ConfirmationDialog", Category.DIALOGS),
        ComponentSpec("FormDialog", Category.DIALOGS),
        ComponentSpec("ErrorDialog", Category.DIALOGS),
        ComponentSpec("BottomSheetDialog", Category.DIALOGS),
    )
}
