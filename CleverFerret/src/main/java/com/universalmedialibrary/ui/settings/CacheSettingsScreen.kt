package com.universalmedialibrary.ui.settings

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.widget.Toast
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.input.PasswordVisualTransformation
import androidx.compose.ui.unit.dp
import androidx.core.content.FileProvider
import androidx.core.content.ContextCompat
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.viewModelScope
import androidx.navigation.NavController
import com.universalmedialibrary.data.repository.CacheLocation
import com.universalmedialibrary.data.repository.SettingsRepository
import com.universalmedialibrary.data.settings.BottomGearPosition
import com.universalmedialibrary.data.settings.MiniPlayerBackgroundMode
import com.universalmedialibrary.services.MediaScannerService
import com.universalmedialibrary.services.debug.DebugBugReportService
import com.universalmedialibrary.utils.PermissionsHandler
import com.universalmedialibrary.utils.rememberPermissionsHandler
import com.universalmedialibrary.jobs.WorkScheduler
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext
import java.io.File
import javax.inject.Inject
import java.util.Locale
import java.util.concurrent.TimeUnit

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun CacheSettingsScreen(
    onBack: () -> Unit,
    viewModel: CacheSettingsViewModel = hiltViewModel()
) {
    val context = LocalContext.current
    val state by viewModel.state.collectAsState()
    val scope = rememberCoroutineScope()
    var cacheSizeText by remember { mutableStateOf("…") }
    var availableSpaceText by remember { mutableStateOf("…") }

    // Slider is local to avoid spamming DataStore writes while dragging.
    var sliderMb by remember { mutableStateOf(state.maxCacheSizeMb.coerceIn(512, 10_240)) }
    LaunchedEffect(state.maxCacheSizeMb) {
        sliderMb = state.maxCacheSizeMb.coerceIn(512, 10_240)
    }

    LaunchedEffect(state.cacheLocation) {
        val (sizeBytes, availableMb) = withContext(Dispatchers.IO) {
            val dir = getCacheDirectoryForLocation(context, state.cacheLocation)
            val size = directorySize(dir)
            val available = runCatching {
                android.os.StatFs(dir.path).availableBytes / (1024L * 1024L)
            }.getOrDefault(0L)
            size to available
        }
        cacheSizeText = sizeBytes.toHumanReadable()
        availableSpaceText = "${availableMb} MB"
    }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Cache") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, contentDescription = "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(
            modifier = Modifier
                .fillMaxSize()
                .padding(padding)
                .verticalScroll(rememberScrollState())
                .padding(16.dp),
            verticalArrangement = Arrangement.spacedBy(16.dp)
        ) {
            Text(
                text = "Cache location",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            val externalAvailable = remember(context) { context.externalCacheDir != null }
            SingleChoiceSegmentedButtonRow(modifier = Modifier.fillMaxWidth()) {
                SegmentedButton(
                    selected = state.cacheLocation == CacheLocation.INTERNAL,
                    onClick = { viewModel.setCacheLocation(CacheLocation.INTERNAL) },
                    shape = SegmentedButtonDefaults.itemShape(index = 0, count = 2)
                ) { Text("Local") }

                SegmentedButton(
                    selected = state.cacheLocation == CacheLocation.EXTERNAL,
                    onClick = {
                        if (externalAvailable) viewModel.setCacheLocation(CacheLocation.EXTERNAL)
                        else Toast.makeText(context, "No external/SD cache directory available.", Toast.LENGTH_SHORT).show()
                    },
                    enabled = externalAvailable,
                    shape = SegmentedButtonDefaults.itemShape(index = 1, count = 2)
                ) { Text("SD card") }
            }

            Text(
                text = "Current cache size: $cacheSizeText",
                style = MaterialTheme.typography.bodyMedium
            )

            Text(
                text = "Available space: $availableSpaceText",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Text(
                text = "Max cache size",
                style = MaterialTheme.typography.titleMedium,
                fontWeight = FontWeight.SemiBold
            )

            val sliderMinMb = 512
            val sliderMaxMb = 10_240
            val stepMb = 256
            val valuesCount = ((sliderMaxMb - sliderMinMb) / stepMb) + 1
            val steps = (valuesCount - 2).coerceAtLeast(0)

            Text(
                text = String.format(
                    Locale.getDefault(),
                    "%.2f GB",
                    sliderMb.toDouble() / 1024.0
                ),
                style = MaterialTheme.typography.bodyMedium
            )

            Slider(
                value = sliderMb.toFloat(),
                onValueChange = { raw ->
                    val snapped = ((raw - sliderMinMb) / stepMb).toInt().coerceAtLeast(0) * stepMb + sliderMinMb
                    sliderMb = snapped.coerceIn(sliderMinMb, sliderMaxMb)
                },
                onValueChangeFinished = { viewModel.setMaxCacheSizeMb(sliderMb) },
                valueRange = sliderMinMb.toFloat()..sliderMaxMb.toFloat(),
                steps = steps
            )
            Text(
                text = "Range: 0.5 GB to 10 GB",
                style = MaterialTheme.typography.bodySmall,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )

            Button(
                onClick = {
                    scope.launch {
                        val newSize = withContext(Dispatchers.IO) {
                            clearCache(context, state.cacheLocation)
                            calculateCacheSize(context, state.cacheLocation).toHumanReadable()
                        }
                        cacheSizeText = newSize
                    }
                },
                modifier = Modifier.fillMaxWidth()
            ) {
                Icon(Icons.Default.DeleteSweep, contentDescription = "Clear cache")
                Spacer(modifier = Modifier.width(8.dp))
                Text("Clear cache")
            }
        }
    }
}
