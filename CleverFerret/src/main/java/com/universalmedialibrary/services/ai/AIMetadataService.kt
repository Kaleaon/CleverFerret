package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import com.universalmedialibrary.data.repository.MetadataStagingRepository
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to generate metadata and tags using AI.
 */
@Singleton
class AIMetadataService @Inject constructor(
    private val aiServiceManager: AIServiceManager,
    private val metadataStagingRepository: MetadataStagingRepository
) {

    /**
     * Suggest tags for a media item based on its metadata and stage them as pending candidates.
     */
    suspend fun suggestTags(mediaItem: MediaItem, metadata: MetadataCommon?): Result<List<String>> {
        val provider = aiServiceManager.getActiveProvider() ?: return Result.failure(Exception("No AI provider configured"))

        val prompt = buildTagSuggestionPrompt(mediaItem, metadata)
        
        val result = provider.generateInsight(
            prompt = prompt,
            contextText = "Media Type: ${mediaItem.mediaType}",
            type = ReaderAIInsightType.THEMES // Semantically closest
        )

        return result.map { response ->
            val tags = parseTags(response)
            if (tags.isNotEmpty()) {
                metadataStagingRepository.stageAITagSuggestions(
                    itemId = mediaItem.itemId,
                    tags = tags,
                    confidenceScore = 0.85f,
                    source = "AI:TagSuggestion"
                )
            }
            tags
        }
    }

    private fun buildTagSuggestionPrompt(mediaItem: MediaItem, metadata: MetadataCommon?): String {
        val title = metadata?.title ?: mediaItem.fileName
        val author = "Unknown Author" // MetadataCommon does not support author field yet
        val summary = metadata?.summary ?: "No summary available"
        val type = mediaItem.mediaType

        return """
            Analyze the following media item and suggest 5-10 relevant tags.
            
            Media Type: $type
            Title: $title
            Creator/Author: $author
            Description/Summary: $summary
            
            Output ONLY a comma-separated list of tags. Do not include numbering, bullet points, or extra text.
            Example output: Science Fiction, Space Opera, Adventure, Classic, Future
        """.trimIndent()
    }

    private fun parseTags(response: String): List<String> {
        return response.split(",")
            .map { it.trim() }
            .filter { it.isNotEmpty() }
            .map { 
                // clean up any accidental markdown or quotes
                it.replace("\"", "")
                  .replace("*", "")
                  .replace(".", "")
            }
    }
}
