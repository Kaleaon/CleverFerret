# EPIC: OPDS Catalog + Download Wiring

## Feature Matrix Link
- Source row: **OPDS wiring (catalog + download backend)** in `CleverFerretV2/docs/v2/feature-matrix.md`.
- Matrix reference: [CleverFerret V2 feature matrix](../../../CleverFerretV2/docs/v2/feature-matrix.md).

## Milestones
- **M1 — Contract**
  - Define OPDS 1.x/2.0 parsing contract and normalized feed/entity model.
  - Establish authentication strategy contract (public/basic/token) and pagination behavior.
  - Finalize download pipeline handoff contract to library importer.
- **M2 — Integration**
  - Implement OPDS client stack in `feature/opds` + `core/network`.
  - Wire catalog browsing/search/details/download actions into library ingest flow.
  - Add persistence for subscriptions, last position, and cached feed metadata.
- **M3 — QA Hardening**
  - Validate interoperability against representative public/private OPDS catalogs.
  - Run resiliency tests for malformed feeds, pagination loops, and transient network failures.
  - Execute full regression for auth-protected catalogs and large catalog navigation.

## API / Dependency Prerequisites
- OPDS endpoint availability for test fixtures (public and auth-protected).
- XML/JSON parsing libraries aligned with OPDS 1.x and 2.0 profile expectations.
- Download manager support for authenticated media acquisition and resume support.
- MIME/type mapping for feed entries to import pipeline.

## Security / Privacy Requirements
- Sanitize and validate remote feed content before rendering.
- Securely store catalog credentials/tokens; never persist plaintext secrets.
- Restrict network client to approved protocols and enforce TLS validation.
- Prevent script/markup injection through strict text rendering and URL handling.
- Provide explicit user controls for deleting catalog credentials and cache.

## Test Strategy
- Unit tests for feed parsing, link relation handling, and pagination edge cases.
- Contract tests with fixture feeds (OPDS 1.x + 2.0 + auth variants).
- Integration tests covering browse → detail → download → library import.
- Network fault tests for timeout, retry, resumable downloads, and stale auth credentials.
- Manual exploratory QA for multilingual metadata and large catalog UX performance.

## UI / KTheme Acceptance
- OPDS browse/search/detail screens adopt KTheme components and tokenized spacing.
- Loading/empty/error states conform to existing list/panel design language.
- Download affordances and status indicators are consistent with library import UI patterns.
- Accessibility validation for navigation hierarchy, focus order, and high-contrast themes.
