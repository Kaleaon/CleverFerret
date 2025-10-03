package com.universalmedialibrary.services.opds

import javax.inject.Inject
import javax.inject.Singleton

/**
 * Minimal OPDS feed generator (stub) for future expansion.
 * Generates simple Atom XML with entries for media items.
 */
@Singleton
class OpdsService @Inject constructor() {
    fun generateCatalogFeed(title: String = "CleverFerret OPDS"): String {
        return """
            <?xml version="1.0" encoding="utf-8"?>
            <feed xmlns="http://www.w3.org/2005/Atom" xmlns:opds="http://opds-spec.org/2010/catalog">
              <title>$title</title>
              <id>urn:uuid:cleverferret:catalog</id>
              <updated>${System.currentTimeMillis()}</updated>
            </feed>
        """.trimIndent()
    }
}
