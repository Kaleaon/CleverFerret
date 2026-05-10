package com.universalmedialibrary.ui.reader

import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.alpha
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.font.GenericFontFamily
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import com.universalmedialibrary.data.local.entity.AnnotationExportConfig
import com.universalmedialibrary.data.local.entity.ExportFormat
import com.universalmedialibrary.data.local.entity.ReaderAIInsight
import java.io.File

@OptIn(ExperimentalMaterial3Api::class)
@Composable
internal fun ReadingSettingsSheet(
    fontSize: TextUnit,
    onFontSizeChange: (TextUnit) -> Unit,
    fontFamily: GenericFontFamily,
    onFontFamilyChange: (GenericFontFamily) -> Unit,
    backgroundColor: Color,
    onBackgroundChange: (Color, Color) -> Unit,
    brightness: Float,
    onBrightnessChange: (Float) -> Unit,
    onDismiss: () -> Unit
) {
    ModalBottomSheet(onDismissRequest = onDismiss) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(24.dp),
            verticalArrangement = Arrangement.spacedBy(24.dp)
        ) {
            Text(
                text = "Reading Settings",
                style = MaterialTheme.typography.titleLarge,
                fontWeight = FontWeight.Bold
            )

            // Font size
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Font Size", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    IconButton(onClick = { onFontSizeChange((fontSize.value - 2).sp) }) {
                        Icon(Icons.Default.Remove, contentDescription = "Decrease")
                    }
                    Text(
                        text = "${fontSize.value.toInt()} sp",
                        modifier = Modifier.weight(1f),
                        textAlign = TextAlign.Center
                    )
                    IconButton(onClick = { onFontSizeChange((fontSize.value + 2).sp) }) {
                        Icon(Icons.Default.Add, contentDescription = "Increase")
                    }
                }
            }

            // Font family
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Font", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = fontFamily == FontFamily.Serif,
                        onClick = { onFontFamilyChange(FontFamily.Serif) },
                        label = { Text("Serif") }
                    )
                    FilterChip(
                        selected = fontFamily == FontFamily.SansSerif,
                        onClick = { onFontFamilyChange(FontFamily.SansSerif) },
                        label = { Text("Sans") }
                    )
                    FilterChip(
                        selected = fontFamily == FontFamily.Monospace,
                        onClick = { onFontFamilyChange(FontFamily.Monospace) },
                        label = { Text("Mono") }
                    )
                }
            }

            // Theme
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Theme", style = MaterialTheme.typography.titleMedium)
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    ThemeButton(
                        name = "Sepia",
                        backgroundColor = Color(0xFFFFFBF0),
                        textColor = Color(0xFF3E2723),
                        isSelected = backgroundColor == Color(0xFFFFFBF0),
                        onClick = { onBackgroundChange(Color(0xFFFFFBF0), Color(0xFF3E2723)) }
                    )
                    ThemeButton(
                        name = "Night",
                        backgroundColor = Color(0xFF1A1A1A),
                        textColor = Color(0xFFE0E0E0),
                        isSelected = backgroundColor == Color(0xFF1A1A1A),
                        onClick = { onBackgroundChange(Color(0xFF1A1A1A), Color(0xFFE0E0E0)) }
                    )
                    ThemeButton(
                        name = "White",
                        backgroundColor = Color.White,
                        textColor = Color.Black,
                        isSelected = backgroundColor == Color.White,
                        onClick = { onBackgroundChange(Color.White, Color.Black) }
                    )
                }
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    ThemeButton(
                        name = "Paper",
                        backgroundColor = Color(0xFFF5F5DC), // Beige/Cream
                        textColor = Color(0xFF2C2C2C),
                        isSelected = backgroundColor == Color(0xFFF5F5DC),
                        onClick = { onBackgroundChange(Color(0xFFF5F5DC), Color(0xFF2C2C2C)) }
                    )
                    ThemeButton(
                        name = "OLED",
                        backgroundColor = Color.Black,
                        textColor = Color(0xFFB0B0B0),
                        isSelected = backgroundColor == Color.Black,
                        onClick = { onBackgroundChange(Color.Black, Color(0xFFB0B0B0)) }
                    )
                }
            }

            // Brightness
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("Brightness", style = MaterialTheme.typography.titleMedium)
                Slider(
                    value = brightness,
                    onValueChange = onBrightnessChange,
                    valueRange = 0.3f..1f
                )
            }

            Spacer(modifier = Modifier.height(16.dp))
        }
    }
}
