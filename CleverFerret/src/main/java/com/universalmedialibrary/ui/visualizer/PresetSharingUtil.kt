package com.universalmedialibrary.ui.visualizer

import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.Color
import androidx.compose.foundation.Image
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Share
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.asImageBitmap
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.services.visualizer.VisualizerPreset
import com.universalmedialibrary.services.visualizer.VisualizerPresetManager
import java.io.File
import java.io.FileOutputStream

/**
 * Preset Sharing Utility
 *
 * Provides functionality to share visualizer presets via QR code, JSON, or direct sharing
 */

@Composable
fun PresetShareDialog(
    preset: VisualizerPreset,
    onDismiss: () -> Unit
) {
    val context = LocalContext.current
    val presetManager = remember { VisualizerPresetManager() }
    val jsonString = remember { presetManager.exportPreset(preset) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Share \"${preset.name}\"")
        },
        text = {
            Column(
                modifier = Modifier.fillMaxWidth(),
                horizontalAlignment = Alignment.CenterHorizontally,
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    text = "Share this preset with others",
                    style = MaterialTheme.typography.bodyMedium
                )
                
                // Info about sharing
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(12.dp),
                        verticalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            text = "Sharing Options:",
                            style = MaterialTheme.typography.labelLarge,
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                        Text(
                            text = "• Copy JSON to share via text\n• Share via any app\n• Others can import in Preset Browser",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSecondaryContainer
                        )
                    }
                }
                
                // JSON preview
                OutlinedCard(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 150.dp)
                ) {
                    Text(
                        text = jsonString,
                        style = MaterialTheme.typography.bodySmall,
                        modifier = Modifier.padding(12.dp),
                        maxLines = 6
                    )
                }
            }
        },
        confirmButton = {
            Row(
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                // Copy to clipboard
                TextButton(
                    onClick = {
                        copyToClipboard(context, jsonString, preset.name)
                        onDismiss()
                    }
                ) {
                    Text("Copy JSON")
                }
                
                // Share via Android share sheet
                Button(
                    onClick = {
                        sharePreset(context, preset, jsonString)
                        onDismiss()
                    }
                ) {
                    Icon(Icons.Default.Share, null, modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Share")
                }
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Close")
            }
        }
    )
}

/**
 * Copy preset JSON to clipboard
 */
private fun copyToClipboard(context: Context, text: String, label: String) {
    val clipboard = context.getSystemService(Context.CLIPBOARD_SERVICE) as android.content.ClipboardManager
    val clip = android.content.ClipData.newPlainText(label, text)
    clipboard.setPrimaryClip(clip)
    
    // Show toast
    android.widget.Toast.makeText(
        context,
        "Preset JSON copied to clipboard",
        android.widget.Toast.LENGTH_SHORT
    ).show()
}

/**
 * Share preset via Android share sheet
 */
private fun sharePreset(context: Context, preset: VisualizerPreset, jsonString: String) {
    val shareIntent = Intent(Intent.ACTION_SEND).apply {
        type = "text/plain"
        putExtra(Intent.EXTRA_SUBJECT, "Visualizer Preset: ${preset.name}")
        putExtra(Intent.EXTRA_TITLE, "Share Visualizer Preset")
        putExtra(
            Intent.EXTRA_TEXT,
            """
            Check out this audio visualizer preset!
            
            Name: ${preset.name}
            By: ${preset.author}
            Description: ${preset.description}
            
            Import JSON:
            $jsonString
            
            To use: Copy the JSON and import it in CleverFerret's Visualizer Preset Browser.
            """.trimIndent()
        )
    }
    
    context.startActivity(Intent.createChooser(shareIntent, "Share Visualizer Preset"))
}

/**
 * Generate a simple QR code bitmap (basic implementation without external library)
 * For production, consider using ZXing library
 */
fun generateSimpleQRCode(text: String, size: Int = 500): Bitmap {
    // This is a placeholder implementation
    // In a real app, you'd want to use ZXing or another QR code library
    val bitmap = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
    
    // Fill with white background
    for (x in 0 until size) {
        for (y in 0 until size) {
            bitmap.setPixel(x, y, Color.WHITE)
        }
    }
    
    // Draw a simple pattern (not a real QR code)
    // This is just for demonstration
    val cellSize = size / 25
    for (i in 0 until 25) {
        for (j in 0 until 25) {
            val hash = (text.hashCode() + i * 31 + j * 37).rem(2)
            if (hash == 0) {
                val startX = i * cellSize
                val startY = j * cellSize
                for (x in startX until (startX + cellSize).coerceAtMost(size)) {
                    for (y in startY until (startY + cellSize).coerceAtMost(size)) {
                        bitmap.setPixel(x, y, Color.BLACK)
                    }
                }
            }
        }
    }
    
    return bitmap
}
