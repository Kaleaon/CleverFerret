package com.cleverferret.v2.feature.search.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class SearchNavDestination(val route: String) {
    data object LibrarySearch : SearchNavDestination("library/search")
    data object DiscoverSearch : SearchNavDestination("discover/search")
}

interface SearchFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}
