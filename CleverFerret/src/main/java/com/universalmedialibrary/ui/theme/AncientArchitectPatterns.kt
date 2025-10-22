package com.universalmedialibrary.ui.theme

import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.dp

/**
 * Geometric patterns and decorative elements for Ancient Architect theme
 * Inspired by Art Deco, Dwarven friezes, and ancient technology
 */

/**
 * Pattern drawing utilities
 */
object AncientArchitectPatterns {
    
    /**
     * Draw chevron steps pattern (Art Deco inspired)
     */
    fun DrawScope.drawChevronPattern(
        color: Color,
        alpha: Float = 0.1f,
        strokeWidth: Float = 2f,
        spacing: Float = 20f
    ) {
        val width = size.width
        val height = size.height
        val steps = (height / spacing).toInt()
        
        for (i in 0..steps) {
            val y = i * spacing
            val path = Path().apply {
                moveTo(0f, y)
                lineTo(width / 4f, y - spacing / 2f)
                lineTo(width / 2f, y)
                lineTo(3f * width / 4f, y - spacing / 2f)
                lineTo(width, y)
            }
            drawPath(
                path = path,
                color = color.copy(alpha = alpha),
                style = Stroke(width = strokeWidth)
            )
        }
    }
    
    /**
     * Draw diamond grid pattern (Dwarven inspired)
     */
    fun DrawScope.drawDiamondGrid(
        color: Color,
        alpha: Float = 0.08f,
        strokeWidth: Float = 1f,
        cellSize: Float = 40f
    ) {
        val width = size.width
        val height = size.height
        val cols = (width / cellSize).toInt() + 1
        val rows = (height / cellSize).toInt() + 1
        
        for (row in 0..rows) {
            for (col in 0..cols) {
                val x = col * cellSize
                val y = row * cellSize
                val halfCell = cellSize / 2f
                
                val path = Path().apply {
                    moveTo(x, y - halfCell)
                    lineTo(x + halfCell, y)
                    lineTo(x, y + halfCell)
                    lineTo(x - halfCell, y)
                    close()
                }
                
                drawPath(
                    path = path,
                    color = color.copy(alpha = alpha),
                    style = Stroke(width = strokeWidth)
                )
            }
        }
    }
    
    /**
     * Draw hexagonal cells pattern (Ancient tech inspired)
     */
    fun DrawScope.drawHexagonalGrid(
        color: Color,
        alpha: Float = 0.06f,
        strokeWidth: Float = 1f,
        cellSize: Float = 30f
    ) {
        val width = size.width
        val height = size.height
        val hexWidth = cellSize * 2f
        val hexHeight = cellSize * 1.732f // sqrt(3)
        val cols = (width / (hexWidth * 0.75f)).toInt() + 2
        val rows = (height / hexHeight).toInt() + 2
        
        for (row in 0..rows) {
            for (col in 0..cols) {
                val xOffset = if (row % 2 == 0) 0f else hexWidth * 0.75f / 2f
                val x = col * hexWidth * 0.75f + xOffset
                val y = row * hexHeight
                
                drawHexagon(
                    center = Offset(x, y),
                    radius = cellSize,
                    color = color.copy(alpha = alpha),
                    strokeWidth = strokeWidth
                )
            }
        }
    }
    
    /**
     * Draw a single hexagon
     */
    private fun DrawScope.drawHexagon(
        center: Offset,
        radius: Float,
        color: Color,
        strokeWidth: Float
    ) {
        val path = Path().apply {
            for (i in 0..5) {
                val angle = Math.PI / 3.0 * i
                val x = center.x + radius * Math.cos(angle).toFloat()
                val y = center.y + radius * Math.sin(angle).toFloat()
                if (i == 0) moveTo(x, y) else lineTo(x, y)
            }
            close()
        }
        
        drawPath(
            path = path,
            color = color,
            style = Stroke(width = strokeWidth)
        )
    }
    
    /**
     * Draw corner decorations (Art Deco/Dwarven inspired)
     */
    fun DrawScope.drawCornerDecorations(
        color: Color,
        alpha: Float = 0.6f,
        size: Float = 16f,
        strokeWidth: Float = 2f
    ) {
        val decorationSize = size
        
        // Top-left corner
        drawCornerDecoration(
            offset = Offset(0f, 0f),
            size = decorationSize,
            color = color.copy(alpha = alpha),
            strokeWidth = strokeWidth,
            rotation = 0f
        )
        
        // Top-right corner
        drawCornerDecoration(
            offset = Offset(this.size.width, 0f),
            size = decorationSize,
            color = color.copy(alpha = alpha),
            strokeWidth = strokeWidth,
            rotation = 90f
        )
        
        // Bottom-right corner
        drawCornerDecoration(
            offset = Offset(this.size.width, this.size.height),
            size = decorationSize,
            color = color.copy(alpha = alpha),
            strokeWidth = strokeWidth,
            rotation = 180f
        )
        
        // Bottom-left corner
        drawCornerDecoration(
            offset = Offset(0f, this.size.height),
            size = decorationSize,
            color = color.copy(alpha = alpha),
            strokeWidth = strokeWidth,
            rotation = 270f
        )
    }
    
    /**
     * Draw a single corner decoration
     */
    private fun DrawScope.drawCornerDecoration(
        offset: Offset,
        size: Float,
        color: Color,
        strokeWidth: Float,
        rotation: Float
    ) {
        val path = Path().apply {
            // L-shaped bracket with geometric detail
            moveTo(0f, size)
            lineTo(0f, size / 3f)
            lineTo(size / 6f, size / 3f)
            lineTo(size / 6f, size / 6f)
            lineTo(size / 3f, size / 6f)
            lineTo(size / 3f, 0f)
            lineTo(size, 0f)
        }
        
        // Apply rotation and translation
        val matrix = Matrix().apply {
            postRotate(rotation, 0f, 0f)
            postTranslate(offset.x, offset.y)
        }
        path.transform(matrix)
        
        drawPath(
            path = path,
            color = color,
            style = Stroke(width = strokeWidth)
        )
    }
    
    /**
     * Draw frieze pattern (Dwarven inspired)
     */
    fun DrawScope.drawFriezePattern(
        color: Color,
        alpha: Float = 0.3f,
        strokeWidth: Float = 2f,
        height: Float = 40f,
        yPosition: Float = 0f
    ) {
        val width = size.width
        val segmentWidth = 60f
        val segments = (width / segmentWidth).toInt() + 1
        
        for (i in 0..segments) {
            val x = i * segmentWidth
            val path = Path().apply {
                // Geometric frieze pattern
                moveTo(x, yPosition)
                lineTo(x + segmentWidth / 4f, yPosition + height / 3f)
                lineTo(x + segmentWidth / 2f, yPosition)
                lineTo(x + 3f * segmentWidth / 4f, yPosition + height / 3f)
                lineTo(x + segmentWidth, yPosition)
                
                moveTo(x + segmentWidth / 4f, yPosition + height / 3f)
                lineTo(x + segmentWidth / 4f, yPosition + 2f * height / 3f)
                
                moveTo(x + 3f * segmentWidth / 4f, yPosition + height / 3f)
                lineTo(x + 3f * segmentWidth / 4f, yPosition + 2f * height / 3f)
            }
            
            drawPath(
                path = path,
                color = color.copy(alpha = alpha),
                style = Stroke(width = strokeWidth)
            )
        }
    }
    
    /**
     * Draw crystalline facets pattern (Stargate Atlantis inspired)
     */
    fun DrawScope.drawCrystallineFacets(
        color: Color,
        alpha: Float = 0.05f,
        strokeWidth: Float = 1f
    ) {
        val width = size.width
        val height = size.height
        val numFacets = 20
        
        for (i in 0 until numFacets) {
            val x1 = (Math.random() * width).toFloat()
            val y1 = (Math.random() * height).toFloat()
            val x2 = x1 + (Math.random() * 100 - 50).toFloat()
            val y2 = y1 + (Math.random() * 100 - 50).toFloat()
            val x3 = x1 + (Math.random() * 100 - 50).toFloat()
            val y3 = y1 + (Math.random() * 100 - 50).toFloat()
            
            val path = Path().apply {
                moveTo(x1, y1)
                lineTo(x2, y2)
                lineTo(x3, y3)
                close()
            }
            
            drawPath(
                path = path,
                color = color.copy(alpha = alpha),
                style = Stroke(width = strokeWidth)
            )
        }
    }
}

/**
 * Metallic gradient brushes
 */
object MetallicBrushes {
    
    /**
     * Create a bronze metallic gradient
     */
    fun bronzeGradient(
        start: Offset = Offset(0f, 0f),
        end: Offset = Offset(1000f, 1000f)
    ): Brush {
        return Brush.linearGradient(
            colors = listOf(
                MetallicColors.BronzeLight,
                MetallicColors.AncientBronze,
                MetallicColors.BronzeDark,
                MetallicColors.AncientBronze,
                MetallicColors.BronzeLight
            ),
            start = start,
            end = end,
            tileMode = TileMode.Mirror
        )
    }
    
    /**
     * Create a copper metallic gradient
     */
    fun copperGradient(
        start: Offset = Offset(0f, 0f),
        end: Offset = Offset(1000f, 1000f)
    ): Brush {
        return Brush.linearGradient(
            colors = listOf(
                MetallicColors.CopperLight,
                MetallicColors.CopperGlow,
                MetallicColors.CopperDark,
                MetallicColors.CopperGlow,
                MetallicColors.CopperLight
            ),
            start = start,
            end = end,
            tileMode = TileMode.Mirror
        )
    }
    
    /**
     * Create a radial metallic gradient
     */
    fun radialMetallicGradient(
        colors: List<Color>,
        center: Offset = Offset.Unspecified,
        radius: Float = Float.POSITIVE_INFINITY
    ): Brush {
        return Brush.radialGradient(
            colors = colors,
            center = center,
            radius = radius
        )
    }
    
    /**
     * Create a crystal glow gradient
     */
    fun crystalGlowGradient(
        glowColor: Color,
        center: Offset = Offset.Unspecified
    ): Brush {
        return Brush.radialGradient(
            colors = listOf(
                glowColor.copy(alpha = 0.8f),
                glowColor.copy(alpha = 0.4f),
                glowColor.copy(alpha = 0.1f),
                Color.Transparent
            ),
            center = center,
            radius = 200f
        )
    }
}