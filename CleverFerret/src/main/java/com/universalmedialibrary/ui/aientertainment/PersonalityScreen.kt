package com.universalmedialibrary.ui.aientertainment

import androidx.compose.foundation.*
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.*
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material.icons.outlined.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.data.aientertainment.*
import java.text.SimpleDateFormat
import java.util.*

/**
 * Personality Screen - V5: Personality evolution and mood tracking
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun PersonalityScreen(
    characterId: Long,
    onNavigateBack: () -> Unit,
    viewModel: PersonalityViewModel = hiltViewModel()
) {
    val character by viewModel.selectedCharacter.collectAsState()
    val currentMood by viewModel.currentMood.collectAsState()
    val currentTraits by viewModel.currentTraits.collectAsState()
    val events by viewModel.events.collectAsState()
    val isLoading by viewModel.isLoading.collectAsState()
    
    LaunchedEffect(characterId) {
        viewModel.loadPersonality(characterId)
    }
    
    val currentChar = character
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null, tint = SynthColors.textPrimary)
                    }
                },
                title = {
                    Text(
                        "Personality Evolution",
                        color = SynthColors.textPrimary
                    )
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = SynthColors.backgroundSecondary
                )
            )
        },
        containerColor = SynthColors.background
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator(color = SynthColors.primary)
            }
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Character header
                item {
                    currentChar?.let { char ->
                        CharacterHeader(character = char)
                    }
                }
                
                // Current Mood section
                item {
                    MoodSection(
                        mood = currentMood,
                        onMoodChange = { newMood, intensity ->
                            viewModel.updateMood(characterId, newMood, intensity)
                        }
                    )
                }
                
                // Traits section
                item {
                    TraitsSection(traits = currentTraits)
                }
                
                // Evolution Timeline
                item {
                    Text(
                        "Evolution Timeline",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold,
                        color = SynthColors.textPrimary
                    )
                }
                
                if (events.isEmpty()) {
                    item {
                        Card(
                            colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
                            shape = RoundedCornerShape(12.dp)
                        ) {
                            Box(
                                modifier = Modifier
                                    .fillMaxWidth()
                                    .padding(24.dp),
                                contentAlignment = Alignment.Center
                            ) {
                                Column(horizontalAlignment = Alignment.CenterHorizontally) {
                                    Icon(
                                        Icons.Outlined.Timeline,
                                        null,
                                        modifier = Modifier.size(48.dp),
                                        tint = SynthColors.textMuted
                                    )
                                    Spacer(modifier = Modifier.height(8.dp))
                                    Text(
                                        "No personality events yet",
                                        color = SynthColors.textSecondary
                                    )
                                    Text(
                                        "Start chatting to see personality evolution",
                                        style = MaterialTheme.typography.bodySmall,
                                        color = SynthColors.textMuted
                                    )
                                }
                            }
                        }
                    }
                } else {
                    items(events) { event ->
                        EventCard(event = event)
                    }
                }
                
                item {
                    Spacer(modifier = Modifier.height(32.dp))
                }
            }
        }
    }
}

@Composable
private fun CharacterHeader(character: SynthCharacter) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(16.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            CharacterAvatar(name = character.name, size = 64)
            
            Spacer(modifier = Modifier.width(16.dp))
            
            Column {
                Text(
                    character.name,
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold,
                    color = SynthColors.textPrimary
                )
                
                if (character.personality.isNotEmpty()) {
                    Text(
                        character.personality.take(100) + if (character.personality.length > 100) "..." else "",
                        style = MaterialTheme.typography.bodySmall,
                        color = SynthColors.textSecondary
                    )
                }
            }
        }
    }
}

@Composable
private fun MoodSection(
    mood: MoodState?,
    onMoodChange: (String, Double) -> Unit
) {
    val currentMood = mood ?: MoodState()
    var showMoodPicker by remember { mutableStateOf(false) }
    
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    "Current Mood",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold,
                    color = SynthColors.textPrimary
                )
                
                TextButton(onClick = { showMoodPicker = true }) {
                    Text("Change")
                }
            }
            
            Spacer(modifier = Modifier.height(16.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                // Mood emoji
                Box(
                    modifier = Modifier
                        .size(64.dp)
                        .clip(CircleShape)
                        .background(Color(currentMood.color).copy(alpha = 0.2f)),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        currentMood.emoji,
                        fontSize = 32.sp
                    )
                }
                
                Spacer(modifier = Modifier.width(16.dp))
                
                Column {
                    Text(
                        currentMood.current.replaceFirstChar { it.uppercase() },
                        style = MaterialTheme.typography.titleLarge,
                        color = Color(currentMood.color)
                    )
                    
                    // Intensity bar
                    Row(
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            "Intensity: ${(currentMood.intensity * 100).toInt()}%",
                            style = MaterialTheme.typography.bodySmall,
                            color = SynthColors.textSecondary
                        )
                    }
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    LinearProgressIndicator(
                        progress = { currentMood.intensity.toFloat() },
                        modifier = Modifier
                            .fillMaxWidth(0.7f)
                            .height(8.dp)
                            .clip(RoundedCornerShape(4.dp)),
                        color = Color(currentMood.color),
                        trackColor = SynthColors.border
                    )
                }
            }
        }
    }
    
    // Mood picker dialog
    if (showMoodPicker) {
        AlertDialog(
            onDismissRequest = { showMoodPicker = false },
            title = { Text("Select Mood") },
            text = {
                LazyVerticalGrid(
                    columns = GridCells.Fixed(3),
                    horizontalArrangement = Arrangement.spacedBy(8.dp),
                    verticalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    items(MoodState.availableMoods) { moodName ->
                        val tempMood = MoodState(current = moodName)
                        
                        Surface(
                            onClick = {
                                onMoodChange(moodName, currentMood.intensity)
                                showMoodPicker = false
                            },
                            color = if (currentMood.current == moodName) 
                                SynthColors.primary.copy(alpha = 0.2f) 
                            else 
                                SynthColors.backgroundSecondary,
                            shape = RoundedCornerShape(12.dp)
                        ) {
                            Column(
                                modifier = Modifier.padding(12.dp),
                                horizontalAlignment = Alignment.CenterHorizontally
                            ) {
                                Text(tempMood.emoji, fontSize = 24.sp)
                                Spacer(modifier = Modifier.height(4.dp))
                                Text(
                                    moodName.replaceFirstChar { it.uppercase() },
                                    style = MaterialTheme.typography.labelSmall,
                                    color = SynthColors.textPrimary
                                )
                            }
                        }
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { showMoodPicker = false }) {
                    Text("Cancel")
                }
            },
            containerColor = SynthColors.surface
        )
    }
}

@Composable
private fun TraitsSection(traits: Map<String, Double>) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(16.dp)
    ) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp)
        ) {
            Text(
                "Character Traits",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold,
                color = SynthColors.textPrimary
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            if (traits.isEmpty()) {
                Text(
                    "No traits developed yet. Chat more to evolve traits!",
                    style = MaterialTheme.typography.bodyMedium,
                    color = SynthColors.textSecondary
                )
            } else {
                traits.forEach { (trait, value) ->
                    TraitRow(
                        trait = trait.replaceFirstChar { it.uppercase() },
                        value = value.toFloat()
                    )
                    Spacer(modifier = Modifier.height(12.dp))
                }
            }
        }
    }
}

@Composable
private fun TraitRow(trait: String, value: Float) {
    Column {
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Text(
                trait,
                style = MaterialTheme.typography.bodyMedium,
                color = SynthColors.textPrimary
            )
            Text(
                "${(value * 100).toInt()}%",
                style = MaterialTheme.typography.bodyMedium,
                color = SynthColors.primary
            )
        }
        
        Spacer(modifier = Modifier.height(4.dp))
        
        LinearProgressIndicator(
            progress = { value },
            modifier = Modifier
                .fillMaxWidth()
                .height(8.dp)
                .clip(RoundedCornerShape(4.dp)),
            color = SynthColors.primary,
            trackColor = SynthColors.border
        )
    }
}

@Composable
private fun EventCard(event: SynthPersonalityEvent) {
    Card(
        colors = CardDefaults.cardColors(containerColor = SynthColors.surface),
        shape = RoundedCornerShape(12.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.Top
        ) {
            // Event icon
            Box(
                modifier = Modifier
                    .size(40.dp)
                    .clip(CircleShape)
                    .background(SynthColors.backgroundSecondary),
                contentAlignment = Alignment.Center
            ) {
                Text(event.icon, fontSize = 20.sp)
            }
            
            Spacer(modifier = Modifier.width(12.dp))
            
            Column(modifier = Modifier.weight(1f)) {
                Text(
                    event.eventType.replace("_", " ").replaceFirstChar { it.uppercase() },
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold,
                    color = SynthColors.textPrimary
                )
                
                Spacer(modifier = Modifier.height(4.dp))
                
                Text(
                    event.description,
                    style = MaterialTheme.typography.bodyMedium,
                    color = SynthColors.textSecondary
                )
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Text(
                    formatEventTime(event.createdAt),
                    style = MaterialTheme.typography.labelSmall,
                    color = SynthColors.textMuted
                )
            }
        }
    }
}

private fun formatEventTime(timestamp: Long): String {
    val now = System.currentTimeMillis()
    val diff = now - timestamp
    
    return when {
        diff < 60_000 -> "Just now"
        diff < 3_600_000 -> "${diff / 60_000} minutes ago"
        diff < 86_400_000 -> "${diff / 3_600_000} hours ago"
        diff < 604_800_000 -> "${diff / 86_400_000} days ago"
        else -> SimpleDateFormat("MMM dd, yyyy", Locale.getDefault()).format(Date(timestamp))
    }
}
