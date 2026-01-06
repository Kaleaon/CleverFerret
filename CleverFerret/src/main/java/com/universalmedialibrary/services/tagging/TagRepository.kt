package com.universalmedialibrary.services.tagging

/**
 * This file contains legacy data classes that are used by the UniversalTagManager
 * for backward compatibility. The actual tag repository operations are handled
 * by com.universalmedialibrary.data.repository.TagRepository which uses the
 * UnifiedTag entity from the Room database.
 */

// Note: UniversalTag, MediaTagRelation, and TagStatistics are defined in UniversalTagManager.kt