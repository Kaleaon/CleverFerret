package com.cleverferret.v2.app.navigation

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class AppNavigationCatalogTest {
    @Test
    fun `canonical routes are unique across the app`() {
        val flattenedRoutes = AppNavigationCatalog.topLevelDestinations.values.flatten().map(AppDestination::route)

        assertEquals(flattenedRoutes.size, flattenedRoutes.distinct().size)
    }

    @Test
    fun `every top-level domain has at least one destination`() {
        V2NavigationGraph.TopLevelDomain.entries.forEach { domain ->
            assertTrue(AppNavigationCatalog.topLevelDestinations[domain].orEmpty().isNotEmpty())
        }
    }
}
