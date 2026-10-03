# Core UI V2 Design System Specification

This document defines the V2 design system contract for `core:ui`.

## 1) Design tokens

All tokens should be exposed as stable semantic names in `core:ui` and consumed by feature modules through UI contracts instead of hard-coded values.

### 1.1 Color tokens

Use semantic roles first, then map to concrete palettes per theme.

#### Foundation palette families
- `palette.neutral.*` (surface/text scaffolding)
- `palette.brand.*` (primary product accent)
- `palette.success.*`
- `palette.warning.*`
- `palette.error.*`
- `palette.info.*`

#### Semantic color roles
- Surface: `color.surface.background`, `color.surface.elevated`, `color.surface.overlay`, `color.surface.inverse`
- Content: `color.content.primary`, `color.content.secondary`, `color.content.tertiary`, `color.content.inverse`
- Action: `color.action.primary`, `color.action.primaryPressed`, `color.action.secondary`, `color.action.disabled`
- Utility: `color.border.default`, `color.border.focus`, `color.border.subtle`, `color.divider`
- States: `color.state.success`, `color.state.warning`, `color.state.error`, `color.state.info`

#### Contrast targets
- Body text contrast: minimum 4.5:1 against its surface.
- Large text (>= 18sp regular or >= 14sp bold): minimum 3.0:1.
- Interactive controls, icons, and graphically meaningful affordances: minimum 3.0:1.
- Focus indicators: minimum 3.0:1 against adjacent colors.

### 1.2 Type tokens

Define typography as role tokens, not font-size literals.

- Display: `type.display.l`, `type.display.m`
- Headline: `type.headline.l`, `type.headline.m`, `type.headline.s`
- Title: `type.title.l`, `type.title.m`, `type.title.s`
- Body: `type.body.l`, `type.body.m`, `type.body.s`
- Label: `type.label.l`, `type.label.m`, `type.label.s`
- Monospace utility: `type.code.m`

Each token includes:
- `fontFamily`
- `fontWeight`
- `fontSize`
- `lineHeight`
- `letterSpacing`

Dynamic type/scaling requirements:
- Respect Android system font scaling up to at least 200%.
- Avoid clipping/truncation for primary copy under max scaling.
- Favor vertical growth/reflow over fixed-height clipping.

### 1.3 Spacing tokens

Adopt a 4dp base scale.

- `space.0 = 0`
- `space.1 = 4`
- `space.2 = 8`
- `space.3 = 12`
- `space.4 = 16`
- `space.5 = 20`
- `space.6 = 24`
- `space.8 = 32`
- `space.10 = 40`
- `space.12 = 48`
- `space.16 = 64`

Related layout tokens:
- Corner radii: `radius.s`, `radius.m`, `radius.l`, `radius.xl`, `radius.full`
- Elevation: `elevation.0..5`
- Stroke widths: `stroke.hairline`, `stroke.s`, `stroke.m`

### 1.4 Motion tokens

Motion should reinforce hierarchy and continuity, and remain optional under reduced motion settings.

- Durations: `motion.duration.fast` (100ms), `motion.duration.normal` (200ms), `motion.duration.slow` (320ms)
- Easing: `motion.easing.standard`, `motion.easing.emphasized`, `motion.easing.decelerate`, `motion.easing.accelerate`
- Transitions: `motion.transition.fade`, `motion.transition.scale`, `motion.transition.sharedAxisX/Y`

Accessibility constraints:
- Support reduced/removed non-essential motion when system animation scale is disabled.
- Avoid parallax or rapid oscillation patterns.

## 2) Theming specification

### 2.1 Theme architecture

Provide a layered theme model:
1. **Base semantic theme** (light/dark).
2. **Reading theme overlays** (preserve existing strength): sepia, paper, dark-reader, AMOLED, high-contrast-reader.
3. **Domain accents** (optional): domain-specific accent differentiation without changing semantic meaning.

### 2.2 Preserve current reading-theme strengths

V2 must retain and formalize reading-focused customization:
- Independent reader background/text palettes.
- Reader-specific brightness and contrast adjustments.
- Optional page chrome minimization (low-distraction mode).
- Theme persistence per content type (ebook/comic/article where supported).

### 2.3 Theme selection and persistence

- Global app theme and reader theme are separate preferences.
- Reader may override global theme while actively reading.
- Last-used reader theme should restore per user profile and optionally per library/source.

### 2.4 Theming API surface (expected)

`core:ui` should provide stable contracts such as:
- `ThemeTokens`
- `ReaderThemeTokens`
- `ThemeMode` and `ReaderThemeMode`
- `ProvideCleverFerretTheme(...)`

(Exact implementation naming can vary, but semantic API separation is required.)

## 3) Reusable component library (core:ui)

Each component must have: default style, loading/empty/error variants where relevant, accessibility semantics, and preview/sample states.

### 3.1 Cards
- `MediaCard` (cover + metadata + progress)
- `CollectionCard`
- `StatCard`
- `ActionCard`

### 3.2 Players
- `MiniPlayerBar`
- `NowPlayingPanel`
- `QueueSheet`
- `TransportControls` (play/pause/seek/skip)

### 3.3 Reader controls
- `ReaderTopBar`
- `ReaderBottomBar`
- `ReaderProgressScrubber`
- `ReaderDisplaySettingsSheet` (font, spacing, theme)

### 3.4 Chips
- `FilterChip`
- `SelectableChip`
- `TagChip`
- `StatusChip`

### 3.5 Dialogs
- `ConfirmationDialog`
- `FormDialog`
- `ErrorDialog`
- `BottomSheetDialog`

## 4) Accessibility acceptance criteria (UI library)

The following criteria are release-blocking for V2 UI components:

1. **TalkBack labels and roles**
   - Interactive components expose meaningful labels.
   - Custom controls expose role/state (selected, checked, expanded, disabled).
   - Decorative imagery is marked non-announced.

2. **Dynamic type scaling**
   - Components remain usable and non-overlapping from 100% to 200% system font scale.
   - Critical controls remain discoverable without horizontal scrolling.

3. **Contrast targets**
   - All text and key visuals meet the contrast targets defined above.
   - Reader themes include at least one high-contrast compliant variant.

4. **Focus order and keyboard/switch navigation**
   - Focus order matches visual/logical reading order.
   - Dialogs trap focus while open and return focus to invoking element when dismissed.
   - Primary action is reachable without navigating hidden/disabled elements.

## 5) ktheme compatibility contract

To ensure forward compatibility with `GitHub.com/kaleaon/ktheme`:

- `core:ui` canonical adapter: `com.cleverferret.v2.core.ui.theme.KthemeThemeAdapterV1`.
- Adapter inputs only rely on stable baseline fields (`primary`, `background`, `surface`, etc.) and preserve unknown future keys as passthrough roles.
- Feature modules must consume semantic role tokens from adapter output; they must not depend directly on ktheme DTO field names.
- Future ktheme schema growth should be additive in `passthroughRoles`, then promoted to semantic roles as needed without breaking callers.

Reference contracts in code:
- `DesignTokensV1`
- `ComponentCatalogV1`
- `AccessibilityAcceptanceV1`
- `KthemeThemeAdapterV1`
