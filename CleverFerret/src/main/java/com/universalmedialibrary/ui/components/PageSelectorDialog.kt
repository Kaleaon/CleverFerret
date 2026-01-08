package com.universalmedialibrary.ui.components

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Pages
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.unit.dp

/**
 * Page Selector Dialog
 * 
 * Allows users to jump to a specific page in a PDF or eBook by entering the page number.
 *
 * @param currentPage Current page number
 * @param totalPages Total number of pages
 * @param onPageSelect Callback with selected page number
 * @param onDismiss Callback when dialog is dismissed
 */
@Composable
fun PageSelectorDialog(
    currentPage: Int,
    totalPages: Int,
    onPageSelect: (Int) -> Unit,
    onDismiss: () -> Unit
) {
    var pageInput by remember { mutableStateOf(currentPage.toString()) }
    var errorMessage by remember { mutableStateOf<String?>(null) }
    
    AlertDialog(
        onDismissRequest = onDismiss,
        icon = {
            Icon(
                Icons.Default.Pages,
                contentDescription = "Media image",
                tint = MaterialTheme.colorScheme.primary
            )
        },
        title = {
            Text(
                "Go to Page",
                style = MaterialTheme.typography.headlineSmall,
                fontWeight = FontWeight.Bold
            )
        },
        text = {
            Column(
                modifier = Modifier.fillMaxWidth(),
                verticalArrangement = Arrangement.spacedBy(16.dp)
            ) {
                Text(
                    "Current: Page $currentPage of $totalPages",
                    style = MaterialTheme.typography.bodyMedium,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
                
                OutlinedTextField(
                    value = pageInput,
                    onValueChange = { newValue ->
                        pageInput = newValue
                        // Validate input
                        val pageNum = newValue.toIntOrNull()
                        errorMessage = when {
                            newValue.isBlank() -> "Please enter a page number"
                            pageNum == null -> "Invalid page number"
                            pageNum < 1 -> "Page must be at least 1"
                            pageNum > totalPages -> "Page cannot exceed $totalPages"
                            else -> null
                        }
                    },
                    label = { Text("Page Number") },
                    placeholder = { Text("Enter page number") },
                    keyboardOptions = KeyboardOptions(
                        keyboardType = KeyboardType.Number
                    ),
                    isError = errorMessage != null,
                    supportingText = errorMessage?.let { { Text(it) } },
                    modifier = Modifier.fillMaxWidth(),
                    singleLine = true
                )
                
                // Quick jump buttons
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    OutlinedButton(
                        onClick = { pageInput = "1" },
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("First")
                    }
                    OutlinedButton(
                        onClick = { pageInput = (totalPages / 2).toString() },
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Middle")
                    }
                    OutlinedButton(
                        onClick = { pageInput = totalPages.toString() },
                        modifier = Modifier.weight(1f)
                    ) {
                        Text("Last")
                    }
                }
            }
        },
        confirmButton = {
            Button(
                onClick = {
                    val pageNum = pageInput.toIntOrNull()
                    if (pageNum != null && pageNum in 1..totalPages) {
                        onPageSelect(pageNum)
                        onDismiss()
                    }
                },
                enabled = errorMessage == null && pageInput.isNotBlank()
            ) {
                Text("Go")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
