// ModernPinAccessScreen — PIN / biometric entry guarding privacy-sensitive
// surfaces (parental, hidden libraries, security settings, kid mode exit).
// Compact lock icon + masked PIN dots + numpad. Optional biometric CTA
// when the device supports it.

package com.universalmedialibrary.ui.modern.auth

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.grid.GridCells
import androidx.compose.foundation.lazy.grid.LazyVerticalGrid
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.Backspace
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.ui.modern.components.CFTopBar
import com.universalmedialibrary.ui.modern.theme.CFSpacing
import com.universalmedialibrary.ui.modern.theme.LocalCFTokens

data class ModernPinAccessUiState(
    val title: String = "Enter PIN",
    val subtitle: String = "Enter your 4-6 digit PIN to continue.",
    val pinLength: Int,
    val maxLength: Int = 6,
    val biometricAvailable: Boolean = false,
    val errorMessage: String? = null,
    val isVerifying: Boolean = false,
)

@Composable
fun ModernPinAccessScreen(
    state: ModernPinAccessUiState,
    onBack: () -> Unit,
    onDigit: (Int) -> Unit,
    onBackspace: () -> Unit,
    onSubmit: () -> Unit,
    onBiometric: () -> Unit,
) {
    val cs = MaterialTheme.colorScheme
    val tokens = LocalCFTokens.current
    Scaffold(
        topBar = { CFTopBar(title = state.title, onBack = onBack) },
        containerColor = cs.background,
    ) { padding ->
        Column(
            Modifier.fillMaxSize().padding(padding).padding(CFSpacing.xl),
            horizontalAlignment = Alignment.CenterHorizontally,
            verticalArrangement = Arrangement.spacedBy(CFSpacing.lg, Alignment.CenterVertically),
        ) {
            Box(
                Modifier
                    .size(96.dp)
                    .clip(CircleShape)
                    .background(tokens.metal.brush()),
                contentAlignment = Alignment.Center,
            ) { Icon(Icons.Default.Lock, contentDescription = null, tint = cs.onPrimary, modifier = Modifier.size(40.dp)) }

            Text(
                state.subtitle,
                style = MaterialTheme.typography.bodyMedium,
                color = cs.onSurfaceVariant,
                textAlign = TextAlign.Center,
            )

            Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                repeat(state.maxLength) { i ->
                    val filled = i < state.pinLength
                    Box(
                        Modifier
                            .size(14.dp)
                            .clip(CircleShape)
                            .background(if (filled) cs.primary else cs.onSurface.copy(alpha = 0.2f)),
                    )
                }
            }

            state.errorMessage?.let {
                Text(it, color = cs.error, style = MaterialTheme.typography.bodySmall)
            }

            LazyVerticalGrid(
                columns = GridCells.Fixed(3),
                horizontalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                verticalArrangement = Arrangement.spacedBy(CFSpacing.sm),
                modifier = Modifier.heightIn(max = 360.dp),
                userScrollEnabled = false,
            ) {
                (1..9).forEach { d -> item { NumKey(d.toString()) { onDigit(d) } } }
                item {
                    if (state.biometricAvailable) IconKey(Icons.Default.Fingerprint, contentDescription = "Use biometric", onClick = onBiometric)
                    else Spacer(Modifier.size(72.dp))
                }
                item { NumKey("0") { onDigit(0) } }
                item { IconKey(Icons.AutoMirrored.Filled.Backspace, contentDescription = "Backspace", onClick = onBackspace) }
            }

            if (state.pinLength >= 4 && !state.isVerifying) {
                TextButton(onClick = onSubmit) { Text("Unlock") }
            }
            if (state.isVerifying) {
                CircularProgressIndicator(color = cs.primary, modifier = Modifier.size(28.dp))
            }
        }
    }
}

@Composable
private fun NumKey(text: String, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Box(
        Modifier
            .size(72.dp)
            .clip(CircleShape)
            .background(cs.surface)
            .clickable(onClick = onClick),
        contentAlignment = Alignment.Center,
    ) {
        Text(text, style = MaterialTheme.typography.headlineMedium, fontWeight = FontWeight.Black)
    }
}

@Composable
private fun IconKey(icon: ImageVector, contentDescription: String, onClick: () -> Unit) {
    val cs = MaterialTheme.colorScheme
    Box(
        Modifier
            .size(72.dp)
            .clip(CircleShape)
            .background(cs.surfaceVariant)
            .clickable(onClick = onClick),
        contentAlignment = Alignment.Center,
    ) { Icon(icon, contentDescription = contentDescription, tint = cs.onSurfaceVariant) }
}

