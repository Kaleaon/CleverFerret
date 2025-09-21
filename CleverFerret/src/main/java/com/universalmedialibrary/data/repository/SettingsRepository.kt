package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.settings.*
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asStateFlow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class SettingsRepository @Inject constructor() {
    
    private val _apiSettings = MutableStateFlow(ApiSettings())
    val apiSettings: Flow<ApiSettings> = _apiSettings.asStateFlow()
    
    private val _readerSettings = MutableStateFlow(ReaderSettings())
    val readerSettings: Flow<ReaderSettings> = _readerSettings.asStateFlow()
    
    private val _securitySettings = MutableStateFlow(SecuritySettings())
    val securitySettings: Flow<SecuritySettings> = _securitySettings.asStateFlow()
    
    private val _generalSettings = MutableStateFlow(GeneralSettings())
    val generalSettings: Flow<GeneralSettings> = _generalSettings.asStateFlow()
    
    suspend fun updateApiSettings(settings: ApiSettings) {
        _apiSettings.value = settings
        // In real implementation, save to database/preferences
    }
    
    suspend fun updateReaderSettings(settings: ReaderSettings) {
        _readerSettings.value = settings
        // In real implementation, save to database/preferences
    }
    
    suspend fun updateSecuritySettings(settings: SecuritySettings) {
        _securitySettings.value = settings
        // In real implementation, save to database/preferences
    }
    
    suspend fun updateGeneralSettings(settings: GeneralSettings) {
        _generalSettings.value = settings
        // In real implementation, save to database/preferences
    }
}