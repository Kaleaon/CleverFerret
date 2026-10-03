// ModernScannerScreen — single screen used for both QR (sharing /
// collaborative join) and barcode (book ISBN lookup). The actual camera
// preview is supplied by the caller as `cameraSurface` so this composable
// stays test-friendly. Includes a torch toggle, manual-entry button, and
// last-scan result card overlay.

package com.universalmedialibrary.ui.modern.scanner

import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFMetalButton
import com.universalmedialibrary.ui.modern.theme.CFSpacing

enum class ScannerMode { QrCode, Barcode }

data class ScannerLastResult(
    val text: String,
    val matchedTitle: String? = null,
    val matchedSubtitle: String? = null,
)

data class ModernScannerUiState(
    val mode: ScannerMode,
    val torchOn: Boolean = false,
    val lastResult: ScannerLastResult? = null,
)

@Composable
fun ModernScannerScreen(
    state: ModernScannerUiState,
    onBack: () -> Unit,
    onTorchToggle: () -> Unit,
    onManualEntry: () -> Unit,
    onAcceptResult: () -> Unit,
    cameraSurface: @Composable BoxScope.() -> Unit,
) {
    Box(Modifier.fillMaxSize().background(Color.Black)) {
        cameraSurface()

        // Reticle overlay
        Box(
            Modifier
                .align(Alignment.Center)
                .size(if (state.mode == ScannerMode.QrCode) 240.dp else 280.dp)
                .border(2.dp, Color.White.copy(alpha = 0.85f), RoundedCornerShape(16.dp)),
        )

        // Top bar
        Row(
            Modifier
                .fillMaxWidth()
                .background(Brush.verticalGradient(listOf(Color.Black.copy(alpha = 0.55f), Color.Transparent)))
                .padding(CFSpacing.md),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back", tint = Color.White) }
            Text(
                if (state.mode == ScannerMode.QrCode) "Scan QR code" else "Scan barcode",
                style = MaterialTheme.typography.titleMedium,
                color = Color.White,
                fontWeight = FontWeight.Black,
                modifier = Modifier.weight(1f).padding(start = CFSpacing.sm),
            )
            IconButton(onClick = onTorchToggle) {
                Icon(
                    if (state.torchOn) Icons.Default.FlashOn else Icons.Default.FlashOff,
                    contentDescription = "Torch",
                    tint = Color.White,
                )
            }
        }

        // Bottom action bar
        Column(
            Modifier
                .align(Alignment.BottomCenter)
                .fillMaxWidth()
                .background(Brush.verticalGradient(listOf(Color.Transparent, Color.Black.copy(alpha = 0.65f))))
                .padding(CFSpacing.lg),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
        ) {
            state.lastResult?.let { result -> ResultCard(result, onAccept = onAcceptResult) }
            TextButton(onClick = onManualEntry) {
                Icon(Icons.Default.Keyboard, contentDescription = null, tint = Color.White)
                Spacer(Modifier.width(4.dp))
                Text("Enter manually", color = Color.White)
            }
        }
    }
}

@Composable
private fun ResultCard(result: ScannerLastResult, onAccept: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Column(
        Modifier
            .fillMaxWidth()
            .clip(RoundedCornerShape(14.dp))
            .background(cs.surface)
            .padding(CFSpacing.md),
        verticalArrangement = Arrangement.spacedBy(CFSpacing.xs),
    ) {
        Text("DETECTED", style = MaterialTheme.typography.labelSmall, color = cs.primary, fontWeight = FontWeight.Black)
        Text(
            result.matchedTitle ?: result.text,
            style = MaterialTheme.typography.titleSmall,
            maxLines = 1,
            overflow = TextOverflow.Ellipsis,
        )
        result.matchedSubtitle?.let {
            Text(it, style = MaterialTheme.typography.bodySmall, color = cs.onSurfaceVariant, maxLines = 1, overflow = TextOverflow.Ellipsis)
        }
        Spacer(Modifier.height(CFSpacing.xs))
        CFMetalButton(text = if (result.matchedTitle != null) "Open" else "Use", onClick = onAccept)
    }
}
