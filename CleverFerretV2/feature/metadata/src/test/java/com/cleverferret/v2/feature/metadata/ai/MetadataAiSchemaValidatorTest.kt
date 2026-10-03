package com.cleverferret.v2.feature.metadata.ai

import kotlin.test.Test
import kotlin.test.assertFalse
import kotlin.test.assertTrue

class MetadataAiSchemaValidatorTest {
    @Test
    fun `mind-map contract falls back when payload is malformed`() {
        val malformed = "{\"nodes\": [{\"id\":\"n1\"}]}"

        val result = MetadataAiSchemaValidator.validate(MetadataAiContract.MIND_MAP_GRAPH, malformed)

        assertFalse(result.valid)
        assertTrue(result.fallbackPayload.contains("\"edges\""))
    }

    @Test
    fun `recommendation contract accepts schema with required keys`() {
        val valid = "{\"recommendations\":[],\"reasoning\":\"Because it matches pacing\"}"

        val result = MetadataAiSchemaValidator.validate(MetadataAiContract.RECOMMENDATION_REASONING, valid)

        assertTrue(result.valid)
    }
}
