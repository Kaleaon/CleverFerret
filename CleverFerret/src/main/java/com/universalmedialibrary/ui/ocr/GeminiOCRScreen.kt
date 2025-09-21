package com.universalmedialibrary.ui.ocr

import android.net.Uri
import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.animation.core.*
import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ai.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

/**
 * Gemini OCR Screen for Enhanced Book Content Recognition
 * 
 * Advanced OCR interface that allows users to:
 * - Extract text from older PDFs without selectable text
 * - Process scanned books and handwritten documents
 * - Analyze document content and extract metadata
 * - Configure OCR settings and quality options
 * - Monitor processing progress in real-time
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun GeminiOCRScreen(
    onBack: () -> Unit,
    viewModel: GeminiOCRViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val uiState by viewModel.uiState.collectAsState()
    val ocrState by viewModel.ocrState.collectAsState()
    
    // File picker for PDFs and images
    val documentPicker = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent()
    ) { uri ->
        uri?.let { viewModel.selectDocument(it) }
    }
    
    val multipleImagePicker = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetMultipleContents()
    ) { uris ->
        if (uris.isNotEmpty()) {
            viewModel.selectMultipleImages(uris)
        }
    }
    
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        // Top App Bar
        TopAppBar(
            title = { 
                Text(
                    "Gemini AI OCR",
                    style = MaterialTheme.typography.headlineSmall,
                    fontWeight = FontWeight.Bold
                )
            },
            navigationIcon = {
                IconButton(onClick = onBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = "Back")
                }
            },
            colors = TopAppBarDefaults.topAppBarColors(
                containerColor = MaterialTheme.colorScheme.surface
            )
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // API Key Input
        if (!uiState.hasApiKey) {
            ApiKeyInput(
                apiKey = uiState.apiKey,
                onApiKeyChange = viewModel::updateApiKey,
                onSaveApiKey = viewModel::saveApiKey,
                modifier = Modifier.fillMaxWidth()
            )
            
            Spacer(modifier = Modifier.height(24.dp))
        }
        
        // OCR Options
        OCROptionsCard(
            options = uiState.ocrOptions,
            onOptionsChange = viewModel::updateOCROptions,
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Document Selection
        DocumentSelectionCard(
            selectedDocument = uiState.selectedDocument,
            selectedImages = uiState.selectedImages,
            onSelectPDF = { documentPicker.launch("application/pdf") },
            onSelectImages = { multipleImagePicker.launch("image/*") },
            onClearSelection = viewModel::clearSelection,
            modifier = Modifier.fillMaxWidth()
        )
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Process Button
        if (uiState.canProcess && uiState.hasApiKey) {
            Button(
                onClick = viewModel::startOCRProcessing,
                enabled = !ocrState.isProcessing,
                modifier = Modifier.fillMaxWidth()
            ) {
                if (ocrState.isProcessing) {
                    CircularProgressIndicator(
                        modifier = Modifier.size(16.dp),
                        strokeWidth = 2.dp,
                        color = MaterialTheme.colorScheme.onPrimary
                    )
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Processing...")
                } else {
                    Icon(Icons.Default.Psychology, contentDescription = null)
                    Spacer(modifier = Modifier.width(8.dp))
                    Text("Start AI OCR Processing")
                }
            }
        }
        
        Spacer(modifier = Modifier.height(16.dp))
        
        // Processing Status
        if (ocrState.isProcessing || uiState.lastResult != null) {
            ProcessingStatusCard(
                ocrState = ocrState,
                lastResult = uiState.lastResult,
                modifier = Modifier.fillMaxWidth()
            )
        }
        
        // Results
        if (uiState.lastResult?.success == true) {
            Spacer(modifier = Modifier.height(16.dp))
            
            OCRResultsCard(
                result = uiState.lastResult!!,
                onSaveToLibrary = { result -> 
                    viewModel.saveResultToLibrary(result)
                },
                onExportText = { result ->
                    viewModel.exportExtractedText(result)
                },
                modifier = Modifier.fillMaxWidth()
            )
        }
    }
    
    // Show any errors
    uiState.error?.let { error ->
        LaunchedEffect(error) {
            // You could show a snackbar here
        }
    }
}

@Composable
private fun ApiKeyInput(
    apiKey: String,
    onApiKeyChange: (String) -> Unit,
    onSaveApiKey: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(
        modifier = modifier,
        colors = CardDefaults.cardColors(
            containerColor = MaterialTheme.colorScheme.primaryContainer
        )
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Row(
                verticalAlignment = Alignment.CenterVertically
            ) {
                Icon(
                    Icons.Default.Key,
                    contentDescription = null,
                    tint = MaterialTheme.colorScheme.onPrimaryContainer
                )
                Spacer(modifier = Modifier.width(8.dp))
                Text(
                    "Gemini API Key Required",
                    style = MaterialTheme.typography.titleMedium,
                    fontWeight = FontWeight.Medium,
                    color = MaterialTheme.colorScheme.onPrimaryContainer
                )
            }
            
            Spacer(modifier = Modifier.height(12.dp))
            
            OutlinedTextField(
                value = apiKey,
                onValueChange = onApiKeyChange,
                label = { Text("Enter Gemini API Key") },
                placeholder = { Text("AIzaSy...") },
                modifier = Modifier.fillMaxWidth(),
                singleLine = true
            )
            
            Spacer(modifier = Modifier.height(8.dp))
            
            Row(
                horizontalArrangement = Arrangement.SpaceBetween,
                modifier = Modifier.fillMaxWidth()
            ) {
                TextButton(
                    onClick = { /* Open help/documentation */ }
                ) {
                    Text("Get API Key")
                }
                
                Button(
                    onClick = onSaveApiKey,
                    enabled = apiKey.isNotBlank()
                ) {
                    Text("Save Key")
                }
            }
        }
    }
}

@Composable
private fun OCROptionsCard(
    options: GeminiOCROptions,
    onOptionsChange: (GeminiOCROptions) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                "OCR Settings",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Image Quality
            Column {
                Text(
                    "Image Quality: ${options.imageQuality.name}",
                    style = MaterialTheme.typography.bodyMedium
                )
                Slider(
                    value = options.imageQuality.ordinal.toFloat(),
                    onValueChange = { value ->
                        val quality = ImageQuality.values()[value.toInt()]
                        onOptionsChange(options.copy(imageQuality = quality))
                    },
                    steps = ImageQuality.values().size - 2,
                    valueRange = 0f..(ImageQuality.values().size - 1).toFloat()
                )
            }
            
            Spacer(modifier = Modifier.height(8.dp))
            
            // Format Options
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilterChip(
                    selected = options.preserveFormatting,
                    onClick = { 
                        onOptionsChange(options.copy(preserveFormatting = !options.preserveFormatting))
                    },
                    label = { Text("Preserve Format") }
                )
                
                FilterChip(
                    selected = options.detectTables,
                    onClick = { 
                        onOptionsChange(options.copy(detectTables = !options.detectTables))
                    },
                    label = { Text("Detect Tables") }
                )
            }
            
            Spacer(modifier = Modifier.height(4.dp))
            
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                FilterChip(
                    selected = options.detectImages,
                    onClick = { 
                        onOptionsChange(options.copy(detectImages = !options.detectImages))
                    },
                    label = { Text("Detect Images") }
                )
                
                FilterChip(
                    selected = options.multiLanguage,
                    onClick = { 
                        onOptionsChange(options.copy(multiLanguage = !options.multiLanguage))
                    },
                    label = { Text("Multi-Language") }
                )
            }
        }
    }
}

@Composable
private fun DocumentSelectionCard(
    selectedDocument: Uri?,
    selectedImages: List<Uri>,
    onSelectPDF: () -> Unit,
    onSelectImages: () -> Unit,
    onClearSelection: () -> Unit,
    modifier: Modifier = Modifier
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                "Select Documents",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Selection buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = onSelectPDF,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.PictureAsPdf, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("PDF Book")
                }
                
                OutlinedButton(
                    onClick = onSelectImages,
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.Collections, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Images")
                }
            }
            
            // Selection status
            when {
                selectedDocument != null -> {
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(
                            Icons.Default.CheckCircle,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "PDF Selected: ${selectedDocument.lastPathSegment}",
                            style = MaterialTheme.typography.bodyMedium,
                            modifier = Modifier.weight(1f)
                        )
                        IconButton(onClick = onClearSelection) {
                            Icon(Icons.Default.Clear, contentDescription = "Clear")
                        }
                    }
                }
                selectedImages.isNotEmpty() -> {
                    Spacer(modifier = Modifier.height(8.dp))
                    Row(
                        verticalAlignment = Alignment.CenterVertically,
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Icon(
                            Icons.Default.CheckCircle,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.primary
                        )
                        Spacer(modifier = Modifier.width(8.dp))
                        Text(
                            "${selectedImages.size} images selected",
                            style = MaterialTheme.typography.bodyMedium,
                            modifier = Modifier.weight(1f)
                        )
                        IconButton(onClick = onClearSelection) {
                            Icon(Icons.Default.Clear, contentDescription = "Clear")
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun ProcessingStatusCard(
    ocrState: GeminiOCRState,
    lastResult: GeminiOCRResult?,
    modifier: Modifier = Modifier
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            when {
                ocrState.isProcessing -> {
                    Text(
                        "Processing with AI OCR",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium
                    )
                    
                    Spacer(modifier = Modifier.height(12.dp))
                    
                    LinearProgressIndicator(
                        progress = ocrState.progress,
                        modifier = Modifier.fillMaxWidth()
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    Text(
                        "Page ${ocrState.currentPage} of ${ocrState.totalPages}",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.onSurfaceVariant
                    )
                    
                    if (ocrState.progress > 0) {
                        val estimatedTotal = (System.currentTimeMillis() - ocrState.startTime) / ocrState.progress
                        val remainingTime = ((estimatedTotal * (1 - ocrState.progress)) / 1000).toInt()
                        Text(
                            "Estimated time remaining: ${remainingTime}s",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
                
                lastResult != null -> {
                    Text(
                        if (lastResult.success) "OCR Completed Successfully" else "OCR Failed",
                        style = MaterialTheme.typography.titleMedium,
                        fontWeight = FontWeight.Medium,
                        color = if (lastResult.success) 
                            MaterialTheme.colorScheme.primary 
                        else 
                            MaterialTheme.colorScheme.error
                    )
                    
                    Spacer(modifier = Modifier.height(8.dp))
                    
                    if (lastResult.success) {
                        Text(
                            "Extracted ${lastResult.totalText.length} characters",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            "Average confidence: ${String.format("%.1f", lastResult.confidence * 100)}%",
                            style = MaterialTheme.typography.bodyMedium
                        )
                        Text(
                            "Processing time: ${lastResult.processingTimeMs / 1000}s",
                            style = MaterialTheme.typography.bodySmall,
                            color = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    } else {
                        Text(
                            lastResult.error ?: "Unknown error occurred",
                            style = MaterialTheme.typography.bodyMedium,
                            color = MaterialTheme.colorScheme.error
                        )
                    }
                }
            }
            
            ocrState.error?.let { error ->
                Text(
                    error,
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.error
                )
            }
        }
    }
}

@Composable
private fun OCRResultsCard(
    result: GeminiOCRResult,
    onSaveToLibrary: (GeminiOCRResult) -> Unit,
    onExportText: (GeminiOCRResult) -> Unit,
    modifier: Modifier = Modifier
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                "OCR Results",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(12.dp))
            
            // Document Analysis
            result.documentAnalysis?.let { analysis ->
                Card(
                    colors = CardDefaults.cardColors(
                        containerColor = MaterialTheme.colorScheme.secondaryContainer
                    )
                ) {
                    Column(
                        modifier = Modifier.padding(12.dp)
                    ) {
                        Text(
                            "Document Analysis",
                            style = MaterialTheme.typography.titleSmall,
                            fontWeight = FontWeight.Medium
                        )
                        Spacer(modifier = Modifier.height(8.dp))
                        
                        analysis.title?.let { title ->
                            Text("Title: $title", style = MaterialTheme.typography.bodySmall)
                        }
                        analysis.author?.let { author ->
                            Text("Author: $author", style = MaterialTheme.typography.bodySmall)
                        }
                        analysis.language?.let { language ->
                            Text("Language: $language", style = MaterialTheme.typography.bodySmall)
                        }
                        analysis.contentType?.let { contentType ->
                            Text("Type: $contentType", style = MaterialTheme.typography.bodySmall)
                        }
                    }
                }
                
                Spacer(modifier = Modifier.height(12.dp))
            }
            
            // Text Preview
            Text(
                "Extracted Text Preview:",
                style = MaterialTheme.typography.bodyMedium,
                fontWeight = FontWeight.Medium
            )
            
            Spacer(modifier = Modifier.height(4.dp))
            
            Text(
                result.totalText.take(500) + if (result.totalText.length > 500) "..." else "",
                style = MaterialTheme.typography.bodySmall,
                modifier = Modifier
                    .fillMaxWidth()
                    .background(
                        MaterialTheme.colorScheme.surfaceVariant,
                        RoundedCornerShape(8.dp)
                    )
                    .padding(12.dp)
            )
            
            Spacer(modifier = Modifier.height(16.dp))
            
            // Action Buttons
            Row(
                modifier = Modifier.fillMaxWidth(),
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                OutlinedButton(
                    onClick = { onExportText(result) },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.FileDownload, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Export Text")
                }
                
                Button(
                    onClick = { onSaveToLibrary(result) },
                    modifier = Modifier.weight(1f)
                ) {
                    Icon(Icons.Default.SaveAs, contentDescription = null)
                    Spacer(modifier = Modifier.width(4.dp))
                    Text("Save to Library")
                }
            }
        }
    }
}

@HiltViewModel
class GeminiOCRViewModel @Inject constructor(
    private val geminiOCRService: GeminiOCRService
) : ViewModel() {
    
    private val _uiState = MutableStateFlow(GeminiOCRUIState())
    val uiState: StateFlow<GeminiOCRUIState> = _uiState.asStateFlow()
    
    val ocrState = geminiOCRService.ocrState
    
    fun updateApiKey(apiKey: String) {
        _uiState.value = _uiState.value.copy(apiKey = apiKey)
    }
    
    fun saveApiKey() {
        _uiState.value = _uiState.value.copy(hasApiKey = _uiState.value.apiKey.isNotBlank())
    }
    
    fun updateOCROptions(options: GeminiOCROptions) {
        _uiState.value = _uiState.value.copy(ocrOptions = options)
    }
    
    fun selectDocument(uri: Uri) {
        _uiState.value = _uiState.value.copy(
            selectedDocument = uri,
            selectedImages = emptyList(),
            canProcess = true
        )
    }
    
    fun selectMultipleImages(uris: List<Uri>) {
        _uiState.value = _uiState.value.copy(
            selectedDocument = null,
            selectedImages = uris,
            canProcess = uris.isNotEmpty()
        )
    }
    
    fun clearSelection() {
        _uiState.value = _uiState.value.copy(
            selectedDocument = null,
            selectedImages = emptyList(),
            canProcess = false
        )
    }
    
    fun startOCRProcessing() {
        val state = _uiState.value
        if (!state.hasApiKey || !state.canProcess) return
        
        viewModelScope.launch {
            try {
                val result = when {
                    state.selectedDocument != null -> {
                        geminiOCRService.extractTextFromPDF(
                            state.selectedDocument,
                            state.apiKey,
                            state.ocrOptions
                        )
                    }
                    state.selectedImages.isNotEmpty() -> {
                        geminiOCRService.extractFromScannedBook(
                            state.selectedImages,
                            state.apiKey
                        )
                    }
                    else -> return@launch
                }
                
                _uiState.value = _uiState.value.copy(
                    lastResult = result,
                    error = if (!result.success) result.error else null
                )
                
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    error = "Processing failed: ${e.message}"
                )
            }
        }
    }
    
    fun saveResultToLibrary(result: GeminiOCRResult) {
        // Implementation for saving to media library
        viewModelScope.launch {
            // Save extracted text and metadata to library
        }
    }
    
    fun exportExtractedText(result: GeminiOCRResult) {
        // Implementation for exporting text to file
        viewModelScope.launch {
            // Export text to file system
        }
    }
}

data class GeminiOCRUIState(
    val apiKey: String = "",
    val hasApiKey: Boolean = false,
    val ocrOptions: GeminiOCROptions = GeminiOCROptions(),
    val selectedDocument: Uri? = null,
    val selectedImages: List<Uri> = emptyList(),
    val canProcess: Boolean = false,
    val lastResult: GeminiOCRResult? = null,
    val error: String? = null
)