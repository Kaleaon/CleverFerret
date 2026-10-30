package com.cleverferret.v2.feature.library.services.library

import com.cleverferret.v2.feature.library.api.LibraryFeatureApi

class DefaultLibraryFeatureApi : LibraryFeatureApi {
    override fun featureKey(): String = "feature:library"
}
