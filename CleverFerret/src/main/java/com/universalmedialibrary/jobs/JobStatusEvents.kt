package com.universalmedialibrary.jobs

import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.update

enum class JobExecutionState {
    QUEUED,
    RUNNING,
    PROGRESS,
    SUCCEEDED,
    FAILED,
    CANCELLED
}

data class JobStatusEvent(
    val contractType: JobContractType,
    val state: JobExecutionState,
    val jobId: String,
    val message: String? = null,
    val progress: Int? = null,
    val total: Int? = null,
    val timestampMs: Long = System.currentTimeMillis()
)

object JobStatusBus {
    private val _events = MutableSharedFlow<JobStatusEvent>(
        replay = 0,
        extraBufferCapacity = 128
    )
    val events: SharedFlow<JobStatusEvent> = _events.asSharedFlow()

    private val _latestByType = MutableStateFlow<Map<JobContractType, JobStatusEvent>>(emptyMap())
    val latestByType: StateFlow<Map<JobContractType, JobStatusEvent>> = _latestByType.asStateFlow()

    fun publish(event: JobStatusEvent) {
        _events.tryEmit(event)
        _latestByType.update { it + (event.contractType to event) }
    }
}
