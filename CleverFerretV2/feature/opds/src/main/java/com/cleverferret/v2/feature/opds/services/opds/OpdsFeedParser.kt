package com.cleverferret.v2.feature.opds.services.opds

import com.cleverferret.v2.core.common.error.AppError
import com.cleverferret.v2.core.network.resilience.AppErrorException
import com.cleverferret.v2.feature.opds.model.OpdsEntryV1
import com.cleverferret.v2.feature.opds.model.OpdsFeedV1
import com.cleverferret.v2.feature.opds.model.OpdsLinkV1
import org.w3c.dom.Element
import java.io.StringReader
import javax.xml.parsers.DocumentBuilderFactory
import org.xml.sax.InputSource

class OpdsFeedParser {

    fun parse(catalogUrl: String, rawXml: String): OpdsFeedV1 {
        val sanitized = sanitizeXmlEntities(rawXml)
        try {
            val documentBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder()
            val document = documentBuilder.parse(InputSource(StringReader(sanitized)))
            val feed = document.getElementsByTagName("feed").item(0)
                ?: throw AppErrorException(AppError.ParsingFailure("Missing <feed> root", "application/atom+xml"))

            val feedElement = feed as Element
            val title = feedElement.getElementsByTagName("title").item(0)?.textContent?.trim().orEmpty().ifBlank { "Untitled Catalog" }

            val entries = feedElement.getElementsByTagName("entry")
            val parsedEntries = buildList {
                for (i in 0 until entries.length) {
                    val entry = entries.item(i) as? Element ?: continue
                    add(parseEntry(entry, i))
                }
            }

            return OpdsFeedV1(
                catalogId = catalogUrl,
                title = title,
                entries = parsedEntries,
            )
        } catch (error: AppErrorException) {
            throw error
        } catch (error: Exception) {
            throw AppErrorException(
                AppError.ParsingFailure(
                    message = "Feed parse error: ${error.message ?: "malformed OPDS XML"}",
                    payloadType = "application/atom+xml",
                )
            )
        }
    }

    private fun parseEntry(element: Element, index: Int): OpdsEntryV1 {
        val title = element.getElementsByTagName("title").item(0)?.textContent?.trim().orEmpty().ifBlank { "Untitled" }
        val entryId = element.getElementsByTagName("id").item(0)?.textContent?.trim().takeUnless { it.isNullOrBlank() } ?: "entry-$index"

        val authors = element.getElementsByTagName("author").let { authorNodes ->
            buildList {
                for (i in 0 until authorNodes.length) {
                    val author = authorNodes.item(i) as? Element ?: continue
                    val name = author.getElementsByTagName("name").item(0)?.textContent?.trim().orEmpty()
                    if (name.isNotBlank()) add(name)
                }
            }
        }

        val links = element.getElementsByTagName("link").let { linkNodes ->
            buildList {
                for (i in 0 until linkNodes.length) {
                    val link = linkNodes.item(i) as? Element ?: continue
                    val href = link.getAttribute("href").trim()
                    if (href.isBlank()) continue
                    add(
                        OpdsLinkV1(
                            href = href,
                            rel = link.getAttribute("rel").split(Regex("\\s+")).filter { it.isNotBlank() },
                            type = link.getAttribute("type").ifBlank { null },
                            title = link.getAttribute("title").ifBlank { null },
                        )
                    )
                }
            }
        }

        val summary = element.getElementsByTagName("summary").item(0)?.textContent?.trim().takeUnless { it.isNullOrBlank() }

        return OpdsEntryV1(
            id = entryId,
            title = title,
            authors = authors,
            summary = summary,
            acquisitionLinks = links.filter { link -> link.rel.any { it.contains("acquisition") } },
        )
    }

    internal fun sanitizeXmlEntities(xmlContent: String): String {
        val withoutControlChars = xmlContent.replace(Regex("[\\u0000-\\u0008\\u000B\\u000C\\u000E-\\u001F]"), "")
        val escapedAmpersands = withoutControlChars.replace(Regex("&(?!(amp|lt|gt|quot|apos|#\\d+|#x[0-9a-fA-F]+);)"), "&amp;")
        val normalizedBrokenNumeric = escapedAmpersands.replace(Regex("&#(?!\\d+;|x[0-9a-fA-F]+;)"), "&amp;#")
        return normalizedBrokenNumeric
            .replace("&nbsp", "&amp;nbsp")
            .replace("&#x;", "&amp;#x;")
    }
}
