package com.universalmedialibrary.ui.modern.theme

import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Test
import kotlin.math.floor

class AdaptiveGridWidthTokensTest {

    @Test
    fun cfTokens_definesGridMinItemWidthTokens() {
        val tokens = NavyGoldTokens
        assertNotNull("gridMinItemWidth token container should not be null", tokens.gridMinItemWidth)
        assertEquals("quickAction min width token default", 100.dp, tokens.gridMinItemWidth.quickAction)
        assertEquals("poster min width token default", 160.dp, tokens.gridMinItemWidth.poster)
        assertEquals("squareCard min width token default", 140.dp, tokens.gridMinItemWidth.squareCard)
        assertEquals("dialogChip min width token default", 120.dp, tokens.gridMinItemWidth.dialogChip)
    }

    @Test
    fun cfSpacing_exposesGridMinItemWidths() {
        assertEquals("CFSpacing.quickActionMinWidth", 100.dp, CFSpacing.quickActionMinWidth)
        assertEquals("CFSpacing.posterMinWidth", 160.dp, CFSpacing.posterMinWidth)
        assertEquals("CFSpacing.squareCardMinWidth", 140.dp, CFSpacing.squareCardMinWidth)
        assertEquals("CFSpacing.dialogChipMinWidth", 120.dp, CFSpacing.dialogChipMinWidth)
    }

    @Test
    fun gridItemDensity_adaptsCleanlyAcrossViewports() {
        // Function representing Compose GridCells.Adaptive column count calculation: max(1, floor(viewportWidth / minSize))
        fun calculateColumns(viewportWidth: Dp, minSize: Dp): Int {
            return maxOf(1, floor(viewportWidth.value / minSize.value).toInt())
        }

        // Compact viewport (400dp)
        val compact400 = 400.dp
        assertEquals("Poster columns on 400dp compact screen", 2, calculateColumns(compact400, CFSpacing.posterMinWidth))
        assertEquals("Quick action columns on 400dp compact screen", 4, calculateColumns(compact400, CFSpacing.quickActionMinWidth))
        assertEquals("Square card columns on 400dp compact screen", 2, calculateColumns(compact400, CFSpacing.squareCardMinWidth))
        assertEquals("Dialog chip columns on 400dp compact screen", 3, calculateColumns(compact400, CFSpacing.dialogChipMinWidth))

        // Medium viewport (700dp)
        val medium700 = 700.dp
        assertEquals("Poster columns on 700dp medium screen", 4, calculateColumns(medium700, CFSpacing.posterMinWidth))
        assertEquals("Quick action columns on 700dp medium screen", 7, calculateColumns(medium700, CFSpacing.quickActionMinWidth))
        assertEquals("Square card columns on 700dp medium screen", 5, calculateColumns(medium700, CFSpacing.squareCardMinWidth))
        assertEquals("Dialog chip columns on 700dp medium screen", 5, calculateColumns(medium700, CFSpacing.dialogChipMinWidth))

        // Expanded viewport (1200dp)
        val expanded1200 = 1200.dp
        assertEquals("Poster columns on 1200dp expanded screen", 7, calculateColumns(expanded1200, CFSpacing.posterMinWidth))
        assertEquals("Quick action columns on 1200dp expanded screen", 12, calculateColumns(expanded1200, CFSpacing.quickActionMinWidth))
        assertEquals("Square card columns on 1200dp expanded screen", 8, calculateColumns(expanded1200, CFSpacing.squareCardMinWidth))
        assertEquals("Dialog chip columns on 1200dp expanded screen", 10, calculateColumns(expanded1200, CFSpacing.dialogChipMinWidth))
    }
}
