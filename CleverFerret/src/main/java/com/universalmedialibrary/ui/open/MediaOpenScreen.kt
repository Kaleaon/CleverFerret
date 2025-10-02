package com.universalmedialibrary.ui.open

import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.hilt.navigation.compose.hiltViewModel
import com.universalmedialibrary.ui.reader.EPUBReaderScreen
import com.universalmedialibrary.ui.reader.DocumentReaderScreen
import com.universalmedialibrary.ui.reader.ComicReaderScreen

@Composable
fun MediaOpenScreen(
	itemId: Long,
	onBack: () -> Unit,
	viewModel: MediaOpenViewModel = hiltViewModel()
) {
	val uiState by viewModel.uiState.collectAsState()
	LaunchedEffect(itemId) { viewModel.load(itemId) }

	when {
		uiState.isLoading -> CircularProgressIndicator()
		u iState.error != null -> Text(uiState.error ?: "Error")
		uiState.mediaItem != null -> {
			val item = uiState.mediaItem
			val path = item.filePath
			val name = item.fileName
			val ext = name.substringAfterLast('.', "").lowercase()
			when {
				ext == "epub" -> EPUBReaderScreen(navController = object : androidx.navigation.NavController(LocalContext.current) {}, bookUri = path)
				ext in setOf("pdf", "txt", "html", "htm", "docx") -> DocumentReaderScreen(uriString = path, fileName = name, onBack = onBack)
				ext in setOf("cbz", "cbr") -> ComicReaderScreen(uriString = path, fileName = name, onBack = onBack)
				else -> Text("No viewer for .$ext")
			}
		}
	}
}

