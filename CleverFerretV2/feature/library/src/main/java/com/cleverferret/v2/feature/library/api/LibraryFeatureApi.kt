package com.cleverferret.v2.feature.library.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class LibraryNavDestination(val route: String) {
    data object Home : LibraryNavDestination("library/home")
    data class Item(val itemId: String) : LibraryNavDestination("library/item/$itemId") {
        companion object {
            const val ROUTE_PATTERN = "library/item/{itemId}"
        }
    }
    data class Collection(val collectionId: String) : LibraryNavDestination("library/collection/$collectionId") {
        companion object {
            const val ROUTE_PATTERN = "library/collection/{collectionId}"
        }
    }
    data class Series(val seriesId: String) : LibraryNavDestination("library/series/$seriesId") {
        companion object {
            const val ROUTE_PATTERN = "library/series/{seriesId}"
        }
    }
    data object Search : LibraryNavDestination("library/search")
}

interface LibraryFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}
