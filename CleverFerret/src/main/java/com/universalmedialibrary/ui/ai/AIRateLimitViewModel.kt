package com.universalmedialibrary.ui.ai

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.universalmedialibrary.services.ai.*
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
class AIRateLimitViewModel @Inject constructor(
    private val aiRateLimitService: AIRateLimitService
) : ViewModel() {

    private val _isLoading = MutableStateFlow(false)
    val isLoading: StateFlow<Boolean> = _isLoading.asStateFlow()

    private val _rateLimitConfig = MutableStateFlow(RateLimitConfig(
        globalLimit = 60,
        providerLimits = emptyMap(),
        userLimits = emptyMap(),
        dailyLimits = emptyMap(),
        burstCapacity = 10,
        enabled = true
    ))
    val rateLimitConfig: StateFlow<RateLimitConfig> = _rateLimitConfig.asStateFlow()

    private val _usageStatistics = MutableStateFlow<LocalUsageStatistics?>(null)
    val usageStatistics: StateFlow<LocalUsageStatistics?> = _usageStatistics.asStateFlow()

    val rateLimitStatus = aiRateLimitService.rateLimitStatus

    init {
        loadRateLimitConfig()
        refreshStatistics()
    }

    private fun loadRateLimitConfig() {
        viewModelScope.launch {
            _isLoading.value = true
            try {
                val config = aiRateLimitService.getRateLimitConfig()
                _rateLimitConfig.value = config
            } catch (e: Exception) {
                // Handle error
            } finally {
                _isLoading.value = false
            }
        }
    }

    fun updateGlobalLimit(newLimit: Int) {
        viewModelScope.launch {
            try {
                val updatedConfig = _rateLimitConfig.value.copy(globalLimit = newLimit)
                aiRateLimitService.updateRateLimitConfig(updatedConfig)
                _rateLimitConfig.value = updatedConfig
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun updateProviderLimit(provider: LocalAIProvider, newLimit: Int) {
        viewModelScope.launch {
            try {
                val currentLimits = _rateLimitConfig.value.providerLimits.toMutableMap()
                currentLimits[provider.name] = newLimit
                val updatedConfig = _rateLimitConfig.value.copy(providerLimits = currentLimits)
                aiRateLimitService.updateRateLimitConfig(updatedConfig)
                _rateLimitConfig.value = updatedConfig
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun enableRateLimiting() {
        viewModelScope.launch {
            try {
                val updatedConfig = _rateLimitConfig.value.copy(enabled = true)
                aiRateLimitService.updateRateLimitConfig(updatedConfig)
                _rateLimitConfig.value = updatedConfig
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun disableRateLimiting() {
        viewModelScope.launch {
            try {
                val updatedConfig = _rateLimitConfig.value.copy(enabled = false)
                aiRateLimitService.updateRateLimitConfig(updatedConfig)
                _rateLimitConfig.value = updatedConfig
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun refreshStatistics() {
        viewModelScope.launch {
            try {
                val stats = aiRateLimitService.getUsageStatistics()
                _usageStatistics.value = stats
            } catch (e: Exception) {
                // Handle error
            }
        }
    }

    fun resetStatistics() {
        viewModelScope.launch {
            try {
                aiRateLimitService.resetStatistics()
                refreshStatistics()
            } catch (e: Exception) {
                // Handle error
            }
        }
    }
}