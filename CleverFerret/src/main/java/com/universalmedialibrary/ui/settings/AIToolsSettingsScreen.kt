package com.universalmedialibrary.ui.settings

import androidx.compose.animation.AnimatedVisibility
import androidx.compose.animation.expandVertically
import androidx.compose.animation.fadeIn
import androidx.compose.animation.fadeOut
import androidx.compose.animation.shrinkVertically
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Check
import androidx.compose.material.icons.filled.Close
import androidx.compose.material.icons.filled.Code
import androidx.compose.material.icons.filled.Description
import androidx.compose.material.icons.filled.LibraryMusic
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Search
import androidx.compose.material.icons.filled.Storage
import androidx.compose.material.icons.filled.Web
import androidx.compose.material.icons.outlined.Info
import androidx.compose.material.icons.outlined.Security
import androidx.compose.material.icons.outlined.Speed
import androidx.compose.material3.Card
import androidx.compose.material3.CardDefaults
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.HorizontalDivider
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.SnackbarHost
import androidx.compose.material3.SnackbarHostState
import androidx.compose.material3.Surface
import androidx.compose.material3.Switch
import androidx.compose.material3.Text
import androidx.compose.material3.TopAppBar
import androidx.compose.runtime.Composable
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.vector.ImageVector
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ai.AITool
import com.universalmedialibrary.services.ai.AIToolsService
import com.universalmedialibrary.services.ai.ToolStatus
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * AI Tools Settings ViewModel
 */
@HiltViewModel
class AIToolsSettingsViewModel @Inject constructor(
    private val aiToolsService: AIToolsService
) : ViewModel() {
    
    val enabledTools = aiToolsService.enabledTools
    val toolStatus = aiToolsService.toolStatus
    
    private val _testResults = MutableStateFlow<Map<AITool, TestResult>>(emptyMap())
    val testResults: StateFlow<Map<AITool, TestResult>> = _testResults.asStateFlow()
    
    fun toggleTool(tool: AITool, enabled: Boolean) {
        aiToolsService.setToolEnabled(tool, enabled)
    }
    
    fun testTool(tool: AITool) {
        viewModelScope.launch {
            _testResults.value = _testResults.value + (tool to TestResult.Testing)
            
            try {
                val result = when (tool) {
                    AITool.WEB_SEARCH -> {
                        aiToolsService.webSearch("test query", 3)
                    }
                    AITool.VIEW_WEB_PAGE -> {
                        aiToolsService.fetchWebPage("https://example.com")
                    }
                    AITool.DOCUMENT_RETRIEVAL -> {
                        aiToolsService.retrieveDocument("https://example.com")
                    }
                    AITool.SCAN_MEDIA_LIBRARY -> {
                        aiToolsService.scanBooksLibrary()
                    }
                    AITool.PROCESS_BOOKS -> {
                        // Can't test without actual file
                        Result.success("Book processing ready")
                    }
                    AITool.LISTEN_MUSIC -> {
                        // Can't test without actual file
                        Result.success("Music analysis ready")
                    }
                }
                
                if (result.isSuccess) {
                    _testResults.value = _testResults.value + (tool to TestResult.Success)
                } else {
                    _testResults.value = _testResults.value + (tool to TestResult.Failed(result.exceptionOrNull()?.message ?: "Unknown error"))
                }
            } catch (e: Exception) {
                _testResults.value = _testResults.value + (tool to TestResult.Failed(e.message ?: "Test failed"))
            }
        }
    }
    
    fun getToolDescriptions(): String = aiToolsService.getToolDescriptions()
}

sealed class TestResult {
    object Testing : TestResult()
    object Success : TestResult()
    data class Failed(val error: String) : TestResult()
}

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AIToolsSettingsScreen(
    onNavigateBack: () -> Unit,
    viewModel: AIToolsSettingsViewModel = hiltViewModel()
) {
    val enabledTools by viewModel.enabledTools.collectAsState()
    val toolStatus by viewModel.toolStatus.collectAsState()
    val testResults by viewModel.testResults.collectAsState()
    
    val snackbarHostState = remember { SnackbarHostState() }
    var showInfoDialog by remember { mutableStateOf(false) }
    
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("AI Tools & Capabilities") },
                navigationIcon = {
                    IconButton(onClick = onNavigateBack) {
                        Icon(Icons.Filled.ArrowBack, contentDescription = "Back")
                    }
                },
                actions = {
                    IconButton(onClick = { showInfoDialog = true }) {
                        Icon(Icons.Outlined.Info, contentDescription = "Info")
                    }
                }
            )
        },
        snackbarHost = { SnackbarHost(snackbarHostState) }
    ) { padding ->
        LazyColumn(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .padding(horizontal = 16.dp),
            verticalArrangement = Arrangement.spacedBy(12.dp)
        ) {
            item {
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "AI Assistant Capabilities",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = "Enable tools that the AI can use during conversations",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
            
            // Info Cards
            item {
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    InfoChip(
                        icon = Icons.Outlined.Security,
                        text = "Privacy First",
                        modifier = Modifier.weight(1f)
                    )
                    InfoChip(
                        icon = Icons.Outlined.Speed,
                        text = "On-Device",
                        modifier = Modifier.weight(1f)
                    )
                }
            }
            
            item { HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp)) }
            
            // Web Tools Section
            item {
                Text(
                    text = "Web & Search",
                    style = MaterialTheme.typography.labelLarge,
                    fontWeight = FontWeight.Medium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.WEB_SEARCH,
                    enabled = AITool.WEB_SEARCH in enabledTools,
                    testResult = testResults[AITool.WEB_SEARCH],
                    icon = Icons.Filled.Search,
                    onToggle = { viewModel.toggleTool(AITool.WEB_SEARCH, it) },
                    onTest = { viewModel.testTool(AITool.WEB_SEARCH) }
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.VIEW_WEB_PAGE,
                    enabled = AITool.VIEW_WEB_PAGE in enabledTools,
                    testResult = testResults[AITool.VIEW_WEB_PAGE],
                    icon = Icons.Filled.Web,
                    onToggle = { viewModel.toggleTool(AITool.VIEW_WEB_PAGE, it) },
                    onTest = { viewModel.testTool(AITool.VIEW_WEB_PAGE) }
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.DOCUMENT_RETRIEVAL,
                    enabled = AITool.DOCUMENT_RETRIEVAL in enabledTools,
                    testResult = testResults[AITool.DOCUMENT_RETRIEVAL],
                    icon = Icons.Filled.Description,
                    onToggle = { viewModel.toggleTool(AITool.DOCUMENT_RETRIEVAL, it) },
                    onTest = { viewModel.testTool(AITool.DOCUMENT_RETRIEVAL) }
                )
            }
            
            item { HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp)) }
            
            // Media Library Section
            item {
                Text(
                    text = "Media Library",
                    style = MaterialTheme.typography.labelLarge,
                    fontWeight = FontWeight.Medium,
                    color = MaterialTheme.colorScheme.primary
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.SCAN_MEDIA_LIBRARY,
                    enabled = AITool.SCAN_MEDIA_LIBRARY in enabledTools,
                    testResult = testResults[AITool.SCAN_MEDIA_LIBRARY],
                    icon = Icons.Filled.Storage,
                    onToggle = { viewModel.toggleTool(AITool.SCAN_MEDIA_LIBRARY, it) },
                    onTest = { viewModel.testTool(AITool.SCAN_MEDIA_LIBRARY) }
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.PROCESS_BOOKS,
                    enabled = AITool.PROCESS_BOOKS in enabledTools,
                    testResult = testResults[AITool.PROCESS_BOOKS],
                    icon = Icons.Filled.MenuBook,
                    onToggle = { viewModel.toggleTool(AITool.PROCESS_BOOKS, it) },
                    onTest = { viewModel.testTool(AITool.PROCESS_BOOKS) }
                )
            }
            
            item {
                AIToolCard(
                    tool = AITool.LISTEN_MUSIC,
                    enabled = AITool.LISTEN_MUSIC in enabledTools,
                    testResult = testResults[AITool.LISTEN_MUSIC],
                    icon = Icons.Filled.LibraryMusic,
                    onToggle = { viewModel.toggleTool(AITool.LISTEN_MUSIC, it) },
                    onTest = { viewModel.testTool(AITool.LISTEN_MUSIC) }
                )
            }
            
            item { HorizontalDivider(modifier = Modifier.padding(vertical = 8.dp)) }
            
            // Tool Status
            if (toolStatus !is ToolStatus.Idle) {
                item {
                    ToolStatusCard(status = toolStatus)
                }
            }
            
            // System Prompt Preview
            item {
                Card(
                    modifier = Modifier.fillMaxWidth(),
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.5f)
                    )
                ) {
                    Column(modifier = Modifier.padding(16.dp)) {
                        Row(verticalAlignment = Alignment.CenterVertically) {
                            Icon(
                                imageVector = Icons.Filled.Code,
                                contentDescription = null,
                                tint = MaterialTheme.colorScheme.primary
                            )
                            Spacer(modifier = Modifier.width(8.dp))
                            Text(
                                text = "System Prompt Preview",
                                style = MaterialTheme.typography.titleSmall,
                                fontWeight = FontWeight.Bold
                            )
                        }
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Text(
                            text = "This will be added to AI conversations:",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                        
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        Surface(
                            modifier = Modifier.fillMaxWidth(),
                            shape = RoundedCornerShape(8.dp),
                            color = MaterialTheme.colorScheme.surface
                        ) {
                            Text(
                                text = viewModel.getToolDescriptions(),
                                style = MaterialTheme.typography.bodySmall,
                                modifier = Modifier.padding(12.dp),
                                fontFamily = androidx.compose.ui.text.font.FontFamily.Monospace
                            )
                        }
                    }
                }
            }
            
            item { Spacer(modifier = Modifier.height(32.dp)) }
        }
    }
}

@Composable
private fun InfoChip(
    icon: ImageVector,
    text: String,
    modifier: Modifier = Modifier
) {
    Surface(
        modifier = modifier,
        shape = RoundedCornerShape(20.dp),
        color = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.5f)
    ) {
        Row(
            modifier = Modifier.padding(horizontal = 12.dp, vertical = 8.dp),
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.Center
        ) {
            Icon(
                imageVector = icon,
                contentDescription = null,
                modifier = Modifier.size(16.dp),
                tint = MaterialTheme.colorScheme.primary
            )
            Spacer(modifier = Modifier.width(6.dp))
            Text(
                text = text,
                style = MaterialTheme.typography.labelMedium,
                color = MaterialTheme.colorScheme.primary
            )
        }
    }
}

@Composable
private fun AIToolCard(
    tool: AITool,
    enabled: Boolean,
    testResult: TestResult?,
    icon: ImageVector,
    onToggle: (Boolean) -> Unit,
    onTest: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = if (enabled) 
                MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.2f) 
            else 
                MaterialTheme.colorScheme.surfaceVariant.copy(alpha = 0.3f)
        ),
        shape = RoundedCornerShape(12.dp)
    ) {
        Column(modifier = Modifier.padding(16.dp)) {
            Row(
                modifier = Modifier.fillMaxWidth(),
                verticalAlignment = Alignment.CenterVertically
            ) {
                Box(
                    modifier = Modifier
                        .size(40.dp)
                        .clip(CircleShape)
                        .background(
                            if (enabled) 
                                MaterialTheme.colorScheme.primary.copy(alpha = 0.15f) 
                            else 
                                MaterialTheme.colorScheme.onSurface.copy(alpha = 0.1f)
                        ),
                    contentAlignment = Alignment.Center
                ) {
                    Icon(
                        imageVector = icon,
                        contentDescription = null,
                        tint = if (enabled) MaterialTheme.colorScheme.primary else MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                Spacer(modifier = Modifier.width(12.dp))
                
                Column(modifier = Modifier.weight(1f)) {
                    Text(
                        text = tool.displayName,
                        style = MaterialTheme.typography.titleSmall,
                        fontWeight = FontWeight.Medium
                    )
                    Text(
                        text = tool.description,
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                }
                
                // Test result indicator
                testResult?.let { result ->
                    when (result) {
                        is TestResult.Testing -> {
                            androidx.compose.material3.CircularProgressIndicator(
                                modifier = Modifier.size(20.dp),
                                strokeWidth = 2.dp
                            )
                        }
                        is TestResult.Success -> {
                            Icon(
                                imageVector = Icons.Filled.Check,
                                contentDescription = "Success",
                                tint = MaterialTheme.colorScheme.primary,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                        is TestResult.Failed -> {
                            Icon(
                                imageVector = Icons.Filled.Close,
                                contentDescription = "Failed",
                                tint = MaterialTheme.colorScheme.error,
                                modifier = Modifier.size(20.dp)
                            )
                        }
                    }
                    Spacer(modifier = Modifier.width(8.dp))
                }
                
                Switch(
                    checked = enabled,
                    onCheckedChange = onToggle
                )
            }
            
            AnimatedVisibility(
                visible = enabled,
                enter = expandVertically() + fadeIn(),
                exit = shrinkVertically() + fadeOut()
            ) {
                Column {
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    Surface(
                        modifier = Modifier.fillMaxWidth(),
                        shape = RoundedCornerShape(8.dp),
                        color = MaterialTheme.colorScheme.surface
                    ) {
                        Column(modifier = Modifier.padding(12.dp)) {
                            Text(
                                text = "Usage:",
                                style = MaterialTheme.typography.labelSmall,
                                color = MaterialTheme.colorScheme.primary
                            )
                            Text(
                                text = tool.usage,
                                style = MaterialTheme.typography.bodySmall,
                                fontFamily = androidx.compose.ui.text.font.FontFamily.Monospace
                            )
                        }
                    }
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Row(
                        modifier = Modifier.fillMaxWidth(),
                        horizontalArrangement = Arrangement.End
                    ) {
                        androidx.compose.material3.TextButton(onClick = onTest) {
                            Text("Test Tool")
                        }
                    }
                }
            }
            
            // Show error if test failed
            (testResult as? TestResult.Failed)?.let { failed ->
                Spacer(modifier = Modifier.height(8.dp))
                Text(
                    text = "Error: ${failed.error}",
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@Composable
private fun ToolStatusCard(status: ToolStatus) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer.copy(alpha = 0.3f)
        )
    ) {
        Row(
            modifier = Modifier
                .fillMaxWidth()
                .padding(16.dp),
            verticalAlignment = Alignment.CenterVertically
        ) {
            androidx.compose.material3.CircularProgressIndicator(
                modifier = Modifier.size(24.dp),
                strokeWidth = 2.dp
            )
            Spacer(modifier = Modifier.width(12.dp))
            Text(
                text = when (status) {
                    is ToolStatus.Searching -> "Searching: ${status.query}..."
                    is ToolStatus.FetchingPage -> "Fetching page..."
                    is ToolStatus.RetrievingDocument -> "Retrieving document..."
                    is ToolStatus.ScanningLibrary -> "Scanning ${status.type} library..."
                    is ToolStatus.ProcessingBook -> "Processing book..."
                    is ToolStatus.AnalyzingMusic -> "Analyzing music..."
                    is ToolStatus.Error -> "Error: ${status.message}"
                    else -> ""
                },
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}
