package com.universalmedialibrary.ui.midi

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.Path
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.midi.MidiFile
import com.universalmedialibrary.data.midi.MidiNote
import kotlin.math.abs

/**
 * Music Notation Display
 * 
 * Displays MIDI notes as standard music notation on a staff
 * Features:
 * - Treble and bass clefs
 * - Standard notation rendering
 * - Time signatures
 * - Key signatures
 * - Measure lines
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun MusicNotationDisplay(
    midiFile: MidiFile,
    notes: List<MidiNote>,
    onBack: () -> Unit
) {
    var zoomLevel by remember { mutableFloatStateOf(1f) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Music Notation - ${midiFile.title}") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.Default.ArrowBack, "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { zoomLevel = (zoomLevel * 1.2f).coerceIn(0.5f, 3f) }) {
                        Icon(Icons.Default.ZoomIn, "Zoom In")
                    }
                    IconButton(onClick = { zoomLevel = (zoomLevel / 1.2f).coerceIn(0.5f, 3f) }) {
                        Icon(Icons.Default.ZoomOut, "Zoom Out")
                    }
                }
            )
        }
    ) { paddingValues ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Notation info card
            Card(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp)
            ) {
                Column(modifier = Modifier.padding(16.dp)) {
                    Text(
                        text = "Tempo: ${midiFile.tempo} BPM",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "Time Signature: ${midiFile.timeSignature}",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    if (midiFile.keySignature != null) {
                        Text(
                            text = "Key: ${midiFile.keySignature}",
                            style = MaterialTheme.typography.bodyMedium
                        )
                    }
                }
            }
            
            // Staff display
            StaffDisplay(
                notes = notes,
                timeSignature = midiFile.timeSignature,
                keySignature = midiFile.keySignature,
                zoomLevel = zoomLevel,
                modifier = Modifier
                    .fillMaxWidth()
                    .weight(1f)
            )
        }
    }
}

@Composable
private fun StaffDisplay(
    notes: List<MidiNote>,
    timeSignature: String,
    keySignature: String?,
    zoomLevel: Float,
    modifier: Modifier = Modifier
) {
    val scrollState = rememberScrollState()
    
    Box(
        modifier = modifier
            .horizontalScroll(scrollState)
            .padding(16.dp)
    ) {
        Canvas(
            modifier = Modifier.size(
                width = (2000 * zoomLevel).dp,
                height = 400.dp
            )
        ) {
            val staffSpacing = 15f * zoomLevel
            val staffTop = 100f
            
            // Draw treble clef staff
            drawStaff(
                topY = staffTop,
                spacing = staffSpacing,
                clef = "treble"
            )
            
            // Draw bass clef staff
            drawStaff(
                topY = staffTop + 150f,
                spacing = staffSpacing,
                clef = "bass"
            )
            
            // Draw time signature
            drawTimeSignature(
                x = 80f * zoomLevel,
                trebleY = staffTop,
                bassY = staffTop + 150f,
                timeSignature = timeSignature,
                spacing = staffSpacing
            )
            
            // Draw key signature if present
            if (keySignature != null) {
                drawKeySignature(
                    x = 130f * zoomLevel,
                    trebleY = staffTop,
                    bassY = staffTop + 150f,
                    keySignature = keySignature,
                    spacing = staffSpacing
                )
            }
            
            // Draw measure lines
            val measureWidth = 200f * zoomLevel
            val startX = 200f * zoomLevel
            for (measure in 0..10) {
                val x = startX + measure * measureWidth
                
                // Treble staff measure line
                drawLine(
                    color = Color.Black,
                    start = Offset(x, staffTop),
                    end = Offset(x, staffTop + 4 * staffSpacing),
                    strokeWidth = 1f
                )
                
                // Bass staff measure line
                drawLine(
                    color = Color.Black,
                    start = Offset(x, staffTop + 150f),
                    end = Offset(x, staffTop + 150f + 4 * staffSpacing),
                    strokeWidth = 1f
                )
            }
            
            // Draw notes on staff
            val sortedNotes = notes.sortedBy { it.startTime }
            var currentX = startX + 50f * zoomLevel
            
            for (note in sortedNotes.take(50)) { // Limit for performance
                val staffY = if (note.pitch >= 60) staffTop else staffTop + 150f
                val position = getNotePosition(note.pitch, staffY, staffSpacing)
                
                // Draw note head
                drawCircle(
                    color = Color.Black,
                    radius = 6f * zoomLevel,
                    center = Offset(currentX, position)
                )
                
                // Draw stem
                drawLine(
                    color = Color.Black,
                    start = Offset(currentX + 5f * zoomLevel, position),
                    end = Offset(currentX + 5f * zoomLevel, position - 40f * zoomLevel),
                    strokeWidth = 1.5f
                )
                
                // Draw ledger lines if needed
                drawLedgerLines(
                    noteX = currentX,
                    noteY = position,
                    staffY = staffY,
                    spacing = staffSpacing,
                    zoomLevel = zoomLevel
                )
                
                currentX += 40f * zoomLevel
            }
        }
    }
}

private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawStaff(
    topY: Float,
    spacing: Float,
    clef: String
) {
    val width = size.width
    
    // Draw 5 staff lines
    for (i in 0..4) {
        val y = topY + i * spacing
        drawLine(
            color = Color.Black,
            start = Offset(0f, y),
            end = Offset(width, y),
            strokeWidth = 1f
        )
    }
    
    // Draw clef symbol (simplified representation)
    if (clef == "treble") {
        // Draw treble clef (G clef) - simplified
        val clefPath = Path().apply {
            moveTo(40f, topY + 2 * spacing)
            cubicTo(
                35f, topY + spacing,
                45f, topY,
                50f, topY + spacing
            )
            cubicTo(
                55f, topY + 2 * spacing,
                45f, topY + 3 * spacing,
                40f, topY + 2 * spacing
            )
        }
        drawPath(
            path = clefPath,
            color = Color.Black,
            style = Stroke(width = 2f)
        )
    } else {
        // Draw bass clef (F clef) - simplified
        val clefPath = Path().apply {
            moveTo(35f, topY + 2 * spacing)
            lineTo(45f, topY + 2 * spacing)
            lineTo(45f, topY + 3 * spacing)
            lineTo(35f, topY + 3 * spacing)
            close()
        }
        drawPath(
            path = clefPath,
            color = Color.Black
        )
        
        // Draw two dots
        drawCircle(
            color = Color.Black,
            radius = 2f,
            center = Offset(52f, topY + 1.5f * spacing)
        )
        drawCircle(
            color = Color.Black,
            radius = 2f,
            center = Offset(52f, topY + 2.5f * spacing)
        )
    }
}

private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawTimeSignature(
    x: Float,
    trebleY: Float,
    bassY: Float,
    timeSignature: String,
    spacing: Float
) {
    // Time signature text would be drawn here
    // For simplicity, just drawing placeholder
}

private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawKeySignature(
    x: Float,
    trebleY: Float,
    bassY: Float,
    keySignature: String,
    spacing: Float
) {
    // Key signature sharps/flats would be drawn here
    // For simplicity, just drawing placeholder
}

private fun getNotePosition(pitch: Int, staffY: Float, spacing: Float): Float {
    // Middle C = 60
    // Each semitone is not exactly a position on the staff
    // Need to map MIDI pitch to staff position
    
    // Simplified mapping (proper implementation would use scale degrees)
    val noteNames = listOf("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    val staffPositions = mapOf(
        "C" to 0, "D" to -1, "E" to -2, "F" to -3, "G" to -4, "A" to -5, "B" to -6
    )
    
    val noteIndex = pitch % 12
    val octave = pitch / 12
    val noteName = noteNames[noteIndex].replace("#", "")
    
    val basePosition = staffPositions[noteName] ?: 0
    val octaveOffset = (octave - 4) * -7 // Each octave is 7 staff positions
    
    return staffY + 4 * spacing + (basePosition + octaveOffset) * (spacing / 2f)
}

private fun androidx.compose.ui.graphics.drawscope.DrawScope.drawLedgerLines(
    noteX: Float,
    noteY: Float,
    staffY: Float,
    spacing: Float,
    zoomLevel: Float
) {
    val staffBottom = staffY + 4 * spacing
    val staffTop = staffY
    
    // Draw ledger lines above staff
    if (noteY < staffTop) {
        var ledgerY = staffTop - spacing
        while (ledgerY >= noteY) {
            if (abs(ledgerY - noteY) < spacing / 4) {
                drawLine(
                    color = Color.Black,
                    start = Offset(noteX - 10f * zoomLevel, ledgerY),
                    end = Offset(noteX + 10f * zoomLevel, ledgerY),
                    strokeWidth = 1f
                )
            }
            ledgerY -= spacing
        }
    }
    
    // Draw ledger lines below staff
    if (noteY > staffBottom) {
        var ledgerY = staffBottom + spacing
        while (ledgerY <= noteY) {
            if (abs(ledgerY - noteY) < spacing / 4) {
                drawLine(
                    color = Color.Black,
                    start = Offset(noteX - 10f * zoomLevel, ledgerY),
                    end = Offset(noteX + 10f * zoomLevel, ledgerY),
                    strokeWidth = 1f
                )
            }
            ledgerY += spacing
        }
    }
}
