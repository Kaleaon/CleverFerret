package com.universalmedialibrary.widgets

import android.appwidget.AppWidgetManager
import android.content.Context
import android.widget.RemoteViews
import com.universalmedialibrary.R

/**
 * Video Player Widget
 * Shows currently watching video with quick access
 */
class VideoPlayerWidget : BaseWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    companion object {
        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_video_player)

            // Sample data
            views.setTextViewText(R.id.widget_video_title, "Video Title")
            views.setTextViewText(R.id.widget_video_duration, "1:25:30 / 2:15:00")
            views.setProgressBar(R.id.widget_progress, 100, 63, false)

            // Click to open app
            val pendingIntent = getActivityPendingIntent(context, "OPEN_VIDEO_PLAYER", requestCode = 6000)
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
