package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.StagedMetadataCandidate
import kotlinx.coroutines.flow.Flow

@Dao
interface StagedMetadataCandidateDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCandidate(candidate: StagedMetadataCandidate): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCandidates(candidates: List<StagedMetadataCandidate>): List<Long>

    @Update
    suspend fun updateCandidate(candidate: StagedMetadataCandidate)

    @Query("SELECT * FROM staged_metadata_candidates WHERE candidateId = :candidateId")
    suspend fun getCandidateById(candidateId: Long): StagedMetadataCandidate?

    @Query("SELECT * FROM staged_metadata_candidates WHERE status = 'PENDING' ORDER BY confidenceScore DESC, createdAt DESC")
    fun observePendingCandidates(): Flow<List<StagedMetadataCandidate>>

    @Query("SELECT * FROM staged_metadata_candidates WHERE status = 'PENDING' ORDER BY confidenceScore DESC, createdAt DESC")
    suspend fun getPendingCandidates(): List<StagedMetadataCandidate>

    @Query("SELECT * FROM staged_metadata_candidates WHERE itemId = :itemId AND status = 'PENDING' ORDER BY createdAt DESC")
    suspend fun getPendingCandidatesByItemId(itemId: Long): List<StagedMetadataCandidate>

    @Query("DELETE FROM staged_metadata_candidates WHERE candidateId = :candidateId")
    suspend fun deleteCandidate(candidateId: Long)

    @Query("DELETE FROM staged_metadata_candidates WHERE candidateId IN (:candidateIds)")
    suspend fun deleteCandidates(candidateIds: List<Long>)

    @Query("DELETE FROM staged_metadata_candidates WHERE itemId = :itemId")
    suspend fun deleteCandidatesByItemId(itemId: Long)

    @Query("DELETE FROM staged_metadata_candidates WHERE expiresAt < :nowEpochMs")
    suspend fun deleteExpiredCandidates(nowEpochMs: Long = System.currentTimeMillis()): Int

    @Query("DELETE FROM staged_metadata_candidates")
    suspend fun deleteAllCandidates()
}
