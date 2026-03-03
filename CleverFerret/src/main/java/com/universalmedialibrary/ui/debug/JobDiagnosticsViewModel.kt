package com.universalmedialibrary.ui.debug

import androidx.lifecycle.ViewModel
import com.universalmedialibrary.jobs.JobContractType
import com.universalmedialibrary.jobs.JobStatusBus
import com.universalmedialibrary.jobs.JobStatusEvent
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.StateFlow
import javax.inject.Inject

@HiltViewModel
class JobDiagnosticsViewModel @Inject constructor() : ViewModel() {
    val jobEvents: Flow<JobStatusEvent> = JobStatusBus.events
    val latestEventsByType: StateFlow<Map<JobContractType, JobStatusEvent>> =
        JobStatusBus.latestByType
}
