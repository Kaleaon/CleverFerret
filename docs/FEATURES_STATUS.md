# CleverFerret Feature Status

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

## Active feature status snapshot (synced to matrix)

| Capability | Status | Target |
|---|---|---|
| EPUB reading | Ready | V2.0 |
| PDF reading | Ready | V2.0 |
| Comic reading (CBZ/CBR/CBT/CB7) | Ready | V2.0 |
| Audiobook/music playback | Ready | V2.0 |
| Podcast playback/management | Ready | V2.0 |
| Radio (FM simulation + internet radio) | Ready | V2.0 |
| Library management/search/scanning | Ready | V2.0 |
| Widgets (media/reading/stats) | Ready | V2.0 |
| DOC/RTF/ODT/CHM/FB2 support | Partial | V2.1 |
| Chromecast validation hardening | Partial | V2.1 |
| MOBI/AZW/AZW3 integration | Partial | V2.1 |
| DJVU support completion | Partial | V2.2 |
| OPDS wiring (catalog + download backend) | Partial | V2.1 |
| Cloud sync providers (Google Drive/Dropbox/progress sync) | Stub | V2.2 |
| Advanced AI features (insights/mind maps/recommendations) | Planned | V2.3 |
| Plex auth/sync hardening | Partial | V2.2 |
| Multi-room audio | Planned | V2.3 |

## Notes

- This file is a summary view; the V2 matrix remains authoritative for ownership, test scope, and dependencies.
- If any status differs from the matrix, update this file and the matrix together in the same PR.
