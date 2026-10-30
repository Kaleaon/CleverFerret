package com.universalmedialibrary.widgets

import android.appwidget.AppWidgetManager
import android.content.Context
import android.widget.RemoteViews
import com.universalmedialibrary.R

/**
 * Comic Reader Widget
 * Shows currently reading comic with quick navigation
 */
class ComicReaderWidget : BaseWidgetProvider() {

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
            val pendingIntent = getActivityPendingIntent(context, "OPEN_COMIC_READER", requestCode = 7000)
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
