# Documentation Lifecycle Policy

This policy defines how documentation is created, maintained, summarized, and archived for the CleverFerret repository.

## 1) Document classes

### Canonical docs
Canonical docs are the source of truth for current behavior, plans, and implementation state. If another document conflicts with a canonical doc, the canonical doc wins.

Canonical docs include:
- `docs/INDEX.md` (master navigation)
- `docs/QUICK_REFERENCE.md` (developer quick-start and pre-merge checks)
- Active docs in:
  - `docs/features/`
  - `docs/planning/`
  - `docs/implementation/`
  - `docs/reviews/`
- Governance docs in `docs/governance/`

### Derived/summary docs
Derived docs are convenience summaries generated from or based on canonical docs (status reports, executive summaries, rollups, review synopses, etc.). They must link back to at least one canonical source.

Rules:
- Must not introduce source-of-truth decisions not present in canonical docs.
- Must include a `source_canonical` metadata field.
- If stale or conflicting, update canonical docs first, then regenerate/update the derived doc.

## 2) Ownership by major doc family

Each major doc family must declare and maintain an owner in metadata.

| Doc family | Owner field value |
|---|---|
| `docs/features/` | `Product + UX` |
| `docs/planning/` | `Engineering Management` |
| `docs/implementation/` | `Engineering` |
| `docs/reviews/` | `QA + Code Review` |

If ownership changes, update the impacted canonical docs and this policy in the same pull request.

## 3) Archive triggers

Move a document to `docs/archive/` (or `docs/archive/completed/`) when one or more triggers applies:
- Work is completed and no further updates are expected.
- Content has been superseded by a newer canonical document.
- The document records a time-boxed incident, migration, or investigation that is now closed.
- The file has had no updates beyond its freshness SLA and is no longer actionable.

Before archiving:
1. Add replacement links (if any) in the archived file header.
2. Update `docs/INDEX.md` links and category placement.
3. Update `docs/QUICK_REFERENCE.md` if any quick links changed.

## 4) Required metadata fields

All new or materially updated docs in the major families must include this metadata block near the top of the file.

```md
- status: draft | active | deprecated | archived
- owner: <team-or-role>
- last_reviewed: YYYY-MM-DD
- next_review: YYYY-MM-DD
- canonical: true | false
- source_canonical: <path-or-list>   # required when canonical: false
```

Notes:
- `source_canonical` is optional only for canonical docs.
- `next_review` must be computed from the SLA table below.

## 5) Freshness SLA

Minimum review cadence for active docs:

| Doc family | SLA |
|---|---|
| `docs/planning/` | Review every 30 days |
| `docs/features/` | Review every 90 days |
| `docs/implementation/` | Review every 90 days |
| `docs/reviews/` | Review every 60 days |
| `docs/governance/` | Review every 90 days |

If a document misses SLA:
- Mark `status: deprecated` until reviewed, or
- Archive it if no longer needed.

## 6) Pre-merge documentation gate

Every PR that changes documentation status, ownership, or lifecycle classification must satisfy this checklist item:

- [ ] **If status changed, update canonical + index + quick reference.**

This means updating:
1. The impacted canonical document(s),
2. `docs/INDEX.md`, and
3. `docs/QUICK_REFERENCE.md`.
