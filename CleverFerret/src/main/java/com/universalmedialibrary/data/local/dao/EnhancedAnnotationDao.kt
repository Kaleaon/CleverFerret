package com.universalmedialibrary.data.local.dao

import androidx.room.Dao
import androidx.room.Delete
import androidx.room.Insert
import androidx.room.OnConflictStrategy
import androidx.room.Query
import androidx.room.Update
import com.universalmedialibrary.data.local.entity.AnnotationCard
import com.universalmedialibrary.data.local.entity.AnnotationColor
import com.universalmedialibrary.data.local.entity.EnhancedAnnotation
import kotlinx.coroutines.flow.Flow

@Dao
interface EnhancedAnnotationDao {

    @Query("SELECT * FROM enhanced_annotations WHERE itemId = :itemId ORDER BY position ASC")
    fun getAnnotationsByItemId(itemId: Long): Flow<List<EnhancedAnnotation>>

    @Query("SELECT * FROM enhanced_annotations WHERE itemId = :itemId AND chapterId = :chapterId ORDER BY position ASC")
    fun getAnnotationsByChapter(itemId: Long, chapterId: Long): Flow<List<EnhancedAnnotation>>

    @Query("SELECT * FROM enhanced_annotations WHERE itemId = :itemId AND colorTag = :color ORDER BY position ASC")
    fun getAnnotationsByColor(itemId: Long, color: AnnotationColor): Flow<List<EnhancedAnnotation>>

    @Query("SELECT * FROM enhanced_annotations WHERE annotationId = :annotationId")
    suspend fun getAnnotationById(annotationId: Long): EnhancedAnnotation?

    @Query("SELECT * FROM enhanced_annotations WHERE itemId = :itemId ORDER BY createdAt DESC")
    fun getAnnotationsByTime(itemId: Long): Flow<List<EnhancedAnnotation>>

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnnotation(annotation: EnhancedAnnotation): Long

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertAnnotations(annotations: List<EnhancedAnnotation>)

    @Update
    suspend fun updateAnnotation(annotation: EnhancedAnnotation)

    @Delete
    suspend fun deleteAnnotation(annotation: EnhancedAnnotation)

    @Query("DELETE FROM enhanced_annotations WHERE itemId = :itemId")
    suspend fun deleteAnnotationsByItemId(itemId: Long)

    @Query("DELETE FROM enhanced_annotations WHERE annotationId = :annotationId")
    suspend fun deleteAnnotationById(annotationId: Long)

    @Query("SELECT COUNT(*) FROM enhanced_annotations WHERE itemId = :itemId")
    suspend fun getAnnotationCount(itemId: Long): Int

    @Query("SELECT COUNT(*) FROM enhanced_annotations WHERE itemId = :itemId AND colorTag = :color")
    suspend fun getAnnotationCountByColor(itemId: Long, color: AnnotationColor): Int

    @Query("UPDATE enhanced_annotations SET aiSummary = :summary WHERE annotationId = :annotationId")
    suspend fun updateAISummary(annotationId: Long, summary: String)

    @Query("UPDATE enhanced_annotations SET aiTranslation = :translation WHERE annotationId = :annotationId")
    suspend fun updateAITranslation(annotationId: Long, translation: String)

    @Query("SELECT * FROM annotation_cards WHERE annotationId = :annotationId")
    suspend fun getCardByAnnotationId(annotationId: Long): AnnotationCard?

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    suspend fun insertCard(card: AnnotationCard): Long

    @Update
    suspend fun updateCard(card: AnnotationCard)

    @Delete
    suspend fun deleteCard(card: AnnotationCard)
}
