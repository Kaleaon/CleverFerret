package com.universalmedialibrary.ui.components

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.*
import androidx.compose.ui.graphics.drawscope.DrawScope
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.universalmedialibrary.ui.theme.CleverFerretProfessionalColors

/**
 * Clever Ferret Logo Component
 * 
 * Creates a professional ferret face with glasses logo using Canvas drawing.
 * Features a sophisticated ferret mascot that conveys intelligence and trustworthiness.
 */

@Composable
fun CleverFerretLogo(
    size: Dp = 40.dp,
    showText: Boolean = true,
    textStyle: androidx.compose.ui.text.TextStyle = MaterialTheme.typography.headlineSmall
) {
    Row(
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Ferret Logo Canvas
        Box(
            modifier = Modifier
                .size(size)
                .clip(CircleShape)
                .background(
                    brush = Brush.radialGradient(
                        colors = listOf(
                            CleverFerretProfessionalColors.Gold.copy(alpha = 0.2f),
                            CleverFerretProfessionalColors.Navy.copy(alpha = 0.1f)
                        ),
                        radius = size.value * 0.8f
                    )
                ),
            contentAlignment = Alignment.Center
        ) {
            Canvas(
                modifier = Modifier.size(size * 0.9f)
            ) {
                drawFerretWithGlasses(this, size.toPx() * 0.9f)
            }
        }
        
        if (showText) {
            Spacer(modifier = Modifier.width(8.dp))
            Text(
                text = "Clever Ferret",
                style = textStyle,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurface
            )
        }
    }
}

@Composable
fun CleverFerretIconOnly(size: Dp = 32.dp) {
    CleverFerretLogo(size = size, showText = false)
}

/**
 * Simplified Logo for Small Spaces
 */
@Composable
fun CleverFerretMini(size: Dp = 24.dp) {
    Box(
        modifier = Modifier
            .size(size)
            .clip(CircleShape)
            .background(CleverFerretProfessionalColors.DeepGold),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = "CF",
            fontSize = (size.value * 0.4f).sp,
            fontWeight = FontWeight.Bold,
            color = Color.White
        )
    }
}

/**
 * Large Logo for App Header
 */
@Composable
fun CleverFerretHeaderLogo() {
    Row(
        verticalAlignment = Alignment.CenterVertically
    ) {
        // Large ferret logo
        Box(
            modifier = Modifier
                .size(48.dp)
                .clip(RoundedCornerShape(12.dp))
                .background(
                    brush = Brush.linearGradient(
                        colors = listOf(
                            CleverFerretProfessionalColors.Navy,
                            CleverFerretProfessionalColors.DeepNavy
                        )
                    )
                ),
            contentAlignment = Alignment.Center
        ) {
            Canvas(
                modifier = Modifier.size(36.dp)
            ) {
                drawFerretWithGlasses(this, 36.dp.toPx(), isLarge = true)
            }
        }
        
        Spacer(modifier = Modifier.width(12.dp))
        
        Column {
            Text(
                text = "Clever Ferret",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold,
                color = MaterialTheme.colorScheme.onSurface
            )
            Text(
                text = "Universal Media Library",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}

/**
 * Draw ferret face with glasses using Canvas
 */
private fun drawFerretWithGlasses(
    drawScope: DrawScope,
    canvasSize: Float,
    isLarge: Boolean = false
) {
    with(drawScope) {
        val center = Offset(canvasSize / 2f, canvasSize / 2f)
        val headRadius = canvasSize * 0.35f
        
        // Ferret colors
        val ferretBrown = Color(0xFF8B4513)
        val ferretLightBrown = Color(0xFFA0522D)
        val ferretDarkBrown = Color(0xFF654321)
        
        // Draw ferret head (main circle)
        drawCircle(
            color = ferretLightBrown,
            radius = headRadius,
            center = center
        )
        
        // Draw ears
        val earOffset = headRadius * 0.7f
        val earRadius = headRadius * 0.25f
        
        // Left ear
        drawCircle(
            color = ferretBrown,
            radius = earRadius,
            center = Offset(center.x - earOffset, center.y - earOffset)
        )
        
        // Right ear
        drawCircle(
            color = ferretBrown,
            radius = earRadius,
            center = Offset(center.x + earOffset, center.y - earOffset)
        )
        
        // Draw snout
        val snoutRadius = headRadius * 0.4f
        drawOval(
            color = ferretLightBrown,
            topLeft = Offset(center.x - snoutRadius * 0.6f, center.y + headRadius * 0.1f),
            size = Size(snoutRadius * 1.2f, snoutRadius * 0.8f)
        )
        
        // Draw nose
        val noseRadius = headRadius * 0.08f
        drawCircle(
            color = Color.Black,
            radius = noseRadius,
            center = Offset(center.x, center.y + headRadius * 0.35f)
        )
        
        // Draw eyes
        val eyeRadius = headRadius * 0.12f
        val eyeOffsetX = headRadius * 0.35f
        val eyeOffsetY = headRadius * 0.1f
        
        // Left eye
        drawCircle(
            color = Color.Black,
            radius = eyeRadius,
            center = Offset(center.x - eyeOffsetX, center.y - eyeOffsetY)
        )
        
        // Right eye
        drawCircle(
            color = Color.Black,
            radius = eyeRadius,
            center = Offset(center.x + eyeOffsetX, center.y - eyeOffsetY)
        )
        
        // Draw glasses
        val glassesColor = CleverFerretProfessionalColors.DeepNavy
        val strokeWidth = if (isLarge) 3.dp.toPx() else 2.dp.toPx()
        
        // Left lens
        drawCircle(
            color = Color.Transparent,
            radius = eyeRadius * 2f,
            center = Offset(center.x - eyeOffsetX, center.y - eyeOffsetY),
            style = Stroke(width = strokeWidth)
        )
        
        // Right lens  
        drawCircle(
            color = Color.Transparent,
            radius = eyeRadius * 2f,
            center = Offset(center.x + eyeOffsetX, center.y - eyeOffsetY),
            style = Stroke(width = strokeWidth)
        )
        
        // Bridge of glasses
        drawLine(
            color = glassesColor,
            start = Offset(center.x - eyeRadius * 0.3f, center.y - eyeOffsetY),
            end = Offset(center.x + eyeRadius * 0.3f, center.y - eyeOffsetY),
            strokeWidth = strokeWidth
        )
        
        // Glasses arms (temples)
        drawLine(
            color = glassesColor,
            start = Offset(center.x - eyeOffsetX - eyeRadius * 2f, center.y - eyeOffsetY),
            end = Offset(center.x - eyeOffsetX - eyeRadius * 3f, center.y - eyeOffsetY + headRadius * 0.2f),
            strokeWidth = strokeWidth
        )
        
        drawLine(
            color = glassesColor,
            start = Offset(center.x + eyeOffsetX + eyeRadius * 2f, center.y - eyeOffsetY),
            end = Offset(center.x + eyeOffsetX + eyeRadius * 3f, center.y - eyeOffsetY + headRadius * 0.2f),
            strokeWidth = strokeWidth
        )
        
        // Add lens glint for professional look
        if (isLarge) {
            val glintRadius = eyeRadius * 0.5f
            drawCircle(
                color = Color.White.copy(alpha = 0.3f),
                radius = glintRadius,
                center = Offset(center.x - eyeOffsetX - eyeRadius * 0.5f, center.y - eyeOffsetY - eyeRadius * 0.5f)
            )
            
            drawCircle(
                color = Color.White.copy(alpha = 0.3f),
                radius = glintRadius,
                center = Offset(center.x + eyeOffsetX - eyeRadius * 0.5f, center.y - eyeOffsetY - eyeRadius * 0.5f)
            )
        }
    }
}

/**
 * Logo for Settings About Screen
 */
@Composable
fun CleverFerretAboutLogo() {
    Box(
        modifier = Modifier
            .size(80.dp)
            .clip(RoundedCornerShape(20.dp))
            .background(
                brush = Brush.radialGradient(
                    listOf(
                        CleverFerretProfessionalColors.DeepGold,
                        CleverFerretProfessionalColors.Navy
                    )
                )
            ),
        contentAlignment = Alignment.Center
    ) {
        Canvas(
            modifier = Modifier.size(60.dp)
        ) {
            drawFerretWithGlasses(this, 60.dp.toPx(), isLarge = true)
        }
    }
}