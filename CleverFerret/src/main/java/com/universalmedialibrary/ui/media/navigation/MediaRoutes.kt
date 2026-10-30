package com.universalmedialibrary.ui.media.navigation

import android.net.Uri

/**
 * Main Navigation Routes for Clean media-centric CleverFerret
 */
object MediaRoutes {
    // Main sections
    const val HOME = "home"
    const val SEARCH = "search"
    const val ACTIVITY = "activity"
    const val ROOM_CHAT = "room-chat/{roomName}"
    const val SETTINGS = "settings"
    
    // Library routes
    const val LIBRARY_ROOT = "library"
    const val LIBRARY = "library/{mediaType}"
    const val BOOKS = "library/book"
    const val AUDIOBOOKS = "library/audiobook"
    const val MUSIC = "library/music"
    const val PODCASTS = "library/podcast"
    const val COMICS = "library/comic"
    const val MOVIES = "library/movie"
    const val TV_SHOWS = "library/tv_show"
    const val WEB_FICTION = "library/webfiction"
    const val RADIO = "library/radio"
    const val DOCUMENTS = "library/document"
    
    // Detail routes
    const val MEDIA_DETAIL = "detail/{mediaType}/{mediaId}"
    const val BOOK_DETAIL = "detail/book/{mediaId}"
    const val MUSIC_ALBUM_DETAIL = "detail/album/{mediaId}"
    const val ARTIST_DETAIL = "detail/artist/{mediaId}"
    const val PODCAST_DETAIL = "detail/podcast/{mediaId}"
    const val SERIES_DETAIL = "detail/series/{mediaId}"
    
    // Player routes
    const val READER = "reader/{mediaType}/{mediaId}"
    const val AUDIO_PLAYER = "player/audio/{playerType}"
    const val VIDEO_PLAYER = "player/video/{videoId}"
    // File/URI based viewers (arguments are URL-encoded; replace the legacy epub_reader, pdf_reader
    // and comic_reader routes)
    const val DOCUMENT_READER = "document-reader/{uri}/{name}"
    const val EPUB_READER = "epub-reader/{path}"
    const val PDF_READER = "pdf-reader/{path}"
    
    // Discovery routes
    const val DISCOVER = "discover"
    const val DISCOVERY_BASE = "discovery"
    const val DISCOVERY = "discovery?query={query}&tags={tags}&type={type}"
    const val OPDS_BROWSER = "opds"
    const val PODCAST_DISCOVER = "discover/podcasts"
    const val WEB_FICTION_BROWSE = "discover/webfiction/{source}"
    const val SEE_ALL = "home/see-all/{section}"

    // Metadata editing
    const val METADATA_EDITOR = "metadata-editor/{itemId}"

    // Standardized helper for discovery route with arguments
    fun discoveryRoute(query: String? = null, tags: String? = null, type: String? = null): String {
        val params = mutableListOf<String>()
        query?.takeIf { it.isNotBlank() }?.let { params.add("query=${Uri.encode(it)}") }
        tags?.takeIf { it.isNotBlank() }?.let { params.add("tags=${Uri.encode(it)}") }
        type?.takeIf { it.isNotBlank() }?.let { params.add("type=${Uri.encode(it)}") }
        return if (params.isEmpty()) DISCOVERY_BASE else "$DISCOVERY_BASE?${params.joinToString("&")}"
    }
    
    // Collections & Organization
    const val COLLECTIONS = "collections"
    const val COLLECTION_DETAIL = "collection/{collectionId}"
    const val TAGS = "tags"
    const val TAG_DETAIL = "tag/{tagId}"
    const val TAG_MANAGER = "tag_manager"
    const val TAG_EXPLORER = "tag_explorer"
    const val SMART_COLLECTIONS = "smart_collections"
    const val SMART_COLLECTION_DETAIL = "smart_collection/{ruleId}"
    const val ENHANCED_SEARCH = "enhanced_search?query={query}&tags={tags}&mediaTypes={mediaTypes}"
    const val UNIVERSAL_SEARCH = "universal_search"
    
    // Helper for smart collection detail
    fun smartCollectionDetailRoute(ruleId: Long) = "smart_collection/$ruleId"
    
    // Helper for enhanced search with parameters
    fun enhancedSearchRoute(query: String? = null, tags: String? = null, mediaTypes: String? = null): String {
        val params = mutableListOf<String>()
        query?.let { params.add("query=$it") }
        tags?.let { params.add("tags=$it") }
        mediaTypes?.let { params.add("mediaTypes=$it") }
        return if (params.isEmpty()) "enhanced_search" else "enhanced_search?${params.joinToString("&")}"
    }
    
    // Special features
    const val AMBIENT_SOUNDS = "ambient"
    const val NEWS = "news"
    const val VISUALIZER = "visualizer"
    const val SYNC = "sync"
    const val IMPORT_EXPORT = "import-export"
    const val FOLDER_IMPORT = "folder-import"
    const val METADATA_REVIEW_QUEUE = "metadata-review-queue"
    
    // AI Entertainment (SynthChat Integration)
    // Removed

    // Link to Landseek
    const val LANDSEEK = "landseek"
    
    // Enhanced AI Systems
    const val ENHANCED_FILE_BROWSER = "enhanced-file-browser"
    
    // Settings sub-routes
    const val SETTINGS_API = "settings/api"
    const val SETTINGS_ACCOUNTS = "settings/accounts"
    const val SETTINGS_APPEARANCE = "settings/appearance"
    const val SETTINGS_PLAYBACK = "settings/playback"
    const val SETTINGS_READER = "settings/reader"
    const val SETTINGS_STORAGE = "settings/storage"
    const val SETTINGS_SECURITY = "settings/security"
    const val SETTINGS_ABOUT = "settings/about"
    const val SETTINGS_PAYWALL_THEMES = "settings/paywall/themes"
    const val SETTINGS_PAYWALL_SCANNER = "settings/paywall/scanner"
    const val SETTINGS_PAYWALL_CLOUD = "settings/paywall/cloud"
    // Legacy route compatibility (underscore is the primary route in the legacy settings UI)
    const val SETTINGS_MEDIA_SERVERS = "settings/media_servers"
    const val FILE_BROWSER = "file-browser"
    
    // Onboarding
    const val ONBOARDING = "onboarding"
    
    // Debug (only in debug builds)
    const val DEBUG_MENU = "debug"
    const val NOT_FOUND = "not-found?path={path}"
    
    // Helper functions for navigation
    /** Maps a stored media type (e.g. MUSIC_TRACK) to the route segment used by detail/reader routes. */
    fun routeNameForMediaType(storedType: String): String = when (storedType.uppercase()) {
        "BOOK", "EBOOK" -> "book"
        "AUDIOBOOK" -> "audiobook"
        "MOVIE", "DOCUMENTARY" -> "movie"
        "TV_SHOW" -> "tv_show"
        "MUSIC", "MUSIC_TRACK", "MUSIC_ALBUM" -> "music"
        "PODCAST", "PODCAST_EPISODE", "PODCAST_SERIES" -> "podcast"
        "COMIC" -> "comic"
        "RADIO" -> "radio"
        "MAGAZINE", "NEWSPAPER", "DOCUMENT" -> "document"
        else -> storedType.lowercase()
    }
    fun libraryRoute(mediaType: String) = "library/$mediaType"
    fun mediaDetailRoute(mediaType: String, mediaId: String) = "detail/$mediaType/$mediaId"
    fun readerRoute(mediaType: String, mediaId: String) = "reader/$mediaType/$mediaId"
    fun audioPlayerRoute(playerType: String) = "player/audio/$playerType"
    fun videoPlayerRoute(videoId: String) = "player/video/$videoId"
    fun documentReaderRoute(uri: String, fileName: String) =
        "document-reader/${Uri.encode(uri)}/${Uri.encode(fileName)}"
    fun epubReaderRoute(path: String) = "epub-reader/${Uri.encode(path)}"
    fun pdfReaderRoute(path: String) = "pdf-reader/${Uri.encode(path)}"
    fun metadataEditorRoute(itemId: String) = "metadata-editor/${Uri.encode(itemId)}"
    fun collectionDetailRoute(collectionId: String) = "collection/$collectionId"
    fun webFictionBrowseRoute(source: String) = "discover/webfiction/${Uri.encode(source)}"
    fun seeAllRoute(section: String) = "home/see-all/${Uri.encode(section)}"
    fun notFoundRoute(path: String) = "not-found?path=${Uri.encode(path)}"
    fun roomChatRoute(roomName: String) = "room-chat/${Uri.encode(roomName)}"
}
