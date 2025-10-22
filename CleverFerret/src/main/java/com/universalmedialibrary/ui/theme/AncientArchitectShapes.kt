package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.shape.GenericShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Rect
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Outline
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.Shape
import androidx.compose.ui.unit.Density
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.LayoutDirection
import androidx.compose.ui.unit.dp

/**
 * Geometric shapes for Ancient Architect theme
 * Inspired by Art Deco, Dwarven architecture, and ancient technology
 */

/**
 * Stepped corner shape - Art Deco inspired
 * Creates a tiered/stepped effect at corners
 */
class SteppedCornerShape(
    private val cornerSize: Dp = 8.dp,
    private val steps: Int = 3
) : Shape {
    override fun createOutline(
        size: Size,
        layoutDirection: LayoutDirection,
        density: Density
    ): Outline {
        val cornerPx = with(density) { cornerSize.toPx() }
        val stepSize = cornerPx / steps
        
        return Outline.Generic(
            Path().apply {
                // Start from top-left, moving clockwise
                moveTo(0f, cornerPx)
                
                // Top-left stepped corner
                for (i in 0 until steps) {
                    lineTo(stepSize * i, cornerPx - stepSize * (i + 1))
                }
                lineTo(cornerPx, 0f)
                
                // Top edge
                lineTo(size.width - cornerPx, 0f)
                
                // Top-right stepped corner
                for (i in 0 until steps) {
                    lineTo(size.width - cornerPx + stepSize * (i + 1), stepSize * i)
                }
                lineTo(size.width, cornerPx)
                
                // Right edge
                lineTo(size.width, size.height - cornerPx)
                
                // Bottom-right stepped corner
                for (i in 0 until steps) {
                    lineTo(size.width - stepSize * i, size.height - cornerPx + stepSize * (i + 1))
                }
                lineTo(size.width - cornerPx, size.height)
                
                // Bottom edge
                lineTo(cornerPx, size.height)
                
                // Bottom-left stepped corner
                for (i in 0 until steps) {
                    lineTo(cornerPx - stepSize * (i + 1), size.height - stepSize * i)
                }
                lineTo(0f, size.height - cornerPx)
                
                // Close path
                close()
            }
        )
    }
}

/**
 * Hexagonal shape - Ancient technology inspired
 */
class HexagonShape : Shape {
    override fun createOutline(
        size: Size,
        layoutDirection: LayoutDirection,
        density: Density
    ): Outline {
        val width = size.width
        val height = size.height
        val sideLength = width / 4f
        
        return Outline.Generic(
            Path().apply {
                moveTo(sideLength, 0f)
                lineTo(width - sideLength, 0f)
                lineTo(width, height / 2f)
                lineTo(width - sideLength, height)
                lineTo(sideLength, height)
                lineTo(0f, height / 2f)
                close()
            }
        )
    }
}

/**
 * Diamond shape - Art Deco inspired
 */
class DiamondShape : Shape {
    override fun createOutline(
        size: Size,
        layoutDirection: LayoutDirection,
        density: Density
    ): Outline {
        val width = size.width
        val height = size.height
        
        return Outline.Generic(
            Path().apply {
                moveTo(width / 2f, 0f)
                lineTo(width, height / 2f)
                lineTo(width / 2f, height)
                lineTo(0f, height / 2f)
                close()
            }
        )
    }
}

/**
 * Beveled rectangle - Dwarven architecture inspired
 */
class BeveledRectangleShape(
    private val bevelSize: Dp = 4.dp
) : Shape {
    override fun createOutline(
        size: Size,
        layoutDirection: LayoutDirection,
        density: Density
    ): Outline {
        val bevelPx = with(density) { bevelSize.toPx() }
        val width = size.width
        val height = size.height
        
        return Outline.Generic(
            Path().apply {
                moveTo(bevelPx, 0f)
                lineTo(width - bevelPx, 0f)
                lineTo(width, bevelPx)
                lineTo(width, height - bevelPx)
                lineTo(width - bevelPx, height)
                lineTo(bevelPx, height)
                lineTo(0f, height - bevelPx)
                lineTo(0f, bevelPx)
                close()
            }
        )
    }
}

/**
 * Chevron shape - Art Deco inspired
 */
class ChevronShape(
    private val pointHeight: Float = 0.3f
) : Shape {
    override fun createOutline(
        size: Size,
        layoutDirection: LayoutDirection,
        density: Density
    ): Outline {
        val width = size.width
        val height = size.height
        val point = height * pointHeight
        
        return Outline.Generic(
            Path().apply {
                moveTo(0f, point)
                lineTo(width / 2f, 0f)
                lineTo(width, point)
                lineTo(width, height)
                lineTo(0f, height)
                close()
            }
        )
    }
}

/**
 * Predefined shapes for Ancient Architect theme
 */
object AncientArchitectShapes {
    // Standard shapes with slight modifications
    val small = RoundedCornerShape(4.dp)
    val medium = RoundedCornerShape(8.dp)
    val large = RoundedCornerShape(12.dp)
    
    // Geometric shapes
    val steppedSmall = SteppedCornerShape(cornerSize = 6.dp, steps = 2)
    val steppedMedium = SteppedCornerShape(cornerSize = 8.dp, steps = 3)
    val steppedLarge = SteppedCornerShape(cornerSize = 12.dp, steps = 4)
    
    val hexagon = HexagonShape()
    val diamond = DiamondShape()
    
    val beveledSmall = BeveledRectangleShape(bevelSize = 3.dp)
    val beveledMedium = BeveledRectangleShape(bevelSize = 4.dp)
    val beveledLarge = BeveledRectangleShape(bevelSize = 6.dp)
    
    val chevron = ChevronShape()
}

/**
 * Shape tokens for different component types
 */
object AncientArchitectShapeTokens {
    // Cards and containers
    val cardShape = AncientArchitectShapes.steppedMedium
    val elevatedCardShape = AncientArchitectShapes.steppedLarge
    
    // Buttons
    val buttonShape = AncientArchitectShapes.beveledMedium
    val iconButtonShape = AncientArchitectShapes.hexagon
    val fabShape = AncientArchitectShapes.diamond
    
    // Dialogs and sheets
    val dialogShape = AncientArchitectShapes.steppedLarge
    val bottomSheetShape = AncientArchitectShapes.chevron
    
    // Input fields
    val textFieldShape = AncientArchitectShapes.beveledSmall
    
    // Chips and badges
    val chipShape = AncientArchitectShapes.beveledSmall
    val badgeShape = AncientArchitectShapes.diamond
}