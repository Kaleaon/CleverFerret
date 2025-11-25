package com.universalmedialibrary.services.ai

import com.universalmedialibrary.data.local.entity.MediaItem
import com.universalmedialibrary.data.local.entity.MetadataCommon
import com.universalmedialibrary.data.local.entity.ReaderAIInsightType
import javax.inject.Inject
import javax.inject.Singleton

/**
 * Service to generate metadata and tags using AI.
 */
@Singleton
class AIMetadataService @Inject constructor(
    private val aiServiceManager: AIServiceManager
) {

    /**
     * Suggest tags for a media item based on its metadata.
     */
    suspend fun suggestTags(mediaItem: MediaItem, metadata: MetadataCommon?): Result<List<String>> {
        val provider = aiServiceManager.getActiveProvider() ?: return Result.failure(Exception("No AI provider configured"))

        val prompt = buildTagSuggestionPrompt(mediaItem, metadata)
        
        // We use SUMMARY type as a generic "generate text" request since we don't have a dedicated TAGS type yet,
        // or we could add one. For now, repurposing an existing type or adding a new one is fine.
        // Let's assume the provider can handle this prompt regardless of the "type" enum if we format the prompt well.
        // Ideally, we should add a TAGS type to ReaderAIInsightType, but for now we can use THEMES or SUMMARY.
        
        val result = provider.generateInsight(
            prompt = prompt,
            contextText = "Media Type: ${mediaItem.mediaType}",
            type = ReaderAIInsightType.THEMES // Semantically closest
        )

        return result.map { response ->
            parseTags(response)
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
