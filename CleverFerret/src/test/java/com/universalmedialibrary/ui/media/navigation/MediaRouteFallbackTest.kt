package com.universalmedialibrary.ui.media.navigation

import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class MediaRouteFallbackTest {

    @Test
    fun resolveRouteOrFallback_keepsKnownStaticRoute() {
        val resolved = resolveRouteOrFallback(MediaRoutes.HOME)
        assertEquals(MediaRoutes.HOME, resolved)
    }

    @Test
    fun resolveRouteOrFallback_keepsKnownParameterizedRoute() {
        val route = MediaRoutes.mediaDetailRoute("book", "123")
        val resolved = resolveRouteOrFallback(route)
        assertEquals(route, resolved)
    }

    @Test
    fun resolveRouteOrFallback_keepsSeeAllRoute() {
        val route = MediaRoutes.seeAllRoute("books")
        val resolved = resolveRouteOrFallback(route)
        assertEquals(route, resolved)
    }

    @Test
    fun resolveRouteOrFallback_mapsUnknownRouteToNotFound() {
        val unknownRoute = "totally/unknown/route"
        val resolved = resolveRouteOrFallback(unknownRoute)
        assertTrue(resolved.startsWith("not-found?path="))
        assertTrue(resolved.contains("totally%2Funknown%2Froute"))
    }
}
