package com.universalmedialibrary.ui.player

import androidx.compose.animation.*
import androidx.compose.animation.core.*
import androidx.compose.foundation.BorderStroke
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.material3.rememberModalBottomSheetState
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.blur
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.rotate
import androidx.compose.ui.draw.scale
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.graphics.Shadow
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.foundation.horizontalScroll
import androidx.compose.ui.layout.ContentScale
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import coil.compose.AsyncImage
import com.universalmedialibrary.services.audio.AudioPlaybackManager.AudioQueueEntry
import com.universalmedialibrary.ui.player.WaveformSource
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.Locale
import kotlin.math.PI
import kotlin.math.absoluteValue
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.roundToInt

@Composable
internal fun PartyModeAurora(
    modifier: Modifier = Modifier,
    baseColors: List<Color>
) {
    val transition = rememberInfiniteTransition(label = "party_mode")
    val phase by transition.animateFloat(
        initialValue = 0f,
        targetValue = 1f,
        animationSpec = infiniteRepeatable(
            animation = tween(durationMillis = 12000, easing = LinearEasing),
            repeatMode = androidx.compose.animation.core.RepeatMode.Restart
        ),
        label = "party_phase"
    )
    Canvas(modifier = modifier) {
        val width = size.width
        val height = size.height
        val palette = listOf(
            baseColors.getOrNull(0) ?: Color.Magenta,
            baseColors.getOrNull(1) ?: Color.Cyan,
            baseColors.getOrNull(2) ?: Color.Yellow
        )
        palette.forEachIndexed { index, color ->
            val animatedRadius = (width.coerceAtMost(height) / 2f) * (0.4f + 0.25f * sin((phase + index * 0.3f) * 2 * PI).toFloat())
            val animatedX = width * ((phase + index * 0.2f) % 1f)
            val animatedY = height * (((phase * 1.2f) + index * 0.15f) % 1f)
            drawCircle(
                color = color.copy(alpha = 0.12f),
                radius = animatedRadius,
                center = Offset(animatedX, animatedY),
                style = Stroke(width = animatedRadius * 0.15f)
            )
        }
    }
}
