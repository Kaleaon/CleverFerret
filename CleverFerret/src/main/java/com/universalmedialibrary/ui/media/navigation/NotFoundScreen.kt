package com.universalmedialibrary.ui.media.navigation

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowBack
import androidx.compose.material.icons.filled.Home
import androidx.compose.material.icons.filled.MenuBook
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.focus.FocusRequester
import androidx.compose.ui.focus.focusRequester
import androidx.compose.ui.semantics.heading
import androidx.compose.ui.semantics.semantics
import androidx.compose.ui.unit.dp

@Composable
internal fun NotFoundRouteScreen(
    requestedPath: String,
    onNavigateHome: () -> Unit,
    onNavigateSearch: () -> Unit,
    onNavigateLibrary: () -> Unit,
    onBack: () -> Unit
) {
    val focusRequester = remember { FocusRequester() }
    LaunchedEffect(Unit) { focusRequester.requestFocus() }

    BoxWithConstraints(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
    ) {
        val wideLayout = maxWidth >= 720.dp

        if (wideLayout) {
            Row(
                modifier = Modifier.fillMaxSize(),
                horizontalArrangement = Arrangement.Center,
                verticalAlignment = Alignment.CenterVertically
            ) {
                NotFoundCardContent(
                    modifier = Modifier.widthIn(max = 800.dp),
                    focusRequester = focusRequester,
                    requestedPath = requestedPath,
                    onNavigateHome = onNavigateHome,
                    onNavigateSearch = onNavigateSearch,
                    onNavigateLibrary = onNavigateLibrary,
                    onBack = onBack
                )
            }
        } else {
            NotFoundCardContent(
                modifier = Modifier.fillMaxSize(),
                focusRequester = focusRequester,
                requestedPath = requestedPath,
                onNavigateHome = onNavigateHome,
                onNavigateSearch = onNavigateSearch,
                onNavigateLibrary = onNavigateLibrary,
                onBack = onBack
            )
        }
    }
}

@Composable
internal fun NotFoundCardContent(
    modifier: Modifier,
    focusRequester: FocusRequester,
    requestedPath: String,
    onNavigateHome: () -> Unit,
    onNavigateSearch: () -> Unit,
    onNavigateLibrary: () -> Unit,
    onBack: () -> Unit
) {
    Card(modifier = modifier) {
        Column(
            modifier = Modifier
                .fillMaxWidth()
                .padding(20.dp)
                .verticalScroll(rememberScrollState()),
            verticalArrangement = Arrangement.spacedBy(14.dp)
        ) {
            Text(
                text = "CleverFerret",
                style = MaterialTheme.typography.labelLarge,
                color = MaterialTheme.colorScheme.primary
            )
            Text(
                modifier = Modifier.semantics { heading() },
                text = "We couldn't find that page",
                style = MaterialTheme.typography.headlineSmall
            )
            Text(
                text = "The route \"$requestedPath\" doesn't exist or is no longer available. " +
                    "Use one of the recovery actions below.",
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
            Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                Button(
                    modifier = Modifier.focusRequester(focusRequester),
                    onClick = onNavigateHome
                ) {
                    Icon(Icons.Default.Home, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Go Home")
                }
                OutlinedButton(onClick = onBack) {
                    Icon(Icons.Default.ArrowBack, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Back")
                }
            }
            Row(horizontalArrangement = Arrangement.spacedBy(10.dp)) {
                OutlinedButton(onClick = onNavigateSearch) {
                    Icon(Icons.Default.Search, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Search")
                }
                OutlinedButton(onClick = onNavigateLibrary) {
                    Icon(Icons.Default.MenuBook, contentDescription = null)
                    Spacer(Modifier.width(8.dp))
                    Text("Library")
                }
            }
        }
    }
}
