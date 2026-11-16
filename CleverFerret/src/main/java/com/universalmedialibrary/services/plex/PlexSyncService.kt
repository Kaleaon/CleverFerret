package com.universalmedialibrary.services.plex

import android.content.Context
import com.universalmedialibrary.data.local.AppDatabase
import com.universalmedialibrary.data.local.dao.*
import com.universalmedialibrary.services.cache.MediaDownloadScheduler
import com.universalmedialibrary.services.ingestion.IngestionPipeline
import com.universalmedialibrary.services.sync.ServerCredentialManager
import dagger.hilt.android.qualifiers.ApplicationContext
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service for syncing progress, ratings, collections and tags with Plex Media Server.
 * Refactored into [PlexSyncAdapter] to support journal-backed replay and vector clock conflict resolution.
 */
@Suppress("LongParameterList")
@Singleton
class PlexSyncService @Inject constructor(
    @ApplicationContext context: Context,
    database: AppDatabase,
    plexServerDao: PlexServerDao,
    plexMediaItemDao: PlexMediaItemDao,
    plexSyncDao: PlexSyncDao,
    mediaItemDao: MediaItemDao,
    libraryDao: LibraryDao,
    authService: PlexAuthService,
    ingestionPipeline: IngestionPipeline,
    plexVirtualUriResolver: PlexVirtualUriResolver? = null,
    downloadScheduler: MediaDownloadScheduler? = null,
    remoteSyncMutationDao: RemoteSyncMutationDao? = null,
    credentialManager: ServerCredentialManager? = null,
    progressSyncJournalDao: ProgressSyncJournalDao = database.progressSyncJournalDao()
) : PlexSyncAdapter(
    context = context,
    database = database,
    plexServerDao = plexServerDao,
    plexMediaItemDao = plexMediaItemDao,
    plexSyncDao = plexSyncDao,
    mediaItemDao = mediaItemDao,
    libraryDao = libraryDao,
    authService = authService,
    ingestionPipeline = ingestionPipeline,
    plexVirtualUriResolver = plexVirtualUriResolver,
    downloadScheduler = downloadScheduler,
    remoteSyncMutationDao = remoteSyncMutationDao,
    credentialManager = credentialManager,
    progressSyncJournalDao = progressSyncJournalDao
)
