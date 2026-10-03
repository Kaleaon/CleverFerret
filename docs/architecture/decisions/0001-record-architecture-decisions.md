# ADR 0001 — Record architecture decisions

## Status

Accepted (2026-05-02)

## Context

CleverFerret has accumulated significant architectural decisions across
its single-module Android app and incubating `CleverFerretV2/`
multi-module tree. Several recent code-review documents reference work
items that have already been completed in trunk, indicating the lack of
a durable decision log. The Premiere roadmap
(`docs/planning/PREMIERE_ROADMAP.md`) Phase 0 explicitly calls for
establishing an ADR home at `docs/architecture/decisions/`.

## Decision

Adopt lightweight Architecture Decision Records (ADRs) following the
Michael Nygard format. Store under
`docs/architecture/decisions/NNNN-slug.md`. Each ADR is short, dated,
and append-only; supersession is the only mechanism for invalidation.

Status values: `Proposed`, `Accepted`, `Superseded by ADR-NNNN`,
`Deprecated`.

## Consequences

- New significant decisions get a record before merging.
- Stale references in design docs can be resolved by linking to the
  authoritative ADR.
- Onboarding is shorter; new contributors read a curated decision log
  instead of mining git history.
- Cost: ~15 minutes per decision, paid once.
