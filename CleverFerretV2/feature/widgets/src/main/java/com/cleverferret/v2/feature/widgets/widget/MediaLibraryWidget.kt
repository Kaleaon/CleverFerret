package com.cleverferret.v2.feature.widgets.widget

import com.cleverferret.v2.feature.widgets.api.WidgetsFeatureApi

/**
 * Canonical widget entrypoint for the V2 widgets feature.
 *
 * Issue #134 requires this implementation to live at
 * `widget/MediaLibraryWidget.kt` (singular `widget` package segment).
 */
class MediaLibraryWidget : WidgetsFeatureApi {
    override fun featureKey(): String = FEATURE_KEY

    companion object {
        const val FEATURE_KEY: String = "media-library-widget"
    }
}
