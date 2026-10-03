# EPIC: Plex Auth + Sync Hardening

## Feature Matrix Link
- Source row: **Plex auth/sync hardening** in `CleverFerretV2/docs/v2/feature-matrix.md`.
- Matrix reference: [CleverFerret V2 feature matrix](../../../CleverFerretV2/docs/v2/feature-matrix.md).

## Milestones
- **M1 — Contract**
  - Define Plex auth/session contract (token issuance, refresh/validation, multi-server context).
  - Finalize sync job contract for library deltas, watch/progress state, and failure semantics.
  - Specify error taxonomy and retry policy for Plex API interactions.
- **M2 — Integration**
  - Implement robust Plex auth flow with improved token/session lifecycle handling.
  - Integrate resilient sync engine with idempotent updates and checkpointing.
  - Wire auth/sync telemetry events for diagnostics and operational monitoring.
- **M3 — QA Hardening**
  - Run long-duration sync reliability tests against realistic Plex library sizes.
  - Validate reconnect/re-auth flows after token revocation and server topology changes.
  - Complete regression suite for degraded network, partial API failures, and duplicate delta handling.

## API / Dependency Prerequisites
- Plex developer registration/token and documented API contract references.
- Stable `feature/plex`, `core/auth`, and `core/network` interfaces for auth and sync orchestration.
- Test Plex server instances (single-server and multi-server account contexts).
- Persistent sync checkpoint store with migration-safe schema.

## Security / Privacy Requirements
- Store Plex auth tokens encrypted at rest and scrub from diagnostics.
- Enforce session expiration and explicit re-auth for invalid/revoked tokens.
- Minimize persisted remote metadata to only what sync requires.
- Respect user privacy controls for unlinking account and deleting synced Plex artifacts.
- Audit all auth/sync endpoints for secure transport and certificate validation.

## Test Strategy
- Unit tests for token/session state machine and sync checkpoint logic.
- Contract tests against mocked Plex endpoints for auth and media metadata sync behavior.
- Integration tests for first link, incremental sync, retries, and reconciliation after failures.
- Load/resilience tests for large libraries and high-change-rate scenarios.
- Manual QA for multi-server account switching and account unlink recovery.

## UI / KTheme Acceptance
- Plex connection and sync status surfaces follow KTheme visual tokens and interaction patterns.
- Error/re-auth prompts match global dialog/toast conventions.
- Sync progress indicators use consistent iconography, typography, and color semantics.
- Theme parity validated for connection, sync progress, and error recovery flows.
