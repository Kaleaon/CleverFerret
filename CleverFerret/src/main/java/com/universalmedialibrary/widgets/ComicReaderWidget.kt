package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity

/**
 * Comic Reader Widget
 * Shows currently reading comic with quick navigation
 */
class ComicReaderWidget : AppWidgetProvider() {

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
            val views = RemoteViews(context.packageName, R.layout.widget_comic_reader)

            // Sample data
            views.setTextViewText(R.id.widget_comic_title, "Comic Title")
            views.setTextViewText(R.id.widget_issue_number, "Issue #42")
            views.setTextViewText(R.id.widget_page_number, "Page 15 of 24")
            views.setProgressBar(R.id.widget_progress, 100, 62, false)

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_COMIC_READER"
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context, 7000, intent, // Unique request code for comic widget
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
