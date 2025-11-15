package com.universalmedialibrary.services.ambient

import com.universalmedialibrary.data.local.entity.AmbientSound
import com.universalmedialibrary.data.local.entity.AmbientCategory

/**
 * Extensible sound library system
 * Allows easy addition of new themed sound collections (sci-fi, medieval, etc.)
 * without modifying core service code
 */
object SoundLibrary {
    
    /**
     * Sound collection with metadata
     */
    data class SoundCollection(
        val id: String,
        val name: String,
        val description: String,
        val theme: String, // e.g., "modern", "sci-fi", "medieval", "fantasy"
        val sounds: List<AmbientSound>,
        val enabled: Boolean = true
    )
    
    /**
     * Registry of all available sound collections
     * Add new collections here to make them available to users
     */
    private val collections = mutableMapOf<String, SoundCollection>()
    
    init {
        // Register Moodist as the default modern collection
        registerCollection(
            SoundCollection(
                id = "moodist",
                name = "Moodist Collection",
                description = "84 professionally curated modern ambient sounds",
                theme = "modern",
                sounds = MoodistSounds.getAllSounds(),
                enabled = true
            )
        )

        FreeAmbientCollections.registerAll()
    }
    
    /**
     * Register a new sound collection
     * Call this to add sci-fi, medieval, or other themed collections
     */
    fun registerCollection(collection: SoundCollection) {
        collections[collection.id] = collection
    }
    
    /**
     * Get all registered collections
     */
    fun getAllCollections(): List<SoundCollection> = collections.values.toList()
    
    /**
     * Get enabled collections only
     */
    fun getEnabledCollections(): List<SoundCollection> {
        return collections.values.filter { it.enabled }
    }
    
    /**
     * Get collection by ID
     */
    fun getCollection(id: String): SoundCollection? = collections[id]
    
    /**
     * Get all sounds from all enabled collections
     */
    fun getAllSounds(): List<AmbientSound> {
        return getEnabledCollections().flatMap { it.sounds }
    }
    
    /**
     * Get sounds by theme
     */
    fun getSoundsByTheme(theme: String): List<AmbientSound> {
        return collections.values
            .filter { it.theme == theme && it.enabled }
            .flatMap { it.sounds }
    }
    
    /**
     * Get sounds by category across all enabled collections
     */
    fun getSoundsByCategory(category: AmbientCategory): List<AmbientSound> {
        return getAllSounds().filter { it.category == category }
    }
    
    /**
     * Get available themes
     */
    fun getAvailableThemes(): List<String> {
        return collections.values.map { it.theme }.distinct().sorted()
    }
    
    /**
     * Enable/disable a collection
     */
    fun setCollectionEnabled(id: String, enabled: Boolean) {
        collections[id]?.let { collection ->
            collections[id] = collection.copy(enabled = enabled)
        }
    }
    
    /**
     * Get statistics
     */
    fun getStats(): LibraryStats {
        val allSounds = getAllSounds()
        return LibraryStats(
            totalCollections = collections.size,
            enabledCollections = getEnabledCollections().size,
            totalSounds = allSounds.size,
            soundsByTheme = collections.values.groupBy { it.theme }
                .mapValues { it.value.sumOf { c -> c.sounds.size } },
            soundsByCategory = allSounds.groupBy { it.category }
                .mapValues { it.value.size }
        )
    }
    
    data class LibraryStats(
        val totalCollections: Int,
        val enabledCollections: Int,
        val totalSounds: Int,
        val soundsByTheme: Map<String, Int>,
        val soundsByCategory: Map<AmbientCategory, Int>
    )
}

/**
 * Example: How to add a new themed sound collection
 * 
 * See ThemedSoundCollections.kt for complete examples of:
 * - SciFiSounds (8 sounds)
 * - MedievalSounds (10 sounds)
 * - FantasySounds (6 sounds)
 * - HorrorSounds (4 sounds)
 * 
 * Usage:
 * ```kotlin
 * SoundLibrary.registerCollection(
 *     SoundLibrary.SoundCollection(
 *         id = "mytheme",
 *         name = "My Theme Collection",
 *         description = "Sounds for my theme",
 *         theme = "my-theme",
 *         sounds = MyThemeSounds.getAllSounds()
 *     )
 * )
 * ```
 */
