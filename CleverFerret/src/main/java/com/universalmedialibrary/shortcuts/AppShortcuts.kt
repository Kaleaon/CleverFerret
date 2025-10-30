package com.universalmedialibrary.shortcuts

import android.content.Context
import android.content.Intent
import android.content.pm.ShortcutInfo
import android.content.pm.ShortcutManager
import android.graphics.drawable.Icon
import android.os.Build
import androidx.annotation.RequiresApi
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.R

/**
 * App Shortcuts Manager
 * Features:
 * - Dynamic shortcuts (recently read books)
 * - Pinned shortcuts (favorite books)
 * - App actions (continue reading, search books)
 * - Adaptive icons
 * - Deep links to specific screens
 */

class AppShortcutsManager(private val context: Context) {

    private val shortcutManager: ShortcutManager? =
        context.getSystemService(Context.SHORTCUT_SERVICE) as? ShortcutManager

    /**
     * Update dynamic shortcuts
     * These appear in the app icon long-press menu
     */
    fun updateDynamicShortcuts(recentBooks: List<BookShortcut>) {
        if (shortcutManager == null) return

        val shortcuts = mutableListOf<ShortcutInfo>()

        // Add "Continue Reading" shortcut
        shortcuts.add(
            ShortcutInfo.Builder(context, "continue_reading")
                .setShortLabel("Continue Reading")
                .setLongLabel("Continue Reading Current Book")
                .setIcon(Icon.createWithResource(context, R.drawable.ic_book))
                .setIntent(
                    Intent(Intent.ACTION_VIEW, null, context, MainActivity::class.java).apply {
                        putExtra("action", "continue_reading")
                    }
                )
                .setRank(0)
                .build()
        )

        // Add "Search Books" shortcut
        shortcuts.add(
            ShortcutInfo.Builder(context, "search_books")
                .setShortLabel("Search")
                .setLongLabel("Search Books")
                .setIcon(Icon.createWithResource(context, R.drawable.ic_search))
                .setIntent(
                    Intent(Intent.ACTION_VIEW, null, context, MainActivity::class.java).apply {
                        putExtra("action", "search")
                    }
                )
                .setRank(1)
                .build()
        )

        // Add recent books (up to 3)
        recentBooks.take(3).forEachIndexed { index, book ->
            shortcuts.add(
                ShortcutInfo.Builder(context, "book_${book.id}")
                    .setShortLabel(book.title)
                    .setLongLabel("Continue reading ${book.title}")
                    .setIcon(
                        if (book.coverIcon != null) {
                            book.coverIcon
                        } else {
                            Icon.createWithResource(context, R.drawable.ic_book)
                        }
                    )
                    .setIntent(
                        Intent(Intent.ACTION_VIEW, null, context, MainActivity::class.java).apply {
                            putExtra("action", "open_book")
                            putExtra("book_id", book.id)
                        }
                    )
                    .setRank(index + 2)
                    .build()
            )
        }

        // Dynamic shortcuts are limited to 4-5 on most devices
        shortcutManager.dynamicShortcuts = shortcuts.take(5)
    }

    /**
     * Create a pinned shortcut for a book
     * User can place this on their home screen
     */
    fun createPinnedShortcut(book: BookShortcut): Boolean {
        if (shortcutManager == null) return false
        if (!shortcutManager.isRequestPinShortcutSupported) return false

        val shortcut = ShortcutInfo.Builder(context, "pinned_book_${book.id}")
            .setShortLabel(book.title)
            .setLongLabel(book.title)
            .setIcon(
                book.coverIcon ?: Icon.createWithResource(context, R.drawable.ic_book)
            )
            .setIntent(
                Intent(Intent.ACTION_VIEW, null, context, MainActivity::class.java).apply {
                    putExtra("action", "open_book")
                    putExtra("book_id", book.id)
                }
            )
            .build()

        // Create the PendingIntent for the callback
        val successCallback = android.app.PendingIntent.getBroadcast(
            context,
            0,
            Intent(context, ShortcutCreatedReceiver::class.java).apply {
                putExtra("book_id", book.id)
            },
            android.app.PendingIntent.FLAG_UPDATE_CURRENT or android.app.PendingIntent.FLAG_IMMUTABLE
        )

        return shortcutManager.requestPinShortcut(shortcut, successCallback.intentSender)
    }

    /**
     * Remove a dynamic shortcut
     */
    fun removeDynamicShortcut(shortcutId: String) {
        shortcutManager?.removeDynamicShortcuts(listOf(shortcutId))
    }

    /**
     * Remove all dynamic shortcuts
     */
    fun removeAllDynamicShortcuts() {
        shortcutManager?.removeAllDynamicShortcuts()
    }

    /**
     * Report shortcut usage
     * This helps the system rank shortcuts
     */
    fun reportShortcutUsed(shortcutId: String) {
        shortcutManager?.reportShortcutUsed(shortcutId)
    }

    /**
     * Update shortcut for a book (e.g., when cover changes)
     */
    fun updateShortcut(book: BookShortcut) {
        if (shortcutManager == null) return

        val shortcut = ShortcutInfo.Builder(context, "book_${book.id}")
            .setShortLabel(book.title)
            .setLongLabel("Continue reading ${book.title}")
            .setIcon(
                book.coverIcon ?: Icon.createWithResource(context, R.drawable.ic_book)
            )
            .setIntent(
                Intent(Intent.ACTION_VIEW, null, context, MainActivity::class.java).apply {
                    putExtra("action", "open_book")
                    putExtra("book_id", book.id)
                }
            )
            .build()

        shortcutManager.updateShortcuts(listOf(shortcut))
    }

    /**
     * Disable shortcuts for deleted books
     */
    fun disableShortcuts(bookIds: List<Long>, reason: String = "Book removed") {
        val shortcutIds = bookIds.map { "book_$it" }
        shortcutManager?.disableShortcuts(shortcutIds, reason)
    }

    /**
     * Create app actions shortcuts.xml
     * These appear in Google Assistant and other surfaces
     */
    fun getAppActions(): List<AppAction> {
        return listOf(
            AppAction(
                id = "continue_reading",
                name = "Continue Reading",
                description = "Continue reading your current book",
                category = "READ"
            ),
            AppAction(
                id = "search_books",
                name = "Search Books",
                description = "Search your library",
                category = "SEARCH"
            ),
            AppAction(
                id = "reading_stats",
                name = "Reading Statistics",
                description = "View your reading statistics",
                category = "VIEW"
            ),
            AppAction(
                id = "add_book",
                name = "Add Book",
                description = "Add a new book to your library",
                category = "CREATE"
            )
        )
    }
}

/**
 * Data class for book shortcut
 */
data class BookShortcut(
    val id: Long,
    val title: String,
    val author: String,
    val coverIcon: Icon? = null,
    val progress: Float = 0f
)

/**
 * Data class for app action
 */
data class AppAction(
    val id: String,
    val name: String,
    val description: String,
    val category: String
)

/**
 * Broadcast receiver for shortcut creation callback
 */
class ShortcutCreatedReceiver : android.content.BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        val bookId = intent.getLongExtra("book_id", -1)
        // Handle shortcut creation success
        // Could show a toast or log analytics
    }
}

/**
 * Helper to create app shortcuts configuration
 * This is referenced in AndroidManifest.xml
 */
object ShortcutsXmlGenerator {
    /**
     * Generate shortcuts.xml content
     * This would be in res/xml/shortcuts.xml
     */
    fun generateShortcutsXml(): String {
        return """
<?xml version="1.0" encoding="utf-8"?>
<shortcuts xmlns:android="http://schemas.android.com/apk/res/android">
    <shortcut
        android:shortcutId="continue_reading"
        android:enabled="true"
        android:icon="@drawable/ic_book"
        android:shortcutShortLabel="@string/shortcut_continue_reading_short"
        android:shortcutLongLabel="@string/shortcut_continue_reading_long"
        android:shortcutDisabledMessage="@string/shortcut_disabled_message">
        <intent
            android:action="android.intent.action.VIEW"
            android:targetPackage="com.universalmedialibrary"
            android:targetClass="com.universalmedialibrary.MainActivity">
            <extra android:name="action" android:value="continue_reading" />
        </intent>
        <categories android:name="android.shortcut.conversation" />
    </shortcut>

    <shortcut
        android:shortcutId="search_books"
        android:enabled="true"
        android:icon="@drawable/ic_search"
        android:shortcutShortLabel="@string/shortcut_search_short"
        android:shortcutLongLabel="@string/shortcut_search_long">
        <intent
            android:action="android.intent.action.VIEW"
            android:targetPackage="com.universalmedialibrary"
            android:targetClass="com.universalmedialibrary.MainActivity">
            <extra android:name="action" android:value="search" />
        </intent>
    </shortcut>

    <shortcut
        android:shortcutId="reading_stats"
        android:enabled="true"
        android:icon="@drawable/ic_stats"
        android:shortcutShortLabel="@string/shortcut_stats_short"
        android:shortcutLongLabel="@string/shortcut_stats_long">
        <intent
            android:action="android.intent.action.VIEW"
            android:targetPackage="com.universalmedialibrary"
            android:targetClass="com.universalmedialibrary.MainActivity">
            <extra android:name="action" android:value="stats" />
        </intent>
    </shortcut>
</shortcuts>
        """.trimIndent()
    }

    /**
     * Generate actions.xml content for App Actions
     * This would be in res/xml/actions.xml
     */
    fun generateActionsXml(): String {
        return """
<?xml version="1.0" encoding="utf-8"?>
<actions>
    <action intentName="actions.intent.OPEN_APP_FEATURE">
        <fulfillment urlTemplate="cleverferret://continue_reading">
            <parameter-mapping intentParameter="feature" urlParameter="action"/>
        </fulfillment>
    </action>

    <action intentName="actions.intent.SEARCH">
        <fulfillment urlTemplate="cleverferret://search?q={query}">
            <parameter-mapping intentParameter="query" urlParameter="q"/>
        </fulfillment>
    </action>
</actions>
        """.trimIndent()
    }
}
