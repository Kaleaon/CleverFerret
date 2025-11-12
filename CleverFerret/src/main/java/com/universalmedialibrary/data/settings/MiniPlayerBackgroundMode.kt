package com.universalmedialibrary.data.settings

/**
 * Visual presentation choices for the persistent mini player / media controls bar.
 */
enum class MiniPlayerBackgroundMode(
    val displayName: String,
    val description: String
) {
    THEME(
        displayName = "Theme Surface",
        description = "Use the app theme surface colors for a clean, minimal look."
    ),
    ALBUM_ART_SLIVER(
        displayName = "Album Art Sliver",
        description = "Show a vertically scrolling slice of the current album artwork."
    ),
    VISUALIZER(
        displayName = "Visualizer",
        description = "Animate reactive bars behind the controls while music plays."
    );

    companion object {
        fun fromName(name: String?): MiniPlayerBackgroundMode =
            values().firstOrNull { it.name == name } ?: THEME
    }
}
