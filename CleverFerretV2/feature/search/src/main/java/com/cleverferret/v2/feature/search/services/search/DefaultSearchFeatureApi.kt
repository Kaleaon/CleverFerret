package com.cleverferret.v2.feature.search.services.search

import com.cleverferret.v2.feature.search.api.SearchFeatureApi

class DefaultSearchFeatureApi : SearchFeatureApi {
    override fun featureKey(): String = "feature:search"
}
