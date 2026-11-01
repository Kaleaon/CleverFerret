package com.cleverferret.core.designsystem.accessibility

import android.content.Context
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityManager
import androidx.compose.runtime.Composable
import androidx.compose.runtime.remember
import androidx.compose.runtime.rememberCoroutineScope
import androidx.compose.ui.platform.LocalContext
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock
import kotlin.math.abs

private const val DEFAULT_MIN_PROGRESS_INTERVAL_MS = 500L
private const val DEFAULT_MIN_PROGRESS_STEP = 10
private const val DEFAULT_POLITE_DEBOUNCE_MS = 300L
private const val MIN_PERCENT = 0
private const val MAX_PERCENT = 100

/**
 * Centralized interface for accessibility live region announcements.
 * Dispatches polite, assertive, and progress updates to screen readers with rate limiting
 * and debouncing in compliance with WCAG 2.1 AA Success Criterion 4.1.3 (Status Messages).
 */
interface LiveRegionManager {

    /**
     * Dispatches a polite announcement to the screen reader.
     * Polite announcements are debounced to prevent flooding assistive technologies.
     *
     * @param message Text to be spoken politely.
     */
    fun announcePolite(message: String)

    /**
     * Dispatches an assertive announcement to the screen reader immediately.
     * Assertive announcements interrupt and clear any pending polite messages.
     *
     * @param message Critical text or error to be spoken assertively.
     */
    fun announceAssertive(message: String)

    /**
     * Dispatches a progress announcement with debouncing and step thresholding.
     *
     * @param percent Current progress percentage (0 to 100).
     * @param label Optional context label (e.g., "Syncing", "Importing").
     */
    fun announceProgress(percent: Int, label: String = "")

    /**
     * Whether accessibility services and screen readers / touch exploration are currently active.
     */
    val isAccessibilityActive: Boolean

    /**
     * Cancels any pending debounced or queued announcements.
     */
    fun cancelPendingAnnouncements()
}

/**
 * Functional interface for dispatching announcements to system accessibility services or views.
 */
fun interface AccessibilityAnnouncementDispatcher {
    fun dispatch(message: String, isAssertive: Boolean)
}

/**
 * Configuration options for live region debouncing and throttling.
 *
 * @property minProgressIntervalMs Minimum time in ms between progress updates (default: 500ms).
 * @property minProgressStep Minimum percentage step required between progress updates (default: 10%).
 * @property politeDebounceMs Debounce time for consecutive polite announcements (default: 300ms).
 */
data class LiveRegionThrottleConfig(
    val minProgressIntervalMs: Long = DEFAULT_MIN_PROGRESS_INTERVAL_MS,
    val minProgressStep: Int = DEFAULT_MIN_PROGRESS_STEP,
    val politeDebounceMs: Long = DEFAULT_POLITE_DEBOUNCE_MS,
)

/**
 * Default Android implementation of [AccessibilityAnnouncementDispatcher].
 */
class AndroidAccessibilityAnnouncementDispatcher(
    private val context: Context,
    private val accessibilityManager: AccessibilityManager? =
        context.getSystemService(Context.ACCESSIBILITY_SERVICE) as? AccessibilityManager
) : AccessibilityAnnouncementDispatcher {

    override fun dispatch(message: String, isAssertive: Boolean) {
        val manager = accessibilityManager ?: return
        if (!manager.isEnabled) return

        @Suppress("DEPRECATION")
        val event = AccessibilityEvent.obtain().apply {
            eventType = AccessibilityEvent.TYPE_ANNOUNCEMENT
            className = javaClass.name
            packageName = context.packageName
            text.add(message)
        }

        try {
            manager.sendAccessibilityEvent(event)
        } catch (_: Exception) {
            // Graceful fallback if system service rejects the event
        }
    }
}

/**
 * State-driven implementation of [LiveRegionManager] with coroutine-based debouncing,
 * threshold filtering, and assertive queue clearing.
 */
class DefaultLiveRegionManager(
    private val scope: CoroutineScope,
    private val config: LiveRegionThrottleConfig = LiveRegionThrottleConfig(),
    private val isAccessibilityActiveProvider: () -> Boolean = { true },
    private val dispatcher: AccessibilityAnnouncementDispatcher = AccessibilityAnnouncementDispatcher { _, _ -> },
    private val timeProvider: () -> Long = { System.currentTimeMillis() }
) : LiveRegionManager {

    constructor(
        scope: CoroutineScope,
        config: LiveRegionThrottleConfig = LiveRegionThrottleConfig(),
        accessibilityManager: AccessibilityManager?,
        dispatcher: AccessibilityAnnouncementDispatcher,
        timeProvider: () -> Long = { System.currentTimeMillis() }
    ) : this(
        scope = scope,
        config = config,
        isAccessibilityActiveProvider = {
            (accessibilityManager?.isEnabled == true) &&
                (accessibilityManager.isTouchExplorationEnabled)
        },
        dispatcher = dispatcher,
        timeProvider = timeProvider
    )

    override val isAccessibilityActive: Boolean
        get() = isAccessibilityActiveProvider()

    private val mutex = Mutex()
    private var pendingPoliteJob: Job? = null
    private var pendingProgressJob: Job? = null

    private var lastAnnouncedProgressPercent: Int? = null
    private var lastAnnouncedProgressTimeMs: Long = 0L
    private var pendingProgressPercent: Int? = null
    private var pendingProgressLabel: String = ""

    override fun announcePolite(message: String) {
        if (!isAccessibilityActive || message.isBlank()) return

        scope.launch {
            mutex.withLock {
                pendingPoliteJob?.cancel()
                val job = launch {
                    if (config.politeDebounceMs > 0) {
                        delay(config.politeDebounceMs)
                    }
                    dispatcher.dispatch(message, isAssertive = false)
                }
                pendingPoliteJob = job
            }
        }
    }

    override fun announceAssertive(message: String) {
        if (!isAccessibilityActive || message.isBlank()) return

        // Constraint 1: Critical error announcements must bypass debounce queues to sound immediately.
        // Also cancel/clear all pending polite and progress jobs immediately.
        cancelPendingAnnouncements()
        dispatcher.dispatch(message, isAssertive = true)
    }

    override fun announceProgress(percent: Int, label: String) {
        if (!isAccessibilityActive) return

        val clampedPercent = percent.coerceIn(MIN_PERCENT, MAX_PERCENT)
        val currentTime = timeProvider()

        scope.launch {
            mutex.withLock {
                val lastPercent = lastAnnouncedProgressPercent
                val timeSinceLast = currentTime - lastAnnouncedProgressTimeMs

                val isMilestone = clampedPercent == MIN_PERCENT || clampedPercent == MAX_PERCENT
                val isFirstUpdate = lastPercent == null
                val stepSatisfied = isFirstUpdate ||
                    abs(clampedPercent - (lastPercent ?: 0)) >= config.minProgressStep
                val intervalSatisfied = timeSinceLast >= config.minProgressIntervalMs

                if (isMilestone || (stepSatisfied && intervalSatisfied)) {
                    // Immediate dispatch
                    pendingProgressJob?.cancel()
                    pendingProgressJob = null
                    dispatchProgressAnnouncement(clampedPercent, label, currentTime)
                } else if (stepSatisfied) {
                    // Step threshold met, but interval not yet elapsed: debounce trailing update
                    pendingProgressPercent = clampedPercent
                    pendingProgressLabel = label

                    if (pendingProgressJob == null || pendingProgressJob?.isActive == false) {
                        val waitTime = (config.minProgressIntervalMs - timeSinceLast).coerceAtLeast(0L)
                        pendingProgressJob = launch {
                            delay(waitTime)
                            mutex.withLock {
                                val latestPercent = pendingProgressPercent
                                val latestLabel = pendingProgressLabel
                                if (latestPercent != null) {
                                    dispatchProgressAnnouncement(
                                        latestPercent,
                                        latestLabel,
                                        timeProvider()
                                    )
                                }
                                pendingProgressJob = null
                            }
                        }
                    }
                }
            }
        }
    }

    private fun dispatchProgressAnnouncement(percent: Int, label: String, dispatchTime: Long) {
        val announcement = if (label.isBlank()) {
            "$percent%"
        } else {
            "$label: $percent%"
        }
        lastAnnouncedProgressPercent = percent
        lastAnnouncedProgressTimeMs = dispatchTime
        pendingProgressPercent = null
        dispatcher.dispatch(announcement, isAssertive = false)
    }

    override fun cancelPendingAnnouncements() {
        pendingPoliteJob?.cancel()
        pendingPoliteJob = null
        pendingProgressJob?.cancel()
        pendingProgressJob = null
        pendingProgressPercent = null
    }
}

/**
 * No-op implementation of [LiveRegionManager] for previews, tests, or disabled states.
 */
object NoOpLiveRegionManager : LiveRegionManager {
    override fun announcePolite(message: String) = Unit
    override fun announceAssertive(message: String) = Unit
    override fun announceProgress(percent: Int, label: String) = Unit
    override val isAccessibilityActive: Boolean = false
    override fun cancelPendingAnnouncements() = Unit
}

/**
 * Creates and remembers a [LiveRegionManager] bound to the composable lifecycle.
 */
@Composable
fun rememberLiveRegionManager(
    config: LiveRegionThrottleConfig = remember { LiveRegionThrottleConfig() }
): LiveRegionManager {
    val context = LocalContext.current.applicationContext
    val coroutineScope = rememberCoroutineScope()
    val accessibilityManager = remember(context) {
        context.getSystemService(Context.ACCESSIBILITY_SERVICE) as? AccessibilityManager
    }

    return remember(coroutineScope, accessibilityManager, config) {
        DefaultLiveRegionManager(
            scope = coroutineScope,
            config = config,
            accessibilityManager = accessibilityManager,
            dispatcher = AndroidAccessibilityAnnouncementDispatcher(context, accessibilityManager)
        )
    }
}
