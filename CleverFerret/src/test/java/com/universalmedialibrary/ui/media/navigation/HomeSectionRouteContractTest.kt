package com.universalmedialibrary.ui.media.navigation

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Test

class HomeSectionRouteContractTest {

    @Test
    fun fromSection_resolvesKnownHomeSection() {
        val contract = HomeSectionRouteContract.fromSection("comics")

        assertNotNull(contract)
        assertEquals(HomeSectionRouteContract.COMICS, contract)
        assertEquals(MediaRoutes.seeAllRoute("comics"), contract?.seeAllRoute())
        assertEquals(MediaRoutes.libraryRoute("comic"), MediaRoutes.libraryRoute(contract!!.mediaTypeRoute))
    }

    @Test
    fun fromSection_rejectsUnknownSection() {
        val contract = HomeSectionRouteContract.fromSection("unknown-section")

        assertNull(contract)
    }

    @Test
    fun fromSection_decodesEncodedSection() {
        val contract = HomeSectionRouteContract.fromSection("web_fiction")

        assertEquals(HomeSectionRouteContract.WEB_FICTION, contract)
        assertEquals(MediaRoutes.seeAllRoute("web_fiction"), contract?.seeAllRoute())
    }
}
