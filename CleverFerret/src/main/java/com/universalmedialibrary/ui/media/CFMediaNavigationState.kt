package com.universalmedialibrary.ui.media

import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.data.settings.BottomGearPosition

internal data class CFMediaNavigationState(
    val route: String,
    val visible: Boolean,
    val preferences: BottomBarPreferences,
    val gear: BottomGearPosition
)

