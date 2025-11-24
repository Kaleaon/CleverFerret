package com.universalmedialibrary.services.dictionary

import kotlinx.serialization.Serializable

@Serializable
data class WordDefinition(
    val word: String,
    val phonetic: String? = null,
    val phonetics: List<Phonetic> = emptyList(),
    val meanings: List<Meaning> = emptyList(),
    val license: License? = null,
    val sourceUrls: List<String> = emptyList()
)

@Serializable
data class Phonetic(
    val text: String? = null,
    val audio: String? = null,
    val sourceUrl: String? = null,
    val license: License? = null
)

@Serializable
data class Meaning(
    val partOfSpeech: String,
    val definitions: List<DefinitionDetail> = emptyList(),
    val synonyms: List<String> = emptyList(),
    val antonyms: List<String> = emptyList()
)

@Serializable
data class DefinitionDetail(
    val definition: String,
    val synonyms: List<String> = emptyList(),
    val antonyms: List<String> = emptyList(),
    val example: String? = null
)

@Serializable
data class License(
    val name: String,
    val url: String
)
