package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.SharedLinkDao
import com.universalmedialibrary.data.local.entity.SharedLink
import kotlinx.coroutines.flow.Flow
import java.util.UUID
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class SharingRepository @Inject constructor(
    private val dao: SharedLinkDao
) {
    fun getLinksForTarget(type: String, id: Long): Flow<List<SharedLink>> = dao.getForTarget(type, id)

    suspend fun createLink(type: String, id: Long, expirationMs: Long? = null): SharedLink {
        val token = UUID.randomUUID().toString()
        val link = SharedLink(
            targetType = type,
            targetId = id,
            token = token,
            expiresAt = expirationMs?.let { System.currentTimeMillis() + it }
        )
        val newId = dao.insert(link)
        return link.copy(id = newId)
    }

    suspend fun setEnabled(id: Long, enabled: Boolean) = dao.setEnabled(id, enabled)
}

