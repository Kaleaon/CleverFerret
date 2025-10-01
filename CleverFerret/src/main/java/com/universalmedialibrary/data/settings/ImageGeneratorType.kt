package com.universalmedialibrary.data.settings

import kotlinx.serialization.Serializable

/**
 * Image generation model types for creating book covers using Gemini API
 */
@Serializable
enum class ImageGeneratorType {
    /**
     * Dedicated Imagen model - higher quality, optimized for book covers (default)
     */
    IMAGEN,

    /**
     * Gemini's native multimodal image generation - faster generation
     */
    GEMINI_BUILTIN
}
