package com.universalmedialibrary.services

import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.provider.DocumentsContract
import android.util.Xml
import androidx.documentfile.provider.DocumentFile
import com.universalmedialibrary.data.MediaType
import com.universalmedialibrary.data.local.dao.LibraryDao
import com.universalmedialibrary.data.local.dao.MediaItemDao
import com.universalmedialibrary.data.local.dao.MetadataDao
import com.universalmedialibrary.data.local.entity.Library
import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.MetadataMusicTrack
import com.universalmedialibrary.data.local.entity.People
import com.universalmedialibrary.data.local.entity.ItemPersonRole
import com.universalmedialibrary.data.local.entity.MetadataBook
import com.universalmedialibrary.data.local.entity.Series
import com.universalmedialibrary.utils.ComicInfoParser
import com.universalmedialibrary.utils.ComicArchiveUtils
import com.universalmedialibrary.utils.FilebotDataService
import com.universalmedialibrary.utils.FileNameSanitizer
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.xmlpull.v1.XmlPullParser
import java.io.ByteArrayOutputStream
import java.security.MessageDigest
import java.io.File
import java.text.SimpleDateFormat
import java.util.Locale
import java.util.zip.ZipInputStream
import javax.inject.Inject
import javax.inject.Singleton
import com.universalmedialibrary.utils.ErrorLogger
import com.universalmedialibrary.services.importer.ImportLogInfo
import com.universalmedialibrary.services.importer.ImportOperationLog
import com.universalmedialibrary.services.importer.ImportOperationStatus
import com.universalmedialibrary.services.importer.ImportTransactionLog
import com.universalmedialibrary.services.importer.UndoSummary
import com.universalmedialibrary.services.storage.StorageImportClassifier
import kotlinx.serialization.json.Json
import kotlinx.serialization.encodeToString
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.Serializable
import kotlinx.coroutines.currentCoroutineContext
import kotlinx.coroutines.isActive
import kotlinx.coroutines.CancellationException

data class ImportSortOptions(
    val moveFiles: Boolean = false
    ,
    val removeEmptyFolders: Boolean = true
    ,
    val conflictStrategy: ImportConflictStrategy = ImportConflictStrategy.RENAME
    ,
    val preventDuplicates: Boolean = true
    ,
    val duplicateStrategy: ImportConflictStrategy = ImportConflictStrategy.SKIP
    ,
    val storeContentHash: Boolean = true
    ,
    val profile: ImportSortProfile = ImportSortProfile.DEFAULT
)
data class ImportSortSummary(
    val imported: Int = 0,
    val skipped: Int = 0,
    val errors: Int = 0,
    val deletedFolders: Int = 0
)
data class ImportPlan(
    val inputTreeUri: String,
    val outputTreeUri: String,
    val items: List<ImportPlanItem>
)
data class ImportPlanItem(
    val sourceUri: String,
    val sourceDisplayName: String,
    val mediaType: String,
    val title: String,
    val authorOrArtist: String? = null,
    val album: String? = null,
    val series: String? = null,
    val trackNumber: Int? = null,
    val durationMs: Long? = null,
    val metadataSource: String? = null,
    val confidence: Float = 0.5f,
    val reasons: List<String> = emptyList(),
    val destSegments: List<String>,
    val outputFileName: String,
    val conflictStrategy: ImportConflictStrategy? = null,
    val fileSize: Long? = null
) {
    val isQuestionable: Boolean
        get() = confidence < 0.7f || reasons.isNotEmpty()
}
enum class ImportConflictStrategy {
    SKIP,
    RENAME,
    REPLACE,
    QUARANTINE
}
enum class ImportSortProfile {
    DEFAULT,
    COMICS_SINGLETONS_TO_ROOT,
    COMICS_ALWAYS_SERIES_FOLDER,
    BOOKS_FLAT,
    BOOKS_AUTHOR_TITLE
}
