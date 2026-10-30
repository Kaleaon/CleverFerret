package com.cleverferret.v2.feature.collections.services.collections

import com.cleverferret.v2.feature.collections.api.CollectionsFeatureApi

class DefaultCollectionsFeatureApi : CollectionsFeatureApi {
    override fun featureKey(): String = "feature:collections"
}
