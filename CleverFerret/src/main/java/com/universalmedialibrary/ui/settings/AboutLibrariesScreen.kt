package com.universalmedialibrary.ui.settings

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import com.mikepenz.aboutlibraries.ui.compose.m3.LibrariesContainer

/**
 * AboutLibraries Screen
 * 
 * Displays all open source libraries used in CleverFerret with their licenses.
 * Automatically generated from project dependencies using AboutLibraries plugin.
 * 
 * Features:
 * - Complete list of dependencies
 * - License information
 * - Author and repository links
 * - Searchable and filterable
 * - Material 3 design
 */
@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun AboutLibrariesScreen(
    onBack: () -> Unit
) {
    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Open Source Licenses") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(
                            imageVector = Icons.AutoMirrored.Filled.ArrowBack,
                            contentDescription = "Back"
                        )
                    }
                }
            )
        }
    ) { paddingValues ->
        LibrariesContainer(
            modifier = Modifier
                .fillMaxSize()
                .padding(paddingValues)
        )
    }
}
