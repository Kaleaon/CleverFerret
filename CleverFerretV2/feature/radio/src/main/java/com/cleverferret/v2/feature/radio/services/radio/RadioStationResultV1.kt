package com.cleverferret.v2.feature.radio.services.radio


data class RadioStationResultV1(
    val stationId: String,
    val name: String,
    val streamUrl: String,
    val codec: String
)
