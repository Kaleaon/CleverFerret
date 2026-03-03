package com.cleverferret.v2.feature.radio.services.radio;

public record RadioStationResultV1(
        String stationId,
        String name,
        String streamUrl,
        String codec
) {}
