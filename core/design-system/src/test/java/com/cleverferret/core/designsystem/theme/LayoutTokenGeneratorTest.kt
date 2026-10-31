package com.cleverferret.core.designsystem.theme

import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test

class LayoutTokenGeneratorTest {

    @Test
    fun testAllSevenUniversalLayoutStandardsExist() {
        val layouts = CFLayout.entries
        assertEquals(7, layouts.size)

        val names = layouts.map { it.name }
        assertEquals(
            listOf("COMPOSE", "TERMINAL", "SWEEP", "TILES", "GLASS", "RULES", "PRESS"),
            names
        )
    }

    @Test
    fun testFromIdMappingAndLegacyAliases() {
        assertEquals(CFLayout.COMPOSE, CFLayout.fromId("compose"))
        assertEquals(CFLayout.TERMINAL, CFLayout.fromId("terminal"))
        assertEquals(CFLayout.SWEEP, CFLayout.fromId("sweep"))
        assertEquals(CFLayout.TILES, CFLayout.fromId("tiles"))
        assertEquals(CFLayout.GLASS, CFLayout.fromId("glass"))
        assertEquals(CFLayout.RULES, CFLayout.fromId("rules"))
        assertEquals(CFLayout.PRESS, CFLayout.fromId("press"))

        // Legacy ID mappings
        assertEquals(CFLayout.SWEEP, CFLayout.fromId("lcars"))
        assertEquals(CFLayout.SWEEP, CFLayout.fromId("Lcars"))
        assertEquals(CFLayout.TILES, CFLayout.fromId("metro"))
        assertEquals(CFLayout.TILES, CFLayout.fromId("Metro"))
        assertEquals(CFLayout.COMPOSE, CFLayout.fromId("Compose"))

        // Unknown / null defaults to COMPOSE
        assertEquals(CFLayout.COMPOSE, CFLayout.fromId(null))
        assertEquals(CFLayout.COMPOSE, CFLayout.fromId(""))
        assertEquals(CFLayout.COMPOSE, CFLayout.fromId("unknown-layout-id"))

        // Companion aliases
        assertEquals(CFLayout.COMPOSE, CFLayout.Compose)
        assertEquals(CFLayout.SWEEP, CFLayout.Lcars)
        assertEquals(CFLayout.TILES, CFLayout.Metro)
    }

    @Test
    fun testCornerTokensFromSchema() {
        // Compose corners: large 18, panel 14, tile 12, cover 6, control 999, icon 10, artwork 20
        val composeCorners = CFLayout.COMPOSE.corners
        assertEquals(18, composeCorners.largeDp)
        assertEquals(14, composeCorners.panelDp)
        assertEquals(12, composeCorners.tileDp)
        assertEquals(6, composeCorners.coverDp)
        assertEquals(999, composeCorners.controlDp)
        assertEquals(10, composeCorners.iconDp)
        assertEquals(20, composeCorners.artworkDp)

        // Terminal corners: all 4
        val terminalCorners = CFLayout.TERMINAL.corners
        assertEquals(4, terminalCorners.largeDp)
        assertEquals(4, terminalCorners.panelDp)
        assertEquals(4, terminalCorners.tileDp)
        assertEquals(4, terminalCorners.coverDp)
        assertEquals(4, terminalCorners.controlDp)
        assertEquals(4, terminalCorners.iconDp)
        assertEquals(4, terminalCorners.artworkDp)

        // Glass corners: large 18, panel 16, tile 12, cover 8, control 12, icon 12, artwork 22
        val glassCorners = CFLayout.GLASS.corners
        assertEquals(18, glassCorners.largeDp)
        assertEquals(16, glassCorners.panelDp)
        assertEquals(12, glassCorners.tileDp)
        assertEquals(8, glassCorners.coverDp)
        assertEquals(12, glassCorners.controlDp)
        assertEquals(12, glassCorners.iconDp)
        assertEquals(22, glassCorners.artworkDp)

        // Press corners: large 6, panel 3, tile 2, cover 2, control 2, icon 2, artwork 4
        val pressCorners = CFLayout.PRESS.corners
        assertEquals(6, pressCorners.largeDp)
        assertEquals(3, pressCorners.panelDp)
        assertEquals(2, pressCorners.tileDp)
        assertEquals(2, pressCorners.coverDp)
        assertEquals(2, pressCorners.controlDp)
        assertEquals(2, pressCorners.iconDp)
        assertEquals(4, pressCorners.artworkDp)
    }

    @Test
    fun testTypographySpecAndNavigationFromSchema() {
        val terminalTypo = CFLayout.TERMINAL.typography
        assertEquals("JetBrains Mono", terminalTypo.bodyFontFamily)
        assertEquals(12, terminalTypo.minimumMetadataSp)
        assertEquals("uppercase", terminalTypo.contentCase)

        val sweepNav = CFLayout.SWEEP.navigation
        assertEquals("sweep", sweepNav.phone)
        assertEquals("sweep", sweepNav.wide)

        assertNotNull(CFLayout.SWEEP.lcarsFrame)
        assertEquals(76, CFLayout.SWEEP.lcarsFrame?.railDp)
        assertEquals(12, CFLayout.SWEEP.lcarsFrame?.barDp)
        assertEquals(18, CFLayout.SWEEP.lcarsFrame?.innerDp)
    }

    @Test
    fun testMaterial3ShapesConversion() {
        for (layout in CFLayout.entries) {
            val shapes = layout.corners.toMaterial3Shapes()
            assertNotNull(shapes.extraSmall)
            assertNotNull(shapes.small)
            assertNotNull(shapes.medium)
            assertNotNull(shapes.large)
            assertNotNull(shapes.extraLarge)
        }
    }
}
