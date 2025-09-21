package com.universalmedialibrary.data.settings

import androidx.room.Entity
import androidx.room.PrimaryKey
import kotlinx.serialization.Serializable

@Serializable
@Entity(tableName = "reader_settings")
data class ReaderSettings(
    @PrimaryKey
    val id: String = "default",
    val fontSize: Float = 16f,
    val lineSpacing: Float = 1.5f,
    val fontFamily: String = "Default",
    val backgroundColor: String = "#FFFFFF",
    val textColor: String = "#000000",
    val theme: ReaderTheme = ReaderTheme.LIGHT,
    val pageAnimation: PageAnimation = PageAnimation.SLIDE,
    val autoScrollSpeed: Float = 1.0f,
    val autoScrollMode: AutoScrollMode = AutoScrollMode.OFF,
    val keepScreenOn: Boolean = true,
    val fullScreenMode: Boolean = false,
    val showPageNumbers: Boolean = true,
    val showProgressBar: Boolean = true,
    val marginHorizontal: Float = 16f,
    val marginVertical: Float = 20f,
    val enableGestures: Boolean = true,
    val volumeKeyNavigation: Boolean = true,
    val tapToTurn: Boolean = true,
    val swipeToTurn: Boolean = true
)

enum class ReaderTheme {
    LIGHT,
    DARK,
    SEPIA,
    NIGHT
}

enum class PageAnimation {
    NONE,
    SLIDE,
    FADE,
    FLIP
}
