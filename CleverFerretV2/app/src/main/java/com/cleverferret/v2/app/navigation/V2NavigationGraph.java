package com.cleverferret.v2.app.navigation;

import java.util.List;
import java.util.Map;

/**
 * Single source of truth for V2 route domains and canonical paths.
 */
public final class V2NavigationGraph {
    private V2NavigationGraph() {}

    public enum TopLevelDomain {
        LIBRARY("library"),
        READER("reader"),
        AUDIO("audio"),
        RADIO("radio"),
        DISCOVER("discover"),
        SYNC("sync"),
        SETTINGS("settings");

        private final String route;

        TopLevelDomain(String route) {
            this.route = route;
        }

        public String route() {
            return route;
        }
    }

    public static final Map<TopLevelDomain, List<String>> CANONICAL_ROUTES = Map.of(
            TopLevelDomain.LIBRARY, List.of("library/home", "library/item/{itemId}", "library/collection/{collectionId}", "library/series/{seriesId}", "library/search"),
            TopLevelDomain.READER, List.of("reader/session/{itemId}", "reader/contents/{itemId}", "reader/annotations/{itemId}", "reader/theme"),
            TopLevelDomain.AUDIO, List.of("audio/home", "audio/now-playing", "audio/queue", "audio/audiobooks", "audio/podcasts", "audio/music"),
            TopLevelDomain.RADIO, List.of("radio/home", "radio/station/{stationId}", "radio/favorites"),
            TopLevelDomain.DISCOVER, List.of("discover/home", "discover/search", "discover/opds", "discover/webfiction", "discover/recommendations"),
            TopLevelDomain.SYNC, List.of("sync/home", "sync/providers", "sync/history", "sync/conflicts"),
            TopLevelDomain.SETTINGS, List.of("settings/home", "settings/reader", "settings/playback", "settings/network", "settings/security", "settings/import-export", "settings/about")
    );

    public static final Map<String, TopLevelDomain> LEGACY_UI_AREA_MAPPING = Map.ofEntries(
            Map.entry("ui/library", TopLevelDomain.LIBRARY),
            Map.entry("ui/bookshelf", TopLevelDomain.LIBRARY),
            Map.entry("ui/collections", TopLevelDomain.LIBRARY),
            Map.entry("ui/reader", TopLevelDomain.READER),
            Map.entry("ui/comic", TopLevelDomain.READER),
            Map.entry("ui/audio", TopLevelDomain.AUDIO),
            Map.entry("ui/podcast", TopLevelDomain.AUDIO),
            Map.entry("ui/radio", TopLevelDomain.RADIO),
            Map.entry("ui/oldtimeradio", TopLevelDomain.RADIO),
            Map.entry("ui/search", TopLevelDomain.DISCOVER),
            Map.entry("ui/webfiction", TopLevelDomain.DISCOVER),
            Map.entry("ui/sync", TopLevelDomain.SYNC),
            Map.entry("ui/cloud", TopLevelDomain.SYNC),
            Map.entry("ui/settings", TopLevelDomain.SETTINGS),
            Map.entry("ui/theme", TopLevelDomain.SETTINGS)
    );

    public static final List<String> DEPRECATED_FLOW_PATTERNS = List.of(
            "cross-domain utility screens embedded in feature flows",
            "parallel player surfaces split by media type",
            "reader variants with duplicated controls/theme handling",
            "legacy hub forks via ui/home and ui/main",
            "direct navigation to package implementation details"
    );
}
