package com.universalmedialibrary.ui.books

import android.graphics.Color
import android.graphics.Typeface
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.automirrored.filled.MenuBook
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import com.github.mikephil.charting.animation.Easing
import com.github.mikephil.charting.charts.BarChart
import com.github.mikephil.charting.charts.HorizontalBarChart
import com.github.mikephil.charting.charts.PieChart
import com.github.mikephil.charting.components.Legend
import com.github.mikephil.charting.components.XAxis
import com.github.mikephil.charting.data.*
import com.github.mikephil.charting.formatter.IndexAxisValueFormatter
import com.github.mikephil.charting.formatter.PercentFormatter
import java.util.Locale

/**
 * Reading Statistics Screen with MPAndroidChart
 * 
 * Displays comprehensive reading statistics with animated charts:
 * - Bar chart for monthly reading progress
 * - Pie/Donut chart for yearly reading goal
 * - Horizontal bar chart for top publishers
 * - Summary statistics cards
 * 
 * Uses MPAndroidChart library for beautiful, animated visualizations
 * Adapted from badreads project: https://github.com/fenimore/badreads
 */

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun ReadingStatisticsWithChartsScreen(
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
                },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer,
                    titleContentColor = MaterialTheme.colorScheme.onPrimaryContainer
                )
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
                        icon = Icons.AutoMirrored.Filled.MenuBook,
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
            
            // Reading goal with donut chart
            item {
                YearlyGoalChartCard(
                    goal = uiState.yearlyGoal,
                    current = uiState.booksReadThisYear,
                    onSetGoal = { newGoal ->
                        viewModel.setYearlyGoal(newGoal)
                    }
                )
            }
            
            // Monthly reading bar chart
            item {
                MonthlyReadingBarChart(
                    data = uiState.monthlyReadingData
                )
            }
            
            // Top publishers horizontal bar chart
            if (uiState.topPublishers.isNotEmpty()) {
                item {
                    TopPublishersBarChart(
                        publishers = uiState.topPublishers
                    )
                }
            }
            
            // Shelf breakdown
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
private fun YearlyGoalChartCard(
    goal: Int,
    current: Int,
    onSetGoal: (Int) -> Unit,
    modifier: Modifier = Modifier
) {
    var showDialog by remember { mutableStateOf(false) }
    val progress = if (goal > 0) (current.toFloat() / goal * 100).coerceIn(0f, 100f) else 0f
    
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
                        text = "📚 ${java.time.LocalDate.now().year} Reading Goal",
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = "$current of $goal books read",
                        style = MaterialTheme.typography.bodyLarge,
                        color = MaterialTheme.colorScheme.onSecondaryContainer.copy(alpha = 0.7f)
                    )
                }
                
                FilledTonalButton(onClick = { showDialog = true }) {
                    Icon(Icons.Default.Edit, contentDescription = "Edit", modifier = Modifier.size(18.dp))
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Set Goal")
                }
            }
            
            // Donut/Pie chart for goal
            AndroidView(
                factory = { context ->
                    PieChart(context).apply {
                        description.isEnabled = false
                        setDrawEntryLabels(false)
                        isRotationEnabled = false
                        setHoleColor(android.graphics.Color.TRANSPARENT)
                        holeRadius = 70f
                        transparentCircleRadius = 75f
                        
                        // Center text
                        setDrawCenterText(true)
                        centerText = "${progress.toInt()}%\nComplete"
                        setCenterTextSize(20f)
                        setCenterTextTypeface(Typeface.DEFAULT_BOLD)
                        
                        // Legend
                        legend.isEnabled = true
                        legend.verticalAlignment = Legend.LegendVerticalAlignment.BOTTOM
                        legend.horizontalAlignment = Legend.LegendHorizontalAlignment.CENTER
                        legend.orientation = Legend.LegendOrientation.HORIZONTAL
                        legend.setDrawInside(false)
                        legend.textSize = 12f
                    }
                },
                update = { chart ->
                    val entries = ArrayList<PieEntry>()
                    entries.add(PieEntry(current.toFloat(), "Read"))
                    if (goal > current) {
                        entries.add(PieEntry((goal - current).toFloat(), "Remaining"))
                    }
                    
                    val dataSet = PieDataSet(entries, "").apply {
                        colors = listOf(
                            Color.rgb(76, 175, 80),  // Green for read
                            Color.rgb(158, 158, 158) // Gray for remaining
                        )
                        sliceSpace = 3f
                        selectionShift = 5f
                        valueTextSize = 14f
                        valueTypeface = Typeface.DEFAULT_BOLD
                    }
                    
                    val data = PieData(dataSet).apply {
                        setValueFormatter(PercentFormatter(chart))
                        setValueTextSize(14f)
                        setValueTextColor(Color.WHITE)
                    }
                    
                    chart.data = data
                    chart.animateY(1400, Easing.EaseInOutQuad)
                    chart.invalidate()
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(280.dp)
            )
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
private fun MonthlyReadingBarChart(
    data: List<MonthlyReading>,
    modifier: Modifier = Modifier
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
                    text = "📊 Books Read per Month",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Last 12 months",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            if (data.isEmpty()) {
                Box(
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(250.dp),
                    contentAlignment = Alignment.Center
                ) {
                    Text(
                        text = "No reading data available yet.\nStart reading to see your progress!",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            } else {
                AndroidView(
                    factory = { context ->
                        BarChart(context).apply {
                            description.isEnabled = false
                            setDrawGridBackground(false)
                            setDrawBarShadow(false)
                            setFitBars(true)
                            setPinchZoom(false)
                            setScaleEnabled(false)
                            
                            // X-axis
                            xAxis.apply {
                                position = XAxis.XAxisPosition.BOTTOM
                                setDrawGridLines(false)
                                granularity = 1f
                                textSize = 10f
                            }
                            
                            // Y-axis (left)
                            axisLeft.apply {
                                setDrawGridLines(true)
                                granularity = 1f
                                axisMinimum = 0f
                                textSize = 10f
                            }
                            
                            // Y-axis (right) - disabled
                            axisRight.isEnabled = false
                            
                            // Legend
                            legend.isEnabled = false
                        }
                    },
                    update = { chart ->
                        val entries = data.mapIndexed { index, monthData ->
                            BarEntry(index.toFloat(), monthData.count.toFloat())
                        }
                        
                        val dataSet = BarDataSet(entries, "Books Read").apply {
                            color = Color.rgb(33, 150, 243) // Blue
                            valueTextSize = 10f
                            valueTypeface = Typeface.DEFAULT_BOLD
                            setDrawValues(true)
                        }
                        
                        val barData = BarData(dataSet).apply {
                            barWidth = 0.8f
                        }
                        
                        chart.xAxis.valueFormatter = IndexAxisValueFormatter(data.map { it.month })
                        chart.data = barData
                        chart.animateY(1500, Easing.EaseInOutCubic)
                        chart.invalidate()
                    },
                    modifier = Modifier
                        .fillMaxWidth()
                        .height(250.dp)
                )
            }
        }
    }
}

@Composable
private fun TopPublishersBarChart(
    publishers: List<PublisherCount>,
    modifier: Modifier = Modifier
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
                    text = "🏢 Top Publishers",
                    style = MaterialTheme.typography.titleLarge,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Your most-read publishers",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            AndroidView(
                factory = { context ->
                    HorizontalBarChart(context).apply {
                        description.isEnabled = false
                        setDrawGridBackground(false)
                        setDrawBarShadow(false)
                        setFitBars(true)
                        setPinchZoom(false)
                        setScaleEnabled(false)
                        
                        // X-axis (top)
                        xAxis.apply {
                            position = XAxis.XAxisPosition.TOP
                            setDrawGridLines(false)
                            granularity = 1f
                            textSize = 10f
                        }
                        
                        // Y-axis (left)
                        axisLeft.apply {
                            setDrawGridLines(true)
                            granularity = 1f
                            textSize = 9f
                        }
                        
                        // Y-axis (right) - disabled
                        axisRight.isEnabled = false
                        
                        // Legend
                        legend.isEnabled = false
                        
                        // Extra offset for labels
                        setExtraOffsets(0f, 0f, 0f, 10f)
                    }
                },
                update = { chart ->
                    val topPublishers = publishers.take(8)
                    val entries = topPublishers.mapIndexed { index, publisher ->
                        BarEntry(index.toFloat(), publisher.count.toFloat())
                    }
                    
                    val dataSet = BarDataSet(entries, "Books").apply {
                        colors = listOf(
                            Color.rgb(255, 152, 0),  // Orange
                            Color.rgb(255, 193, 7),  // Amber
                            Color.rgb(139, 195, 74), // Light Green
                            Color.rgb(76, 175, 80),  // Green
                            Color.rgb(3, 169, 244),  // Light Blue
                            Color.rgb(33, 150, 243), // Blue
                            Color.rgb(103, 58, 183), // Deep Purple
                            Color.rgb(156, 39, 176)  // Purple
                        )
                        valueTextSize = 10f
                        valueTypeface = Typeface.DEFAULT_BOLD
                    }
                    
                    val barData = BarData(dataSet).apply {
                        barWidth = 0.85f
                    }
                    
                    // Truncate long publisher names
                    val labels = topPublishers.map { 
                        if (it.name.length > 25) "${it.name.take(22)}..." else it.name 
                    }
                    
                    chart.xAxis.valueFormatter = IndexAxisValueFormatter(labels)
                    chart.data = barData
                    chart.animateX(1500, Easing.EaseInOutCubic)
                    chart.invalidate()
                },
                modifier = Modifier
                    .fillMaxWidth()
                    .height(300.dp)
            )
        }
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
                text = "📚 Shelf Breakdown",
                style = MaterialTheme.typography.titleLarge,
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
    color: androidx.compose.ui.graphics.Color,
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

private fun formatNumber(number: Int): String {
    val locale = Locale.getDefault()
    return when {
        number >= 1_000_000 -> String.format(locale, "%.1fM", number / 1_000_000.0)
        number >= 1_000 -> String.format(locale, "%.1fK", number / 1_000.0)
        else -> number.toString()
    }
}
