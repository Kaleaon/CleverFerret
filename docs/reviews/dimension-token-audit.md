# Hardcoded Dimension Audit (Media UI)

Date: 2026-04-18

## Scope

- `CleverFerret/src/main/java/com/universalmedialibrary/ui/media/**`

## Audit command

```bash
scripts/ci/audit_hardcoded_dimensions.sh
```

## Results

- Hardcoded `.dp`: **600**
- Hardcoded `.sp`: **32**

## Top files by count

1. `ui/media/theme/MediaDesignSystem.kt` (93)
2. `ui/media/MediaAuthScreen.kt` (37)
3. `ui/media/screens/MediaHomeScreen.kt` (36)
4. `ui/media/player/MediaVideoPlayerScreen.kt` (28)
5. `ui/media/screens/PodcastScreen.kt` (26)

## Migration implemented in this change

- Added shared size tokens in `MediaSizes` and shared zero-spacing token in `MediaSpacing`.
- Migrated hardcoded dimensions in `MediaNavigation.kt` to design tokens (avatar sizes, sidebar selection indicator size, edge fade width, min item width, indicator dot).

## Follow-up plan

1. Migrate high-volume screens first (`MediaAuthScreen`, `MediaHomeScreen`, player screens).
2. Keep all new dimensions centralized in `MediaDesignSystem.kt`.
3. Add CI gate (or lint custom rule) after first migration wave so existing debt does not block incremental cleanup.
