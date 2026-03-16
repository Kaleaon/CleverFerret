package com.universalmedialibrary.ui.visualizer

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.visualizer.VisualizerPreset
import com.universalmedialibrary.services.visualizer.VisualizerPresetManager
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class PresetBrowserViewModel @Inject constructor(
    @dagger.hilt.android.qualifiers.ApplicationContext private val context: android.content.Context
) : ViewModel() {

    private val presetManager = VisualizerPresetManager()

    private val _presets = MutableStateFlow<List<VisualizerPreset>>(emptyList())
    val presets: StateFlow<List<VisualizerPreset>> = _presets.asStateFlow()

    private val _searchQuery = MutableStateFlow("")
    val searchQuery: StateFlow<String> = _searchQuery.asStateFlow()

    private val customPresets = mutableListOf<VisualizerPreset>()

    init {
        loadPresets()
    }

    private fun loadPresets() {
        _presets.value = presetManager.getAllPresets(customPresets)
    }

    fun updateSearchQuery(query: String) {
        _searchQuery.value = query
        filterPresets(query)
    }

    private fun filterPresets(query: String) {
        val allPresets = presetManager.getAllPresets(customPresets)
        _presets.value = if (query.isBlank()) {
            allPresets
        } else {
            allPresets.filter { preset ->
                preset.name.contains(query, ignoreCase = true) ||
                preset.description.contains(query, ignoreCase = true) ||
                preset.author.contains(query, ignoreCase = true) ||
                preset.tags.any { it.contains(query, ignoreCase = true) }
            }
        }
    }

    fun importPreset(jsonString: String) {
        viewModelScope.launch {
            presetManager.importPreset(jsonString)?.let { preset ->
                customPresets.add(preset)
                loadPresets()
            }
        }
    }

    fun exportPreset(preset: VisualizerPreset) {
        viewModelScope.launch {
            val json = presetManager.exportPreset(preset)

            // Implemented: Share via Android share sheet
            try {
                val shareIntent = android.content.Intent(android.content.Intent.ACTION_SEND).apply {
                    type = "application/json"
                    putExtra(android.content.Intent.EXTRA_TEXT, json)
                    putExtra(android.content.Intent.EXTRA_TITLE, "Share ${preset.name}")
                    addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                }

                val chooserIntent = android.content.Intent.createChooser(shareIntent, "Share Visualizer Preset")
                chooserIntent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK)
                context.startActivity(chooserIntent)
            } catch (e: Exception) {
                // Fallback: Copy to clipboard
                val clipboard = context.getSystemService(android.content.Context.CLIPBOARD_SERVICE) as android.content.ClipboardManager
                val clip = android.content.ClipData.newPlainText("Visualizer Preset", json)
                clipboard.setPrimaryClip(clip)
                android.util.Log.i("PresetBrowserViewModel", "Preset copied to clipboard as fallback")
            }
        }
    }
}
