package com.universalmedialibrary.ui.reader.components

import android.graphics.Bitmap
import androidx.compose.animation.*
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.VolumeUp
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalClipboardManager
import androidx.compose.ui.text.AnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.window.Dialog
import androidx.compose.ui.window.DialogProperties

/**
 * OCR Overlay UI Component
 * 
 * Provides controls for OCR text recognition with result display and TTS
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun OcrOverlay(
    bitmap: Bitmap?,
    onRecognizeText: () -> Unit,
    ocrResult: String?,
    isProcessing: Boolean,
    onDismiss: () -> Unit,
    modifier: Modifier = Modifier,
    onSpeakText: ((String) -> Unit)? = null,
    onStopSpeaking: (() -> Unit)? = null,
    isSpeaking: Boolean = false,
    currentLanguage: com.universalmedialibrary.services.ocr.OcrLanguage? = null,
    availableLanguages: List<com.universalmedialibrary.services.ocr.OcrLanguage>? = null,
    onLanguageChange: ((com.universalmedialibrary.services.ocr.OcrLanguage) -> Unit)? = null
) {
    val clipboardManager = LocalClipboardManager.current
    var showLanguageMenu by remember { mutableStateOf(false) }
    
    Column(
        modifier = modifier
            .fillMaxWidth()
            .background(
                color = MaterialTheme.colorScheme.surface.copy(alpha = 0.95f),
                shape = RoundedCornerShape(topStart = 16.dp, topEnd = 16.dp)
            )
            .padding(16.dp)
    ) {
        // Header
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
            verticalAlignment = Alignment.CenterVertically
        ) {
            Text(
                text = "Text Recognition (OCR)",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            IconButton(onClick = onDismiss) {
                Icon(
                    imageVector = Icons.Default.Close,
                    contentDescription = "Close OCR"
                )
            }
        }
        
        Spacer(modifier = Modifier.height(8.dp))
        
        // Language selector (if multi-language support is enabled)
        if (currentLanguage != null && availableLanguages != null && onLanguageChange != null) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Language:",
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.padding(end = 8.dp)
                )
                
                Box {
                    OutlinedButton(
                        onClick = { showLanguageMenu = true },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text(currentLanguage.displayName)
                        Spacer(modifier = Modifier.width(4.dp))
                        Icon(
                            imageVector = Icons.Default.ArrowDropDown,
                            contentDescription = "Select language"
                        )
                    }
                    
                    DropdownMenu(
                        expanded = showLanguageMenu,
                        onDismissRequest = { showLanguageMenu = false }
                    ) {
                        availableLanguages.forEach { language ->
                            DropdownMenuItem(
                                text = { Text(language.displayName) },
                                onClick = {
                                    onLanguageChange(language)
                                    showLanguageMenu = false
                                }
                            )
                        }
                    }
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
        }
        
        // OCR Button
        Button(
            onClick = onRecognizeText,
            enabled = bitmap != null && !isProcessing,
            modifier = Modifier.fillMaxWidth()
        ) {
            if (isProcessing) {
                CircularProgressIndicator(
                    modifier = Modifier.size(24.dp),
                    color = MaterialTheme.colorScheme.onPrimary
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text("Processing...")
            } else {
                Icon(
                    imageVector = Icons.Default.TextFields,
                    contentDescription = null
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text("Extract Text")
            }
        }
        
        // Result display
        AnimatedVisibility(
            visible = ocrResult != null && !isProcessing,
            enter = fadeIn() + expandVertically(),
            exit = fadeOut() + shrinkVertically()
        ) {
            Column(modifier = Modifier.padding(top = 16.dp)) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Extracted Text",
                        style = MaterialTheme.typography.labelLarge,
                        fontWeight = FontWeight.SemiBold
                    )
                    
                    if (ocrResult != null) {
                        Row {
                            // TTS controls (if available)
                            if (onSpeakText != null && onStopSpeaking != null) {
                                IconButton(
                                    onClick = {
                                        if (isSpeaking) {
                                            onStopSpeaking()
                                        } else {
                                            onSpeakText(ocrResult)
                                        }
                                    }
                                ) {
                                    Icon(
                                        imageVector = if (isSpeaking) Icons.Default.Stop else Icons.AutoMirrored.Filled.VolumeUp,
                                        contentDescription = if (isSpeaking) "Stop speaking" else "Read aloud"
                                    )
                                }
                            }
                            
                            IconButton(
                                onClick = {
                                    clipboardManager.setText(AnnotatedString(ocrResult))
                                }
                            ) {
                                Icon(
                                    imageVector = Icons.Default.ContentCopy,
                                    contentDescription = "Copy text"
                                )
                            }
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 200.dp)
                        .clip(RoundedCornerShape(8.dp))
                        .border(
                            width = 1.dp,
                            color = MaterialTheme.colorScheme.outline,
                            shape = RoundedCornerShape(8.dp)
                        ),
                    color = MaterialTheme.colorScheme.surfaceVariant
                ) {
                    if (ocrResult != null) {
                        Text(
                            text = ocrResult,
                            modifier = Modifier
                                .padding(12.dp)
                                .verticalScroll(rememberScrollState()),
                            style = MaterialTheme.typography.bodyMedium
                        )
                    } else {
                        Box(
                            modifier = Modifier
                                .fillMaxSize()
                                .padding(12.dp),
                            contentAlignment = Alignment.Center
                        ) {
                            Text(
                                text = "No text found",
                                style = MaterialTheme.typography.bodyMedium,
                                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.6f)
                            )
                        }
                    }
                }
            }
        }
        
        // Info text
        if (!isProcessing && ocrResult == null) {
            Spacer(modifier = Modifier.height(8.dp))
            Text(
                text = "Tap 'Extract Text' to recognize text in this page using on-device OCR",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant.copy(alpha = 0.7f)
            )
        }
    }
}

/**
 * OCR FAB button for triggering OCR overlay
 */
@Composable
fun OcrFab(
    onClick: () -> Unit,
    modifier: Modifier = Modifier
) {
    FloatingActionButton(
        onClick = onClick,
        modifier = modifier,
        containerColor = MaterialTheme.colorScheme.primaryContainer,
        contentColor = MaterialTheme.colorScheme.onPrimaryContainer
    ) {
        Icon(
            imageVector = Icons.Default.TextFields,
            contentDescription = "Text Recognition"
        )
    }
}

/**
 * Simple OCR result dialog
 */
@Composable
fun OcrResultDialog(
    text: String,
    onDismiss: () -> Unit,
    onCopy: () -> Unit
) {
    Dialog(
        onDismissRequest = onDismiss,
        properties = DialogProperties(usePlatformDefaultWidth = false)
    ) {
        Surface(
            modifier = Modifier
                .fillMaxWidth(0.9f)
                .clip(RoundedCornerShape(16.dp)),
            color = MaterialTheme.colorScheme.surface
        ) {
            Column(
                modifier = Modifier.padding(24.dp)
            ) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = "Extracted Text",
                        style = MaterialTheme.typography.headlineSmall,
                        fontWeight = FontWeight.Bold
                    )
                    
                    IconButton(onClick = onDismiss) {
                        Icon(
                            imageVector = Icons.Default.Close,
                            contentDescription = "Close"
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                Surface(
                    modifier = Modifier
                        .fillMaxWidth()
                        .heightIn(max = 400.dp)
                        .clip(RoundedCornerShape(8.dp)),
                    color = MaterialTheme.colorScheme.surfaceVariant,
                    tonalElevation = 1.dp
                ) {
                    Text(
                        text = text,
                        modifier = Modifier
                            .padding(16.dp)
                            .verticalScroll(rememberScrollState()),
                        style = MaterialTheme.typography.bodyLarge
                    )
                }
                
                Spacer(modifier = Modifier.height(16.dp))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedButton(
                        onClick = onDismiss,
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Close")
                    }
                    
                    Button(
                        onClick = onCopy,
                        modifier = Modifier.weight(1f)
                    ) {
                        Icon(
                            imageVector = Icons.Default.ContentCopy,
                            contentDescription = null,
                            modifier = Modifier.size(18.dp)
                        )
                        Spacer(modifier = Modifier.width(4.dp))
                        Text("Copy")
                    }
                }
            }
        }
    }
}
