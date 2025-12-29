package com.universalmedialibrary.data.local.dao

import androidx.room.*
import com.universalmedialibrary.data.local.entity.*
import kotlinx.coroutines.flow.Flow

/**
 * DAO for tag hierarchy, synonyms, and category operations
 */
@Dao
interface TagHierarchyDao {

    // ==================== TAG HIERARCHY ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertHierarchy(hierarchy: TagHierarchy): Long

    @Delete
    suspend fun deleteHierarchy(hierarchy: TagHierarchy)

    @Query("DELETE FROM tag_hierarchies WHERE parentTagId = :parentId AND childTagId = :childId")
    suspend fun deleteHierarchyLink(parentId: Long, childId: Long)

    /**
     * Get all child tags of a parent
     */
    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN tag_hierarchies th ON t.tagId = th.childTagId
        WHERE th.parentTagId = :parentId
        ORDER BY t.name ASC
    """)
    fun getChildTags(parentId: Long): Flow<List<UnifiedTag>>

    /**
     * Get parent tag of a child
     */
    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN tag_hierarchies th ON t.tagId = th.parentTagId
        WHERE th.childTagId = :childId
        LIMIT 1
    """)
    suspend fun getParentTag(childId: Long): UnifiedTag?

    /**
     * Get all ancestor tags (recursive parents)
     */
    @Query("""
        WITH RECURSIVE ancestors AS (
            SELECT parentTagId, childTagId, depth FROM tag_hierarchies WHERE childTagId = :tagId
            UNION ALL
            SELECT th.parentTagId, th.childTagId, th.depth 
            FROM tag_hierarchies th
            INNER JOIN ancestors a ON th.childTagId = a.parentTagId
        )
        SELECT t.* FROM unified_tags t
        INNER JOIN ancestors a ON t.tagId = a.parentTagId
        ORDER BY a.depth DESC
    """)
    suspend fun getAncestorTags(tagId: Long): List<UnifiedTag>

    /**
     * Get all descendant tags (recursive children)
     */
    @Query("""
        WITH RECURSIVE descendants AS (
            SELECT parentTagId, childTagId, depth FROM tag_hierarchies WHERE parentTagId = :tagId
            UNION ALL
            SELECT th.parentTagId, th.childTagId, th.depth 
            FROM tag_hierarchies th
            INNER JOIN descendants d ON th.parentTagId = d.childTagId
        )
        SELECT t.* FROM unified_tags t
        INNER JOIN descendants d ON t.tagId = d.childTagId
    """)
    suspend fun getDescendantTags(tagId: Long): List<UnifiedTag>

    /**
     * Get root tags (tags with no parent)
     */
    @Query("""
        SELECT t.* FROM unified_tags t
        WHERE t.tagId NOT IN (SELECT childTagId FROM tag_hierarchies)
        ORDER BY t.name ASC
    """)
    fun getRootTags(): Flow<List<UnifiedTag>>

    // ==================== TAG SYNONYMS ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSynonym(synonym: TagSynonym): Long

    @Delete
    suspend fun deleteSynonym(synonym: TagSynonym)

    @Query("DELETE FROM tag_synonyms WHERE primaryTagId = :tagId")
    suspend fun deleteSynonymsForTag(tagId: Long)

    /**
     * Get all synonyms for a tag
     */
    @Query("SELECT * FROM tag_synonyms WHERE primaryTagId = :tagId ORDER BY synonymName ASC")
    fun getSynonymsForTag(tagId: Long): Flow<List<TagSynonym>>

    /**
     * Find tag by synonym name
     */
    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN tag_synonyms ts ON t.tagId = ts.primaryTagId
        WHERE LOWER(ts.synonymName) = LOWER(:synonymName)
        LIMIT 1
    """)
    suspend fun findTagBySynonym(synonymName: String): UnifiedTag?

    /**
     * Search tags including synonyms
     */
    @Query("""
        SELECT DISTINCT t.* FROM unified_tags t
        LEFT JOIN tag_synonyms ts ON t.tagId = ts.primaryTagId
        WHERE LOWER(t.name) LIKE '%' || LOWER(:query) || '%'
           OR LOWER(ts.synonymName) LIKE '%' || LOWER(:query) || '%'
        ORDER BY t.usageCount DESC
        LIMIT :limit
    """)
    suspend fun searchTagsWithSynonyms(query: String, limit: Int = 20): List<UnifiedTag>

    // ==================== TAG CATEGORIES ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCategory(category: TagCategory): Long

    @Update
    suspend fun updateCategory(category: TagCategory)

    @Delete
    suspend fun deleteCategory(category: TagCategory)

    @Query("SELECT * FROM tag_categories ORDER BY displayOrder ASC, name ASC")
    fun getAllCategories(): Flow<List<TagCategory>>

    @Query("SELECT * FROM tag_categories WHERE categoryId = :categoryId")
    suspend fun getCategoryById(categoryId: Long): TagCategory?

    @Query("SELECT * FROM tag_categories WHERE name = :name LIMIT 1")
    suspend fun getCategoryByName(name: String): TagCategory?

    /**
     * Get tags in a category
     */
    @Query("""
        SELECT t.* FROM unified_tags t
        INNER JOIN tag_category_assignments tca ON t.tagId = tca.tagId
        WHERE tca.categoryId = :categoryId
        ORDER BY t.name ASC
    """)
    fun getTagsInCategory(categoryId: Long): Flow<List<UnifiedTag>>

    /**
     * Get categories for a tag
     */
    @Query("""
        SELECT tc.* FROM tag_categories tc
        INNER JOIN tag_category_assignments tca ON tc.categoryId = tca.categoryId
        WHERE tca.tagId = :tagId
        ORDER BY tc.displayOrder ASC
    """)
    fun getCategoriesForTag(tagId: Long): Flow<List<TagCategory>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun assignTagToCategory(assignment: TagCategoryAssignment)

    @Query("DELETE FROM tag_category_assignments WHERE tagId = :tagId AND categoryId = :categoryId")
    suspend fun removeTagFromCategory(tagId: Long, categoryId: Long)

    // ==================== SMART TAG RULES ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertSmartTagRule(rule: SmartTagRule): Long

    @Update
    suspend fun updateSmartTagRule(rule: SmartTagRule)

    @Delete
    suspend fun deleteSmartTagRule(rule: SmartTagRule)

    @Query("SELECT * FROM smart_tag_rules WHERE isEnabled = 1 ORDER BY priority DESC")
    fun getEnabledSmartTagRules(): Flow<List<SmartTagRule>>

    @Query("SELECT * FROM smart_tag_rules ORDER BY priority DESC, name ASC")
    fun getAllSmartTagRules(): Flow<List<SmartTagRule>>

    @Query("SELECT * FROM smart_tag_rules WHERE tagId = :tagId")
    fun getSmartTagRulesForTag(tagId: Long): Flow<List<SmartTagRule>>

    @Query("UPDATE smart_tag_rules SET applyCount = applyCount + 1 WHERE ruleId = :ruleId")
    suspend fun incrementRuleApplyCount(ruleId: Long)

    // ==================== RELATED TAGS ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertRelatedTag(relation: RelatedTag): Long

    @Delete
    suspend fun deleteRelatedTag(relation: RelatedTag)

    /**
     * Get related tags for a specific tag
     */
    @Query("""
        SELECT t.* 
        FROM unified_tags t
        INNER JOIN related_tags rt ON t.tagId = rt.relatedTagId
        WHERE rt.tagId = :tagId
        ORDER BY rt.relationStrength DESC
        LIMIT :limit
    """)
    suspend fun getRelatedTags(tagId: Long, limit: Int = 10): List<UnifiedTag>

    /**
     * Get commonly co-occurring tags
     */
    @Query("""
        SELECT t.* 
        FROM unified_tags t
        INNER JOIN related_tags rt ON t.tagId = rt.relatedTagId
        WHERE rt.tagId = :tagId AND rt.relationType = 'COMMONLY_USED_WITH'
        ORDER BY rt.coOccurrenceCount DESC
        LIMIT :limit
    """)
    suspend fun getCoOccurringTags(tagId: Long, limit: Int = 5): List<UnifiedTag>

    /**
     * Update co-occurrence count
     */
    @Query("""
        UPDATE related_tags 
        SET coOccurrenceCount = coOccurrenceCount + 1 
        WHERE tagId = :tagId AND relatedTagId = :relatedTagId
    """)
    suspend fun incrementCoOccurrence(tagId: Long, relatedTagId: Long)

    // ==================== TAG ANALYTICS ====================

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnalytics(analytics: TagAnalytics): Long

    @Query("""
        SELECT * FROM tag_analytics 
        WHERE tagId = :tagId 
        ORDER BY period DESC 
        LIMIT :months
    """)
    suspend fun getTagAnalytics(tagId: Long, months: Int = 12): List<TagAnalytics>

    @Query("""
        UPDATE tag_analytics 
        SET searchCount = searchCount + 1 
        WHERE tagId = :tagId AND period = :period
    """)
    suspend fun incrementSearchCount(tagId: Long, period: String)

    // ==================== BATCH OPERATIONS ====================

    /**
     * Get tag with all related data
     */
    @Transaction
    suspend fun getTagWithDetails(tagId: Long): TagWithDetails? {
        val tag = getTagById(tagId) ?: return null
        val parent = getParentTag(tagId)
        val synonyms = getSynonymsForTagSync(tagId)
        val categories = getCategoriesForTagSync(tagId)
        
        return TagWithDetails(
            tag = tag,
            parentTag = parent,
            synonyms = synonyms,
            categories = categories
        )
    }

    @Query("SELECT * FROM unified_tags WHERE tagId = :tagId")
    suspend fun getTagById(tagId: Long): UnifiedTag?

    @Query("SELECT * FROM tag_synonyms WHERE primaryTagId = :tagId")
    suspend fun getSynonymsForTagSync(tagId: Long): List<TagSynonym>

    @Query("""
        SELECT tc.* FROM tag_categories tc
        INNER JOIN tag_category_assignments tca ON tc.categoryId = tca.categoryId
        WHERE tca.tagId = :tagId
    """)
    suspend fun getCategoriesForTagSync(tagId: Long): List<TagCategory>

    /**
     * Batch get all tag-category assignments (for N+1 query optimization)
     */
    @Query("SELECT tagId, categoryId FROM tag_category_assignments")
    suspend fun getAllTagCategoryAssignments(): List<TagCategoryAssignmentTuple>

    /**
     * Learn tag co-occurrence from items that have multiple tags
     */
    @Query("""
        SELECT it2.tagId as relatedTag, COUNT(*) as count
        FROM item_tags it1
        INNER JOIN item_tags it2 ON it1.itemId = it2.itemId AND it1.tagId != it2.tagId
        WHERE it1.tagId = :tagId
        GROUP BY it2.tagId
        ORDER BY count DESC
        LIMIT :limit
    """)
    suspend fun findCoOccurringTagIds(tagId: Long, limit: Int = 20): List<CoOccurrenceResult>
}

/**
 * Tag with all related details
 */
data class TagWithDetails(
    val tag: UnifiedTag,
    val parentTag: UnifiedTag?,
    val synonyms: List<TagSynonym>,
    val categories: List<TagCategory>
)

/**
 * Co-occurrence query result
 */
data class CoOccurrenceResult(
    val relatedTag: Long,
    val count: Int
)

/**
 * Simple tuple for tag-category assignments (for batch queries)
 */
data class TagCategoryAssignmentTuple(
    val tagId: Long,
    val categoryId: Long
)
