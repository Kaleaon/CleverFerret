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
 * Home Screen Widgets
 * Includes:
 * - Currently Reading Widget (shows current book with progress)
 * - Quick Access Widget (shortcuts to recent books)
 * - Reading Stats Widget (daily/weekly stats)
 * - Recent Books Widget (list of recently accessed books)
 * - Reading Goal Widget (progress towards reading goals)
 */

/**
 * Currently Reading Widget
 * Shows the book you're currently reading with progress bar
 */
class CurrentlyReadingWidget : AppWidgetProvider() {

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            updateAppWidget(context, appWidgetManager, appWidgetId)
        }
    }

    override fun onEnabled(context: Context) {
        // Enter relevant functionality when first widget is created
    }

    override fun onDisabled(context: Context) {
        // Enter relevant functionality when last widget is disabled
    }

    companion object {
        fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int
        ) {
            // Get current book data (this would come from a repository)
            val bookTitle = "Sample Book Title"
            val author = "Author Name"
            val progress = 75 // percentage

            // Create an Intent to launch MainActivity when widget is tapped
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_CURRENT_BOOK"
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                8000, // Unique request code for currently reading widget
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )

            // Construct the RemoteViews object
            val views = RemoteViews(context.packageName, R.layout.widget_currently_reading).apply {
                setTextViewText(R.id.widget_book_title, bookTitle)
                setTextViewText(R.id.widget_author, author)
                setTextViewText(R.id.widget_progress_text, "$progress%")
                setProgressBar(R.id.widget_progress_bar, 100, progress, false)
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)
            }

            // Instruct the widget manager to update the widget
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

/**
 * Quick Access Widget
 * Shows shortcuts to recently read books
 */
class QuickAccessWidget : AppWidgetProvider() {

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
            val views = RemoteViews(context.packageName, R.layout.widget_quick_access)

            // Set up the intent that starts the RemoteViewsService for the list view
            val intent = Intent(context, QuickAccessWidgetService::class.java).apply {
                putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, appWidgetId)
            }
            
            views.setRemoteAdapter(R.id.widget_book_list, intent)

            // Template intent for clicking items
            val clickIntent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_BOOK"
            }
            val clickPendingIntent = PendingIntent.getActivity(
                context,
                8001, // Unique request code for book click
                clickIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_MUTABLE
            )
            views.setPendingIntentTemplate(R.id.widget_book_list, clickPendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

/**
 * Reading Stats Widget
 * Shows daily or weekly reading statistics
 */
class ReadingStatsWidget : AppWidgetProvider() {

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
            // Get reading stats (would come from repository)
            val booksReadThisWeek = 2
            val pagesReadToday = 45
            val readingTimeMinutes = 120
            val currentStreak = 7

            val views = RemoteViews(context.packageName, R.layout.widget_reading_stats).apply {
                setTextViewText(R.id.widget_books_read, "$booksReadThisWeek books")
                setTextViewText(R.id.widget_pages_read, "$pagesReadToday pages today")
                setTextViewText(R.id.widget_reading_time, "${readingTimeMinutes}min")
                setTextViewText(R.id.widget_streak, "$currentStreak day streak 🔥")
            }

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_STATS"
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

/**
 * Reading Goal Widget
 * Shows progress towards reading goals
 */
class ReadingGoalWidget : AppWidgetProvider() {

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
            // Get goal data
            val goalBooks = 50
            val booksRead = 23
            val progress = (booksRead * 100) / goalBooks
            val daysRemaining = 167 // calculated from year-end

            val views = RemoteViews(context.packageName, R.layout.widget_reading_goal).apply {
                setTextViewText(R.id.widget_goal_title, "2025 Reading Goal")
                setTextViewText(R.id.widget_goal_progress, "$booksRead / $goalBooks books")
                setProgressBar(R.id.widget_goal_progress_bar, 100, progress, false)
                setTextViewText(R.id.widget_days_remaining, "$daysRemaining days remaining")
                
                // Calculate pace
                val booksPerDay = (goalBooks - booksRead).toFloat() / daysRemaining
                val paceText = String.format("%.1f books/week needed", booksPerDay * 7)
                setTextViewText(R.id.widget_pace, paceText)
            }

            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_GOALS"
            }
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}

/**
 * Remote Views Service for list widgets
 */
class QuickAccessWidgetService : android.widget.RemoteViewsService() {
    override fun onGetViewFactory(intent: Intent): RemoteViewsFactory {
        return QuickAccessRemoteViewsFactory(applicationContext, intent)
    }
}

class QuickAccessRemoteViewsFactory(
    private val context: Context,
    intent: Intent
) : android.widget.RemoteViewsService.RemoteViewsFactory {

    private val books = mutableListOf<BookItem>()

    data class BookItem(
        val id: Long,
        val title: String,
        val author: String,
        val progress: Int
    )

    override fun onCreate() {
        // Load recent books from database
        loadRecentBooks()
    }

    override fun onDataSetChanged() {
        // Reload data
        loadRecentBooks()
    }

    override fun onDestroy() {
        books.clear()
    }

    override fun getCount(): Int = books.size

    override fun getViewAt(position: Int): RemoteViews {
        // Bounds checking to prevent crashes
        if (position < 0 || position >= books.size) {
            return RemoteViews(context.packageName, R.layout.widget_book_item)
        }
        
        val book = books[position]
        
        return RemoteViews(context.packageName, R.layout.widget_book_item).apply {
            setTextViewText(R.id.widget_item_title, book.title)
            setTextViewText(R.id.widget_item_author, book.author)
            setTextViewText(R.id.widget_item_progress, "${book.progress}%")
            setProgressBar(R.id.widget_item_progress_bar, 100, book.progress, false)

            // Fill in intent for item click
            val fillInIntent = Intent().apply {
                putExtra("BOOK_ID", book.id)
            }
            setOnClickFillInIntent(R.id.widget_item_root, fillInIntent)
        }
    }

    override fun getLoadingView(): RemoteViews? = null

    override fun getViewTypeCount(): Int = 1

    override fun getItemId(position: Int): Long {
        return books.getOrNull(position)?.id ?: -1L
    }

    override fun hasStableIds(): Boolean = true

    private fun loadRecentBooks() {
        // This would load from actual database
        books.clear()
        books.addAll(
            listOf(
                BookItem(1, "The Great Gatsby", "F. Scott Fitzgerald", 65),
                BookItem(2, "1984", "George Orwell", 42),
                BookItem(3, "To Kill a Mockingbird", "Harper Lee", 88),
                BookItem(4, "Pride and Prejudice", "Jane Austen", 23),
                BookItem(5, "The Catcher in the Rye", "J.D. Salinger", 51)
            )
        )
    }
}