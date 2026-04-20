package com.cleverferret.v2.feature.opds.services.opds

data class OpdsCatalogResultV1(
    val catalogId: String,
    val title: String,
    val entryIds: List<String>,
)
