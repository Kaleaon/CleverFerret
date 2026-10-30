package com.universalmedialibrary.widgets

import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class BaseWidgetProviderTest {

    @Test
    fun `formatTime formats milliseconds correctly`() {
        assertEquals("0:00", BaseWidgetProvider.formatTime(0L))
        assertEquals("1:05", BaseWidgetProvider.formatTime(65_000L))
        assertEquals("60:00", BaseWidgetProvider.formatTime(3_600_000L))
        assertEquals("0:00", BaseWidgetProvider.formatTime(-5000L))
    }

    @Test
    fun `formatDuration formats position and duration correctly`() {
        assertEquals("1:05 / 5:00", BaseWidgetProvider.formatDuration(65_000L, 300_000L))
        assertEquals("--:-- / --:--", BaseWidgetProvider.formatDuration(0L, 0L))
        assertEquals("--:-- / --:--", BaseWidgetProvider.formatDuration(1000L, -100L))
    }

    @Test
    fun `calculateProgressPercentage computes bounded percentages`() {
        assertEquals(50, BaseWidgetProvider.calculateProgressPercentage(30_000L, 60_000L))
        assertEquals(0, BaseWidgetProvider.calculateProgressPercentage(0L, 60_000L))
        assertEquals(100, BaseWidgetProvider.calculateProgressPercentage(60_000L, 60_000L))
        assertEquals(100, BaseWidgetProvider.calculateProgressPercentage(120_000L, 60_000L))
        assertEquals(0, BaseWidgetProvider.calculateProgressPercentage(30_000L, 0L))
    }

    @Test
    fun `getNextPlaybackSpeed cycles correctly`() {
        assertEquals(1.25f, BaseWidgetProvider.getNextPlaybackSpeed(1.0f), 0.01f)
        assertEquals(1.5f, BaseWidgetProvider.getNextPlaybackSpeed(1.25f), 0.01f)
        assertEquals(2.0f, BaseWidgetProvider.getNextPlaybackSpeed(1.5f), 0.01f)
        assertEquals(1.0f, BaseWidgetProvider.getNextPlaybackSpeed(2.0f), 0.01f)
        assertEquals(1.0f, BaseWidgetProvider.getNextPlaybackSpeed(2.5f), 0.01f)
    }

    @Test
    fun `pending intent helpers return valid pending intents`() {
        val context = ApplicationProvider.getApplicationContext<android.content.Context>()
        
        val broadcastPi = BaseWidgetProvider.getBroadcastPendingIntent(
            context,
            PodcastPlayerWidget::class.java,
            "com.universalmedialibrary.PODCAST_PLAY_PAUSE",
            3001
        )
        assertNotNull(broadcastPi)

        val activityPi = BaseWidgetProvider.getActivityPendingIntent(
            context,
            "OPEN_PODCAST_PLAYER",
            0
        )
        assertNotNull(activityPi)
    }
}
