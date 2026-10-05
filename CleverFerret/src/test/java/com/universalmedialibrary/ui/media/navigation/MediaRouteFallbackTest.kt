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

    @Test
    fun resolveRouteOrFallback_keepsPaywallSubroutes() {
        assertEquals("settings/paywall/themes", resolveRouteOrFallback(MediaRoutes.SETTINGS_PAYWALL_THEMES))
        assertEquals("settings/paywall/scanner", resolveRouteOrFallback(MediaRoutes.SETTINGS_PAYWALL_SCANNER))
        assertEquals("settings/paywall/cloud", resolveRouteOrFallback(MediaRoutes.SETTINGS_PAYWALL_CLOUD))
    }

    @Test
    fun resolveRouteOrFallback_keepsDiscoveryRoute() {
        val discoveryBaseResolved = resolveRouteOrFallback(MediaRoutes.DISCOVERY_BASE)
        assertEquals(MediaRoutes.DISCOVERY_BASE, discoveryBaseResolved)

        val parameterizedDiscovery = MediaRoutes.discoveryRoute(query = "cyberpunk", tags = "sci-fi", type = "book")
        val resolved = resolveRouteOrFallback(parameterizedDiscovery)
        assertEquals(parameterizedDiscovery, resolved)
    }

    @Test
    fun sectionSeeAllDetail_contract_isStable() {
        val section = HomeSectionRouteContract.BOOKS
        val seeAllRoute = section.seeAllRoute()
        val detailRoute = MediaRoutes.mediaDetailRoute(section.mediaTypeRoute, "42")

        assertEquals("home/see-all/books", seeAllRoute)
        assertEquals("detail/book/42", detailRoute)
    }

}
