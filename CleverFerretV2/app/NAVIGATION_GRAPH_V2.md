# V2 Navigation Graph (Single Source of Truth)

This document is the canonical navigation specification for `app` in V2.

## 1) Top-level route domains

Top-level domains (required):
- `library`
- `reader`
- `audio`
- `radio`
- `discover`
- `sync`
- `settings`

## 2) Canonical graph

```text
root
├── library
│   ├── library/home
│   ├── library/item/{itemId}
│   ├── library/collection/{collectionId}
│   ├── library/series/{seriesId}
│   └── library/search
├── reader
│   ├── reader/session/{itemId}
│   ├── reader/contents/{itemId}
│   ├── reader/annotations/{itemId}
│   └── reader/theme
├── audio
│   ├── audio/home
│   ├── audio/now-playing
│   ├── audio/queue
│   ├── audio/audiobooks
│   ├── audio/podcasts
│   └── audio/music
├── radio
│   ├── radio/home
│   ├── radio/station/{stationId}
│   └── radio/favorites
├── discover
│   ├── discover/home
│   ├── discover/search
│   ├── discover/opds
│   ├── discover/webfiction
│   └── discover/recommendations
├── sync
│   ├── sync/home
│   ├── sync/providers
│   ├── sync/history
│   └── sync/conflicts
└── settings
    ├── settings/home
    ├── settings/reader
    ├── settings/playback
    ├── settings/network
    ├── settings/security
    ├── settings/import-export
    └── settings/about
```

## 3) Navigation ownership rules

- This file is the SSOT for route names and hierarchy.
- All feature modules register destinations under one of the top-level domains.
- New routes require updates here and route migration notes if replacing a legacy screen.
- Deep links must target canonical V2 paths in this document.

## 4) Legacy `ui/*` to V2 route mapping

Mapping source: legacy package folders under:
`CleverFerret/src/main/java/com/universalmedialibrary/ui/*`

| Legacy `ui/*` area | V2 domain/route target | Status |
|---|---|---|
| `ui/library`, `ui/bookshelf`, `ui/collections`, `ui/series`, `ui/tags`, `ui/organization`, `ui/detail`, `ui/details`, `ui/media` | `library/*` | Migrating |
| `ui/reader`, `ui/comic`, `ui/manga`, `ui/viewer`, `ui/open`, `ui/books` | `reader/*` | Migrating |
| `ui/audio`, `ui/audiobook`, `ui/music`, `ui/playback`, `ui/player`, `ui/podcast`, `ui/midi`, `ui/visualizer` | `audio/*` | Migrating |
| `ui/radio`, `ui/oldtimeradio`, `ui/ambient` | `radio/*` | Migrating |
| `ui/search`, `ui/recommendations`, `ui/fanfiction`, `ui/webfiction`, `ui/opds`, `ui/news`, `ui/integration`, `ui/metadata`, `ui/gallery` | `discover/*` | Migrating |
| `ui/sync`, `ui/cloud`, `ui/collaborative` | `sync/*` | Migrating |
| `ui/settings`, `ui/theme`, `ui/onboarding`, `ui/network`, `ui/maintenance`, `ui/debug`, `ui/filepicker`, `ui/folderimport`, `ui/sharing`, `ui/cast`, `ui/main`, `ui/home`, `ui/screens`, `ui/components`, `ui/icons`, `ui/models`, `ui/selection`, `ui/writer` | `settings/*` (or split to domain-specific screens during migration) | Mixed (many deprecated) |

## 5) Deprecated legacy flows

The following legacy flow shapes are considered deprecated in V2 and should be replaced by canonical route patterns:

1. **Cross-domain utility screens embedded in feature flows**
   - Example: ad-hoc settings/import/debug entry points from non-settings packages.
   - V2 replacement: route through `settings/*` or dedicated modal destinations.

2. **Multiple parallel player surfaces by media type**
   - V2 replacement: unified `audio/now-playing` + typed subroutes.

3. **Reader variants with duplicated controls and theme handling**
   - V2 replacement: shared `reader/session/{itemId}` and `reader/theme` contracts.

4. **Legacy home/main hub forks (`ui/home`, `ui/main`, showcase screens)**
   - V2 replacement: domain-root entrypoints defined in the graph above.

5. **Direct navigation to package-specific implementation details**
   - V2 replacement: only canonical route IDs from this document are externally addressable.

## 6) Accessibility acceptance criteria (navigation)

1. **TalkBack labels**
   - All top-level tabs/drawer entries expose clear labels and selected state.
   - Back/close/up actions include explicit announcement text.

2. **Dynamic type scaling**
   - Top-level navigation remains operable at 200% font scale.
   - Labels do not truncate into ambiguous duplicates.

3. **Contrast targets**
   - Active/inactive nav state colors maintain minimum 3.0:1 contrast for non-text indicators.
   - Text labels meet 4.5:1 where applicable.

4. **Focus order**
   - Focus proceeds app bar -> primary content -> persistent nav controls.
   - Route transition preserves logical focus; dialogs/sheets trap focus and restore on close.

## 7) Code contract

Canonical graph constants are also defined in:
- `com.cleverferret.v2.app.navigation.V2NavigationGraph`

Migration work should keep this markdown and code contract aligned in the same change.
