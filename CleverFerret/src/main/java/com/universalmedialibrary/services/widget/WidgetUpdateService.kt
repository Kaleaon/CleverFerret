package com.universalmedialibrary.services.widget

import android.content.Context
import com.universalmedialibrary.services.queue.MediaQueueManager
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Widget Update Service
 * 
 * Monitors queue changes and updates widgets in real-time.
 * Uses Flow to observe queue state and metadata changes.
 */
@Singleton
class WidgetUpdateService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val queueManager: MediaQueueManager
) {
    
    private val serviceScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    private var isObserving = false
    
    /**
     * Start observing queue changes and updating widgets
     */
    fun startObserving() {
        if (isObserving) return
        
        isObserving = true
        
        // Observe queue changes
        queueManager.currentQueue
            .onEach { queue ->
                // Update widgets when queue changes
                updateAllWidgets()
            }
            .launchIn(serviceScope)
        
        // Observe shuffle state changes
        queueManager.isShuffled
            .onEach { shuffled ->
                // Update widgets when shuffle state changes
                updateAllWidgets()
            }
            .launchIn(serviceScope)
        
        // Observe repeat mode changes
        queueManager.repeatMode
            .onEach { repeatMode ->
                // Update widgets when repeat mode changes
                updateAllWidgets()
            }
            .launchIn(serviceScope)
    }
    
    /**
     * Stop observing queue changes
     */
    fun stopObserving() {
        isObserving = false
        // Note: SupervisorJob will handle cancellation of child coroutines
    }
    
    /**
     * Force update all widgets
     */
    fun forceUpdateWidgets() {
        updateAllWidgets()
    }
    
    /**
     * Update all widgets by sending broadcast
     */
    private fun updateAllWidgets() {
        // Send broadcast to update widgets
        val intent = android.content.Intent().apply {
            action = "com.universalmedialibrary.widget.UPDATE"
        }
        context.sendBroadcast(intent)
    }
}