# ADR-001: Module Boundaries for CleverFerretV2

- Status: Accepted
- Date: 2026-03-03

## Context

CleverFerretV2 introduces a domain-oriented modular architecture to replace package-by-screen and service-sprawl patterns from the legacy codebase.

The goal is to keep feature domains independently evolvable, with shared contracts formalized in `core:data` and feature-local DTOs versioned per feature domain.

## Decision

### 1) Allowed dependency direction

- `app` may depend on all `core:*` and `feature:*` modules.
- `core:*` modules may depend only on other `core:*` modules when necessary.
- `feature:*` modules may depend on `core:*` modules only.

### 2) Cross-feature imports are forbidden

- A feature must **not** import another feature's implementation classes.
- If interaction is required, expose an interface in the providing feature's `api` package and bind implementations in `app`.

### 3) API surfaces live in `feature.<domain>.api`

- Each feature defines public interfaces under `api` packages.
- `app` (or dedicated wiring modules) composes concrete implementations.
- DTOs that are specific to a feature stay local to that feature (e.g., `feature:webfiction` DTOs).

### 4) Versioned domain contracts

- Shared model contracts are owned by `core:data` and carry explicit version names (e.g., `*V1`).
- Legacy shared models from `data/model`, `data/models`, and service-specific model packages are migrated into:
  - `core:data` for cross-feature contracts.
  - Feature-local DTO packages for domain-specific payloads.

## Consequences

- Strong encapsulation between feature domains.
- Reduced accidental coupling and fewer cascading refactors.
- Clear migration path for legacy models into stable, versioned contracts.
