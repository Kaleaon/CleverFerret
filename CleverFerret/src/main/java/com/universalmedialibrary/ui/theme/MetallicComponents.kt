package com.universalmedialibrary.ui.theme

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.draw.shadow
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

/**
 * Beautiful metallic UI components with gradient effects
 * These components showcase the metallic accents properly
 */

/**
 * Metallic Button with gradient shimmer effect
 */
@Composable
fun MetallicButton(
    text: String,
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true
) {
    val metallic = LocalMetallicGradient.current

    Button(
        onClick = onClick,
        modifier = modifier
            .shadow(
                elevation = 4.dp,
                shape = RoundedCornerShape(8.dp),
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            ),
        enabled = enabled,
        colors = ButtonDefaults.buttonColors(
            containerColor = metallic.base,
            contentColor = MaterialTheme.colorScheme.onPrimary
        ),
        elevation = ButtonDefaults.buttonElevation(
            defaultElevation = 2.dp,
            pressedElevation = 6.dp,
            disabledElevation = 0.dp
        )
    ) {
        Text(
            text = text,
            fontWeight = FontWeight.Medium,
            letterSpacing = 0.5.sp
        )
    }
}

/**
 * Metallic Card with subtle gradient
 */
@Composable
fun MetallicCard(
    modifier: Modifier = Modifier,
    onClick: (() -> Unit)? = null,
    content: @Composable ColumnScope.() -> Unit
) {
    val metallic = LocalMetallicGradient.current

    Card(
        modifier = modifier
            .shadow(
                elevation = 4.dp,
                shape = RoundedCornerShape(12.dp),
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            )
            .border(
                width = 1.dp,
                color = metallic.base.copy(alpha = 0.3f),
                shape = RoundedCornerShape(12.dp)
            ),
        onClick = onClick ?: {},
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.surface
        ),
        shape = RoundedCornerShape(12.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            content = content
        )
    }
}

/**
 * Metallic Divider with gradient
 */
@Composable
fun MetallicDivider(
    modifier: Modifier = Modifier,
    thickness: androidx.compose.ui.unit.Dp = 1.dp
) {
    val metallic = LocalMetallicGradient.current

    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(thickness)
            .background(
                brush = Brush.horizontalGradient(
                    colors = listOf(
                        Color.Transparent,
                        metallic.base.copy(alpha = 0.6f),
                        metallic.base,
                        metallic.base.copy(alpha = 0.6f),
                        Color.Transparent
                    )
                )
            )
    )
}

/**
 * Metallic Badge/Chip
 */
@Composable
fun MetallicBadge(
    text: String,
    modifier: Modifier = Modifier
) {
    val metallic = LocalMetallicGradient.current

    Surface(
        modifier = modifier
            .clip(RoundedCornerShape(12.dp))
            .border(
                width = 1.dp,
                color = metallic.base.copy(alpha = 0.5f),
                shape = RoundedCornerShape(12.dp)
            ),
        color = metallic.base.copy(alpha = 0.2f),
        contentColor = metallic.base
    ) {
        Text(
            text = text,
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp),
            style = MaterialTheme.typography.labelSmall,
            fontWeight = FontWeight.Medium
        )
    }
}

/**
 * Metallic Icon Button
 */
@Composable
fun MetallicIconButton(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    enabled: Boolean = true,
    icon: @Composable () -> Unit
) {
    val metallic = LocalMetallicGradient.current

    IconButton(
        onClick = onClick,
        modifier = modifier
            .size(48.dp)
            .shadow(
                elevation = 2.dp,
                shape = CircleShape,
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            )
            .background(
                color = metallic.base.copy(alpha = 0.15f),
                shape = CircleShape
            )
            .border(
                width = 1.dp,
                color = metallic.base.copy(alpha = 0.4f),
                shape = CircleShape
            ),
        enabled = enabled,
        colors = IconButtonDefaults.iconButtonColors(
            contentColor = metallic.base
        )
    ) {
        icon()
    }
}

/**
 * Metallic FAB (Floating Action Button)
 */
@Composable
fun MetallicFAB(
    onClick: () -> Unit,
    modifier: Modifier = Modifier,
    icon: @Composable () -> Unit
) {
    val metallic = LocalMetallicGradient.current

    FloatingActionButton(
        onClick = onClick,
        modifier = modifier
            .shadow(
                elevation = 6.dp,
                shape = CircleShape,
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            ),
        containerColor = metallic.base,
        contentColor = MaterialTheme.colorScheme.onPrimary,
        elevation = FloatingActionButtonDefaults.elevation(
            defaultElevation = 4.dp,
            pressedElevation = 8.dp
        )
    ) {
        icon()
    }
}

/**
 * Metallic Top App Bar
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MetallicTopAppBar(
    title: @Composable () -> Unit,
    modifier: Modifier = Modifier,
    navigationIcon: @Composable () -> Unit = {},
    actions: @Composable RowScope.() -> Unit = {}
) {
    val metallic = LocalMetallicGradient.current

    TopAppBar(
        title = title,
        modifier = modifier
            .shadow(
                elevation = 4.dp,
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            ),
        navigationIcon = navigationIcon,
        actions = actions,
        colors = TopAppBarDefaults.topAppBarColors(
            containerColor = MaterialTheme.colorScheme.surface,
            titleContentColor = MaterialTheme.colorScheme.onSurface,
            actionIconContentColor = metallic.base
        )
    )
}

/**
 * Metallic Progress Bar
 */
@Composable
fun MetallicProgressBar(
    progress: Float,
    modifier: Modifier = Modifier
) {
    val metallic = LocalMetallicGradient.current

    LinearProgressIndicator(
        progress = progress,
        modifier = modifier
            .height(6.dp)
            .clip(RoundedCornerShape(3.dp)),
        color = metallic.base,
        trackColor = metallic.base.copy(alpha = 0.2f)
    )
}

/**
 * Metallic Accent Box - for highlighting content
 */
@Composable
fun MetallicAccentBox(
    modifier: Modifier = Modifier,
    content: @Composable BoxScope.() -> Unit
) {
    val metallic = LocalMetallicGradient.current

    Box(
        modifier = modifier
            .shadow(
                elevation = 2.dp,
                shape = RoundedCornerShape(8.dp),
                ambientColor = metallic.shadow,
                spotColor = metallic.highlight
            )
            .background(
                brush = Brush.verticalGradient(
                    colors = listOf(
                        metallic.highlight.copy(alpha = 0.1f),
                        metallic.base.copy(alpha = 0.05f),
                        metallic.shadow.copy(alpha = 0.1f)
                    )
                ),
                shape = RoundedCornerShape(8.dp)
            )
            .border(
                width = 1.dp,
                color = metallic.base.copy(alpha = 0.3f),
                shape = RoundedCornerShape(8.dp)
            )
            .padding(16.dp),
        content = content
    )
}

/**
 * Metallic Text with shimmer effect
 */
@Composable
fun MetallicText(
    text: String,
    modifier: Modifier = Modifier,
    style: androidx.compose.ui.text.TextStyle = MaterialTheme.typography.titleLarge
) {
    val metallic = LocalMetallicGradient.current

    Text(
        text = text,
        modifier = modifier,
        style = style.copy(
            color = metallic.base,
            fontWeight = FontWeight.Bold,
            shadow = androidx.compose.ui.graphics.Shadow(
                color = metallic.shadow.copy(alpha = 0.3f),
                offset = androidx.compose.ui.geometry.Offset(1f, 1f),
                blurRadius = 2f
            )
        )
    )
}

/**
 * Metallic Stats Card - for displaying numbers with style
 */
@Composable
fun MetallicStatsCard(
    value: String,
    label: String,
    modifier: Modifier = Modifier
) {
    val metallic = LocalMetallicGradient.current

    MetallicAccentBox(
        modifier = modifier.width(120.dp)
    ) {
        Column(
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            MetallicText(
                text = value,
                style = MaterialTheme.typography.headlineMedium
            )
            Spacer(modifier = Modifier.height(4.dp))
            Text(
                text = label,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}
