# V1 Screen Migration Checklist

Use this checklist for every migrated screen route.

| Screen Route | Colors | Typography | Spacing | Radius | Motion | State Colors |
|---|---|---|---|---|---|---|
| `feature/library` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/reader` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/audio` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/radio` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/podcast` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/webfiction` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/metadata` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/sync` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/opds` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/plex` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/settings` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/search` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/collections` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/stats` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |
| `feature/widgets` | ☐ | ☐ | ☐ | ☐ | ☐ | ☐ |

## Exit criteria
- No direct `Color(...)` literals in Compose feature UI when semantic roles exist.
- No direct `.dp` / `.sp` literals in feature UI where `DesignTokensV1` provides role-based values.
- UI colors resolved via `KthemeThemeAdapterV1.adapt(...).color(role)`.
