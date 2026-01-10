package com.universalmedialibrary.ui.reader

import android.content.Context
import android.graphics.Bitmap
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import dagger.hilt.android.lifecycle.HiltViewModel
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PDFReaderViewModel @Inject constructor(
    @ApplicationContext private val context: Context
) : ViewModel() {

    private val _uiState = MutableStateFlow(PDFReaderUiState())
    val uiState: StateFlow<PDFReaderUiState> = _uiState.asStateFlow()

    private val _annotationMode = MutableStateFlow(false)
    val annotationMode: StateFlow<Boolean> = _annotationMode.asStateFlow()

    private val _selectedAnnotationTool = MutableStateFlow(AnnotationTool.HIGHLIGHT)
    val selectedAnnotationTool: StateFlow<AnnotationTool> = _selectedAnnotationTool.asStateFlow()

    private val _annotations = MutableStateFlow<List<Annotation>>(emptyList())
    val annotations: StateFlow<List<Annotation>> = _annotations.asStateFlow()
    
    private val _bookmarks = MutableStateFlow<List<Int>>(emptyList())
    val bookmarks: StateFlow<List<Int>> = _bookmarks.asStateFlow()

    data class PDFReaderUiState(
        val isLoading: Boolean = false,
        val isLoaded: Boolean = false,
        val error: String? = null,
        val documentTitle: String = "",
        val filePath: String = "",
        val currentPage: Int = 1,
        val totalPages: Int = 0,
        val currentPageContent: String = "",
        val showSearch: Boolean = false,
        val searchQuery: String = "",
        val searchResults: List<SearchResult> = emptyList(),
        val zoomLevel: Float = 1.0f,
        val zoomMode: ZoomMode = ZoomMode.FIT_WIDTH,
        val showPageSelector: Boolean = false,
        val showBookmarks: Boolean = false,
        val brightness: Float = 1.0f,
        val nightMode: Boolean = false,
        val continuousScroll: Boolean = false,
        val pageRotation: Int = 0
    )

    fun loadPDF(filePath: String) {
        viewModelScope.launch {
            _uiState.value = _uiState.value.copy(
                isLoading = true, 
                error = null,
                filePath = filePath
            )

            try {
                // Simulate loading a PDF - in real implementation, this would use the PdfReaderEngine
                kotlinx.coroutines.delay(1000)
                
                // Extract filename from path
                val documentTitle = filePath.substringAfterLast("/").substringBeforeLast(".")
                    .ifEmpty { "PDF Document" }

                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    isLoaded = true,
                    documentTitle = documentTitle,
                    totalPages = 25,
                    currentPage = 1,
                    currentPageContent = generateSamplePDFContent(1)
                )
            } catch (e: Exception) {
                _uiState.value = _uiState.value.copy(
                    isLoading = false,
                    error = "Failed to load PDF: ${e.message}"
                )
            }
        }
    }

    fun nextPage() {
        val currentState = _uiState.value
        if (currentState.currentPage < currentState.totalPages) {
            val newPage = currentState.currentPage + 1
            _uiState.value = currentState.copy(
                currentPage = newPage,
                currentPageContent = generateSamplePDFContent(newPage)
            )
        }
    }

    fun previousPage() {
        val currentState = _uiState.value
        if (currentState.currentPage > 1) {
            val newPage = currentState.currentPage - 1
            _uiState.value = currentState.copy(
                currentPage = newPage,
                currentPageContent = generateSamplePDFContent(newPage)
            )
        }
    }

    fun goToPage(pageNumber: Int) {
        val currentState = _uiState.value
        val targetPage = pageNumber.coerceIn(1, currentState.totalPages)
        if (targetPage != currentState.currentPage && currentState.totalPages > 0) {
            _uiState.value = currentState.copy(
                currentPage = targetPage,
                currentPageContent = generateSamplePDFContent(targetPage)
            )
        }
    }

    fun toggleAnnotationMode() {
        _annotationMode.value = !_annotationMode.value
    }

    fun setAnnotationTool(tool: AnnotationTool) {
        _selectedAnnotationTool.value = tool
    }

    fun createAnnotation(annotation: Annotation) {
        val currentAnnotations = _annotations.value.toMutableList()
        currentAnnotations.add(annotation.copy(pageNumber = _uiState.value.currentPage))
        _annotations.value = currentAnnotations
    }

    fun deleteAnnotation(annotationId: Long) {
        _annotations.value = _annotations.value.filter { it.id != annotationId }
    }
    
    fun updateAnnotation(annotation: Annotation) {
        _annotations.value = _annotations.value.map { 
            if (it.id == annotation.id) annotation else it 
        }
    }

    fun toggleSearch() {
        _uiState.value = _uiState.value.copy(
            showSearch = !_uiState.value.showSearch,
            searchQuery = if (!_uiState.value.showSearch) "" else _uiState.value.searchQuery,
            searchResults = if (!_uiState.value.showSearch) emptyList() else _uiState.value.searchResults
        )
    }

    fun setSearchQuery(query: String) {
        _uiState.value = _uiState.value.copy(searchQuery = query)
        // Auto-search as user types
        if (query.length >= 2) {
            performSearch()
        }
    }

    fun performSearch() {
        val query = _uiState.value.searchQuery
        if (query.isNotEmpty()) {
            viewModelScope.launch {
                // Simulate search - in real implementation, this would search the PDF content
                val mockResults = (1..25).mapNotNull { page ->
                    if (page % 3 == 0 || page == 1) {
                        SearchResult(
                            pageNumber = page,
                            context = "...text containing '$query' found on page $page with surrounding context...",
                            position = androidx.compose.ui.geometry.Offset(100f, (page * 50).toFloat())
                        )
                    } else null
                }

                _uiState.value = _uiState.value.copy(searchResults = mockResults)
            }
        }
    }
    
    fun clearSearch() {
        _uiState.value = _uiState.value.copy(
            searchQuery = "",
            searchResults = emptyList()
        )
    }

    fun setZoomMode(mode: ZoomMode) {
        _uiState.value = _uiState.value.copy(zoomMode = mode)
    }

    fun setZoomLevel(level: Float) {
        _uiState.value = _uiState.value.copy(zoomLevel = level.coerceIn(0.5f, 5f))
    }
    
    fun zoomIn() {
        val currentZoom = _uiState.value.zoomLevel
        setZoomLevel(currentZoom + 0.25f)
    }
    
    fun zoomOut() {
        val currentZoom = _uiState.value.zoomLevel
        setZoomLevel(currentZoom - 0.25f)
    }
    
    fun resetZoom() {
        _uiState.value = _uiState.value.copy(
            zoomLevel = 1f,
            zoomMode = ZoomMode.FIT_WIDTH
        )
    }

    fun showPageSelector() {
        _uiState.value = _uiState.value.copy(showPageSelector = true)
    }
    
    fun hidePageSelector() {
        _uiState.value = _uiState.value.copy(showPageSelector = false)
    }

    fun showBookmarks() {
        _uiState.value = _uiState.value.copy(showBookmarks = true)
    }
    
    fun hideBookmarks() {
        _uiState.value = _uiState.value.copy(showBookmarks = false)
    }
    
    fun toggleBookmark() {
        val currentPage = _uiState.value.currentPage
        val currentBookmarks = _bookmarks.value.toMutableList()
        
        if (currentPage in currentBookmarks) {
            currentBookmarks.remove(currentPage)
        } else {
            currentBookmarks.add(currentPage)
            currentBookmarks.sort()
        }
        
        _bookmarks.value = currentBookmarks
    }
    
    fun isCurrentPageBookmarked(): Boolean {
        return _uiState.value.currentPage in _bookmarks.value
    }
    
    fun setBrightness(brightness: Float) {
        _uiState.value = _uiState.value.copy(brightness = brightness.coerceIn(0.1f, 1f))
    }
    
    fun toggleNightMode() {
        _uiState.value = _uiState.value.copy(nightMode = !_uiState.value.nightMode)
    }
    
    fun toggleContinuousScroll() {
        _uiState.value = _uiState.value.copy(continuousScroll = !_uiState.value.continuousScroll)
    }
    
    fun rotatePage() {
        val currentRotation = _uiState.value.pageRotation
        val newRotation = (currentRotation + 90) % 360
        _uiState.value = _uiState.value.copy(pageRotation = newRotation)
    }
    
    fun getAnnotationsForPage(page: Int): List<Annotation> {
        return _annotations.value.filter { it.pageNumber == page }
    }
    
    fun exportAnnotations(): String {
        val annotations = _annotations.value
        return buildString {
            appendLine("PDF Annotations Export")
            appendLine("Document: ${_uiState.value.documentTitle}")
            appendLine("Total Annotations: ${annotations.size}")
            appendLine("---")
            
            annotations.groupBy { it.pageNumber }.forEach { (page, pageAnnotations) ->
                appendLine("\nPage $page:")
                pageAnnotations.forEach { annotation ->
                    appendLine("  - ${annotation.type}: ${annotation.content}")
                }
            }
        }
    }

    private fun generateSamplePDFContent(pageNumber: Int): String {
        return """
Page $pageNumber

This is sample content for page $pageNumber of the PDF document. The Enhanced PDF Reader provides comprehensive tools for viewing and interacting with PDF documents.

Key Features:

1. Zoom Controls
   • Pinch-to-zoom for intuitive scaling
   • Double-tap to zoom in/out quickly
   • Zoom level indicator (50% - 500%)
   • Fit Width and Fit Page modes
   • Reset zoom button

2. Text Selection & Copy
   • Enable text selection mode
   • Select any text in the document
   • Copy to clipboard functionality
   • Highlight selected text
   
3. Navigation
   • Page slider for quick navigation
   • Go to specific page dialog
   • Previous/Next page buttons
   • Page thumbnail strip
   • Bookmark pages for later

4. Annotations
   • Highlight important text
   • Add notes to pages
   • Draw freehand annotations
   • Strikethrough text
   • View and manage annotations

5. Search
   • Full-text search
   • Navigate between results
   • Highlighted search matches

6. Reading Settings
   • Adjustable brightness
   • Night mode for dark reading
   • Continuous scroll mode
   • Page rotation

Sample paragraph for page $pageNumber:

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.

Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Additional content for testing scroll and zoom functionality on page $pageNumber. This paragraph is added to demonstrate how the reader handles longer content and multiple sections within a single page.

The PDF reader supports various document features including:
• Tables and formatted data
• Images and graphics
• Hyperlinks
• Form fields
• Security features

[End of Page $pageNumber]
        """.trimIndent()
    }
}
