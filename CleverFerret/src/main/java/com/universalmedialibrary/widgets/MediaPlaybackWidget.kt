package com.universalmedialibrary.widgets

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.GlanceTheme
import androidx.glance.action.ActionParameters
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.*
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider

/**
 * Jetpack Glance Media Playback Widget
 * 
 * Displays current media with responsive playback controls for books, music, and movies.
 */
object MediaPlaybackWidget : GlanceAppWidget() {

    // Preference keys for widget state
    internal val CURRENT_TITLE = stringPreferencesKey("current_title")
    internal val CURRENT_SUBTITLE = stringPreferencesKey("current_subtitle")
    internal val IS_PLAYING = booleanPreferencesKey("is_playing")
    internal val MEDIA_TYPE = stringPreferencesKey("media_type")
    internal val ARTWORK_URI = stringPreferencesKey("artwork_uri")

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            GlanceTheme {
                MediaPlaybackWidgetContent()
            }
        }
    }

    @Composable
    private fun MediaPlaybackWidgetContent() {
        val prefs = currentState<Preferences>()
        val title = prefs[CURRENT_TITLE] ?: "No Media Playing"
        val subtitle = prefs[CURRENT_SUBTITLE] ?: ""
        val isPlaying = prefs[IS_PLAYING] ?: false
        val mediaType = prefs[MEDIA_TYPE] ?: ""

        Box(
            modifier = GlanceModifier
                .fillMaxSize()
                .background(getBackgroundColor(mediaType))
                .clickable(actionRunCallback<OpenAppAction>())
        ) {
            Column(
                modifier = GlanceModifier
                    .fillMaxSize()
                    .padding(16.dp),
                verticalAlignment = Alignment.Bottom
            ) {
                // Media info
                if (title.isNotEmpty()) {
                    Text(
                        text = title,
                        style = TextStyle(
                            color = ColorProvider(Color.White),
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Bold
                        ),
                        modifier = GlanceModifier.padding(bottom = 4.dp)
                    )
                }
                
                if (subtitle.isNotEmpty()) {
                    Text(
                        text = subtitle,
                        style = TextStyle(
                            color = ColorProvider(Color.White.copy(alpha = 0.8f)),
                            fontSize = 14.sp
                        ),
                        modifier = GlanceModifier.padding(bottom = 12.dp)
                    )
                }

                // Playback controls row
                Row(
                    modifier = GlanceModifier.fillMaxWidth(),
                    horizontalAlignment = Alignment.CenterHorizontally,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    // Previous button
                    Text(
                        "⏮",
                        style = TextStyle(
                            color = ColorProvider(Color.White),
                            fontSize = 18.sp
                        ),
                        modifier = GlanceModifier
                            .clickable(actionRunCallback<PreviousAction>())
                            .padding(12.dp)
                    )

                    Spacer(modifier = GlanceModifier.width(16.dp))

                    // Play/Pause button
                    Text(
                        if (isPlaying) "⏸" else "▶",
                        style = TextStyle(
                            color = ColorProvider(Color.White),
                            fontSize = 24.sp
                        ),
                        modifier = GlanceModifier
                            .clickable(actionRunCallback<PlayPauseAction>())
                            .padding(16.dp)
                    )

                    Spacer(modifier = GlanceModifier.width(16.dp))

                    // Next button
                    Text(
                        "⏭",
                        style = TextStyle(
                            color = ColorProvider(Color.White),
                            fontSize = 18.sp
                        ),
                        modifier = GlanceModifier
                            .clickable(actionRunCallback<NextAction>())
                            .padding(12.dp)
                    )
                }
            }
        }
    }

    /**
     * Get background color based on media type
     */
    private fun getBackgroundColor(mediaType: String): ColorProvider {
        return when (mediaType.uppercase()) {
            "BOOK", "EBOOK" -> ColorProvider(Color(0xFF2C5F2D)) // Green for books
            "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> ColorProvider(Color(0xFF7B1FA2)) // Purple for music
            "MOVIE", "TV_SHOW" -> ColorProvider(Color(0xFF1565C0)) // Blue for movies
            "PODCAST", "PODCAST_EPISODE" -> ColorProvider(Color(0xFFEF6C00)) // Orange for podcasts
            else -> ColorProvider(Color(0xFF455A64)) // Default gray
        }
    }
}

/**
 * Widget receiver for system integration
 */
class MediaPlaybackWidgetReceiver : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = MediaPlaybackWidget
}

/**
 * Action callbacks for widget interactions
 */
class OpenAppAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // Open the main app
        val intent = context.packageManager.getLaunchIntentForPackage(context.packageName)
        intent?.let {
            it.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
            context.startActivity(it)
        }
    }
}

class PlayPauseAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // Toggle playback - this will be connected to MediaPlayerService
        // For now, this is a simplified placeholder that just logs the action
        android.util.Log.d("MediaPlaybackWidget", "PlayPause action triggered")
    }
}

class PreviousAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // Previous track/chapter - will be connected to MediaPlayerService
    }
}

class NextAction : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters
    ) {
        // Next track/chapter - will be connected to MediaPlayerService
    }
}