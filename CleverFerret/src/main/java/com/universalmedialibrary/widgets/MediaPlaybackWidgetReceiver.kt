package com.universalmedialibrary.widgets

import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver

/**
 * MediaPlaybackWidgetReceiver
 *
 * GlanceAppWidgetReceiver for the media playback widget.
 * Handles widget lifecycle events using Jetpack Glance.
 *
 * This receiver is registered in AndroidManifest.xml to receive
 * widget update broadcasts from the system.
 */
class MediaPlaybackWidgetReceiver : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = MediaPlaybackWidget
}
