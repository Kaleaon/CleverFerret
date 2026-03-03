# CleverFerretV2

Domain-oriented multi-module workspace for the next-generation CleverFerret architecture.

## Module layout

- `app`: composition root
- `core/*`: shared primitives, networking, data contracts, persistence, media, auth
- `feature/*`: isolated domain features that can depend only on `core/*` modules

See `../docs/v2/architecture/ADR-001-module-boundaries.md` for module boundary rules.
