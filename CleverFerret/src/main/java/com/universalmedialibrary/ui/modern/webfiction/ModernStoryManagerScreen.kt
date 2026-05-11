// ModernStoryManagerScreen — author-facing manager for the user's own
// fanfiction / web-fiction stories. Different from ModernFormatLibrary
// (reader's collection); this is for writing + publishing. Hero stat
// strip, stories list with publish state, and a "New story" CTA.

package com.universalmedialibrary.ui.modern.webfiction

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.LazyRow
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFEmptyState
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.components.CFSectionHeader
import com.universalmedialibrary.ui.modern.components.CFTagChip
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class StoryPublishState { Draft, Posted, Updating, Hidden }

data class UiAuthorStory(
    val id: String,
    val title: String,
    val fandom: String,
    val chaptersDone: Int,
    val chaptersTotal: Int?,
    val wordCount: Int,
    val views: Int,
    val state: StoryPublishState,
    val accent: Color,
    val updatedLabel: String,
)

data class UiAuthorStat(val label: String, val value: String)

data class ModernStoryManagerUiState(
    val penName: String,
    val stats: List<UiAuthorStat>,
    val stories: List<UiAuthorStory>,
)

@Composable
fun ModernStoryManagerScreen(
    state: ModernStoryManagerUiState,
    onBack: () -> Unit,
    onNewStory: () -> Unit,
    onOpenStory: (UiAuthorStory) -> Unit,
    onEditStory: (UiAuthorStory) -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = "My stories",
                onBack = onBack,
                actions = {
                    IconButton(onClick = onNewStory) { Icon(Icons.Default.Add, contentDescription = "New story") }
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
                Column(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg)
                        .clip(RoundedCornerShape(16.dp))
                        .background(cs.surface)
                        .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(16.dp))
                        .padding(CFSpacing.lg),
                ) {
                    Text("WRITING AS", style = MaterialTheme.typography.labelMedium, color = cs.onSurfaceVariant)
                    Text(
                        state.penName,
                        style = MaterialTheme.typography.headlineSmall.copy(
                            brush = tokens.metal.brush(),
                            fontWeight = FontWeight.Black,
                        ),
                    )
                    Spacer(Modifier.height(CFSpacing.sm))
                    LazyRow(horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm)) {
                        items(state.stats) { stat ->
                            Column(
                                Modifier
                                    .clip(RoundedCornerShape(12.dp))
                                    .background(cs.surfaceVariant)
                                    .padding(horizontal = CFSpacing.md, vertical = CFSpacing.sm),
                            ) {
                                Text(stat.value, style = MaterialTheme.typography.titleMedium, fontWeight = FontWeight.Black)
                                Text(stat.label, style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant)
                            }
                        }
                    }
                }
            }

            if (state.stories.isEmpty()) {
                item {
                    CFEmptyState(
                        icon = Icons.Default.EditNote,
                        title = "No stories yet",
                        body = "Start a new story to begin writing.",
                        actionLabel = "New story",
                        onAction = onNewStory,
                    )
                }
                return@LazyColumn
            }

            item {
                Row(
                    Modifier.fillMaxWidth().padding(horizontal = CFSpacing.lg),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    CFSectionHeader("Stories", "${state.stories.size}", modifier = Modifier.weight(1f))
                    CFMetalButton(text = "New", onClick = onNewStory, leadingIcon = Icons.Default.Add)
                }
            }
            items(state.stories) { story -> StoryRow(story, onOpen = { onOpenStory(story) }, onEdit = { onEditStory(story) }) }
        }
    }
}

@Composable
private fun StoryRow(story: UiAuthorStory, onOpen: () -> Unit, onEdit: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .padding(horizontal = CFSpacing.lg)
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .border(1.dp, cs.outline.copy(alpha = 0.25f), RoundedCornerShape(14.dp))
            .clickable(onClick = onOpen)
            .padding(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(6.dp)) {
            Box(Modifier.size(8.dp).clip(androidx.compose.foundation.shape.CircleShape).background(story.accent))
            Text(story.title, style = MaterialTheme.typography.titleSmall, modifier = Modifier.weight(1f), maxLines = 2, overflow = TextOverflow.Ellipsis, fontWeight = FontWeight.Black)
            CFTagChip(text = story.state.label(), selected = story.state == StoryPublishState.Posted)
        }
        Text(story.fandom, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1)
        Text(
            buildString {
                append("${story.chaptersDone}")
                story.chaptersTotal?.let { append("/$it") }
                append(" chapters · ${story.wordCount.formatThousands()} words · ${story.views.formatThousands()} views")
            },
            style = MaterialTheme.typography.labelSmall,
            color = cs.onSurfaceVariant,
        )
        Row(modifier = Modifier.fillMaxWidth(), verticalAlignment = Alignment.CenterVertically) {
            Text("Updated ${story.updatedLabel}", style = MaterialTheme.typography.labelSmall, color = cs.onSurfaceVariant, modifier = Modifier.weight(1f))
            IconButton(onClick = onEdit) { Icon(Icons.Default.Edit, contentDescription = "Edit", tint = cs.primary) }
        }
    }
}

private fun StoryPublishState.label(): String = when (this) {
    StoryPublishState.Draft     -> "Draft"
    StoryPublishState.Posted    -> "Live"
    StoryPublishState.Updating  -> "Updating"
    StoryPublishState.Hidden    -> "Hidden"
}

private fun Int.formatThousands(): String =
    if (this < 1000) toString() else "%,d".format(this)
