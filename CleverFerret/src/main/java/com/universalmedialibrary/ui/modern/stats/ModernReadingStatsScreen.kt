// ModernReadingStatsScreen — at-a-glance reading / listening / watching
// stats. Top KPI strip, an activity column chart for the last N days,
// per-format breakdown, top authors, current streak.
//
// The chart is rendered with pure Compose (no MPAndroidChart dependency
// in this composable) so the screen previews cleanly. Heights scale with
// the maximum value in the bucket list.

package com.universalmedialibrary.ui.modern.stats

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class StatsKpi(val label: String, val value: String)

data class StatsBucket(val label: String, val value: Float)

data class StatsBreakdown(val label: String, val value: Int, val pct: Float) // pct 0..1

data class TopAuthor(val name: String, val count: Int)

data class ModernReadingStatsUiState(
    val kpis: List<StatsKpi>,
    val activity: List<StatsBucket>,
    val breakdown: List<StatsBreakdown>,
    val topAuthors: List<TopAuthor>,
    val streakDays: Int,
)

@Composable
fun ModernReadingStatsScreen(
    state: ModernReadingStatsUiState,
    onBack: () -> Unit,
    onShare: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = "Stats",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onShare) { Icon(Icons.Default.Share, contentDescription = "Share") }
                },
            )
        },
        containerColor = cs.background,
    ) { padding ->
        LazyColumn(
            Modifier.fillMaxSize().padding(padding),
            contentPadding = PaddingValues(bottom = CFSpacing.xxl),
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg),
        ) {
            item {
                Row(
                    Modifier.padding(horizontal = CFSpacing.lg),
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                ) {
                    state.kpis.forEach { kpi ->
                        Column(
                            Modifier
                                .weight(1f)
                                .clip(RoundedCornerShape(12.dp))
                                .background(cs.surface)
                                .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp))
                                .padding(CFSpacing.md),
                        ) {
                            Text(
                                kpi.value,
                                style = MaterialTheme.typography.headlineSmall.copy(
                                    brush = tokens.metal.brush(),
                                    fontWeight = FontWeight.Black,
                                ),
                            )
                            Text(kpi.label, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
                        }
                    }
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("Activity", "Last ${state.activity.size} days")
                    Spacer(Modifier.height(CFSpacing.sm))
                    ActivityChart(buckets = state.activity)
                }
            }

            item {
                Column(Modifier.padding(horizontal = CFSpacing.lg)) {
                    CFSectionHeader("By format")
                    Spacer(Modifier.height(CFSpacing.sm))
                    Column(verticalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        state.breakdown.forEach { b -> BreakdownRow(b) }
                    }
                }
            }

            item {
                Column(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(14.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("STREAK", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        "${state.streakDays}-day streak",
                        style = MaterialTheme.typography.titleLarge.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                }
            }

            if (state.topAuthors.isNotEmpty()) {
                item { CFSectionHeader("Top authors", modifier = Modifier.padding(horizontal = CFSpacing.lg)) }
                items(state.topAuthors) { author ->
                    Row(
                        Modifier
                            .fillMaxWidth()
                            .padding(horizontal = CFSpacing.lg + CFSpacing.sm, vertical = 4.dp),
                        verticalAlignment = Alignment.CenterVertically,
                    ) {
                        Text(author.name, style = MaterialTheme.typography.bodyLarge, modifier = Modifier.weight(1f))
                        Text(
                            "${author.count}",
                            style = MaterialTheme.typography.titleSmall,
                            color = cs.primary,
                            fontWeight = FontWeight.Black,
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun ActivityChart(buckets: List<StatsBucket>) {
    val cs = MaterialTheme.colorScheme
    val maxValue = (buckets.maxOfOrNull { it.value } ?: 0f).coerceAtLeast(1f)
    Row(
        Modifier
            .fillMaxWidth()
            .height(140.dp)
            .clip(RoundedCornerShape(12.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(12.dp))
            .padding(CFSpacing.sm),
        verticalAlignment = Alignment.Bottom,
        horizontalArrangement = Arrangement.spacedBy(2.dp),
    ) {
        buckets.forEach { bucket ->
            val frac = (bucket.value / maxValue).coerceIn(0f, 1f)
            Column(
                modifier = Modifier.weight(1f).fillMaxHeight(),
                verticalArrangement = Arrangement.Bottom,
                horizontalAlignment = Alignment.CenterHorizontally,
            ) {
                Box(
                    Modifier
                        .fillMaxWidth(0.7f)
                        .fillMaxHeight(frac.coerceAtLeast(0.02f))
                        .clip(RoundedCornerShape(topStart = 3.dp, topEnd = 3.dp))
                        .background(cs.primary),
                )
            }
        }
    }
}

@Composable
private fun BreakdownRow(b: StatsBreakdown) {
    val cs = MaterialTheme.colorScheme
    Column {
        Row(verticalAlignment = Alignment.CenterVertically) {
            Text(b.label, style = MaterialTheme.typography.bodyMedium, modifier = Modifier.weight(1f))
            Text("${b.value}", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
        }
        Spacer(Modifier.height(4.dp))
        LinearProgressIndicator(
            progress = { b.pct.coerceIn(0f, 1f) },
            modifier = Modifier.fillMaxWidth().height(6.dp).clip(RoundedCornerShape(3.dp)),
            color = cs.primary,
            trackColor = cs.onSurface.copy(alpha = 0.12f),
        )
    }
}
