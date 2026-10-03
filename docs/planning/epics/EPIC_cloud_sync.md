# EPIC: Cloud Sync Providers

## Feature Matrix Link
- Source row: **Cloud sync providers (Google Drive/Dropbox/progress sync)** in `CleverFerretV2/docs/v2/feature-matrix.md`.
- Matrix reference: [CleverFerret V2 feature matrix](../../../CleverFerretV2/docs/v2/feature-matrix.md).

## Milestones
- **M1 — Contract**
  - Finalize provider-agnostic sync contract (`SyncProvider`, `AuthSession`, `SyncCursor`, conflict strategy enums).
  - Define canonical sync payload schema for library metadata, reading progress, bookmarks, and playback position.
  - Lock OAuth callback and token refresh contract for Google Drive + Dropbox.
- **M2 — Integration**
  - Implement Google Drive adapter + Dropbox adapter behind shared sync facade.
  - Add background sync scheduler with retry/backoff and offline queueing.
  - Integrate bidirectional merge/conflict resolution into library and reader/audio progress modules.
- **M3 — QA Hardening**
  - Run cross-provider reliability soak tests with intermittent connectivity.
  - Validate conflict resolution outcomes against deterministic fixtures.
  - Complete regression matrix for login/session expiry/token revocation/partial sync failures.

## API / Dependency Prerequisites
- Google Drive API project, OAuth client ID/secret, and scoped permissions.
- Dropbox API app registration and app key/secret.
- Unified OAuth handling in `core/auth` for multi-provider token lifecycle.
- Secure key/value storage and encrypted token persistence.

## Security / Privacy Requirements
- Encrypt provider tokens at rest and redact tokens from logs/analytics.
- Enforce least-privilege OAuth scopes (read/write only required sync surfaces).
- Require explicit user consent per provider and revocation controls in settings.
- Maintain data minimization: sync only user library/progress artifacts necessary for feature operation.
- Threat-model conflict payload tampering and stale token replay.

## Test Strategy
- Unit tests for contract serialization, merge strategies, and token refresh logic.
- Contract tests per provider for auth exchange, delta listing, upload/download, and error mapping.
- Integration tests for end-to-end sync scenarios: first sync, incremental sync, conflict sync, recovery after network loss.
- Fault-injection tests for API throttling, 401 refresh paths, partial object corruption, and clock skew.
- Manual QA checklist for provider linking/unlinking, account switching, and recovery UX.

## UI / KTheme Acceptance
- Sync settings screens follow KTheme spacing, typography, and semantic color tokens.
- Provider cards show consistent status states (connected/syncing/error/last synced) with accessible contrast.
- Conflict resolution prompts use standard dialog components and motion tokens.
- Light/dark theme parity verified across onboarding, settings, and sync status surfaces.
