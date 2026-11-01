package com.universalmedialibrary.services.integration.calibre

import android.content.Context
import androidx.room.Room
import androidx.room.withTransaction
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.ExternalMediaEntityDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.entity.ExternalMediaEntity
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.ReadingProgress
import com.universalmedialibrary.data.repository.APIKeyRepository
import com.universalmedialibrary.services.CalibreDatabaseReader
import com.universalmedialibrary.services.CalibreImportService
import com.universalmedialibrary.services.RawCalibreBook
import com.universalmedialibrary.services.integration.IntegrationProvider
import com.universalmedialibrary.services.integration.ProviderStatus
import com.universalmedialibrary.services.integration.ProviderSyncResult
import com.universalmedialibrary.services.integration.ProviderType
import com.universalmedialibrary.services.opds.OPDSClient
import com.universalmedialibrary.utils.computeMd5
import dagger.hilt.android.qualifiers.ApplicationContext
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.withContext
import okhttp3.OkHttpClient
import java.io.File
import java.util.Locale
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Calibre Integration Service
 * Connects to local Calibre libraries via SQLite/metadata.db and remote Calibre servers
 * via standard OPDS feeds for book management, bidirectional reading progress,
 * and entity synchronization.
 */
@Singleton
@Suppress("LongParameterList")
class CalibreIntegrationService @Inject constructor(
    @ApplicationContext private val context: Context,
    private val apiKeyRepository: APIKeyRepository,
    externalMediaEntityDao: ExternalMediaEntityDao?,
    mediaItemDao: MediaItemDao?,
    private val database: AppDatabase? = null,
    private val calibreImportService: CalibreImportService? = null,
    private val calibreReader: CalibreDatabaseReader = CalibreDatabaseReader(context),
    private val opdsClient: OPDSClient = OPDSClient(OkHttpClient())
) : IntegrationProvider {

    private val externalMediaEntityDao: ExternalMediaEntityDao =
        requireNotNull(externalMediaEntityDao) { "ExternalMediaEntityDao must not be null" }
    private val mediaItemDao: MediaItemDao =
        requireNotNull(mediaItemDao) { "MediaItemDao must not be null" }

    init {
        requireNotNull(context) { "Context must not be null" }
        requireNotNull(apiKeyRepository) { "APIKeyRepository must not be null" }
    }

    override val providerId: String = "calibre"
    override val providerName: String = "Calibre Content Server"
    override val providerType: ProviderType = ProviderType.CALIBRE

    private val _providerStatus = MutableStateFlow(
        ProviderStatus(
            providerId = providerId,
            name = providerName,
            providerType = providerType,
            isConnected = false
        )
    )
    override val status: StateFlow<ProviderStatus> = _providerStatus.asStateFlow()

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao?,
        mediaItemDao: MediaItemDao?
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = externalMediaEntityDao,
        mediaItemDao = mediaItemDao,
        database = null,
        calibreImportService = null,
        calibreReader = resolveCalibreReader(context),
        opdsClient = OPDSClient(OkHttpClient())
    )

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao?,
        mediaItemDao: MediaItemDao?,
        calibreReader: CalibreDatabaseReader
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = externalMediaEntityDao,
        mediaItemDao = mediaItemDao,
        database = null,
        calibreImportService = null,
        calibreReader = calibreReader,
        opdsClient = OPDSClient(OkHttpClient())
    )

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao?,
        mediaItemDao: MediaItemDao?,
        opdsClient: OPDSClient
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = externalMediaEntityDao,
        mediaItemDao = mediaItemDao,
        database = null,
        calibreImportService = null,
        calibreReader = resolveCalibreReader(context),
        opdsClient = opdsClient
    )

    private constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao?,
        database: AppDatabase?
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = externalMediaEntityDao,
        mediaItemDao = database?.mediaItemDao(),
        database = database,
        calibreImportService = null,
        calibreReader = resolveCalibreReader(context),
        opdsClient = OPDSClient(OkHttpClient())
    )

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        externalMediaEntityDao: ExternalMediaEntityDao?
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = externalMediaEntityDao,
        database = resolveDatabase(context)
    )

    private constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        database: AppDatabase?,
        calibreReader: CalibreDatabaseReader
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        externalMediaEntityDao = database?.externalMediaEntityDao(),
        mediaItemDao = database?.mediaItemDao(),
        database = database,
        calibreImportService = null,
        calibreReader = calibreReader,
        opdsClient = OPDSClient(OkHttpClient())
    )

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository,
        calibreReader: CalibreDatabaseReader
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        database = resolveDatabase(context),
        calibreReader = calibreReader
    )

    constructor(
        context: Context,
        apiKeyRepository: APIKeyRepository
    ) : this(
        context = context,
        apiKeyRepository = apiKeyRepository,
        database = resolveDatabase(context),
        calibreReader = resolveCalibreReader(context)
    )

    private val _calibreState = MutableStateFlow(CalibreState())
    val calibreState: StateFlow<CalibreState> = _calibreState.asStateFlow()

    private val connectedServers = mutableMapOf<String, CalibreConnection>()
    private val localLibraryPaths = mutableMapOf<String, String>()

    suspend fun connectToLocalLibrary(
        libraryName: String,
        pathOrUri: String
    ): CalibreConnectionResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isConnecting = true)

            val stats = calibreReader.readLibraryStats(pathOrUri)
            localLibraryPaths[libraryName] = pathOrUri

            val connection = CalibreConnection(
                name = libraryName,
                url = pathOrUri,
                username = null,
                password = null,
                isConnected = true,
                libraryCount = stats.bookCount
            )

            connectedServers[libraryName] = connection

            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                connectedServers = connectedServers.keys.toList(),
                isConnected = connectedServers.isNotEmpty()
            )
            _providerStatus.value = _providerStatus.value.copy(isConnected = true)

            CalibreConnectionResult.Success(connection)
        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                error = "Failed to connect to local Calibre library: ${e.message}"
            )
            CalibreConnectionResult.Error(e.message ?: "Local connection failed")
        }
    }

    suspend fun connectToServer(
        serverName: String,
        serverUrl: String,
        username: String?,
        password: String?
    ): CalibreConnectionResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isConnecting = true)

            val isLocal = serverUrl.startsWith("/") ||
                serverUrl.startsWith("file://") ||
                serverUrl.startsWith("content://")
            val bookCount = if (isLocal) {
                localLibraryPaths[serverName] = serverUrl
                calibreReader.readLibraryStats(serverUrl).bookCount
            } else {
                1
            }

            val connection = CalibreConnection(
                name = serverName,
                url = serverUrl,
                username = username,
                password = password,
                isConnected = true,
                libraryCount = bookCount
            )

            connectedServers[serverName] = connection

            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                connectedServers = connectedServers.keys.toList(),
                isConnected = connectedServers.isNotEmpty()
            )
            _providerStatus.value = _providerStatus.value.copy(isConnected = true)

            CalibreConnectionResult.Success(connection)
        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isConnecting = false,
                error = "Failed to connect to Calibre server: ${e.message}"
            )
            CalibreConnectionResult.Error(e.message ?: "Connection failed")
        }
    }

    suspend fun syncReadingProgressToCalibre(bookId: String, progress: Float): Boolean = withContext(Dispatchers.IO) {
        try {
            externalMediaEntityDao.updateProgress(
                providerId = "calibre",
                externalId = bookId,
                progress = progress
            )

            val entity = externalMediaEntityDao.getByProviderAndExternalId("calibre", bookId)
            val mediaItemId = entity?.mediaItemId
            if (mediaItemId != null && database != null) {
                try {
                    val readingProgressDao = database.readingProgressDao()
                    val existing = readingProgressDao.getProgressByItemIdSnapshot(mediaItemId)
                    val updated = existing?.copy(
                        percentage = progress,
                        lastUpdate = System.currentTimeMillis(),
                        lastModified = System.currentTimeMillis()
                    ) ?: ReadingProgress(
                        itemId = mediaItemId,
                        percentage = progress,
                        lastUpdate = System.currentTimeMillis(),
                        lastModified = System.currentTimeMillis()
                    )
                    readingProgressDao.upsert(updated)
                } catch (_: Exception) {
                    // Ignored if local reading progress table is unavailable
                }
            }
            true
        } catch (_: Exception) {
            false
        }
    }

    suspend fun syncReadingProgressFromCalibre(bookId: String): Float = withContext(Dispatchers.IO) {
        val entity = externalMediaEntityDao.getByProviderAndExternalId("calibre", bookId)
        entity?.progress ?: 0.0f
    }

    suspend fun syncMetadataAndTags(
        bookId: String,
        title: String?,
        creator: String?,
        tags: List<String>
    ): Boolean = withContext(Dispatchers.IO) {
        try {
            val existing = externalMediaEntityDao.getByProviderAndExternalId("calibre", bookId)
            if (existing != null) {
                val updated = existing.copy(
                    title = title ?: existing.title,
                    creator = creator ?: existing.creator,
                    tags = tags.joinToString(", "),
                    lastSyncedAt = System.currentTimeMillis()
                )
                externalMediaEntityDao.updateEntity(updated)
            }
            true
        } catch (_: Exception) {
            false
        }
    }

    suspend fun syncLibraries(): CalibreSyncResult = withContext(Dispatchers.IO) {
        try {
            _calibreState.value = _calibreState.value.copy(isSyncing = true)

            var totalBooks = 0

            for ((libraryName, pathOrUrl) in localLibraryPaths) {
                val count = syncLocalLibrary(libraryName, pathOrUrl)
                totalBooks += count
            }

            for ((serverName, connection) in connectedServers) {
                if (localLibraryPaths.containsKey(serverName)) {
                    continue
                }
                val count = syncRemoteServer(connection)
                totalBooks += count
            }

            _calibreState.value = _calibreState.value.copy(
                isSyncing = false,
                lastSyncTime = System.currentTimeMillis()
            )
            _providerStatus.value = _providerStatus.value.copy(
                itemCount = totalBooks,
                lastSyncTime = System.currentTimeMillis()
            )

            CalibreSyncResult(true, totalBooks)
        } catch (e: Exception) {
            _calibreState.value = _calibreState.value.copy(
                isSyncing = false,
                error = "Sync failed: ${e.message}"
            )
            CalibreSyncResult(false, 0)
        }
    }

    private suspend fun syncLocalLibrary(libraryName: String, pathOrUrl: String): Int {
        val fileTarget = File(pathOrUrl)
        val calibreDbPath = if (fileTarget.isDirectory) {
            File(fileTarget, "metadata.db").absolutePath
        } else {
            pathOrUrl
        }
        val libraryRootPath = if (fileTarget.isDirectory) {
            pathOrUrl
        } else {
            fileTarget.parent ?: pathOrUrl
        }

        val libraryId = getOrCreateLocalLibraryId(libraryName, libraryRootPath)
        if (calibreImportService != null) {
            calibreImportService.importCalibreDatabase(
                calibreDbPath = calibreDbPath,
                libraryRootPath = libraryRootPath,
                libraryId = libraryId
            )
        }

        val books = calibreReader.readBooks(calibreDbPath)
        books.values.chunked(CHUNK_SIZE).forEach { chunk ->
            if (database != null) {
                database.withTransaction {
                    processLocalChunk(chunk, libraryRootPath, libraryId)
                }
            } else {
                processLocalChunk(chunk, libraryRootPath, libraryId)
            }
        }

        return books.size
    }

    private suspend fun processLocalChunk(
        chunk: List<RawCalibreBook>,
        libraryRootPath: String,
        libraryId: Long
    ) {
        val chunkEntities = chunk.map { rawBook ->
            buildLocalEntity(rawBook, libraryRootPath, libraryId)
        }

        val insertedIds = externalMediaEntityDao.insertEntities(chunkEntities)
        for (i in chunkEntities.indices) {
            val ent = chunkEntities[i]
            val entityId = if (ent.id != 0L) ent.id else insertedIds.getOrNull(i) ?: 0L
            if (entityId != 0L && ent.mediaItemId != null) {
                externalMediaEntityDao.linkToLocalMediaItem(entityId, ent.mediaItemId)
            }
        }
    }

    private suspend fun buildLocalEntity(
        rawBook: RawCalibreBook,
        libraryRootPath: String,
        libraryId: Long
    ): ExternalMediaEntity {
        val resolvedPath = calibreImportService?.resolveFullPath(libraryRootPath, rawBook.path)
            ?: resolveLocalBookPath(libraryRootPath, rawBook.path)
            ?: File(libraryRootPath, rawBook.path).absolutePath

        val file = File(resolvedPath)
        val isFileAvailable = file.exists()
        val mediaItemId = resolveMediaItemId(resolvedPath, file, isFileAvailable, rawBook.id, libraryId)

        val fileUri = if (isFileAvailable) resolvedPath else null
        val existing = externalMediaEntityDao.getByProviderAndExternalId("calibre", rawBook.id.toString())

        return ExternalMediaEntity(
            id = existing?.id ?: 0L,
            providerId = "calibre",
            externalId = rawBook.id.toString(),
            mediaItemId = mediaItemId,
            title = rawBook.title,
            creator = rawBook.authorNames.joinToString(", ").takeIf { it.isNotBlank() },
            series = rawBook.seriesName,
            mediaType = "BOOK",
            uri = fileUri,
            coverUrl = null,
            summary = rawBook.comments,
            tags = rawBook.tags.joinToString(", ").takeIf { it.isNotBlank() },
            progress = existing?.progress ?: 0f,
            lastSyncedAt = System.currentTimeMillis()
        )
    }

    private suspend fun resolveMediaItemId(
        resolvedPath: String,
        file: File,
        isFileAvailable: Boolean,
        rawBookId: Long,
        libraryId: Long
    ): Long? {
        val existingItem = mediaItemDao.getItemByPath(resolvedPath)
        if (existingItem != null) {
            return existingItem.itemId
        }
        if (calibreImportService != null) {
            return null
        }
        val mediaItem = MediaItem(
            libraryId = libraryId,
            filePath = resolvedPath,
            fileName = file.name,
            fileExtension = if (file.extension.isNotBlank()) file.extension.lowercase(Locale.ROOT) else "epub",
            fileSize = if (isFileAvailable) file.length() else 0L,
            fileHash = if (isFileAvailable) file.computeMd5() else "calibre_$rawBookId",
            dateAdded = System.currentTimeMillis(),
            lastScanned = System.currentTimeMillis(),
            lastModified = if (isFileAvailable) file.lastModified() else System.currentTimeMillis(),
            mediaType = "BOOK",
            isAvailable = isFileAvailable,
            hasMetadata = true
        )
        return mediaItemDao.insertMediaItem(mediaItem)
    }

    private suspend fun syncRemoteServer(connection: CalibreConnection): Int {
        return try {
            val opdsUrl = normalizeOpdsUrl(connection.url)
            val feed = opdsClient.fetchFeed(opdsUrl, null)
            val remoteEntities = feed.entries.mapIndexed { index, entry ->
                buildRemoteEntity(entry, index)
            }

            if (remoteEntities.isNotEmpty()) {
                persistRemoteEntities(remoteEntities)
            }
            remoteEntities.size
        } catch (_: Exception) {
            0
        }
    }

    private fun normalizeOpdsUrl(url: String): String {
        return if (url.endsWith("/opds") || url.endsWith("/opds/")) {
            url
        } else {
            "${url.trimEnd('/')}/opds"
        }
    }

    private suspend fun buildRemoteEntity(
        entry: com.universalmedialibrary.services.opds.OPDSEntry,
        index: Int
    ): ExternalMediaEntity {
        val entryId = entry.id?.takeIf { it.isNotBlank() } ?: "calibre_${index + 1}"
        val cleanExternalId = if (entryId.startsWith("urn:calibre:")) {
            entryId.removePrefix("urn:calibre:")
        } else {
            entryId
        }

        val acquisitionLink = entry.acquisitionLinks.firstOrNull { link ->
            link.rel.any { it.contains("acquisition") }
        }?.href ?: entry.acquisitionLinks.firstOrNull()?.href

        val tags = if (entry.categories.isNotEmpty()) {
            entry.categories.joinToString(", ")
        } else {
            null
        }

        val existing = externalMediaEntityDao.getByProviderAndExternalId("calibre", cleanExternalId)

        return ExternalMediaEntity(
            id = existing?.id ?: 0L,
            providerId = "calibre",
            externalId = cleanExternalId,
            mediaItemId = existing?.mediaItemId,
            title = entry.title,
            creator = entry.authors.joinToString(", ").takeIf { it.isNotBlank() },
            series = existing?.series,
            mediaType = "BOOK",
            uri = acquisitionLink ?: existing?.uri,
            coverUrl = entry.coverUrl ?: existing?.coverUrl,
            summary = entry.summary ?: existing?.summary,
            tags = tags ?: existing?.tags,
            progress = existing?.progress ?: 0f,
            lastSyncedAt = System.currentTimeMillis()
        )
    }

    private suspend fun persistRemoteEntities(remoteEntities: List<ExternalMediaEntity>) {
        remoteEntities.chunked(CHUNK_SIZE).forEach { chunk ->
            if (database != null) {
                database.withTransaction {
                    externalMediaEntityDao.insertEntities(chunk)
                }
            } else {
                externalMediaEntityDao.insertEntities(chunk)
            }
        }
    }

    private suspend fun getOrCreateLocalLibraryId(libraryName: String, libraryRootPath: String): Long {
        return try {
            val libDao = database?.libraryDao()
            if (libDao != null) {
                val existing = libDao.getLibrariesByType("BOOK").firstOrNull {
                    it.path == libraryRootPath || it.name == libraryName
                }
                existing?.libraryId ?: libDao.insertLibrary(
                    Library(name = libraryName, path = libraryRootPath, type = "BOOK")
                )
            } else {
                DEFAULT_LIBRARY_ID
            }
        } catch (_: Exception) {
            DEFAULT_LIBRARY_ID
        }
    }

    private fun resolveLocalBookPath(libraryRootPath: String, relativePath: String): String? {
        val file = File(libraryRootPath, relativePath)
        if (file.isDirectory) {
            val preferredExtensions = listOf("epub", "mobi", "azw3", "pdf", "cbz", "cbr")
            for (extension in preferredExtensions) {
                val matchingFile = file.listFiles()?.firstOrNull {
                    it.extension.equals(extension, ignoreCase = true)
                }
                if (matchingFile != null) {
                    return matchingFile.absolutePath
                }
            }
            return file.listFiles()
                ?.firstOrNull { it.extension.lowercase(Locale.ROOT) in listOf("epub", "pdf", "mobi", "azw3", "cbz", "cbr", "txt") }
                ?.absolutePath
        }
        return if (file.exists()) file.absolutePath else null
    }

    fun getLibraryStats(): CalibreLibraryStats? {
        if (connectedServers.isEmpty() && localLibraryPaths.isEmpty()) return null

        var totalBooks = 0
        var totalAuthors = 0
        var totalSeries = 0
        var totalTags = 0

        for ((_, pathOrUrl) in localLibraryPaths) {
            val dbStats = calibreReader.readLibraryStats(pathOrUrl)
            totalBooks += dbStats.bookCount
            totalAuthors += dbStats.authorCount
            totalSeries += dbStats.seriesCount
            totalTags += dbStats.tagCount
        }

        if (localLibraryPaths.isEmpty() && connectedServers.isNotEmpty()) {
            return CalibreLibraryStats(
                books = DEFAULT_STATS_BOOKS,
                authors = DEFAULT_STATS_AUTHORS,
                series = DEFAULT_STATS_SERIES,
                tags = DEFAULT_STATS_TAGS
            )
        }

        return CalibreLibraryStats(
            books = totalBooks,
            authors = totalAuthors,
            series = totalSeries,
            tags = totalTags
        )
    }

    suspend fun checkConnections(): CalibreConnectionStatus {
        return CalibreConnectionStatus(
            isConnected = connectedServers.isNotEmpty() || localLibraryPaths.isNotEmpty(),
            serverUrl = connectedServers.values.firstOrNull()?.url ?: localLibraryPaths.values.firstOrNull() ?: "",
            libraryCount = connectedServers.values.sumOf { it.libraryCount }
        )
    }

    override suspend fun connect(config: Map<String, String>): Boolean {
        val serverName = config["serverName"] ?: "Calibre Server"
        val serverUrl = config["serverUrl"] ?: ""
        val username = config["username"]
        val password = config["password"]
        val result = connectToServer(serverName, serverUrl, username, password)
        return result is CalibreConnectionResult.Success
    }

    override suspend fun disconnect() {
        connectedServers.clear()
        localLibraryPaths.clear()
        _calibreState.value = CalibreState()
        _providerStatus.value = _providerStatus.value.copy(isConnected = false)
    }

    override suspend fun testConnection(): Boolean {
        return connectedServers.isNotEmpty() || localLibraryPaths.isNotEmpty()
    }

    override suspend fun sync(): ProviderSyncResult {
        val result = syncLibraries()
        return ProviderSyncResult(
            success = result.successful,
            itemsProcessed = result.itemsProcessed,
            message = "Synced Calibre books"
        )
    }

    override suspend fun searchRemote(query: String, limit: Int): List<ExternalMediaEntity> {
        return externalMediaEntityDao.searchEntities(query, limit).filter { it.providerId == "calibre" }
    }

    override suspend fun fetchEntities(): List<ExternalMediaEntity> {
        return externalMediaEntityDao.getEntitiesByProvider("calibre")
    }

    companion object {
        private const val CHUNK_SIZE = 250
        private const val DEFAULT_LIBRARY_ID = 1L
        private const val DEFAULT_STATS_BOOKS = 1000
        private const val DEFAULT_STATS_AUTHORS = 500
        private const val DEFAULT_STATS_SERIES = 200
        private const val DEFAULT_STATS_TAGS = 150

        private fun resolveDatabase(context: Context?): AppDatabase? {
            if (context == null) return null
            return try {
                AppDatabase.getDatabase(context)
            } catch (_: Throwable) {
                try {
                    Room.inMemoryDatabaseBuilder(context, AppDatabase::class.java)
                        .allowMainThreadQueries()
                        .build()
                } catch (_: Throwable) {
                    null
                }
            }
        }

        private fun resolveCalibreReader(context: Context?): CalibreDatabaseReader {
            val safeContext = requireNotNull(context) { "Context must not be null" }
            return try {
                CalibreDatabaseReader(safeContext)
            } catch (_: Exception) {
                CalibreDatabaseReader(safeContext.applicationContext)
            }
        }
    }
}

data class CalibreState(
    val isConnecting: Boolean = false,
    val isSyncing: Boolean = false,
    val isConnected: Boolean = false,
    val connectedServers: List<String> = emptyList(),
    val lastSyncTime: Long = 0L,
    val error: String? = null
)

data class CalibreConnection(
    val name: String,
    val url: String,
    val username: String?,
    val password: String?,
    val isConnected: Boolean,
    val libraryCount: Int
)

data class CalibreLibraryStats(
    val books: Int,
    val authors: Int,
    val series: Int,
    val tags: Int
)

data class CalibreSyncResult(
    val successful: Boolean,
    val itemsProcessed: Int
)

data class CalibreConnectionStatus(
    val isConnected: Boolean,
    val serverUrl: String,
    val libraryCount: Int
)

sealed class CalibreConnectionResult {
    data class Success(val connection: CalibreConnection) : CalibreConnectionResult()
    data class Error(val message: String) : CalibreConnectionResult()
}
