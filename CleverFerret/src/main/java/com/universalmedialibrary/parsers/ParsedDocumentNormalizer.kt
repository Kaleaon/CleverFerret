package com.universalmedialibrary.parsers

/**
 * Normalizes parser output so the reader pipeline can rely on a consistent contract.
 */
object ParsedDocumentNormalizer {

    fun normalize(
        document: ParsedDocument,
        capability: ParserFactory.ParserCapability
    ): ParsedDocument {
        val content = document.content.trim()
        val paragraphs = document.extractedParagraphs.ifEmpty {
            content
                .split(Regex("""\n\s*\n+"""))
                .map { it.trim() }
                .filter { it.isNotBlank() }
        }

        val headings = document.extractedHeadings.ifEmpty {
            document.structure?.headings.orEmpty().ifEmpty {
                paragraphs.take(3).mapIndexed { idx, text ->
                    Heading(
                        text = text.take(80),
                        level = if (idx == 0) 1 else 2,
                        position = idx
                    )
                }
            }
        }

        val tables = document.extractedTables.ifEmpty {
            document.structure?.tables.orEmpty()
        }

        val warnings = buildList {
            addAll(document.warnings)
            if (content.isBlank()) add("No extractable text content was found.")
            if (!capability.supportsHeadings && headings.isEmpty()) {
                add("Heading extraction is not fully supported for this format.")
            }
            if (!capability.supportsTables && tables.isEmpty()) {
                add("Table extraction is not fully supported for this format.")
            }
        }.distinct()

        val confidencePenalty = when {
            content.isBlank() -> 0.55f
            paragraphs.size < 2 -> 0.15f
            else -> 0f
        }

        val confidence = (document.parserConfidence * capability.baselineConfidence - confidencePenalty)
            .coerceIn(0f, 1f)

        return document.copy(
            content = content,
            extractedParagraphs = paragraphs,
            extractedHeadings = headings,
            extractedTables = tables,
            parserConfidence = confidence,
            warnings = warnings
        )
    }
}
