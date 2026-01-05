package com.universalmedialibrary.services.manga.reader

import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.delay
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.launch
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Webtoon Scroller
 * 
 * Manages auto-scrolling for webtoon/vertical scroll reading mode
 * Inspired by Futon/Kotatsu scroll timer implementation
 */
@Singleton
class WebtoonScroller @Inject constructor() {
    
    companion object {
        const val MIN_SPEED = 0.1f
        const val MAX_SPEED = 5.0f
        const val DEFAULT_SPEED = 1.0f
        
        private const val SCROLL_INTERVAL_MS = 16L // ~60fps
        private const val BASE_SCROLL_PX_PER_SECOND = 100f
    }
    
    private val _isScrolling = MutableStateFlow(false)
    val isScrolling: StateFlow<Boolean> = _isScrolling.asStateFlow()
    
    private val _speed = MutableStateFlow(DEFAULT_SPEED)
    val speed: StateFlow<Float> = _speed.asStateFlow()
    
    private val _scrollOffset = MutableStateFlow(0f)
    val scrollOffset: StateFlow<Float> = _scrollOffset.asStateFlow()
    
    private var scrollJob: Job? = null
    private var scrollCallback: ((Float) -> Unit)? = null
    
    /**
     * Start auto-scrolling
     */
    fun start(
        scope: CoroutineScope,
        onScroll: (delta: Float) -> Unit
    ) {
        if (_isScrolling.value) return
        
        scrollCallback = onScroll
        _isScrolling.value = true
        
        scrollJob = scope.launch {
            while (_isScrolling.value) {
                val delta = calculateScrollDelta()
                _scrollOffset.value += delta
                scrollCallback?.invoke(delta)
                delay(SCROLL_INTERVAL_MS)
            }
        }
    }
    
    /**
     * Stop auto-scrolling
     */
    fun stop() {
        _isScrolling.value = false
        scrollJob?.cancel()
        scrollJob = null
        scrollCallback = null
    }
    
    /**
     * Toggle auto-scrolling
     */
    fun toggle(
        scope: CoroutineScope,
        onScroll: (delta: Float) -> Unit
    ) {
        if (_isScrolling.value) {
            stop()
        } else {
            start(scope, onScroll)
        }
    }
    
    /**
     * Set scroll speed
     */
    fun setSpeed(newSpeed: Float) {
        _speed.value = newSpeed.coerceIn(MIN_SPEED, MAX_SPEED)
    }
    
    /**
     * Increase speed
     */
    fun increaseSpeed(increment: Float = 0.1f) {
        setSpeed(_speed.value + increment)
    }
    
    /**
     * Decrease speed
     */
    fun decreaseSpeed(decrement: Float = 0.1f) {
        setSpeed(_speed.value - decrement)
    }
    
    /**
     * Reset scroll offset
     */
    fun resetOffset() {
        _scrollOffset.value = 0f
    }
    
    /**
     * Calculate scroll delta for current frame
     */
    private fun calculateScrollDelta(): Float {
        val pixelsPerSecond = BASE_SCROLL_PX_PER_SECOND * _speed.value
        val pixelsPerFrame = pixelsPerSecond * (SCROLL_INTERVAL_MS / 1000f)
        return pixelsPerFrame
    }
}
