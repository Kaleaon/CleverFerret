package com.universalmedialibrary.ui.media.navigation

import org.junit.Assert.assertEquals
import org.junit.Test

class SettingsNavigationGraphTest {

    @Test
    fun settingsHubRoutes_areRecognized() {
        assertEquals(MediaRoutes.SETTINGS_HUB_APPEARANCE, resolveRouteOrFallback(MediaRoutes.SETTINGS_HUB_APPEARANCE))
        assertEquals(MediaRoutes.SETTINGS_HUB_LIBRARY, resolveRouteOrFallback(MediaRoutes.SETTINGS_HUB_LIBRARY))
        assertEquals(MediaRoutes.SETTINGS_HUB_PLAYBACK, resolveRouteOrFallback(MediaRoutes.SETTINGS_HUB_PLAYBACK))
        assertEquals(MediaRoutes.SETTINGS_HUB_INTEGRATIONS, resolveRouteOrFallback(MediaRoutes.SETTINGS_HUB_INTEGRATIONS))
        assertEquals(MediaRoutes.SETTINGS_HUB_SYSTEM, resolveRouteOrFallback(MediaRoutes.SETTINGS_HUB_SYSTEM))
    }

    @Test
    fun developerSettingsRoute_isRecognized() {
        assertEquals(MediaRoutes.SETTINGS_DEVELOPER, resolveRouteOrFallback(MediaRoutes.SETTINGS_DEVELOPER))
        assertEquals(MediaRoutes.SETTINGS_FEATURES, resolveRouteOrFallback(MediaRoutes.SETTINGS_FEATURES))
    }

    @Test
    fun deduplicatedSettingsRoutes_areResolvable() {
        assertEquals(MediaRoutes.SETTINGS_MEDIA_SERVERS, resolveRouteOrFallback(MediaRoutes.SETTINGS_MEDIA_SERVERS))
        assertEquals(MediaRoutes.SETTINGS_NETWORK_STORAGE, resolveRouteOrFallback(MediaRoutes.SETTINGS_NETWORK_STORAGE))
        assertEquals(MediaRoutes.SETTINGS_PLAYBACK, resolveRouteOrFallback(MediaRoutes.SETTINGS_PLAYBACK))
        assertEquals(MediaRoutes.SETTINGS_TTS_PROVIDER, resolveRouteOrFallback(MediaRoutes.SETTINGS_TTS_PROVIDER))
        assertEquals(MediaRoutes.SETTINGS_PARENTAL, resolveRouteOrFallback(MediaRoutes.SETTINGS_PARENTAL))
        assertEquals(MediaRoutes.SETTINGS_STORAGE, resolveRouteOrFallback(MediaRoutes.SETTINGS_STORAGE))
        assertEquals(MediaRoutes.SETTINGS_READER, resolveRouteOrFallback(MediaRoutes.SETTINGS_READER))
    }
}
