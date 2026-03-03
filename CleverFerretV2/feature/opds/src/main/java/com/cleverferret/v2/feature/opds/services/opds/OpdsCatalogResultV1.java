package com.cleverferret.v2.feature.opds.services.opds;

import java.util.List;

public record OpdsCatalogResultV1(
        String catalogId,
        String title,
        List<String> entryIds
) {}
