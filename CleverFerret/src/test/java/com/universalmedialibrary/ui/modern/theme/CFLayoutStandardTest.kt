package com.universalmedialibrary.ui.modern.theme

import com.google.gson.JsonParser
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class CFLayoutStandardTest {
    private val contract = File("src/main/assets/theme/layout-standards.v1.json")
    private val tolerance = 0.001f

    private fun standard(layout: CFLayout) = contract.reader().use { CFLayoutStandard.read(it, layout) }

    @Test
    fun stableIdsAndLegacyNamesSurvivePreferenceLoading() {
        assertEquals(listOf("compose", "terminal", "sweep", "tiles", "glass", "rules", "press"), CFLayout.entries.map { it.id })
        CFLayout.entries.forEach {
            assertEquals(it, CFLayout.fromId(it.id))
            assertEquals(it, CFLayout.fromId(it.name))
        }
        assertEquals(CFLayout.Compose, CFLayout.fromId(null))
        assertEquals(CFLayout.Compose, CFLayout.fromId("future-layout"))
    }

    @Test
    fun everyLayoutUsesThePortableInteractionAndNavigationContract() {
        CFLayout.entries.forEach {
            val standard = standard(it)
            assertEquals(48f, standard.minimumTarget, tolerance)
            assertEquals(720f, standard.adaptiveWidth, tolerance)
        }
        assertEquals("sweep", standard(CFLayout.Lcars).navigationPhone)
        assertEquals("rail", standard(CFLayout.Rules).navigationPhone)
        assertEquals("pivot-appbar", standard(CFLayout.Metro).navigationWide)
        assertEquals("rail", standard(CFLayout.Press).navigationWide)
        assertEquals("bar", standard(CFLayout.Glass).navigationPhone)
    }

    @Test
    fun bothNativeSweepsMatchTheReviewedContractGeometry() {
        val frame = checkNotNull(standard(CFLayout.Lcars).frame)
        assertEquals(94f, frame.outerX, tolerance)
        assertEquals(30f, frame.outerY, tolerance)
        assertEquals(86f, frame.headerBottom - frame.outerY, tolerance)
        assertEquals(frame.headerBottom - frame.outerY, frame.headerBottom - frame.bar - frame.inner, tolerance)
        assertEquals(150f, frame.contentTop + frame.outerY, tolerance)
        assertEquals(frame.contentTop + frame.outerY, frame.shellTop + frame.inner, tolerance)
        assertEquals(172f, frame.railTop, tolerance)
    }

    @Test
    fun distinctiveLayoutsRetainTheirCornersAndQuietSurfaces() {
        val terminal = standard(CFLayout.Terminal)
        assertEquals(CFLayoutCorners(4f, 4f, 4f, 4f, 4f, 4f, 4f), terminal.corners)
        assertEquals(12f, terminal.minimumMetadata, tolerance)
        assertEquals(160f, checkNotNull(standard(CFLayout.Metro).maximumQuickActionHeight), tolerance)
        assertEquals("lowercase", standard(CFLayout.Metro).navigationCase)
        assertTrue(standard(CFLayout.Lcars).quiet)
        assertTrue(standard(CFLayout.Press).quiet)
        assertFalse(standard(CFLayout.Compose).quiet)
    }

    @Test(expected = IllegalArgumentException::class)
    fun refusesAnUnsupportedContractVersion() {
        val json = JsonParser.parseString(contract.readText()).asJsonObject
        json.addProperty("version", 99)
        CFLayoutStandard.read(json.toString().reader(), CFLayout.Compose)
    }

    @Test(expected = IllegalArgumentException::class)
    fun refusesAContractWithAMismatchedLayoutId() {
        val json = JsonParser.parseString(contract.readText()).asJsonObject
        json.getAsJsonObject("layouts").getAsJsonObject("sweep").addProperty("id", "compose")
        CFLayoutStandard.read(json.toString().reader(), CFLayout.Lcars)
    }
}
