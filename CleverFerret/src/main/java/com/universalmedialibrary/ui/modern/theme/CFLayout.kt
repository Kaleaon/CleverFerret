package com.universalmedialibrary.ui.modern.theme

enum class CFLayout(val id: String, val displayName: String) {
    Compose("compose", "Compose"),
    Terminal("terminal", "Ink Terminal"),
    Lcars("sweep", "Sweep Console"),
    Metro("tiles", "Metro Tiles"),
    Glass("glass", "Aero Glass"),
    Rules("rules", "Deco Rails"),
    Press("press", "Editorial Press");

    companion object {
        fun fromId(id: String?): CFLayout = entries.firstOrNull { it.id == id || it.name == id } ?: Compose
    }
}
