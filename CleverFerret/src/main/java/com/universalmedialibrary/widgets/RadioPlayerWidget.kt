package com.universalmedialibrary.widgets

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.widget.RemoteViews
import com.universalmedialibrary.R
import com.universalmedialibrary.MainActivity
import com.universalmedialibrary.services.audio.AudioPlaybackManager
import com.universalmedialibrary.data.local.dao.RadioStationDao
import dagger.hilt.android.AndroidEntryPoint
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.flow.firstOrNull
import javax.inject.Inject

/**
 * Radio Player Widget
 * Shows currently playing radio station with controls
 */
@AndroidEntryPoint
class RadioPlayerWidget : AppWidgetProvider() {

    @Inject
    lateinit var audioPlaybackManager: AudioPlaybackManager

    @Inject
    lateinit var radioStationDao: RadioStationDao

    private val widgetScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            widgetScope.launch {
                updateAppWidget(context, appWidgetManager, appWidgetId, audioPlaybackManager, radioStationDao)
            }
        }
    }

    companion object {
        private const val ACTION_PLAY_PAUSE = "com.universalmedialibrary.RADIO_PLAY_PAUSE"
        private const val ACTION_NEXT_STATION = "com.universalmedialibrary.RADIO_NEXT"
        private const val ACTION_PREV_STATION = "com.universalmedialibrary.RADIO_PREV"
        private const val ACTION_FAVORITE = "com.universalmedialibrary.RADIO_FAVORITE"
        private const val PREFS_NAME = "RadioWidgetPrefs"
        private const val PREF_CURRENT_STATION_ID = "current_station_id"

        suspend fun updateAppWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            audioPlaybackManager: AudioPlaybackManager? = null,
            radioStationDao: RadioStationDao? = null
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_radio_player)

            // Get current station from prefs
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val currentStationId = prefs.getLong(PREF_CURRENT_STATION_ID, -1)
            
            val currentStation = if (currentStationId > 0 && radioStationDao != null) {
                radioStationDao.getStationById(currentStationId)
            } else {
                null
            }

            val audioState = audioPlaybackManager?.state?.value
            views.setTextViewText(R.id.widget_station_name, currentStation?.name ?: "No Station Playing")
            views.setTextViewText(R.id.widget_station_genre, currentStation?.genre ?: "")
            views.setTextViewText(R.id.widget_now_playing, 
                if (audioState?.isPlaying == true) "Now Playing" else "Stopped")

            // Set up button intents
            views.setOnClickPendingIntent(
                R.id.widget_play_pause_btn,
                getPendingIntent(context, ACTION_PLAY_PAUSE)
            )
            views.setOnClickPendingIntent(
                R.id.widget_next_btn,
                getPendingIntent(context, ACTION_NEXT_STATION)
            )
            views.setOnClickPendingIntent(
                R.id.widget_prev_btn,
                getPendingIntent(context, ACTION_PREV_STATION)
            )
            views.setOnClickPendingIntent(
                R.id.widget_favorite_btn,
                getPendingIntent(context, ACTION_FAVORITE)
            )

            // Click to open app
            val intent = Intent(context, MainActivity::class.java).apply {
                action = "OPEN_RADIO_PLAYER"
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            }
            val pendingIntent = PendingIntent.getActivity(
                context, 0, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun getPendingIntent(context: Context, action: String): PendingIntent {
            val intent = Intent(context, RadioPlayerWidget::class.java).apply {
                this.action = action
            }
            // Use unique request code per action to avoid PendingIntent reuse
            val requestCode = when (action) {
                ACTION_PLAY_PAUSE -> 4001
                ACTION_NEXT_STATION -> 4002
                ACTION_PREV_STATION -> 4003
                else -> 4000
            }
            return PendingIntent.getBroadcast(
                context, requestCode, intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        widgetScope.launch {
            when (intent.action) {
                ACTION_PLAY_PAUSE -> {
                    if (audioPlaybackManager.state.value.isPlaying) {
                        audioPlaybackManager.exoPlayer.pause()
                    } else {
                        audioPlaybackManager.exoPlayer.play()
                    }
                    updateAllWidgets(context)
                }
                ACTION_NEXT_STATION -> {
                    // Get current station and switch to next
                    val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    val currentStationId = prefs.getLong(PREF_CURRENT_STATION_ID, -1)
                    val allStations = radioStationDao.getAllStations().firstOrNull() ?: emptyList()
                    
                    if (allStations.isNotEmpty()) {
                        val currentIndex = allStations.indexOfFirst { it.id == currentStationId }
                        val nextIndex = (currentIndex + 1) % allStations.size
                        val nextStation = allStations[nextIndex]
                        
                        // Play next station
                        val uri = android.net.Uri.parse(nextStation.streamUrl)
                        audioPlaybackManager.loadSingle(uri, playWhenReady = true)
                        prefs.edit().putLong(PREF_CURRENT_STATION_ID, nextStation.id).apply()
                        radioStationDao.recordPlay(nextStation.id, System.currentTimeMillis())
                    }
                    updateAllWidgets(context)
                }
                ACTION_PREV_STATION -> {
                    // Get current station and switch to previous
                    val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    val currentStationId = prefs.getLong(PREF_CURRENT_STATION_ID, -1)
                    val allStations = radioStationDao.getAllStations().firstOrNull() ?: emptyList()
                    
                    if (allStations.isNotEmpty()) {
                        val currentIndex = allStations.indexOfFirst { it.id == currentStationId }
                        val prevIndex = if (currentIndex <= 0) allStations.size - 1 else currentIndex - 1
                        val prevStation = allStations[prevIndex]
                        
                        // Play previous station
                        val uri = android.net.Uri.parse(prevStation.streamUrl)
                        audioPlaybackManager.loadSingle(uri, playWhenReady = true)
                        prefs.edit().putLong(PREF_CURRENT_STATION_ID, prevStation.id).apply()
                        radioStationDao.recordPlay(prevStation.id, System.currentTimeMillis())
                    }
                    updateAllWidgets(context)
                }
                ACTION_FAVORITE -> {
                    // Toggle favorite status
                    val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    val currentStationId = prefs.getLong(PREF_CURRENT_STATION_ID, -1)
                    if (currentStationId > 0) {
                        val station = radioStationDao.getStationById(currentStationId)
                        if (station != null) {
                            radioStationDao.updateFavoriteStatus(station.id, !station.isFavorite)
                        }
                    }
                    updateAllWidgets(context)
                }
            }
        }
    }

    private fun updateAllWidgets(context: Context) {
        widgetScope.launch {
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val ids = appWidgetManager.getAppWidgetIds(
                android.content.ComponentName(context, RadioPlayerWidget::class.java)
            )
            ids.forEach { id ->
                updateAppWidget(context, appWidgetManager, id, audioPlaybackManager, radioStationDao)
            }
        }
    }

    override fun onDisabled(context: Context) {
        super.onDisabled(context)
        // Cancel coroutine scope when all widgets removed to prevent leaks
        widgetScope.cancel()
    }
}
