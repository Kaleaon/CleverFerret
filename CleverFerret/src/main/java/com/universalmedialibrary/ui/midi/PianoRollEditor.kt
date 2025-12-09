package com.universalmedialibrary.ui.midi

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.background
import androidx.compose.foundation.gestures.detectDragGestures
import androidx.compose.foundation.gestures.detectTapGestures
import androidx.compose.foundation.horizontalScroll
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.input.pointer.pointerInput
import androidx.compose.ui.unit.dp
import com.universalmedialibrary.data.midi.MidiNote

/**
 * Piano Roll Editor
 * 
 * Interactive MIDI note editor with piano roll interface
 * Features:
 * - Visual piano roll grid
 * - Note placement and editing
 * - Drag to move notes
 * - Click to add/remove notes
 * - Zoom and scroll
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PianoRollEditor(
    notes: List<MidiNote>,
    onAddNote: (pitch: Int, startTime: Long, duration: Long, velocity: Int) -> Unit,
    onRemoveNote: (MidiNote) -> Unit,
    onMoveNote: (MidiNote, newStartTime: Long, newPitch: Int) -> Unit,
    onBack: () -> Unit
) {
    var selectedNote by remember { mutableStateOf<MidiNote?>(null) }
    var zoomLevel by remember { mutableFloatStateOf(1f) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Piano Roll Editor") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                },
                actions = {
                    // Zoom controls
                    IconButton(onClick = { zoomLevel = (zoomLevel * 1.2f).coerceIn(0.5f, 4f) }) {
                        Icon(Icons.Default.ZoomIn, "Zoom In")
                    }
                    IconButton(onClick = { zoomLevel = (zoomLevel / 1.2f).coerceIn(0.5f, 4f) }) {
                        Icon(Icons.Default.ZoomOut, "Zoom Out")
                    }
                }
            )
        }
    ) { paddingValues ->
        Row(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        ) {
            // Piano keyboard on the left
            PianoKeyboard(
                modifier = Modifier
                    .width(80.dp)
                    .fillMaxHeight()
            )
            
            // Piano roll grid
            PianoRollGrid(
                notes = notes,
                selectedNote = selectedNote,
                zoomLevel = zoomLevel,
                onNoteClick = { note ->
                    selectedNote = if (selectedNote == note) null else note
                },
                onNoteRemove = onRemoveNote,
                onNoteMove = onMoveNote,
                onAddNote = onAddNote,
                modifier = Modifier.weight(1f)
            )
        }
    }
}

@Composable
private fun PianoKeyboard(modifier: Modifier = Modifier) {
    val noteNames = listOf("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    val blackKeys = setOf(1, 3, 6, 8, 10) // C#, D#, F#, G#, A#
    
    Column(
        modifier = modifier
            .background(MaterialTheme.colorScheme.surface)
            .verticalScroll(rememberScrollState())
    ) {
        // Draw keys from high to low (127 to 0)
        for (pitch in 127 downTo 0) {
            val noteIndex = pitch % 12
            val octave = pitch / 12
            val isBlackKey = noteIndex in blackKeys
            
            Box(
                modifier = Modifier
                    .fillMaxWidth()
                    .height(20.dp)
                    .background(
                        if (isBlackKey) Color.Black
                        else Color.White
                    )
                    .padding(2.dp)
            ) {
                Text(
                    text = "${noteNames[noteIndex]}$octave",
                    style = MaterialTheme.typography.labelSmall,
                    color = if (isBlackKey) Color.White else Color.Black,
                    modifier = Modifier.align(Alignment.CenterStart).padding(start = 4.dp)
                )
            }
            if (pitch > 0) {
                HorizontalDivider(thickness = 0.5.dp)
            }
        }
    }
}

@Composable
private fun PianoRollGrid(
    notes: List<MidiNote>,
    selectedNote: MidiNote?,
    zoomLevel: Float,
    onNoteClick: (MidiNote) -> Unit,
    onNoteRemove: (MidiNote) -> Unit,
    onNoteMove: (MidiNote, Long, Int) -> Unit,
    onAddNote: (Int, Long, Long, Int) -> Unit,
    modifier: Modifier = Modifier
) {
    val horizontalScroll = rememberScrollState()
    val verticalScroll = rememberScrollState()
    
    Box(
        modifier = modifier
            .horizontalScroll(horizontalScroll)
            .verticalScroll(verticalScroll)
    ) {
        Canvas(
            modifier = Modifier
                .size(
                    width = (2000 * zoomLevel).dp,
                    height = (128 * 20).dp
                )
                .pointerInput(Unit) {
                    detectTapGestures { offset ->
                        // Calculate pitch and time from tap position
                        val pitch = 127 - (offset.y / 20f).toInt()
                        val startTime = (offset.x / zoomLevel).toLong()
                        
                        // Check if tapping on existing note
                        val tappedNote = notes.find { note ->
                            val noteX = note.startTime * zoomLevel
                            val noteWidth = note.duration * zoomLevel
                            val noteY = (127 - note.pitch) * 20f
                            
                            offset.x >= noteX && offset.x <= noteX + noteWidth &&
                            offset.y >= noteY && offset.y <= noteY + 20f
                        }
                        
                        if (tappedNote != null) {
                            onNoteClick(tappedNote)
                        } else {
                            // Add new note
                            onAddNote(pitch, startTime, 480, 100)
                        }
                    }
                }
                .pointerInput(notes) {
                    detectDragGestures { change, dragAmount ->
                        // Handle note dragging
                        selectedNote?.let { note ->
                            val newStartTime = note.startTime + (dragAmount.x / zoomLevel).toLong()
                            val pitchChange = -(dragAmount.y / 20f).toInt()
                            val newPitch = (note.pitch + pitchChange).coerceIn(0, 127)
                            
                            onNoteMove(note, newStartTime, newPitch)
                        }
                    }
                }
        ) {
            val canvasWidth = size.width
            val canvasHeight = size.height
            
            // Draw grid lines
            // Horizontal lines (pitch)
            for (pitch in 0..127) {
                val y = (127 - pitch) * 20f
                val isBlackKey = (pitch % 12) in setOf(1, 3, 6, 8, 10)
                
                // Draw background
                drawRect(
                    color = if (isBlackKey) Color(0xFFF5F5F5) else Color.White,
                    topLeft = Offset(0f, y),
                    size = Size(canvasWidth, 20f)
                )
                
                // Draw pitch line
                drawLine(
                    color = Color.LightGray,
                    start = Offset(0f, y),
                    end = Offset(canvasWidth, y),
                    strokeWidth = 0.5f
                )
            }
            
            // Vertical lines (time)
            val ticksPerBeat = 480
            for (beat in 0..(canvasWidth / (ticksPerBeat * zoomLevel)).toInt()) {
                val x = beat * ticksPerBeat * zoomLevel
                drawLine(
                    color = Color.LightGray,
                    start = Offset(x, 0f),
                    end = Offset(x, canvasHeight),
                    strokeWidth = if (beat % 4 == 0) 1f else 0.5f
                )
            }
            
            // Draw notes
            for (note in notes) {
                val noteX = note.startTime * zoomLevel
                val noteWidth = note.duration * zoomLevel
                val noteY = (127 - note.pitch) * 20f
                val noteHeight = 18f
                
                val isSelected = note == selectedNote
                
                // Note rectangle
                drawRect(
                    color = if (isSelected) {
                        Color(0xFF2196F3)
                    } else {
                        Color(0xFF4CAF50).copy(alpha = note.velocity / 127f)
                    },
                    topLeft = Offset(noteX, noteY + 1f),
                    size = Size(noteWidth.coerceAtLeast(10f), noteHeight)
                )
                
                // Note border
                drawRect(
                    color = if (isSelected) Color.Blue else Color.DarkGray,
                    topLeft = Offset(noteX, noteY + 1f),
                    size = Size(noteWidth.coerceAtLeast(10f), noteHeight),
                    style = androidx.compose.ui.graphics.drawscope.Stroke(width = 1f)
                )
            }
        }
    }
}
