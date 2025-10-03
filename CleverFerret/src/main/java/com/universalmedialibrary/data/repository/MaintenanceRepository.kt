package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.MaintenanceChangeDao
import com.universalmedialibrary.data.local.entity.MaintenanceChange
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class MaintenanceRepository @Inject constructor(
    private val dao: MaintenanceChangeDao
) {
    fun getPending(): Flow<List<MaintenanceChange>> = dao.getByStatus("PENDING")
    fun getAll(): Flow<List<MaintenanceChange>> = dao.getAll()

    suspend fun propose(change: MaintenanceChange): Long = dao.insert(change)
    suspend fun accept(changeId: Long) = dao.setStatus(changeId, "ACCEPTED")
    suspend fun reject(changeId: Long) = dao.setStatus(changeId, "REJECTED")
}
