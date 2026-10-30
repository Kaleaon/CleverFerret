package com.cleverferret.v2.feature.reader.services.reader

import com.cleverferret.v2.feature.reader.api.ReaderFeatureApi

class DefaultReaderFeatureApi : ReaderFeatureApi {
    override fun featureKey(): String = "feature:reader"
}
