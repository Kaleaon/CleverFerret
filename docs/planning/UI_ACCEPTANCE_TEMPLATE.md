# UI Acceptance Template (Mandatory)

Use this template for **all UI backlog items**. A UI task is not complete until every check below passes and is documented in the PR or task notes.

## Required acceptance references

Every UI acceptance criteria block must explicitly reference:

1. `DesignTokensV1`
2. `KthemeThemeAdapterV1`
3. `AccessibilityAcceptanceV1`

## Mandatory checks

- [ ] **Semantic color roles only**
  - Uses semantic roles from `DesignTokensV1` (no hard-coded hex values in UI composables/layouts).
  - Theme mapping is routed through `KthemeThemeAdapterV1`.
- [ ] **4dp spacing scale**
  - Spacing values use the 4dp grid (4/8/12/16/20/24/...) from `DesignTokensV1`.
- [ ] **Dynamic type up to 200%**
  - UI remains usable and non-overlapping with system font scaling up to 200%.
- [ ] **Focus order / TalkBack labels**
  - Focus order is deterministic and logical.
  - Interactive elements expose meaningful labels/roles/hints per `AccessibilityAcceptanceV1`.

## Copy/paste acceptance criteria block

```md
### UI Acceptance Criteria (Mandatory)
- References: `DesignTokensV1`, `KthemeThemeAdapterV1`, `AccessibilityAcceptanceV1`
- [ ] Semantic color roles only
- [ ] 4dp spacing scale
- [ ] Dynamic type up to 200%
- [ ] Focus order/TalkBack labels
```
