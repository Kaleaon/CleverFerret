// ModernOnboardingScreen — first-run welcome / source picker.
// Pager of intro slides, then a source-picker grid (Calibre, Plex, OPDS,
// local folders, Reddit, etc.). Each slide is theme-aware (metal-brushed
// hero glyph + matching pill button).

package com.universalmedialibrary.ui.modern.onboarding

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.pager.HorizontalPager
import androidx.compose.foundation.pager.rememberPagerState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens
import kotlinx.coroutines.launch

data class OnboardingSlide(
    val icon: ImageVector,
    val title: String,
    val body: String,
)

data class OnboardingSource(
    val id: String,
    val label: String,
    val description: String,
    val icon: ImageVector,
)

object DefaultOnboarding {
    val SLIDES = listOf(
        OnboardingSlide(
            icon = Icons.Default.LibraryBooks,
            title = "Every format, one library",
            body  = "Books, audiobooks, podcasts, comics, music, video, web fiction, and more — unified.",
        ),
        OnboardingSlide(
            icon = Icons.Default.Cloud,
            title = "Bring your own sources",
            body  = "Calibre, Plex / Jellyfin, OPDS, local folders, Reddit, internet radio — all wired in.",
        ),
        OnboardingSlide(
            icon = Icons.Default.Palette,
            title = "Built to be made yours",
            body  = "Eight metallic palettes shipping today, with LCARS and Metro layouts as alternates.",
        ),
    )
    val SOURCES = listOf(
        OnboardingSource("calibre", "Calibre",        "OPDS catalog or local Calibre library",  Icons.Default.LibraryBooks),
        OnboardingSource("plex",    "Plex / Jellyfin","Pair with a media server",                Icons.Default.Cast),
        OnboardingSource("opds",    "OPDS feed",      "Add any OPDS-compliant catalog",          Icons.Default.Public),
        OnboardingSource("local",   "Local folder",   "Scan device storage / SD",                Icons.Default.Folder),
        OnboardingSource("smb",     "Network share",  "SMB · NFS · WebDAV",                      Icons.Default.Storage),
        OnboardingSource("reddit",  "Reddit (HFY)",   "Auto-import web fiction subreddits",      Icons.Default.Forum),
    )
}

@Composable
fun ModernOnboardingScreen(
    slides: List<OnboardingSlide> = DefaultOnboarding.SLIDES,
    sources: List<OnboardingSource> = DefaultOnboarding.SOURCES,
    onSkip: () -> Unit,
    onPickSource: (OnboardingSource) -> Unit,
    onFinish: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val pageCount = slides.size + 1   // last page = source picker
    val pagerState = rememberPagerState { pageCount }
    val scope = rememberCoroutineScope()

    Scaffold(
        containerColor = cs.background,
    ) { padding ->
        Column(
            Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.lg),
        ) {
            Row(Modifier.fillMaxWidth()) {
                Spacer(Modifier.weight(1f))
                TextButton(onClick = onSkip) { Text("Skip") }
            }

            HorizontalPager(state = pagerState, modifier = Modifier.weight(1f)) { page ->
                if (page < slides.size) {
                    SlidePage(slides[page])
                } else {
                    SourcePicker(sources = sources, onPickSource = onPickSource)
                }
            }

            DotsIndicator(count = pageCount, selected = pagerState.currentPage)

            Spacer(Modifier.height(CFSpacing.lg))
            CFMetalButton(
                text = if (pagerState.currentPage == pageCount - 1) "Get started" else "Next",
                onClick = {
                    if (pagerState.currentPage == pageCount - 1) onFinish()
                    else scope.launch { pagerState.animateScrollToPage(pagerState.currentPage + 1) }
                },
                modifier = Modifier.align(Alignment.CenterHorizontally),
            )
        }
    }
}

@Composable
private fun SlidePage(slide: OnboardingSlide) {
    val tokens = LocalCFTokens.current
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier.fillMaxSize().padding(CFSpacing.xl),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(CFSpacing.lg, Alignment.CenterVertically),
    ) {
        Box(
            Modifier
                .size(160.dp)
                .clip(CircleShape)
                .background(tokens.metal.brush()),
            contentAlignment = Alignment.Center,
        ) {
            Icon(slide.icon, contentDescription = null, tint = cs.onPrimary, modifier = Modifier.size(72.dp))
        }
        Text(
            slide.title,
            style = MaterialTheme.typography.headlineMedium.copy(
                brush = tokens.metal.brush(),
                fontWeight = FontWeight.Black,
            ),
            textAlign = TextAlign.Center,
        )
        Text(
            slide.body,
            style = MaterialTheme.typography.bodyLarge,
            color = cs.onSurfaceVariant,
            textAlign = TextAlign.Center,
        )
    }
}

@Composable
private fun SourcePicker(sources: List<OnboardingSource>, onPickSource: (OnboardingSource) -> Unit) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Column(Modifier.fillMaxSize().padding(vertical = CFSpacing.lg)) {
        Text(
            "Add a source",
            style = MaterialTheme.typography.headlineMedium.copy(
                brush = tokens.metal.brush(),
                fontWeight = FontWeight.Black,
            ),
        )
        Text(
            "Pick one to start with — you can connect more later.",
            style = MaterialTheme.typography.bodyMedium,
            color = cs.onSurfaceVariant,
        )
        Spacer(Modifier.height(CFSpacing.lg))
        Column(verticalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
            sources.forEach { src ->
                Row(
                    Modifier
                        .fillMaxWidth()
                        .clip(RoundedCornerShape(14.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(14.dp))
                        .clickable { onPickSource(src) }
                        .padding(CFSpacing.md),
                    verticalAlignment = Alignment.CenterVertically,
                    horizontalArrangement = Arrangement.spacedBy(CFSpacing.md),
                ) {
                    Box(
                        Modifier
                            .size(40.dp)
                            .clip(RoundedCornerShape(10.dp))
                            .background(cs.surfaceVariant),
                        contentAlignment = Alignment.Center,
                    ) { Icon(src.icon, contentDescription = null, tint = cs.primary) }
                    Column(Modifier.weight(1f)) {
                        Text(src.label, style = MaterialTheme.typography.titleSmall)
                        Text(
                            src.description,
                            style = MaterialTheme.typography.bodySmall,
                            color = cs.onSurfaceVariant,
                        )
                    }
                    Icon(Icons.Default.ChevronRight, contentDescription = null, tint = cs.onSurfaceVariant)
                }
            }
        }
    }
}

@Composable
private fun DotsIndicator(count: Int, selected: Int) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier.fillMaxWidth().padding(top = CFSpacing.sm),
        horizontalArrangement = Arrangement.Center,
    ) {
        repeat(count) { i ->
            val active = i == selected
            Box(
                Modifier
                    .padding(horizontal = 4.dp)
                    .size(if (active) 10.dp else 6.dp)
                    .clip(CircleShape)
                    .background(if (active) cs.primary else cs.onSurface.copy(alpha = 0.3f)),
            )
        }
    }
}
