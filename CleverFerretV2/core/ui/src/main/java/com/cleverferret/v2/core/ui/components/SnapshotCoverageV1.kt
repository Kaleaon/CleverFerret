package com.cleverferret.v2.core.ui.components

object SnapshotCoverageV1 {
    enum class ThemeMode { LIGHT, DARK }

    enum class ReaderOverlay {
        NONE,
        SEPIA,
        PAPER,
        DARK_READER,
        AMOLED,
        HIGH_CONTRAST_READER,
    }

    data class SnapshotScenario(
        val component: String,
        val themeMode: ThemeMode,
        val readerOverlay: ReaderOverlay,
    )

    fun requiredScenarios(component: String): List<SnapshotScenario> = buildList {
        ThemeMode.entries.forEach { mode ->
            add(SnapshotScenario(component, mode, ReaderOverlay.NONE))
            add(SnapshotScenario(component, mode, ReaderOverlay.HIGH_CONTRAST_READER))
        }
    }
}
