package com.universalmedialibrary.ui.ai

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.compose.collectAsStateWithLifecycle
import com.universalmedialibrary.services.ai.*

/**
 * AI Rate Limit Control Screen
 * 
 * Provides UI controls for managing AI rate limits:
 * - Global rate limits
 * - Provider-specific limits
 * - User-specific limits
 * - Usage statistics and monitoring
 * - Real-time rate limit status
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AIRateLimitControlScreen(
    onNavigateBack: () -> Unit,
    viewModel: AIRateLimitViewModel = hiltViewModel()
) {
    val rateLimitConfig by viewModel.rateLimitConfig.collectAsStateWithLifecycle()
    val usageStatistics by viewModel.usageStatistics.collectAsStateWithLifecycle()
    val rateLimitStatus by viewModel.rateLimitStatus.collectAsStateWithLifecycle()
    val isLoading by viewModel.isLoading.collectAsStateWithLifecycle()
    
    var showGlobalLimitDialog by remember { mutableStateOf(false) }
    var showProviderLimitDialog by remember { mutableStateOf(false) }
    var selectedProvider by remember { mutableStateOf(LocalAIProvider.OPENAI) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, null)
                    }
                },
                title = {
                    Text("AI Rate Limit Controls")
                }
            )
        }
    ) { padding ->
        if (isLoading) {
            Box(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding),
                contentAlignment = Alignment.Center
            ) {
                CircularProgressIndicator()
            }
        } else {
            LazyColumn(
                modifier = Modifier
                    .fillMaxSize()
                    .padding(padding)
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                // Status Card
                item {
                    RateLimitStatusCard(
                        status = rateLimitStatus,
                        config = rateLimitConfig
                    )
                }
                
                // Global Limits
                item {
                    GlobalLimitsCard(
                        config = rateLimitConfig,
                        onEditGlobalLimit = { showGlobalLimitDialog = true }
                    )
                }
                
                // Provider Limits
                item {
                    ProviderLimitsCard(
                        config = rateLimitConfig,
                        onEditProviderLimit = { provider ->
                            selectedProvider = provider
                            showProviderLimitDialog = true
                        }
                    )
                }
                
                // Usage Statistics
                item {
                    UsageStatisticsCard(
                        statistics = usageStatistics
                    )
                }
                
                // Quick Actions
                item {
                    QuickActionsCard(
                        config = rateLimitConfig,
                        onEnableRateLimiting = { viewModel.enableRateLimiting() },
                        onDisableRateLimiting = { viewModel.disableRateLimiting() },
                        onResetStatistics = { viewModel.resetStatistics() },
                        onRefreshStats = { viewModel.refreshStatistics() }
                    )
                }
            }
        }
    }
    
    // Global Limit Dialog
    if (showGlobalLimitDialog) {
        GlobalLimitDialog(
            currentLimit = rateLimitConfig.globalLimit,
            onDismiss = { showGlobalLimitDialog = false },
            onSave = { newLimit ->
                viewModel.updateGlobalLimit(newLimit)
                showGlobalLimitDialog = false
            }
        )
    }
    
    // Provider Limit Dialog
    if (showProviderLimitDialog) {
        ProviderLimitDialog(
            provider = selectedProvider,
            currentLimit = rateLimitConfig.providerLimits[selectedProvider.name] ?: 60,
            onDismiss = { showProviderLimitDialog = false },
            onSave = { newLimit ->
                viewModel.updateProviderLimit(selectedProvider, newLimit)
                showProviderLimitDialog = false
            }
        )
    }
}

@Composable
private fun RateLimitStatusCard(
    status: LocalRateLimitStatus,
    config: RateLimitConfig
) {
    val (statusColor, statusText, statusIcon) = when (status) {
        LocalRateLimitStatus.ALLOWED -> Triple(
            Color(0xFF4CAF50),
            "Rate Limiting Active",
            Icons.Filled.CheckCircle
        )
        LocalRateLimitStatus.GLOBAL_LIMIT_EXCEEDED -> Triple(
            Color(0xFFFF9800),
            "Global Limit Exceeded",
            Icons.Filled.Warning
        )
        LocalRateLimitStatus.PROVIDER_LIMIT_EXCEEDED -> Triple(
            Color(0xFFFF9800),
            "Provider Limit Exceeded",
            Icons.Filled.Warning
        )
        LocalRateLimitStatus.RATE_LIMIT_DISABLED -> Triple(
            Color(0xFF9E9E9E),
            "Rate Limiting Disabled",
            Icons.Filled.Block
        )
        else -> Triple(
            Color(0xFFF44336),
            "Rate Limit Error",
            Icons.Filled.Error
        )
    }
    
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.SpaceBetween
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(12.dp)
            ) {
                Icon(
                    imageVector = statusIcon,
                    contentDescription = "Media image",
                    tint = statusColor,
                    modifier = Modifier.size(24.dp)
                )
                Column {
                    Text(
                        text = statusText,
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Bold
                    )
                    Text(
                        text = if (config.enabled) "Global: ${config.globalLimit} req/min" else "Disabled",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
            
            Switch(
                checked = config.enabled,
                onCheckedChange = { /* Handled in quick actions */ }
            )
        }
    }
}

@Composable
private fun GlobalLimitsCard(
    config: RateLimitConfig,
    onEditGlobalLimit: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Text(
                    text = "Global Limits",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                IconButton(onClick = onEditGlobalLimit) {
                    Icon(Icons.Filled.Edit, contentDescription = "Edit")
                }
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.SpaceBetween,
                verticalAlignment = Alignment.CenterVertically
            ) {
                Column {
                    Text(
                        text = "Requests per Minute",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "${config.globalLimit} requests",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Column(
                    horizontalAlignment = Alignment.End
                ) {
                    Text(
                        text = "Burst Capacity",
                        style = MaterialTheme.typography.bodyMedium
                    )
                    Text(
                        text = "${config.burstCapacity} requests",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
            }
        }
    }
}

@Composable
private fun ProviderLimitsCard(
    config: RateLimitConfig,
    onEditProviderLimit: (LocalAIProvider) -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Provider Limits",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            LocalAIProvider.values().forEach { provider ->
                val limit = config.providerLimits[provider.name] ?: 60
                val providerName = when (provider) {
                    LocalAIProvider.OPENAI -> "OpenAI GPT"
                    LocalAIProvider.GEMINI -> "Google Gemini"
                    LocalAIProvider.OLLAMA -> "Local Ollama"
                    LocalAIProvider.CUSTOM -> "Custom Provider"
                }
                
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(vertical = 8.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = providerName,
                        style = MaterialTheme.typography.bodyMedium
                    )
                    
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        horizontalArrangement = Arrangement.spacedBy(8.dp)
                    ) {
                        Text(
                            text = "$limit req/min",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        IconButton(
                            onClick = { onEditProviderLimit(provider) },
                            modifier = Modifier.size(32.dp)
                        ) {
                            Icon(
                                Icons.Filled.Edit,
                                contentDescription = "Edit ${providerName}",
                                modifier = Modifier.size(16.dp)
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun UsageStatisticsCard(
    statistics: LocalUsageStatistics?
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Usage Statistics",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            if (statistics != null) {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column {
                        Text(
                            text = "Total Requests",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = "${statistics.totalRequests}",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    
                    Column(
                        horizontalAlignment = Alignment.End
                    ) {
                        Text(
                            text = "Requests/Minute",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = String.format("%.1f", statistics.requestsPerMinute),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                Spacer(modifier = Modifier.height(8.dp))
                
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.SpaceBetween
                ) {
                    Column {
                        Text(
                            text = "Requests/Day",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = String.format("%.0f", statistics.requestsPerDay),
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                    
                    Column(
                        horizontalAlignment = Alignment.End
                    ) {
                        Text(
                            text = "Blocked Requests",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            text = "${statistics.blockedRequests}",
                            style = MaterialTheme.typography.bodySmall,
                            color = if (statistics.blockedRequests > 0) 
                                Color.Red else MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            } else {
                Text(
                    text = "Statistics not available",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun QuickActionsCard(
    config: RateLimitConfig,
    onEnableRateLimiting: () -> Unit,
    onDisableRateLimiting: () -> Unit,
    onResetStatistics: () -> Unit,
    onRefreshStats: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        elevation = CardDefaults.cardElevation(defaultElevation = 2.dp)
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = "Quick Actions",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Bold
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Button(
                    onClick = if (config.enabled) onDisableRateLimiting else onEnableRateLimiting,
                    modifier = Modifier.weight(1f),
                    colors = ButtonDefaults.buttonColors(
                        containerColor = if (config.enabled) Color.Red else Color(0xFF4CAF50)
                    )
                ) {
                    Text(if (config.enabled) "Disable" else "Enable")
                }
                
                OutlinedButton(
                    onClick = onRefreshStats,
                    modifier = Modifier.weight(1f)
                ) {
                    Text("Refresh")
                }
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            OutlinedButton(
                onClick = onResetStatistics,
                modifier = Modifier.fillMaxWidth()
            ) {
                Text("Reset Statistics")
            }
        }
    }
}

@Composable
private fun GlobalLimitDialog(
    currentLimit: Int,
    onDismiss: () -> Unit,
    onSave: (Int) -> Unit
) {
    var limitInput by remember { mutableStateOf(currentLimit.toString()) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Edit Global Rate Limit")
        },
        text = {
            Column {
                Text(
                    text = "Set the maximum number of requests per minute for all AI providers:",
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(16.dp))
                OutlinedTextField(
                    value = limitInput,
                    onValueChange = { limitInput = it },
                    label = { Text("Requests per Minute") },
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                    singleLine = true
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val newLimit = limitInput.toIntOrNull()
                    if (newLimit != null && newLimit > 0) {
                        onSave(newLimit)
                    }
                }
            ) {
                Text("Save")
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
private fun ProviderLimitDialog(
    provider: LocalAIProvider,
    currentLimit: Int,
    onDismiss: () -> Unit,
    onSave: (Int) -> Unit
) {
    var limitInput by remember { mutableStateOf(currentLimit.toString()) }
    val providerName = when (provider) {
        LocalAIProvider.OPENAI -> "OpenAI GPT"
        LocalAIProvider.GEMINI -> "Google Gemini"
        LocalAIProvider.OLLAMA -> "Local Ollama"
        LocalAIProvider.CUSTOM -> "Custom Provider"
    }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        title = {
            Text("Edit $providerName Rate Limit")
        },
        text = {
            Column {
                Text(
                    text = "Set the maximum number of requests per minute for $providerName:",
                    style = MaterialTheme.typography.bodyMedium
                )
                Spacer(modifier = Modifier.height(16.dp))
                OutlinedTextField(
                    value = limitInput,
                    onValueChange = { limitInput = it },
                    label = { Text("Requests per Minute") },
                    keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
                    singleLine = true
                )
            }
        },
        confirmButton = {
            TextButton(
                onClick = {
                    val newLimit = limitInput.toIntOrNull()
                    if (newLimit != null && newLimit > 0) {
                        onSave(newLimit)
                    }
                }
            ) {
                Text("Save")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}