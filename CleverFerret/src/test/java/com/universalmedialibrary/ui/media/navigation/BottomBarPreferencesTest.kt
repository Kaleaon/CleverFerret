package com.universalmedialibrary.ui.media.navigation

import com.universalmedialibrary.data.settings.BottomBarPreferences
import com.universalmedialibrary.ui.components.NavigationItems
import com.universalmedialibrary.ui.components.resolveBottomBarLayout
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class BottomBarPreferencesTest {

    @Test
    fun defaultPreferences_populatesFourPrimarySlotsWithHomeBooksMusicMovies() {
        val layout = resolveMediaBottomBarLayout(
            destinations = MediaNavDestinations.allDestinations,
            bottomBarPreferences = BottomBarPreferences.Default
        )

        assertEquals("Primary slots must have exactly 4 items", 4, layout.primaryItems.size)

        val primaryRoutes = layout.primaryItems.map { it.route }
        assertEquals(
            listOf(MediaRoutes.HOME, MediaRoutes.BOOKS, MediaRoutes.MUSIC, MediaRoutes.MOVIES),
            primaryRoutes
        )

        assertTrue(
            "Unpinned items must be assigned to overflow list",
            layout.overflowItems.isNotEmpty()
        )
        assertFalse(
            "Primary items must not appear in overflow items",
            layout.overflowItems.any { it.route in primaryRoutes }
        )
    }

    @Test
    fun customPinnedPreferences_presentsCustomPrimarySlotsAndOverflowsUnpinned() {
        val customPreferences = BottomBarPreferences(
            pinned = listOf("home", "audiobooks", "music", "radio")
        )

        val layout = resolveMediaBottomBarLayout(
            destinations = MediaNavDestinations.allDestinations,
            bottomBarPreferences = customPreferences
        )

        assertEquals("Primary slots must have exactly 4 items", 4, layout.primaryItems.size)

        val primaryRoutes = layout.primaryItems.map { it.route }
        assertEquals(
            listOf(MediaRoutes.HOME, MediaRoutes.AUDIOBOOKS, MediaRoutes.MUSIC, MediaRoutes.RADIO),
            primaryRoutes
        )

        val overflowRoutes = layout.overflowItems.map { it.route }
        assertTrue("Books must collapse to overflow when not pinned", overflowRoutes.contains(MediaRoutes.BOOKS))
        assertTrue("Movies must collapse to overflow when not pinned", overflowRoutes.contains(MediaRoutes.MOVIES))
    }

    @Test
    fun legacyPreferenceIds_mapCorrectlyToMediaDestinations() {
        val legacyPreferences = BottomBarPreferences(
            pinned = listOf("home", "library_details/1", "music", "library_details/4")
        )

        val layout = resolveMediaBottomBarLayout(
            destinations = MediaNavDestinations.allDestinations,
            bottomBarPreferences = legacyPreferences
        )

        val primaryRoutes = layout.primaryItems.map { it.route }
        assertEquals(
            listOf(MediaRoutes.HOME, MediaRoutes.BOOKS, MediaRoutes.MUSIC, MediaRoutes.MOVIES),
            primaryRoutes
        )
    }

    @Test
    fun navigationItemResolution_respectsPinnedAndHiddenPreferences() {
        val prefs = BottomBarPreferences(
            pinned = listOf("home", "library_details/2", "music", "radio"),
            hidden = setOf("library_details/1")
        )

        val layout = NavigationItems.bottomNavItems.resolveBottomBarLayout(prefs)

        assertEquals("Primary slots count", 4, layout.primaryItems.size)
        val primaryPreferenceIds = layout.primaryItems.map { it.preferenceId }
        assertEquals(
            listOf("home", "library_details/2", "music", "radio"),
            primaryPreferenceIds
        )

        val overflowIds = layout.overflowItems.map { it.preferenceId }
        assertFalse("Hidden item must not appear in overflow", overflowIds.contains("library_details/1"))
    }

    @Test
    fun activeRouteCheck_correctlyIdentifiesOverflowRoute() {
        val layout = resolveMediaBottomBarLayout(
            destinations = MediaNavDestinations.allDestinations,
            bottomBarPreferences = BottomBarPreferences.Default
        )

        val overflowRoutes = layout.overflowItems.map { it.route }
        val ambientRoute = MediaRoutes.AMBIENT_SOUNDS

        assertTrue("Ambient sounds must be in overflow items", overflowRoutes.contains(ambientRoute))
        assertFalse(
            "Ambient route must not match primary routes",
            layout.primaryItems.any { isDestinationSelected(ambientRoute, it.route) }
        )
    }
}
