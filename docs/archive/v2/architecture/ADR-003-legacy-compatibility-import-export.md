# ADR-003: Legacy Compatibility and Import/Export Strategy for Canonical Schema

- Status: Accepted
- Date: 2026-03-03

## Context

Existing users have CleverFerret databases across many historical Room versions and upgrade paths. Migration must preserve user data while allowing gradual rollout of canonical storage.

Current safety/migration hooks already exist in legacy code:

- `AppUpgradeManager` handles pre-upgrade backup creation, migration triggering, and verification.
- `BackupRestorationManager` handles rollback flow after failed migration/restore attempts.
- `AppDatabaseMigrations` documents table/index evolution history from older DB versions.

## Decision

Use a compatibility-first, importer-driven strategy:

1. **Read compatibility layer**
   - Keep legacy Room migration chain available for old database versions until canonical import completes.
   - Build importer readers keyed by legacy schema version using `AppDatabaseMigrations` lineage.

2. **Dual-write transition window**
   - During rollout, write canonical rows and continue writing legacy progress/sync hotspots to preserve old clients.
   - Prefer canonical reads when both are present; fallback to legacy reads until cutover flag is enabled.

3. **Backup + rollback guardrails**
   - Reuse `AppUpgradeManager` backup step before canonical import.
   - On importer failure, surface recovery through `BackupRestorationManager` and keep app on legacy schema mode.

4. **Import/export tooling contract**
   - Import pipeline: `legacy-db -> mapping rules -> canonical records`.
   - Export pipeline: `canonical records -> stable schema package` for device transfer/cloud backup.
   - Export package includes schema version and per-table checksums to support integrity verification before apply.

## Compatibility strategy

- Never require destructive migration for users with old CleverFerret DBs.
- Canonical importer must be idempotent and resumable.
- Conflicts (local vs cloud/provider) are captured in `SyncStateV1` for deferred resolution instead of dropping data.

## Consequences

- Migration risk is shifted from schema replacement to controlled import with rollback.
- Import/export tooling becomes the primary long-term interoperability path.
- Legacy storage can be retired only after telemetry confirms stable canonical adoption.
