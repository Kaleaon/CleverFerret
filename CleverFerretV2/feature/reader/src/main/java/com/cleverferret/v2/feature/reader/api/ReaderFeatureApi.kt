package com.cleverferret.v2.feature.reader.api

import com.cleverferret.v2.core.common.VersionedContract

sealed class ReaderNavDestination(val route: String) {
    data class Session(val itemId: String) : ReaderNavDestination("reader/session/$itemId") {
        companion object {
            const val ROUTE_PATTERN = "reader/session/{itemId}"
        }
    }

    data class Contents(val itemId: String) : ReaderNavDestination("reader/contents/$itemId") {
        companion object {
            const val ROUTE_PATTERN = "reader/contents/{itemId}"
        }
    }

    data class Annotations(val itemId: String) : ReaderNavDestination("reader/annotations/$itemId") {
        companion object {
            const val ROUTE_PATTERN = "reader/annotations/{itemId}"
        }
    }

    data object Theme : ReaderNavDestination("reader/theme")
}

interface ReaderFeatureApi : VersionedContract {
    fun featureKey(): String
    override fun contractVersion(): String = "V1"
}
