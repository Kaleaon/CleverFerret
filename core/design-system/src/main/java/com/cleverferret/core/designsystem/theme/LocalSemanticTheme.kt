package com.cleverferret.core.designsystem.theme

import androidx.compose.runtime.staticCompositionLocalOf

val LocalSemanticTheme = staticCompositionLocalOf {
    KthemeThemeAdapterV1.adapt(DefaultBaseThemes.LIGHT_BASE)
}

val LocalLiveRegionPolicy = staticCompositionLocalOf {
    KthemeThemeAdapterV1.LiveRegionPolicy()
}

