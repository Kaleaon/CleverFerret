package com.universalmedialibrary.api.plugin

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch
import java.util.concurrent.ConcurrentHashMap
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Implementation of the Plugin Registry
 * 
 * Manages all plugins in the application, handles registration,
 * lifecycle, configuration, and event dispatching.
 */
@Singleton
class PluginRegistryImpl @Inject constructor() : PluginRegistry {
    
    private val plugins = ConcurrentHashMap<String, Plugin>()
    private val pluginConfigs = ConcurrentHashMap<String, MutableMap<String, Any>>()
    private val lifecycleCallbacks = java.util.concurrent.CopyOnWriteArrayList<PluginLifecycleCallback>()
    
    private val scope = CoroutineScope(Dispatchers.Default + SupervisorJob())
    
    private val _events = MutableSharedFlow<PluginEvent>(replay = 0)
    val events: SharedFlow<PluginEvent> = _events.asSharedFlow()
    
    override fun getAllPlugins(): List<Plugin> = plugins.values.toList()
    
    override fun getPluginsByCategory(category: PluginCategory): List<Plugin> {
        return plugins.values.filter { it.category == category }
    }
    
    override fun getPlugin(id: String): Plugin? = plugins[id]
    
    override fun getMetadataProviders(): List<MetadataProviderPlugin> {
        return plugins.values
            .filterIsInstance<MetadataProviderPlugin>()
            .filter { it.isEnabled }
    }
    
    override fun getContentSources(): List<ContentSourcePlugin> {
        return plugins.values
            .filterIsInstance<ContentSourcePlugin>()
            .filter { it.isEnabled }
    }
    
    override fun getMediaServers(): List<MediaServerPlugin> {
        return plugins.values
            .filterIsInstance<MediaServerPlugin>()
            .filter { it.isEnabled }
    }
    
    override fun getSocialIntegrations(): List<SocialIntegrationPlugin> {
        return plugins.values
            .filterIsInstance<SocialIntegrationPlugin>()
            .filter { it.isEnabled }
    }
    
    override fun registerPlugin(plugin: Plugin) {
        plugins[plugin.id] = plugin
        
        // Initialize default config
        val defaultConfig = mutableMapOf<String, Any>()
        plugin.configurationOptions.forEach { option ->
            option.defaultValue?.let { defaultConfig[option.key] = it }
        }
        pluginConfigs[plugin.id] = defaultConfig
        
        // Notify callbacks
        lifecycleCallbacks.forEach { it.onPluginRegistered(plugin) }
        
        // Emit event
        scope.launch {
            _events.emit(PluginEvent.PluginRegistered(plugin))
        }
        
        // Initialize plugin if enabled
        if (plugin.isEnabled) {
            scope.launch {
                try {
                    plugin.initialize()
                } catch (e: Exception) {
                    _events.emit(PluginEvent.PluginError(plugin.id, e))
                }
            }
        }
    }
    
    override fun unregisterPlugin(id: String) {
        plugins.remove(id)?.let { plugin ->
            scope.launch {
                try {
                    plugin.shutdown()
                } catch (_: Exception) { }
            }
            lifecycleCallbacks.forEach { it.onPluginUnregistered(id) }
            scope.launch {
                _events.emit(PluginEvent.PluginUnregistered(id))
            }
        }
        pluginConfigs.remove(id)
    }
    
    override fun setPluginEnabled(id: String, enabled: Boolean) {
        plugins[id]?.let { plugin ->
            val wasEnabled = plugin.isEnabled
            plugin.isEnabled = enabled
            
            if (enabled && !wasEnabled) {
                scope.launch {
                    try {
                        plugin.initialize()
                        lifecycleCallbacks.forEach { it.onPluginEnabled(plugin) }
                        _events.emit(PluginEvent.PluginEnabled(id))
                    } catch (e: Exception) {
                        plugin.isEnabled = false
                        _events.emit(PluginEvent.PluginError(id, e))
                    }
                }
            } else if (!enabled && wasEnabled) {
                scope.launch {
                    try {
                        plugin.shutdown()
                        lifecycleCallbacks.forEach { it.onPluginDisabled(plugin) }
                        _events.emit(PluginEvent.PluginDisabled(id))
                    } catch (e: Exception) {
                        _events.emit(PluginEvent.PluginError(id, e))
                    }
                }
            }
        }
    }
    
    override fun getPluginConfig(id: String): Map<String, Any> {
        return pluginConfigs[id]?.toMap() ?: emptyMap()
    }
    
    override fun updatePluginConfig(id: String, config: Map<String, Any>) {
        pluginConfigs.getOrPut(id) { mutableMapOf() }.putAll(config)
        scope.launch {
            _events.emit(PluginEvent.PluginConfigUpdated(id))
        }
    }
    
    fun addLifecycleCallback(callback: PluginLifecycleCallback) {
        lifecycleCallbacks.add(callback)
    }
    
    fun removeLifecycleCallback(callback: PluginLifecycleCallback) {
        lifecycleCallbacks.remove(callback)
    }
    
    /**
     * Get all enabled providers for a specific media type
     */
    fun getProvidersForMediaType(mediaType: MediaType): List<MetadataProviderPlugin> {
        return getMetadataProviders().filter { mediaType in it.supportedMediaTypes }
    }
    
    /**
     * Aggregate search across all enabled metadata providers
     */
    suspend fun searchAllProviders(query: MetadataQuery): List<MetadataSearchResult> {
        val providers = query.mediaType?.let { getProvidersForMediaType(it) }
            ?: getMetadataProviders()
        
        return providers.flatMap { provider ->
            provider.search(query).getOrElse { emptyList() }
        }.sortedByDescending { it.relevanceScore }
    }
    
    /**
     * Health check all plugins
     */
    suspend fun healthCheckAll(): Map<String, PluginHealth> {
        return plugins.mapValues { (_, plugin) ->
            try {
                plugin.healthCheck()
            } catch (e: Exception) {
                PluginHealth(
                    status = HealthStatus.UNHEALTHY,
                    message = e.message
                )
            }
        }
    }
}

/**
 * Aggregated metadata service that uses all enabled plugins
 */
class AggregatedMetadataService(
    private val registry: PluginRegistryImpl
) {
    /**
     * Search for metadata across all providers
     */
    suspend fun search(
        query: MetadataQuery,
        preferredProviders: List<String>? = null
    ): List<MetadataSearchResult> {
        val providers = if (preferredProviders != null) {
            registry.getMetadataProviders().filter { it.id in preferredProviders }
        } else {
            registry.getMetadataProviders()
        }.let { list ->
            query.mediaType?.let { mt -> list.filter { mt in it.supportedMediaTypes } } ?: list
        }
        
        return providers.flatMap { provider ->
            provider.search(query).getOrElse { emptyList() }
        }.distinctBy { "${it.providerId}:${it.id}" }
            .sortedByDescending { it.relevanceScore }
    }
    
    /**
     * Fetch detailed metadata, trying multiple providers
     */
    suspend fun fetchDetails(
        id: String,
        providerId: String,
        mediaType: MediaType
    ): MediaMetadata? {
        val provider = registry.getMetadataProviders()
            .find { it.id == providerId } ?: return null
        
        return provider.fetchDetails(id, mediaType).getOrNull()
    }
    
    /**
     * Fetch best available cover art
     */
    suspend fun fetchCoverArt(
        id: String,
        providerId: String,
        size: CoverSize = CoverSize.LARGE
    ): String? {
        val provider = registry.getMetadataProviders()
            .find { it.id == providerId } ?: return null
        
        return provider.fetchCoverArt(id, size).getOrNull()
    }
    
    /**
     * Get recommendations from multiple providers
     */
    suspend fun getRecommendations(
        basedOn: List<Pair<String, String>>,  // List of (id, providerId) pairs
        limit: Int = 20
    ): List<MetadataSearchResult> {
        return basedOn.flatMap { (id, providerId) ->
            val provider = registry.getMetadataProviders()
                .find { it.id == providerId }
            provider?.fetchRecommendations(id, limit / basedOn.size)?.getOrElse { emptyList() }
                ?: emptyList()
        }.distinctBy { "${it.providerId}:${it.id}" }
            .take(limit)
    }
}
