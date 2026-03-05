package com.cleverferret.v2.core.ui.components;

import java.util.List;

/**
 * Reusable component inventory contract for core:ui.
 */
public final class ComponentCatalogV1 {
    private ComponentCatalogV1() {}

    public enum Category {
        CARDS,
        PLAYERS,
        READER_CONTROLS,
        CHIPS,
        DIALOGS
    }

    public record ComponentSpec(String name, Category category) {}

    public static final List<ComponentSpec> REQUIRED_COMPONENTS = List.of(
            new ComponentSpec("MediaCard", Category.CARDS),
            new ComponentSpec("CollectionCard", Category.CARDS),
            new ComponentSpec("StatCard", Category.CARDS),
            new ComponentSpec("ActionCard", Category.CARDS),
            new ComponentSpec("MiniPlayerBar", Category.PLAYERS),
            new ComponentSpec("NowPlayingPanel", Category.PLAYERS),
            new ComponentSpec("QueueSheet", Category.PLAYERS),
            new ComponentSpec("TransportControls", Category.PLAYERS),
            new ComponentSpec("ReaderTopBar", Category.READER_CONTROLS),
            new ComponentSpec("ReaderBottomBar", Category.READER_CONTROLS),
            new ComponentSpec("ReaderProgressScrubber", Category.READER_CONTROLS),
            new ComponentSpec("ReaderDisplaySettingsSheet", Category.READER_CONTROLS),
            new ComponentSpec("FilterChip", Category.CHIPS),
            new ComponentSpec("SelectableChip", Category.CHIPS),
            new ComponentSpec("TagChip", Category.CHIPS),
            new ComponentSpec("StatusChip", Category.CHIPS),
            new ComponentSpec("ConfirmationDialog", Category.DIALOGS),
            new ComponentSpec("FormDialog", Category.DIALOGS),
            new ComponentSpec("ErrorDialog", Category.DIALOGS),
            new ComponentSpec("BottomSheetDialog", Category.DIALOGS)
    );
}
