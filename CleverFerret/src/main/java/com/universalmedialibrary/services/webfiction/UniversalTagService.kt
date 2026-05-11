package com.universalmedialibrary.services.webfiction

import com.universalmedialibrary.data.settings.ParentalControlsSettings
import com.universalmedialibrary.services.ContentFilterHelper
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.jsoup.Jsoup
import java.net.URLEncoder
import java.util.Locale
import com.universalmedialibrary.utils.FileNameSanitizer
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Universal tag service for all fanfiction sites
 * Provides tag browsing and discovery across multiple platforms
 */
@Singleton
class UniversalTagService @Inject constructor(
    private val metabodsTagService: MetabodsTagService,
    private val webFictionService: WebFictionService,
    private val parentalControlsSettings: ParentalControlsSettings,
    private val contentFilterHelper: ContentFilterHelper,
    private val fileNameSanitizer: FileNameSanitizer
) {

    companion object {
        private const val USER_AGENT = "Mozilla/5.0 (compatible; CleverFerret/1.0)"
        private const val REQUEST_TIMEOUT = 30000
        private const val SCRIBBLE_HUB_PAGE_SIZE = 25
    }

    private val royalRoadCountRegex = Regex("\\((\\d[\\d,]*)\\)")

    private suspend fun ensureAdultAccess(siteType: WebFictionSiteType): Result<Unit> {
        if (!siteType.isAdultSite()) return Result.success(Unit)
        return if (parentalControlsSettings.isAdultSourcesAllowed()) {
            Result.success(Unit)
        } else {
            Result.failure(AdultSitesDisabledException())
        }
    }

    /**
     * Fetch tags for a specific site
     */
    suspend fun fetchTagsForSite(siteType: WebFictionSiteType): Result<List<WebFictionTag>> {
        ensureAdultAccess(siteType).onFailure { return Result.failure(it) }
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.fetchAllTags()
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> fetchAO3Tags()
            WebFictionSiteType.FANFICTION_NET -> fetchFFNTags()
            WebFictionSiteType.WATTPAD -> fetchWattpadTags()
            WebFictionSiteType.ROYAL_ROAD -> fetchRoyalRoadTags()
            WebFictionSiteType.SCRIBBLE_HUB -> fetchScribbleHubTags()
            WebFictionSiteType.LITEROTICA -> fetchLiteroticaTags()
            WebFictionSiteType.NIFTY -> fetchNiftyTags()
            WebFictionSiteType.ADULT_FANFICTION -> fetchAdultFanFictionTags()
            WebFictionSiteType.BDSM_LIBRARY -> fetchBdsmlibraryTags()
            WebFictionSiteType.MCSTORIES -> fetchMcstoriesTags()
            WebFictionSiteType.QUESTIONABLE_QUESTING -> fetchQQTags()
            else -> Result.success(emptyList())
        }
    }

    /**
     * Browse stories by tags on any supported site
     */
    suspend fun browseByTags(
        siteType: WebFictionSiteType,
        criteria: StorySearchCriteria
    ): Result<StorySearchResult> {
        ensureAdultAccess(siteType).onFailure { return Result.failure(it) }
        return when (siteType) {
            WebFictionSiteType.METABODS -> metabodsTagService.browseByTags(criteria)
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> browseAO3ByTags(criteria)
            WebFictionSiteType.FANFICTION_NET -> browseFFNByTags(criteria)
            WebFictionSiteType.WATTPAD -> browseWattpadByTags(criteria)
            WebFictionSiteType.ROYAL_ROAD -> browseRoyalRoadByTags(criteria)
            WebFictionSiteType.SCRIBBLE_HUB -> browseScribbleHubByTags(criteria)
            WebFictionSiteType.NIFTY -> browseNiftyByTags(criteria)
            WebFictionSiteType.ADULT_FANFICTION -> browseAdultFanFictionByTags(criteria)
            WebFictionSiteType.BDSM_LIBRARY -> browseBdsmlibraryByTags(criteria)
            WebFictionSiteType.MCSTORIES -> browseMcstoriesByTags(criteria)
            else -> Result.failure(Exception("Tag browsing not yet implemented for ${siteType.displayName}"))
        }
    }

    // ===========================================================================================
    // ARCHIVE OF OUR OWN (AO3)
    // ===========================================================================================





    // ===========================================================================================
    // FANFICTION.NET
    // ===========================================================================================



    // ===========================================================================================
    // ROYAL ROAD
    // ===========================================================================================









    // ===========================================================================================
    // OTHER SITES (Wattpad, ScribbleHub, etc.)
    // ===========================================================================================











    /**
     * Browse ScribbleHub stories by tags
     */






    private suspend fun buildSearchResult(
        criteria: StorySearchCriteria,
        stories: List<WebFictionStory>
    ): StorySearchResult {
        val filtered = contentFilterHelper.filterStories(stories)
        val sliced = filtered.drop(criteria.offset)
        val limited = sliced.take(criteria.limit)
        val consumed = criteria.offset + limited.size
        val hasMore = filtered.size > consumed
        val nextOffset = if (hasMore) consumed else null
        return StorySearchResult(
            stories = limited,
            totalCount = filtered.size,
            hasMore = hasMore,
            nextOffset = nextOffset
        )
    }

    /**
     * Get site capabilities
     */
    fun getSiteCapabilities(siteType: WebFictionSiteType): SiteCapabilities {
        return when (siteType) {
            WebFictionSiteType.METABODS -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = true,
                supportedRatings = listOf("Mature", "Explicit")
            )
            WebFictionSiteType.ARCHIVE_OF_OUR_OWN -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = true,
                supportedRatings = listOf("General", "Teen", "Mature", "Explicit")
            )
            WebFictionSiteType.ROYAL_ROAD -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = false,
                supportedRatings = listOf("General", "Teen", "Mature")
            )
            WebFictionSiteType.NIFTY -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
            )
            WebFictionSiteType.ADULT_FANFICTION -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = true,
                hasDownloadButton = false,
                supportedRatings = listOf("Mature", "Explicit")
            )
            WebFictionSiteType.BDSM_LIBRARY -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
            )
            WebFictionSiteType.MCSTORIES -> SiteCapabilities(
                hasTagBrowsing = true,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = listOf("Explicit")
            )
            else -> SiteCapabilities(
                hasTagBrowsing = false,
                hasAdvancedSearch = false,
                hasDownloadButton = false,
                supportedRatings = emptyList()
            )
        }
    }
}

/**
 * Site capabilities for tag browsing
 */
data class SiteCapabilities(
    val hasTagBrowsing: Boolean,
    val hasAdvancedSearch: Boolean,
    val hasDownloadButton: Boolean,
    val supportedRatings: List<String>
)
