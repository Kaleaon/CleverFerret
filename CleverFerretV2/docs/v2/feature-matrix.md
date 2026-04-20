# CleverFerret V2 Feature Matrix (Canonical Active Planning Source)

**Canonical status source for active planning:** This file is the authoritative source of capability readiness, release targeting, ownership, and validation requirements for active work.

**Last verified date:** 2026-04-19  
**Verifier:** GPT-5.3-Codex

## Status taxonomy (verbatim)

Use this taxonomy exactly (spelling/case) in all status and planning documents:

- `Ready` — Implemented and validated for the listed target release.
- `Partial` — Implemented in part; additional integration, validation, or hardening is still required.
- `Stub` — Placeholder or scaffold exists, but production implementation is not complete.
- `Planned` — Not implemented yet; explicitly scheduled for future work.
- `Archived` — Not active; retained for historical reference only.

## Active capability matrix

| Capability | Current status | V2 target release | Owner module | Test coverage required | External dependency/API key needed |
|---|---|---|---|---|---|
| EPUB reading | Ready | V2.0 | `feature/reader` | Unit + integration + reader UI smoke tests | None |
| PDF reading | Ready | V2.0 | `feature/reader` | Unit + integration + rendering regression tests | None |
| Comic reading (CBZ/CBR/CBT/CB7) | Ready | V2.0 | `feature/reader` | Unit + archive parser tests + reader UI tests | None |
| Audiobook/music playback | Ready | V2.0 | `feature/audio`, `core/media` | Unit + service integration + playback instrumentation tests | None |
| Podcast playback/management | Ready | V2.0 | `feature/podcast` | Unit + feed parsing + playback integration tests | Podcast feed network access (no key required) |
| Radio (FM simulation + internet radio) | Ready | V2.0 | `feature/radio` | Unit + stream integration + metadata parsing tests | Radio Browser / RadioDNS network access |
| Library management/search/scanning | Ready | V2.0 | `feature/library`, `core/data`, `core/database` | Unit + database integration + indexing/search tests | Optional metadata APIs (provider-specific keys) |
| Widgets (media/reading/stats) | Ready | V2.0 | `feature/widgets` | Widget unit tests + instrumentation snapshot/smoke tests | None |
| DOC/RTF/ODT/CHM/FB2 support | Partial | V2.1 | `feature/reader`, `core/data` | Parser unit tests + document fixture regression tests + import integration tests | Apache POI / Apache Tika runtime dependencies |
| Chromecast validation hardening | Partial | V2.1 | `core/media`, `feature/audio` | Cast session integration tests + cross-device manual QA checklist | Google Cast SDK + test device/network |
| MOBI/AZW/AZW3 integration | Partial | V2.1 | `feature/reader` | Parser unit tests + UnifiedReaderService integration tests + rendering smoke tests | None |
| DJVU support completion | Partial | V2.2 | `feature/reader` | Validation + decoding unit tests + rendering integration tests | DJVU decoding/rendering library |
| OPDS wiring (catalog + download backend) | Partial | V2.1 | `feature/opds`, `core/network` | API client unit tests + contract tests + end-to-end catalog flow tests | OPDS endpoint availability |
| Cloud sync providers (Google Drive/Dropbox/progress sync) | Stub | V2.2 | `feature/sync`, `core/network`, `core/auth` | OAuth integration tests + sync conflict tests + end-to-end sync tests | Google Drive API credentials, Dropbox API app/keys |
| Advanced AI features (insights/mind maps/recommendations) | Planned | V2.3 | `feature/metadata`, `core/network` | Prompt/service unit tests + response contract tests + UX acceptance tests | OpenAI or Gemini API key (or local Ollama runtime) |
| Plex auth/sync hardening | Partial | V2.2 | `feature/plex`, `core/auth`, `core/network` | Auth flow integration tests + sync resilience tests + API contract tests | Plex developer registration/token |
| Multi-room audio | Planned | V2.3 | `feature/audio`, `core/network` | Protocol unit tests + device discovery integration tests + network resilience tests | Snapcast server + LAN/mDNS support |

## Policy for V2 pull requests

- **Required:** Every PR that changes any capability status, scope, target release, ownership, dependencies, or validation requirements in V2 **must update this matrix in the same PR**.
- PR reviewers should reject V2 status-changing changes if `CleverFerretV2/docs/v2/feature-matrix.md` is not updated accordingly.
