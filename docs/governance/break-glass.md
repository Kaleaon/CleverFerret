# Break-Glass Procedure (Solo Maintainer)

This document defines how to perform an emergency override of normal governance controls when an urgent production-risk or security scenario requires immediate action.

## When break-glass is allowed

Use break-glass only when **all** of the following are true:

1. There is an active outage, severe production regression, security vulnerability, or data-integrity risk.
2. Waiting for standard review/check completion would materially increase impact.
3. The emergency change scope can be kept minimal and reversible.

## Emergency override steps

1. **Open an incident record** (issue or incident note) labeled `break-glass`.
2. **Document rationale** including observed impact, user risk, and why normal process is insufficient.
3. **Apply the smallest possible fix** on a dedicated branch.
4. **Override branch protection only as needed** to merge the emergency fix.
5. **Restore standard protections immediately** after merge.
6. **Create a follow-up PR** (or issue) for hardening, cleanup, and missing test coverage.

## Required audit trail

For every break-glass event, record:

- Exact UTC timestamps for decision, override, merge, and protection restoration.
- Commit SHA(s) and branch name(s).
- Which protections were bypassed (for example, required checks or review gates).
- Validation evidence used before/after deploy.
- Rollback plan and whether rollback was required.

Store this in the incident record and link it from any related PR.

## Post-incident expectations

Within 48 hours of stabilization, the maintainer should:

- Run a short retrospective (what failed, what worked, what to automate).
- Add or improve tests/checks to reduce repeat emergency bypasses.
- Confirm governance docs and branch-protection config still match repository settings.

## Accountability guideline for solo maintenance

Because there is no second approver in a solo-maintainer model:

- Prefer transparency over speed when uncertainty is high.
- Keep emergency changes narrowly scoped.
- Publish a concise incident summary in-repo so future audits can reconstruct decisions.
