package com.universalmedialibrary.ui.books

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import java.util.Locale

/**
 * Enhanced Reading Statistics Screen with Charts
 * 
 * Displays comprehensive reading statistics including:
 * - Books read over time (monthly/yearly charts)
 * - Reading goal tracking with progress indicator
 * - Publisher statistics
 * - Average/total page counts
 * - Reading streaks
 * 
 * Adapted from badreads project: https://github.com/fenimore/badreads
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun EnhancedReadingStatisticsScreen(
    libraryId: Long,
    onNavigateBack: () -> Unit,
    modifier: Modifier = Modifier,
    viewModel: EnhancedReadingStatisticsViewModel = hiltViewModel()
) {
    val uiState by viewModel.uiState.collectAsState()
    
    LaunchedEffect(libraryId) {
        viewModel.loadStatistics(libraryId)
    }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Reading Statistics") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { paddingValues ->
        LazyColumn(
            modifier = modifier
                .fillMaxSize()
                .padding(paddingValues),
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            // Summary cards
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    StatCard(
                        title = "Books Read",
                        value = uiState.booksReadAllTime.toString(),
                        icon = Icons.Default.MenuBook,
                        modifier = Modifier.weight(1f)
                    )
                    StatCard(
                        title = "Pages Read",
                        value = formatNumber(uiState.totalPagesRead),
                        icon = Icons.Default.Description,
                        modifier = Modifier.weight(1f)
                    )
                }
            }
            
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(12.dp)
                ) {
                    StatCard(
                        title = "Avg. Pages",
                        value = uiState.averagePages.toString(),
                        icon = Icons.Default.BarChart,
                        modifier = Modifier.weight(1f)
                    )
                    StatCard(
                        title = "This Year",
                        value = uiState.booksReadThisYear.toString(),
                        icon = Icons.Default.Today,
                        modifier = Modifier.weight(1f)
                    )
                }
            }
            
            // Reading goal
            item {
                YearlyGoalCard(
                    goal = uiState.yearlyGoal,
                    current = uiState.booksReadThisYear,
                    onSetGoal = { newGoal ->
                        viewModel.setYearlyGoal(newGoal)
                    }
                )
            }
            
            // Monthly reading chart
            item {
                ChartCard(
                    title = "Books Read per Month",
                    subtitle = "Last 12 months"
                ) {
                    if (uiState.monthlyReadingData.isNotEmpty()) {
                        MonthlyReadingChart(data = uiState.monthlyReadingData)
                    } else {
                        EmptyChartPlaceholder("No reading data available")
                    }
                }
            }
            
            // Top publishers
            if (uiState.topPublishers.isNotEmpty()) {
                item {
                    ChartCard(
                        title = "Top Publishers",
                        subtitle = "Most read publishers"
                    ) {
                        TopPublishersChart(publishers = uiState.topPublishers)
                    }
                }
            }
            
            // Reading shelf breakdown
            item {
                ShelfBreakdownCard(
                    currentlyReading = uiState.currentlyReading,
                    read = uiState.booksReadAllTime,
                    toRead = uiState.toRead
                )
            }
        }
    }
}

@Composable
private fun StatCard(
    title: String,
    value: String,
    icon: androidx.compose.ui.graphics.vector.ImageVector,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(24.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Text(
                text = value,
                style = MaterialTheme.typography.headlineMedium,
                fontWeight = FontWeight.Bold
            )
            Text(
                text = title,
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
            )
        }
    }
}

@Composable
private fun YearlyGoalCard(
    goal: Int,
    current: Int,
    onSetGoal: (Int) -> Unit,
    modifier: Modifier = Modifier
) {
    var showDialog by remember { mutableStateOf(false) }
    
    Card(
        modifier = modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.secondaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Yearly Reading Goal",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "$current of $goal books",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSecondaryContainer.copy(alpha = 0.7f)
                    )
                }
                
                FilledTonalButton(onClick = { showDialog = true }) {
                    Text("Set Goal")
                }
            }
            
            // Progress bar
            val progress = if (goal > 0) (current.toFloat() / goal).coerceIn(0f, 1f) else 0f
            
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                LinearProgressIndicator(
                    progress = { progress },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(12.dp),
                    strokeCap = androidx.compose.ui.graphics.StrokeCap.Round
                )
                
                Text(
                    text = "${(progress * 100).toInt()}% complete",
                    style = MaterialTheme.typography.labelMedium,
                    color = MaterialTheme.colorScheme.onSecondaryContainer
                )
            }
        }
    }
    
    if (showDialog) {
        SetGoalDialog(
            currentGoal = goal,
            onDismiss = { showDialog = false },
            onConfirm = { newGoal ->
                onSetGoal(newGoal)
                showDialog = false
            }
        )
    }
}

@Composable
private fun SetGoalDialog(
    currentGoal: Int,
    onDismiss: () -> Unit,
    onConfirm: (Int) -> Unit
) {
    var goalText by remember { mutableStateOf(currentGoal.toString()) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Set Yearly Reading Goal") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                Text("How many books do you want to read this year?")
                OutlinedTextField(
                    value = goalText,
                    onValueChange = { goalText = it.filter { char -> char.isDigit() } },
                    label = { Text("Number of books") },
                    singleLine = true,
                    modifier = Modifier.fillMaxWidth()
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val newGoal = goalText.toIntOrNull() ?: currentGoal
                    onConfirm(newGoal)
                }
            ) {
                Text("Set Goal")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}

@Composable
private fun ChartCard(
    title: String,
    subtitle: String,
    modifier: Modifier = Modifier,
    content: @Composable () -> Unit
) {
    Card(
        modifier = modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            Column {
                Text(
                    text = title,
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = subtitle,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            content()
        }
    }
}

@Composable
private fun MonthlyReadingChart(
    data: List<MonthlyReading>,
    modifier: Modifier = Modifier
) {
    val maxCount = data.maxOfOrNull { it.count } ?: 1
    
    Column(
        modifier = modifier
            .fillMaxWidth()
            .height(200.dp),
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        data.forEach { monthData ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = monthData.month,
                    style = MaterialTheme.typography.labelSmall,
                    modifier = Modifier.width(32.dp)
                )
                LinearProgressIndicator(
                    progress = { monthData.count.toFloat() / maxCount },
                    modifier = Modifier
                        .weight(1f)
                        .height(20.dp),
                    strokeCap = androidx.compose.ui.graphics.StrokeCap.Round
                )
                Text(
                    text = monthData.count.toString(),
                    style = MaterialTheme.typography.labelSmall,
                    fontWeight = FontWeight.Bold,
                    modifier = Modifier.width(24.dp)
                )
            }
        }
    }
}

@Composable
private fun TopPublishersChart(
    publishers: List<PublisherCount>,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier.fillMaxWidth(),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        publishers.take(10).forEach { publisher ->
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = publisher.name,
                    style = MaterialTheme.typography.bodyMedium,
                    modifier = Modifier.weight(1f)
                )
                Text(
                    text = publisher.count.toString(),
                    style = MaterialTheme.typography.bodyMedium,
                    fontWeight = FontWeight.Bold,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            LinearProgressIndicator(
                progress = { publisher.count.toFloat() / publishers.maxOf { it.count } },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(4.dp)
            )
        }
    }
}

@Composable
private fun ShelfBreakdownCard(
    currentlyReading: Int,
    read: Int,
    toRead: Int,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier.fillMaxWidth()
    ) {
        Column(
            modifier = Modifier.padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Text(
                text = "Shelf Breakdown",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceEvenly
            ) {
                ShelfStat(
                    label = "Reading",
                    count = currentlyReading,
                    color = MaterialTheme.colorScheme.primary
                )
                ShelfStat(
                    label = "Read",
                    count = read,
                    color = MaterialTheme.colorScheme.tertiary
                )
                ShelfStat(
                    label = "To Read",
                    count = toRead,
                    color = MaterialTheme.colorScheme.secondary
                )
            }
        }
    }
}

@Composable
private fun ShelfStat(
    label: String,
    count: Int,
    color: Color,
    modifier: Modifier = Modifier
) {
    Column(
        modifier = modifier,
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.spacedBy(4.dp)
    ) {
        Text(
            text = count.toString(),
            style = MaterialTheme.typography.headlineMedium,
            fontWeight = FontWeight.Bold,
            color = color
        )
        Text(
            text = label,
            style = MaterialTheme.typography.bodySmall,
            color = MaterialTheme.colorScheme.onSurfaceVariant
        )
    }
}

@Composable
private fun EmptyChartPlaceholder(
    message: String,
    modifier: Modifier = Modifier
) {
    Box(
        modifier = modifier
            .fillMaxWidth()
            .height(200.dp),
        contentAlignment = Alignment.Center
    ) {
        Text(
            text = message,
            style = MaterialTheme.typography.bodyMedium,
            color = MaterialTheme.colorScheme.onSurfaceVariant,
            textAlign = TextAlign.Center
        )
    }
}

private fun formatNumber(number: Int): String {
    val locale = Locale.getDefault()
    return when {
        number >= 1_000_000 -> String.format(locale, "%.1fM", number / 1_000_000.0)
        number >= 1_000 -> String.format(locale, "%.1fK", number / 1_000.0)
        else -> number.toString()
    }
}

// Data classes
data class MonthlyReading(val month: String, val count: Int)
data class PublisherCount(val name: String, val count: Int)
