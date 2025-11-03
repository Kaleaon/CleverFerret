package com.universalmedialibrary.ui.reader.components

import androidx.compose.animation.AnimatedContent
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.togetherWith
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Pause
import androidx.compose.material.icons.filled.PlayArrow
import androidx.compose.material.icons.filled.SkipNext
import androidx.compose.material.icons.filled.SkipPrevious
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.SpanStyle
import androidx.compose.ui.text.buildAnnotatedString
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.withStyle
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import kotlinx.coroutines.delay
import kotlinx.coroutines.isActive

/**
 * RSVP (Rapid Serial Visual Presentation) Reader
 * Displays words one at a time at a fixed position for speed reading
 * Inspired by LibreraReader and Spritz
 * 
 * The optimal recognition point (ORP) is highlighted to help eyes fixate quickly
 */
@Composable
fun RsvpReader(
    text: String,
    wordsPerMinute: Int = 250,
    fontSize: TextUnit = 32.sp,
    onComplete: () -> Unit = {},
    onClose: () -> Unit = {}
) {
    val words = remember(text) { 
        text.split(Regex("\\s+")).filter { it.isNotEmpty() }
    }
    
    var currentIndex by remember { mutableStateOf(0) }
    var isPlaying by remember { mutableStateOf(false) }
    var speed by remember { mutableStateOf(wordsPerMinute) }
    
    // Calculate delay between words based on WPM
    val delayMs = remember(speed) { (60000 / speed).toLong() }
    
    LaunchedEffect(isPlaying, currentIndex) {
        if (isPlaying && currentIndex < words.size) {
            while (isActive && isPlaying && currentIndex < words.size) {
                delay(delayMs)
                currentIndex++
                if (currentIndex >= words.size) {
                    isPlaying = false
                    onComplete()
                }
            }
        }
    }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .background(MaterialTheme.colorScheme.surface)
            .padding(16.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center
    ) {
        // Close button
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.End
        ) {
            TextButton(onClick = onClose) {
                Text("Close")
            }
        }
        
        Spacer(modifier = Modifier.weight(1f))
        
        // Word display with ORP highlighting
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(200.dp),
            contentAlignment = Alignment.Center
        ) {
            if (currentIndex < words.size) {
                val word = words[currentIndex]
                val orpIndex = calculateORP(word)
                
                AnimatedContent(
                    targetState = word,
                    transitionSpec = { fadeIn() togetherWith fadeOut() }
                ) { targetWord ->
                    Text(
                        text = buildAnnotatedString {
                            // Text before ORP
                            append(targetWord.substring(0, orpIndex))
                            
                            // ORP character (highlighted)
                            withStyle(
                                style = SpanStyle(
                                    color = MaterialTheme.colorScheme.primary,
                                    fontWeight = FontWeight.Bold
                                )
                            ) {
                                append(targetWord[orpIndex].toString())
                            }
                            
                            // Text after ORP
                            if (orpIndex < targetWord.length - 1) {
                                append(targetWord.substring(orpIndex + 1))
                            }
                        },
                        fontSize = fontSize,
                        textAlign = TextAlign.Center,
                        modifier = Modifier.fillMaxWidth()
                    )
                }
            } else {
                Text(
                    text = "Finished!",
                    fontSize = fontSize,
                    textAlign = TextAlign.Center
                )
            }
        }
        
        // Progress indicator
        LinearProgressIndicator(
            progress = if (words.isNotEmpty()) currentIndex.toFloat() / words.size else 0f,
            modifier = Modifier
                .fillMaxWidth()
                .padding(vertical = 16.dp)
        )
        
        Text(
            text = "${currentIndex + 1} / ${words.size}",
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
        
        Spacer(modifier = Modifier.height(32.dp))
        
        // Control buttons
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceEvenly,
            verticalAlignment = Alignment.CenterVertically
        ) {
            IconButton(
                onClick = { 
                    if (currentIndex > 0) {
                        currentIndex--
                    }
                },
                enabled = currentIndex > 0
            ) {
                Icon(Icons.Default.SkipPrevious, "Previous word")
            }
            
            FloatingActionButton(
                onClick = { isPlaying = !isPlaying },
                containerColor = MaterialTheme.colorScheme.primaryContainer
            ) {
                Icon(
                    if (isPlaying) Icons.Default.Pause else Icons.Default.PlayArrow,
                    if (isPlaying) "Pause" else "Play"
                )
            }
            
            IconButton(
                onClick = { 
                    if (currentIndex < words.size - 1) {
                        currentIndex++
                    }
                },
                enabled = currentIndex < words.size - 1
            ) {
                Icon(Icons.Default.SkipNext, "Next word")
            }
        }
        
        Spacer(modifier = Modifier.height(32.dp))
        
        // Speed control
        Column(
            modifier = Modifier.fillMaxWidth(),
            horizontalAlignment = Alignment.CenterHorizontally
        ) {
            Text(
                text = "Speed: $speed WPM",
                style = MaterialTheme.typography.titleMedium
            )
            
            Slider(
                value = speed.toFloat(),
                onValueChange = { speed = it.toInt() },
                valueRange = 100f..600f,
                steps = 9,
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 32.dp)
            )
            
            Row(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(horizontal = 32.dp),
                horizontalArrangement = Arrangement.SpaceBetween
            ) {
                Text("Slow", style = MaterialTheme.typography.bodySmall)
                Text("Fast", style = MaterialTheme.typography.bodySmall)
            }
        }
        
        Spacer(modifier = Modifier.weight(1f))
    }
}

/**
 * Calculate the Optimal Recognition Point (ORP) for a word
 * Generally positioned slightly left of center for optimal reading
 */
private fun calculateORP(word: String): Int {
    return when (word.length) {
        1 -> 0
        2, 3, 4 -> 1
        5, 6, 7, 8 -> 2
        9, 10, 11, 12 -> 3
        else -> word.length / 3
    }
}
