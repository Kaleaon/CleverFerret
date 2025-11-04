## CleverFerret v1.6.0

### Highlights
- Polished the Discover screen with responsive navigation that drops the redundant dual rails on phones.
- Refreshed recommendation cards with animated entry, themed gradients, and actual cover artwork support.
- Added a new "Free Classics" section that lets users download curated Project Gutenberg EPUBs with on-device caching and status tracking.
- Improved sample media handling with Coil image loading, graceful fallbacks, and richer visuals.
- Version bump to `1.6.0` / `versionCode 8` for release packaging.

### Internal
- Updated `MainActivity`, `MediaPosterComponents`, and `MainViewModel` to support the new UI flows.
- Introduced `SampleClassic` model and drawable assets for bundled cover art placeholders.
- Ensured the project builds cleanly against the latest upstream `main` after rebase.
