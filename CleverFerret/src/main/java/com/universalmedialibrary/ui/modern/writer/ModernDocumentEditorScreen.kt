// ModernDocumentEditorScreen — distraction-free writing surface for the
// fanfiction / web-fiction creation flow. Top: title + status pill.
// Center: large scrolling editor (caller supplies the actual TextField
// or rich-text surface as `editorSurface`). Bottom: format toolbar,
// word-count, save state.

package com.universalmedialibrary.ui.modern.writer

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.FormatListBulleted
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

enum class DocSaveState { Saved, Saving, Dirty, Error }

data class ModernDocumentEditorUiState(
    val title: String,
    val chapter: String,
    val wordCount: Int,
    val saveState: DocSaveState,
    val isFocusMode: Boolean = false,
)

@Composable
fun ModernDocumentEditorScreen(
    state: ModernDocumentEditorUiState,
    onBack: () -> Unit,
    onTitleClick: () -> Unit,
    onToggleFocus: () -> Unit,
    onPreview: () -> Unit,
    onPublish: () -> Unit,
    onFormat: (FormatAction) -> Unit,
    editorSurface: @Composable BoxScope.() -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = {
            CFTopBar(
                title = state.title,
                onBack = onBack,
                actions = {
                    IconButton(onClick = onToggleFocus) {
                        Icon(
                            if (state.isFocusMode) Icons.Default.UnfoldMore else Icons.Default.UnfoldLess,
                            contentDescription = "Toggle focus mode",
                        )
                    }
                    IconButton(onClick = onPreview) { Icon(Icons.Default.Visibility, contentDescription = "Preview") }
                    IconButton(onClick = onPublish) { Icon(Icons.Default.Publish, contentDescription = "Publish") }
                },
            )
        },
        bottomBar = {
            Column(
                Modifier
                    .fillMaxWidth()
                    .background(cs.surface),
            ) {
                if (!state.isFocusMode) FormatBar(onFormat = onFormat)
                Row(
                    Modifier
                        .fillMaxWidth()
                        .padding(horizontal = CFSpacing.lg, vertical = CFSpacing.sm),
                    verticalAlignment = Alignment.CenterVertically,
                ) {
                    Text(
                        "${state.wordCount.formatThousands()} words · ${state.chapter}",
                        style = MaterialTheme.typography.labelSmall,
                        color = cs.onSurfaceVariant,
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis,
                        modifier = Modifier.weight(1f),
                    )
                    SaveStateBadge(state.saveState)
                }
            }
        },
        containerColor = cs.background,
    ) { padding ->
        Box(Modifier.fillMaxSize().padding(padding)) {
            editorSurface()
            if (!state.isFocusMode) {
                Box(
                    Modifier
                        .align(Alignment.TopCenter)
                        .padding(CFSpacing.sm)
                        .clip(RoundedCornerShape(50))
                        .background(tokens.metal.brush())
                        .clickable(onClick = onTitleClick)
                        .padding(horizontal = 12.dp, vertical = 4.dp),
                ) {
                    Text(state.chapter, style = MaterialTheme.typography.labelMedium, color = cs.onPrimary, fontWeight = FontWeight.Black)
                }
            }
        }
    }
}

enum class FormatAction { Bold, Italic, Underline, H1, H2, Quote, Bullet, OrderedList, Link, Image, Undo, Redo }

@Composable
private fun FormatBar(onFormat: (FormatAction) -> Unit) {
    val cs = MaterialTheme.colorScheme
    Row(
        Modifier
            .fillMaxWidth()
            .border(1.dp, cs.outline.copy(alpha = 0.3f), RoundedCornerShape(0.dp))
            .padding(horizontal = CFSpacing.sm, vertical = 4.dp),
        verticalAlignment = Alignment.CenterVertically,
        horizontalArrangement = Arrangement.spacedBy(2.dp),
    ) {
        FormatBtn(Icons.Default.FormatBold,        "Bold")        { onFormat(FormatAction.Bold) }
        FormatBtn(Icons.Default.FormatItalic,      "Italic")      { onFormat(FormatAction.Italic) }
        FormatBtn(Icons.Default.FormatUnderlined,  "Underline")   { onFormat(FormatAction.Underline) }
        VerticalDivider(modifier = Modifier.height(20.dp), color = cs.outline.copy(alpha = 0.4f))
        FormatBtn(Icons.Default.Title,             "Heading 1")   { onFormat(FormatAction.H1) }
        FormatBtn(Icons.Default.TextFields,        "Heading 2")   { onFormat(FormatAction.H2) }
        FormatBtn(Icons.Default.FormatQuote,       "Quote")       { onFormat(FormatAction.Quote) }
        VerticalDivider(modifier = Modifier.height(20.dp), color = cs.outline.copy(alpha = 0.4f))
        FormatBtn(Icons.AutoMirrored.Filled.FormatListBulleted, "Bullet list") { onFormat(FormatAction.Bullet) }
        FormatBtn(Icons.Default.FormatListNumbered,             "Numbered list") { onFormat(FormatAction.OrderedList) }
        FormatBtn(Icons.Default.Link,                            "Link")        { onFormat(FormatAction.Link) }
        FormatBtn(Icons.Default.Image,                           "Image")       { onFormat(FormatAction.Image) }
        Spacer(Modifier.weight(1f))
        FormatBtn(Icons.Default.Undo, "Undo") { onFormat(FormatAction.Undo) }
        FormatBtn(Icons.Default.Redo, "Redo") { onFormat(FormatAction.Redo) }
    }
}

@Composable
private fun FormatBtn(icon: ImageVector, contentDescription: String, onClick: () -> Unit) {
    IconButton(onClick = onClick, modifier = Modifier.size(36.dp)) {
        Icon(icon, contentDescription = contentDescription, modifier = Modifier.size(18.dp))
    }
}

@Composable
private fun SaveStateBadge(state: DocSaveState) {
    val cs = MaterialTheme.colorScheme
    val (icon, label, tint) = when (state) {
        DocSaveState.Saved   -> Triple(Icons.Default.CloudDone,    "Saved",   cs.primary)
        DocSaveState.Saving  -> Triple(Icons.Default.CloudUpload,  "Saving",  cs.onSurfaceVariant)
        DocSaveState.Dirty   -> Triple(Icons.Default.Edit,         "Editing", cs.onSurfaceVariant)
        DocSaveState.Error   -> Triple(Icons.Default.CloudOff,     "Error",   cs.error)
    }
    Row(verticalAlignment = Alignment.CenterVertically, horizontalArrangement = Arrangement.spacedBy(4.dp)) {
        Icon(icon, contentDescription = label, tint = tint, modifier = Modifier.size(14.dp))
        Text(label, style = MaterialTheme.typography.labelSmall, color = tint)
    }
}

private fun Int.formatThousands(): String =
    if (this < 1000) toString() else "%,d".format(this).replace(',', ',')
