# CleverFerret Roadmap (Matrix-Aligned)

**Canonical source:** `CleverFerretV2/docs/v2/feature-matrix.md`  
**Last verified date:** 2026-04-19  
**Verifier:** GPT-5.3-Codex

## Status taxonomy (verbatim)

Use this taxonomy exactly (spelling/case) in all status and planning documents:

- `Ready` — Implemented and validated for the listed target release.
- `Partial` — Implemented in part; additional integration, validation, or hardening is still required.
- `Stub` — Placeholder or scaffold exists, but production implementation is not complete.
- `Planned` — Not implemented yet; explicitly scheduled for future work.
- `Archived` — Not active; retained for historical reference only.

## V2.0 (Ready)

- EPUB reading
- PDF reading
- Comic reading (CBZ/CBR/CBT/CB7)
- Audiobook/music playback
- Podcast playback/management
- Radio (FM simulation + internet radio)
- Library management/search/scanning
- Widgets (media/reading/stats)

## V2.1 (Partial)

- DOC/RTF/ODT/CHM/FB2 support
- Chromecast validation hardening
- MOBI/AZW/AZW3 integration
- OPDS wiring (catalog + download backend)

## V2.2 (Partial + Stub)

- DJVU support completion (`Partial`)
- Plex auth/sync hardening (`Partial`)
- Cloud sync providers (Google Drive/Dropbox/progress sync) (`Stub`)

## V2.3 (Planned)

- Advanced AI features (insights/mind maps/recommendations)
- Multi-room audio

## Roadmap governance

- Roadmap status values must use the taxonomy above verbatim.
- Status/release changes must be reflected in the matrix and all impacted summaries in the same PR.
