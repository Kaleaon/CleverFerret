package com.universalmedialibrary.ui.reader

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.automirrored.filled.ArrowBack
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.compose.ui.window.Dialog
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch

/**
 * Dictionary and Translation Integration
 * Features:
 * - Offline dictionary support
 * - Word lookup with definitions
 * - Synonyms and antonyms
 * - Etymology and pronunciation
 * - Translation to multiple languages
 * - Google Translate API integration
 * - Word history and favorites
 * - Quick lookup popup
 */

data class DictionaryEntry(
    val word: String,
    val pronunciation: String = "",
    val partOfSpeech: String = "",
    val definitions: List<String> = emptyList(),
    val synonyms: List<String> = emptyList(),
    val antonyms: List<String> = emptyList(),
    val examples: List<String> = emptyList(),
    val etymology: String = ""
)

data class TranslationResult(
    val originalText: String,
    val translatedText: String,
    val sourceLanguage: String,
    val targetLanguage: String,
    val confidence: Float = 0f
)

enum class LookupMode {
    DICTIONARY,
    TRANSLATION,
    BOTH
}

/**
 * Dictionary and Translation Service
 */
class DictionaryService {
    private val offlineDictionary = mutableMapOf<String, DictionaryEntry>()
    private val wordHistory = mutableListOf<String>()
    private val favorites = mutableSetOf<String>()

    init {
        // Preload some common words for demo
        loadSampleDictionary()
    }

    suspend fun lookupWord(word: String): DictionaryEntry? {
        // Simulate network/database lookup
        delay(300)
        addToHistory(word)
        return offlineDictionary[word.lowercase()]
    }

    suspend fun translateText(
        text: String,
        targetLanguage: String,
        sourceLanguage: String = "auto"
    ): TranslationResult {
        // Simulate translation API call
        delay(500)
        return TranslationResult(
            originalText = text,
            translatedText = "[Translated to $targetLanguage]: $text",
            sourceLanguage = sourceLanguage,
            targetLanguage = targetLanguage,
            confidence = 0.95f
        )
    }

    fun addToHistory(word: String) {
        if (word !in wordHistory) {
            wordHistory.add(0, word)
            if (wordHistory.size > 50) {
                wordHistory.removeLast()
            }
        }
    }

    fun addToFavorites(word: String) {
        favorites.add(word)
    }

    fun removeFromFavorites(word: String) {
        favorites.remove(word)
    }

    fun isFavorite(word: String) = word in favorites

    fun getHistory() = wordHistory.toList()

    fun getFavorites() = favorites.toList()

    private fun loadSampleDictionary() {
        offlineDictionary["book"] = DictionaryEntry(
            word = "book",
            pronunciation = "/bʊk/",
            partOfSpeech = "noun",
            definitions = listOf(
                "A written or printed work consisting of pages glued or sewn together along one side and bound in covers.",
                "A main division of a classic literary work.",
                "A set of records or accounts."
            ),
            synonyms = listOf("tome", "volume", "publication", "work"),
            antonyms = listOf(),
            examples = listOf(
                "I'm reading a fascinating book about ancient civilizations.",
                "The book of Genesis in the Bible."
            ),
            etymology = "Old English bōc (noun), bōcian (verb), of Germanic origin"
        )

        offlineDictionary["read"] = DictionaryEntry(
            word = "read",
            pronunciation = "/riːd/",
            partOfSpeech = "verb",
            definitions = listOf(
                "Look at and comprehend the meaning of (written or printed matter) by interpreting the characters or symbols of which it is composed.",
                "Speak (written or printed words) aloud.",
                "Understand or interpret the nature or significance of."
            ),
            synonyms = listOf("peruse", "study", "scan", "browse", "skim"),
            antonyms = listOf("write", "misread"),
            examples = listOf(
                "She enjoys reading mystery novels.",
                "He read the letter aloud to the family.",
                "I can read the situation and know when to leave."
            ),
            etymology = "Old English rǣdan, of Germanic origin"
        )

        offlineDictionary["library"] = DictionaryEntry(
            word = "library",
            pronunciation = "/ˈlaɪbreri/",
            partOfSpeech = "noun",
            definitions = listOf(
                "A building or room containing collections of books, periodicals, and sometimes films and recorded music for use or borrowing by the public or the members of an institution.",
                "A collection of books and periodicals held in a library.",
                "A collection of films, recorded music, etc., organized systematically and kept for research or borrowing."
            ),
            synonyms = listOf("archive", "repository", "collection"),
            antonyms = listOf(),
            examples = listOf(
                "The town has an excellent public library.",
                "She has an impressive library of rare books."
            ),
            etymology = "Middle English: from Old French librairie, from Latin librarium 'bookcase'"
        )
    }
}

/**
 * Quick lookup popup that appears when text is selected
 */
@Composable
fun QuickLookupPopup(
    selectedText: String,
    onDismiss: () -> Unit,
    service: DictionaryService,
    modifier: Modifier = Modifier
) {
    var lookupMode by remember { mutableStateOf(LookupMode.DICTIONARY) }
    var dictionaryEntry by remember { mutableStateOf<DictionaryEntry?>(null) }
    var translationResult by remember { mutableStateOf<TranslationResult?>(null) }
    var isLoading by remember { mutableStateOf(false) }
    var targetLanguage by remember { mutableStateOf("es") } // Spanish default
    val coroutineScope = rememberCoroutineScope()

    LaunchedEffect(selectedText, lookupMode) {
        isLoading = true
        when (lookupMode) {
            LookupMode.DICTIONARY -> {
                dictionaryEntry = service.lookupWord(selectedText)
            }
            LookupMode.TRANSLATION -> {
                translationResult = service.translateText(selectedText, targetLanguage)
            }
            LookupMode.BOTH -> {
                dictionaryEntry = service.lookupWord(selectedText)
                translationResult = service.translateText(selectedText, targetLanguage)
            }
        }
        isLoading = false
    }

    Dialog(onDismissRequest = onDismiss) {
        Card(
            modifier = modifier
                .fillMaxWidth()
                .heightIn(max = 600.dp),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.surface
            ),
            elevation = CardDefaults.cardElevation(defaultElevation = 8.dp)
        ) {
            Column(
                modifier = Modifier.fillMaxWidth()
            ) {
                // Header
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .background(MaterialTheme.colorScheme.primaryContainer)
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.SpaceBetween,
                    verticalAlignment = Alignment.CenterVertically
                ) {
                    Text(
                        text = selectedText,
                        style = MaterialTheme.typography.titleLarge,
                        fontWeight = FontWeight.Bold,
                        color = MaterialTheme.colorScheme.onPrimaryContainer
                    )
                    Row(horizontalArrangement = Arrangement.spacedBy(8.dp)) {
                        IconButton(
                            onClick = {
                                coroutineScope.launch {
                                    if (service.isFavorite(selectedText)) {
                                        service.removeFromFavorites(selectedText)
                                    } else {
                                        service.addToFavorites(selectedText)
                                    }
                                }
                            }
                        ) {
                            Icon(
                                imageVector = if (service.isFavorite(selectedText))
                                    Icons.Default.Favorite else Icons.Default.FavoriteBorder,
                                contentDescription = "Favorite",
                                tint = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                        IconButton(onClick = onDismiss) {
                            Icon(
                                Icons.Default.Close,
                                contentDescription = "Close",
                                tint = MaterialTheme.colorScheme.onPrimaryContainer
                            )
                        }
                    }
                }

                // Mode selector
                Row(
                    modifier = Modifier
                        .fillMaxWidth()
                        .padding(16.dp),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    FilterChip(
                        selected = lookupMode == LookupMode.DICTIONARY,
                        onClick = { lookupMode = LookupMode.DICTIONARY },
                        label = { Text("Dictionary") },
                        leadingIcon = { Icon(Icons.Default.Book, null, modifier = Modifier.size(18.dp)) },
                        modifier = Modifier.weight(1f)
                    )
                    FilterChip(
                        selected = lookupMode == LookupMode.TRANSLATION,
                        onClick = { lookupMode = LookupMode.TRANSLATION },
                        label = { Text("Translate") },
                        leadingIcon = { Icon(Icons.Default.Translate, null, modifier = Modifier.size(18.dp)) },
                        modifier = Modifier.weight(1f)
                    )
                }

                // Content
                if (isLoading) {
                    Box(
                        modifier = Modifier
                            .fillMaxWidth()
                            .height(200.dp),
                        contentAlignment = Alignment.Center
                    ) {
                        CircularProgressIndicator()
                    }
                } else {
                    Column(
                        modifier = Modifier
                            .fillMaxWidth()
                            .weight(1f)
                            .verticalScroll(rememberScrollState())
                            .padding(16.dp),
                        verticalArrangement = Arrangement.spacedBy(16.dp)
                    ) {
                        when (lookupMode) {
                            LookupMode.DICTIONARY -> {
                                dictionaryEntry?.let { DictionaryContent(it) }
                                    ?: Text("No definition found", style = MaterialTheme.typography.bodyLarge)
                            }
                            LookupMode.TRANSLATION -> {
                                // Language selector
                                LanguageSelector(
                                    selectedLanguage = targetLanguage,
                                    onLanguageSelect = { lang ->
                                        targetLanguage = lang
                                        coroutineScope.launch {
                                            isLoading = true
                                            translationResult = service.translateText(selectedText, lang)
                                            isLoading = false
                                        }
                                    }
                                )
                                translationResult?.let { TranslationContent(it) }
                            }
                            LookupMode.BOTH -> {
                                dictionaryEntry?.let { DictionaryContent(it) }
                                HorizontalDivider()
                                translationResult?.let { TranslationContent(it) }
                            }
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun DictionaryContent(entry: DictionaryEntry) {
    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        // Pronunciation
        if (entry.pronunciation.isNotEmpty()) {
            Row(
                verticalAlignment = Alignment.CenterVertically,
                horizontalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Icon(Icons.Default.RecordVoiceOver, null, modifier = Modifier.size(16.dp))
                Text(
                    text = entry.pronunciation,
                    style = MaterialTheme.typography.bodyLarge,
                    color = MaterialTheme.colorScheme.secondary
                )
            }
        }

        // Part of speech
        if (entry.partOfSpeech.isNotEmpty()) {
            Surface(
                color = MaterialTheme.colorScheme.secondaryContainer,
                shape = MaterialTheme.shapes.small
            ) {
                Text(
                    text = entry.partOfSpeech,
                    modifier = Modifier.padding(horizontal = 12.dp, vertical = 4.dp),
                    style = MaterialTheme.typography.labelMedium,
                    fontWeight = FontWeight.SemiBold
                )
            }
        }

        // Definitions
        if (entry.definitions.isNotEmpty()) {
            Text(
                text = "Definitions",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            entry.definitions.forEachIndexed { index, definition ->
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    Text(
                        text = "${index + 1}.",
                        style = MaterialTheme.typography.bodyMedium,
                        color = MaterialTheme.colorScheme.primary
                    )
                    Text(
                        text = definition,
                        style = MaterialTheme.typography.bodyMedium,
                        modifier = Modifier.weight(1f)
                    )
                }
            }
        }

        // Examples
        if (entry.examples.isNotEmpty()) {
            Text(
                text = "Examples",
                style = MaterialTheme.typography.titleSmall,
                fontWeight = FontWeight.Bold
            )
            entry.examples.forEach { example ->
                Surface(
                    color = MaterialTheme.colorScheme.surfaceVariant,
                    shape = MaterialTheme.shapes.small
                ) {
                    Text(
                        text = "\"$example\"",
                        modifier = Modifier.padding(12.dp),
                        style = MaterialTheme.typography.bodyMedium.copy(fontStyle = androidx.compose.ui.text.font.FontStyle.Italic)
                    )
                }
            }
        }

        // Synonyms
        if (entry.synonyms.isNotEmpty()) {
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                Text(
                    text = "Synonyms",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                Row(
                    modifier = Modifier.fillMaxWidth(),
                    horizontalArrangement = Arrangement.spacedBy(8.dp)
                ) {
                    entry.synonyms.take(5).forEach { synonym ->
                        SuggestionChip(
                            onClick = { /* Navigate to synonym definition */ },
                            label = { Text(synonym) }
                        )
                    }
                }
            }
        }

        // Etymology
        if (entry.etymology.isNotEmpty()) {
            Column(verticalArrangement = Arrangement.spacedBy(4.dp)) {
                Text(
                    text = "Etymology",
                    style = MaterialTheme.typography.titleSmall,
                    fontWeight = FontWeight.Bold
                )
                Text(
                    text = entry.etymology,
                    style = MaterialTheme.typography.bodySmall,
                    color = MaterialTheme.colorScheme.onSurfaceVariant
                )
            }
        }
    }
}

@Composable
private fun TranslationContent(result: TranslationResult) {
    Column(verticalArrangement = Arrangement.spacedBy(12.dp)) {
        Text(
            text = "Translation",
            style = MaterialTheme.typography.titleSmall,
            fontWeight = FontWeight.Bold
        )

        Card(
            modifier = Modifier.fillMaxWidth(),
            colors = CardDefaults.cardColors(
                containerColor = MaterialTheme.colorScheme.primaryContainer
            )
        ) {
            Column(
                modifier = Modifier
                    .fillMaxWidth()
                    .padding(16.dp),
                verticalArrangement = Arrangement.spacedBy(8.dp)
            ) {
                Text(
                    text = result.translatedText,
                    style = MaterialTheme.typography.bodyLarge,
                    fontWeight = FontWeight.Medium
                )
                if (result.confidence > 0) {
                    Text(
                        text = "Confidence: ${(result.confidence * 100).toInt()}%",
                        style = MaterialTheme.typography.bodySmall,
                        color = MaterialTheme.colorScheme.onPrimaryContainer.copy(alpha = 0.7f)
                    )
                }
            }
        }

        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            Button(
                onClick = { /* Copy to clipboard */ },
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.ContentCopy, null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(4.dp))
                Text("Copy")
            }
            Button(
                onClick = { /* Share translation */ },
                modifier = Modifier.weight(1f)
            ) {
                Icon(Icons.Default.Share, null, modifier = Modifier.size(18.dp))
                Spacer(modifier = Modifier.width(4.dp))
                Text("Share")
            }
        }
    }
}

@Composable
private fun LanguageSelector(
    selectedLanguage: String,
    onLanguageSelect: (String) -> Unit
) {
    val languages = mapOf(
        "es" to "Spanish",
        "fr" to "French",
        "de" to "German",
        "it" to "Italian",
        "pt" to "Portuguese",
        "ru" to "Russian",
        "ja" to "Japanese",
        "zh" to "Chinese",
        "ko" to "Korean",
        "ar" to "Arabic"
    )

    Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
        Text(
            text = "Target Language",
            style = MaterialTheme.typography.titleSmall,
            fontWeight = FontWeight.Bold
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            languages.entries.take(4).forEach { (code, name) ->
                FilterChip(
                    selected = selectedLanguage == code,
                    onClick = { onLanguageSelect(code) },
                    label = { Text(name, style = MaterialTheme.typography.bodySmall) },
                    modifier = Modifier.weight(1f)
                )
            }
        }
    }
}

/**
 * Dictionary history and favorites screen
 */
@Composable
fun DictionaryHistoryScreen(
    service: DictionaryService,
    onWordClick: (String) -> Unit,
    onBack: () -> Unit
) {
    var selectedTab by remember { mutableStateOf(0) }

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Dictionary") },
                navigationIcon = {
                    IconButton(onClick = onBack) {
                        Icon(Icons.AutoMirrored.Filled.ArrowBack, "Back")
                    }
                }
            )
        }
    ) { padding ->
        Column(modifier = Modifier.padding(padding)) {
            TabRow(selectedTabIndex = selectedTab) {
                Tab(
                    selected = selectedTab == 0,
                    onClick = { selectedTab = 0 },
                    text = { Text("History") },
                    icon = { Icon(Icons.Default.History, null) }
                )
                Tab(
                    selected = selectedTab == 1,
                    onClick = { selectedTab = 1 },
                    text = { Text("Favorites") },
                    icon = { Icon(Icons.Default.Favorite, null) }
                )
            }

            when (selectedTab) {
                0 -> WordList(
                    words = service.getHistory(),
                    onWordClick = onWordClick
                )
                1 -> WordList(
                    words = service.getFavorites(),
                    onWordClick = onWordClick
                )
            }
        }
    }
}

@Composable
private fun WordList(
    words: List<String>,
    onWordClick: (String) -> Unit
) {
    if (words.isEmpty()) {
        Box(
            modifier = Modifier.fillMaxSize(),
            contentAlignment = Alignment.Center
        ) {
            Text(
                text = "No words yet",
                style = MaterialTheme.typography.bodyLarge,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    } else {
        LazyColumn(
            contentPadding = PaddingValues(16.dp),
            verticalArrangement = Arrangement.spacedBy(8.dp)
        ) {
            items(words) { word ->
                Card(
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable { onWordClick(word) }
                ) {
                    Row(
                        modifier = Modifier
                            .fillMaxWidth()
                            .padding(16.dp),
                        horizontalArrangement = Arrangement.SpaceBetween,
                        verticalAlignment = Alignment.CenterVertically
                    ) {
                        Text(
                            text = word,
                            style = MaterialTheme.typography.bodyLarge,
                            fontWeight = FontWeight.Medium
                        )
                        Icon(
                            Icons.Default.ChevronRight,
                            contentDescription = null,
                            tint = MaterialTheme.colorScheme.onSurfaceVariant
                        )
                    }
                }
            }
        }
    }
}
