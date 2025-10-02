package com.universalmedialibrary.ui.writer

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun DocumentEditorScreen(
	title: String,
	initialText: String,
	onBack: () -> Unit
) {
	var docTitle by remember { mutableStateOf(title) }
	var content by remember { mutableStateOf(initialText) }

	Scaffold(
		topBar = {
			TopAppBar(
				title = { Text("Document Editor", fontWeight = FontWeight.SemiBold) },
				navigationIcon = {
					IconButton(onClick = onBack) { Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back") }
				},
				actions = {
					TextButton(onClick = { /* TODO: Save to storage */ }) { Text("Save") }
				}
			)
		}
	) { paddingValues ->
		Column(
			modifier = Modifier
				.fillMaxSize()
				.padding(paddingValues)
				.padding(16.dp),
			verticalArrangement = Arrangement.spacedBy(12.dp)
		) {
			OutlinedTextField(
				value = docTitle,
				onValueChange = { docTitle = it },
				label = { Text("Title") },
				modifier = Modifier.fillMaxWidth()
			)
			OutlinedTextField(
				value = content,
				onValueChange = { content = it },
				label = { Text("Content") },
				modifier = Modifier
					.fillMaxWidth()
					.weight(1f),
				minLines = 10,
				maxLines = Int.MAX_VALUE
			)
		}
	}
}

