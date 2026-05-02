# OPDS Migration Contract

This document defines the migration contract between the legacy OPDS implementation and the new `OpdsFeatureApi` surface consumed by `:CleverFerret`.

## Required `OpdsFeatureApi` Entrypoints Consumed by `:CleverFerret`

The `OpdsFeatureApi` must provide (directly or via stable facade methods) the following capabilities used by the app layer:

1. **Catalog/feed retrieval entrypoint**
   - Accepts a canonical OPDS URL (and optional auth/session context).
   - Returns parsed feed/domain objects required by browsing screens.
   - Exposes typed success and failure outcomes (network, parsing, auth, unknown).

2. **Publication detail retrieval entrypoint**
   - Resolves a selected acquisition/publication link into a domain detail model.
   - Preserves enough metadata for UI rendering and follow-up actions.

3. **Acquisition/download trigger entrypoint**
   - Accepts an acquisition link plus required request headers/context.
   - Returns a deterministic action result (`started`, `queued`, `already_owned`, `failed`).

4. **Authentication handshake/propagation entrypoint**
   - Handles OPDS auth document or challenge flow used by protected catalogs.
   - Exposes updated auth/session state for subsequent API calls.

5. **Search entrypoint (if feature-flagged in current app flow)**
   - Accepts query + pagination cursor where applicable.
   - Returns paged OPDS results with stable ordering contract.

6. **Navigation/pagination entrypoint**
   - Supports follow-next and follow-link semantics from feed links.
   - Maintains backward-compatible handling of rel/type combinations currently relied on by app navigation.

7. **Error mapping contract entrypoint**
   - Normalizes low-level transport/parser exceptions into app-consumable error taxonomy.
   - Ensures existing error UI and analytics events remain mappable during transition.

> Contract rule: Any consumed method currently invoked from `:CleverFerret` must remain source-compatible (or be bridged with an adapter) until all call sites migrate.

## Legacy Adapter Behavior for `services/opds/OPDSClient.kt` During Transition

During migration phases, `services/opds/OPDSClient.kt` acts as a **compatibility adapter**, not as the long-term source of business logic.

1. **Delegation-first behavior**
   - Existing public methods on `OPDSClient.kt` should delegate to `OpdsFeatureApi` whenever an equivalent entrypoint exists.
   - Legacy internal parsing/network logic is retained only as fallback for non-migrated paths.

2. **Behavioral parity requirement**
   - Method-level outputs (success/error shape, nullability expectations, ordering) must remain consistent with pre-migration call-site expectations.
   - Any intentional divergence must be behind a migration flag and documented in release notes/changelog.

3. **Fallback gating**
   - Fallback-to-legacy logic must be explicit and observable (e.g., via structured log/metric tag such as `opds.adapter.fallback=true`).
   - Fallback is allowed only for known unsupported feature gaps; it must not silently swallow new API failures.

4. **Error translation boundary**
   - Adapter is responsible for translating `OpdsFeatureApi` error models into legacy error/result types expected by existing call sites.
   - No lossy translation that would hide auth or parser root cause categories.

5. **Threading/coroutine compatibility**
   - Adapter must preserve dispatcher and cancellation semantics expected by current callers.
   - Blocking behavior introduced by migration is prohibited.

6. **Instrumentation continuity**
   - Existing analytics/telemetry hooks in legacy flows must continue to fire with equivalent event meaning.
   - If event names change in the new stack, adapter should emit compatibility events until downstream dashboards are migrated.

## Test Contract List and Expected Classpath Ownership

The following contract tests are required migration gates and must be maintained as stable verification points.

1. **`OpdsFeedParserContractTest`**
   - **Purpose:** Verifies feed parsing compatibility across representative OPDS 1/2 documents and edge cases.
   - **Ownership:** Should live on the classpath of the OPDS feature/module that owns parser behavior (new implementation).
   - **Legacy compatibility:** May include fixture parity assertions against legacy parser outputs until legacy removal phase.

2. **`OpdsEndToEndFlowTest`**
   - **Purpose:** Verifies user-critical end-to-end flow (discover → open publication → acquire/download) through the migration boundary.
   - **Ownership:** Should live on an integration test classpath that includes `:CleverFerret` consumer wiring plus `OpdsFeatureApi` implementation bindings.
   - **Legacy compatibility:** Must be runnable in both modes while transition flags are active:
     - adapter delegating to new API
     - legacy fallback path where explicitly supported

### Classpath Ownership Rules

- Parser/format contracts belong to the OPDS implementation module classpath.
- App-wiring and behavioral integration contracts belong to an integration classpath that includes `:CleverFerret`.
- Duplicate test definitions across both classpaths are discouraged; share fixtures/utilities, keep ownership singular.

## Deprecation/Removal Conditions for Legacy OPDS Files in Later Phases

Legacy OPDS files (including `services/opds/OPDSClient.kt` legacy branches and related parser/network helpers) can be deprecated and removed only when **all** conditions below are met:

1. **Entrypoint migration completion**
   - All `:CleverFerret` call sites consume `OpdsFeatureApi` directly or through thin DI wiring without legacy-only logic.

2. **Contract test stability**
   - `OpdsFeedParserContractTest` and `OpdsEndToEndFlowTest` pass on CI for an agreed burn-in window (e.g., N consecutive green main-branch runs).

3. **Fallback usage reaches zero**
   - Adapter fallback metric indicates sustained zero (or explicitly approved near-zero) usage over a defined observation window.

4. **Error/analytics parity sign-off**
   - Product/QA/engineering sign-off confirms no regression in user-facing error handling and telemetry completeness.

5. **Flag retirement**
   - Migration feature flags controlling OPDS path selection are removed (not left permanently dormant).

6. **Dead code verification**
   - Static analysis + repository search confirms no runtime references to removed legacy OPDS files/types.

7. **Rollback plan closure**
   - A post-removal rollback strategy exists (e.g., revertable commit window) and ownership is assigned.

Once all conditions are satisfied, legacy OPDS files should be removed in a dedicated cleanup change with explicit release-note mention.
