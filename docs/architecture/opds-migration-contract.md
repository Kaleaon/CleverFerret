# OPDS Migration Contract

## Required `OpdsFeatureApi` entrypoints consumed by `:CleverFerret`

During migration, the OPDS feature module must expose a stable `OpdsFeatureApi` surface that `:CleverFerret` can consume without depending on legacy implementation internals. At minimum, the following entrypoints are required:

- `openCatalog(...)`: Launches or routes to the OPDS catalog flow from app-level navigation.
- `searchCatalog(...)`: Executes OPDS search requests and returns normalized feed/domain results.
- `openPublication(...)`: Resolves and opens a selected OPDS publication/acquisition path.
- `observeAuthState(...)` (or equivalent): Exposes authentication/session state required by OPDS-protected feeds.
- `syncOrRefresh(...)`: Triggers refresh/reload behavior used by app-level pull-to-refresh or retry actions.

Contract expectations:

- Entry points must be callable from `:CleverFerret` without direct references to `services/opds/*`.
- Inputs/outputs should use feature/domain models (not legacy transport DTOs) wherever practical.
- API behavior must remain backward-compatible for the full migration window unless coordinated version bumps are introduced.

## Legacy adapter behavior for `services/opds/OPDSClient.kt` during transition

`services/opds/OPDSClient.kt` remains a compatibility layer while call sites move to `OpdsFeatureApi`.

Required transition behavior:

- **Delegation first**: Legacy client operations should delegate to `OpdsFeatureApi`-backed implementations whenever a mapped feature path exists.
- **Behavior parity**: Adapter must preserve existing error semantics, retry behavior, and auth/header propagation expected by current callers.
- **Mapping boundary**: Any legacy request/response DTO conversions are confined to the adapter layer to avoid leaking old models into new feature code.
- **Telemetry continuity**: Existing logging/metrics tags used for OPDS success/failure tracking remain emitted (either preserved or aliased) during migration.
- **Safe fallback**: For not-yet-migrated flows, adapter may keep legacy execution paths; these paths should be explicitly marked with TODO/phase references.

## Test contract list and expected classpath ownership

The following tests are the migration contract gate:

- `OpdsFeedParserContractTest`
- `OpdsEndToEndFlowTest`

Expected ownership/classpath rules:

- `OpdsFeedParserContractTest` should live with OPDS parsing/domain code in the feature-side classpath (not app-only classpath), so parser behavior is validated where implementation resides.
- `OpdsEndToEndFlowTest` should execute from an integration-level test source set with both `:CleverFerret` and OPDS feature wiring on classpath to validate real navigation/service composition.
- Tests must not require direct construction of deprecated `OPDSClient` internals once equivalent `OpdsFeatureApi` wiring is available.

## Deprecation/removal conditions for legacy OPDS files in later phases

Legacy OPDS files (including `services/opds/OPDSClient.kt` and adjacent legacy transport/helpers) can be removed only when all conditions below are met:

1. All `:CleverFerret` OPDS call sites compile against `OpdsFeatureApi` with no runtime fallbacks to legacy execution paths.
2. `OpdsFeedParserContractTest` and `OpdsEndToEndFlowTest` pass using feature-owned implementations only.
3. No production dependency graph references remain from app/feature modules to `services/opds/*` legacy APIs.
4. Logging/metrics/analytics parity is confirmed for at least one release cycle after migration cutover.
5. Deprecated symbols are annotated and have completed the announced deprecation window.

Recommended phased cleanup:

- Phase N: Mark legacy OPDS classes `@Deprecated` with replacement guidance.
- Phase N+1: Remove remaining adapter fallback branches.
- Phase N+2: Delete legacy OPDS files and related module wiring; keep changelog/migration notes.
