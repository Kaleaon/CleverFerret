package com.universalmedialibrary.data.settings

data class ReaderSettings(
    val fontSize: Int = 16,
    val fontFamily: String = "system",
    val lineSpacing: Float = 1.5f,
    val marginSize: Int = 16,
    val backgroundColor: String = "#FFFFFF",
    val textColor: String = "#000000",
    val nightModeEnabled: Boolean = false,
    val pageAnimationEnabled: Boolean = true,
    val autoScrollEnabled: Boolean = false,
    val keepScreenOn: Boolean = true,
    val showProgressBar: Boolean = true,
    val showChapterTitles: Boolean = true,
    val enableZoom: Boolean = true,
    val defaultZoomLevel: Float = 1.0f
)