package com.universalmedialibrary.data.repository

import com.universalmedialibrary.data.local.dao.AnnotationDao
import com.universalmedialibrary.data.local.entity.TextAnnotation
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Repository for annotation-related data operations
 */
@Singleton
class AnnotationRepository @Inject constructor(
    private val annotationDao: AnnotationDao
) {
    fun getAnnotationsForBook(itemId: Long): Flow<List<TextAnnotation>> =
        annotationDao.getAnnotationsForBook(itemId)
    
    fun getAnnotationsForChapter(itemId: Long, chapterIndex: Int): Flow<List<TextAnnotation>> =
        annotationDao.getAnnotationsForChapter(itemId, chapterIndex)
    
    fun getAnnotationsByType(type: String): Flow<List<TextAnnotation>> =
        annotationDao.getAnnotationsByType(type)
    
    fun getAnnotationsWithNotes(): Flow<List<TextAnnotation>> =
        annotationDao.getAnnotationsWithNotes()
    
    suspend fun insertAnnotation(annotation: TextAnnotation): Long =
        annotationDao.insertAnnotation(annotation)
    
    suspend fun updateAnnotation(annotation: TextAnnotation) =
        annotationDao.updateAnnotation(annotation)
    
    suspend fun deleteAnnotation(annotationId: Long) =
        annotationDao.deleteAnnotation(annotationId)
    
    suspend fun deleteAllAnnotationsForBook(itemId: Long) =
        annotationDao.deleteAllAnnotationsForBook(itemId)
}
