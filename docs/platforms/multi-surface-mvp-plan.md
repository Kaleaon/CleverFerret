# Multi-Surface MVP Plan

## Purpose
Deliver a usable MVP across all target surfaces while keeping each surface independently shippable, with clear boundaries for scope, shared dependencies, and review gates.

## MVP Deliverables and Non-Goals by Surface

### 1) iOS (Phone + Tablet)
**MVP deliverables**
- Core playback experience: play/pause/seek, queue handling, and persistent now-playing state.
- Media session integration: lock screen controls, background playback behavior, and headset/remote transport commands.
- Browse and discovery: home feed, basic search, and detail page drill-down.
- Artwork rendering in player, queue, and browse cards with placeholder/fallback states.
- Offline-safe startup behavior (loads last known state and gracefully rehydrates network data).

**Non-goals**
- Advanced personalization (algorithmic recommendation tuning beyond baseline ranking).
- Social features (sharing, comments, collaborative playlists).
- Rich downloads/offline library management.
- iPad-specific multitasking optimizations beyond responsive layout.

### 2) Android (Phone + Tablet)
**MVP deliverables**
- Functional playback stack with foreground service and resilient audio focus handling.
- Media session + notification transport controls.
- Browse model parity with iOS for key content types and navigation depth.
- Artwork loading/caching with low-memory fallbacks.
- Cold-start and process-death recovery for active playback session.

**Non-goals**
- Android Auto, Wear OS, and TV integrations.
- Deep OEM-specific behavior tuning for every vendor skin.
- Custom equalizer/audio effects.

### 3) Web (Desktop + Mobile Web)
**MVP deliverables**
- Browser playback UI with consistent controls and queue semantics.
- Browse/discovery routes matching core native taxonomy.
- Progressive artwork loading strategy (thumbnail -> full-res).
- Session continuity in a single browser profile (resume queue and position).
- Baseline accessibility support for controls, focus order, and screen reader labels.

**Non-goals**
- Full PWA offline mode and installability hardening.
- Deep keyboard shortcut customization.
- Legacy-browser edge-case support beyond agreed compatibility matrix.

### 4) Desktop (macOS/Windows, if packaged separately)
**MVP deliverables**
- Stable playback shell using shared playback APIs and queue model.
- Windowed browse + now-playing experience with artwork and transport controls.
- OS-level media key support where framework support is available.
- Crash-safe session restore (last queue + playhead).

**Non-goals**
- Platform-native menu bar/tray feature depth.
- Advanced multi-window workflows.
- Device-specific hardware acceleration tuning.

## Shared Dependencies (Cross-Surface)
These dependencies should be treated as common critical path items with explicit contracts and compatibility versioning.

1. **Media session abstraction**
   - Canonical transport commands (`play`, `pause`, `seek`, `next`, `previous`).
   - Unified now-playing metadata schema.
   - Lifecycle contract for interruption/focus/background handling.

2. **Browse model**
   - Shared content taxonomy (home rails, collections, item detail, search result types).
   - Stable API envelope and pagination semantics.
   - Consistent error/loading/empty-state model.

3. **Artwork pipeline**
   - Derivative size spec (thumbnail/card/hero).
   - URL signing/CDN policy and cache invalidation rules.
   - Fallback hierarchy (placeholder, dominant-color block, retry behavior).

## Store / Review Gating Requirements by Platform

### iOS App Store
- App Privacy details and data usage declarations aligned with runtime behavior.
- Background audio entitlement justification and review notes for playback use case.
- Metadata completeness: screenshots, age rating, content rights statements where required.
- Build passes TestFlight smoke tests and no blocker crashes/regressions.

### Google Play (Android)
- Data safety form consistency with implemented telemetry/auth behavior.
- Foreground service + notification behavior compliant with current Play policies.
- Content rating and regional distribution settings configured.
- Internal testing track sign-off and pre-launch report review.

### Web Release Gate
- Production domain configuration, TLS, and CSP validated.
- Accessibility and core performance budget checks at agreed thresholds.
- Error monitoring + release rollback mechanism enabled.
- Legal links (privacy/terms/cookies) visible in production entry points.

### Desktop Distribution Gate
- Code signing/notarization requirements met for each OS distribution channel.
- Auto-update channel tested (or explicitly disabled for MVP with manual update plan).
- Installer/uninstaller sanity checks and permission prompts validated.
- Crash telemetry and minimal diagnostics pipeline enabled.

## Parallelization Plan (Avoid Global Stall)

### Workstream decomposition
- **Track A — Shared Foundations:** media session abstraction, browse model contracts, artwork pipeline API/spec.
- **Track B — Surface Clients:** iOS, Android, Web, Desktop implementation teams execute in parallel against versioned interfaces.
- **Track C — Compliance/Release:** store listing assets, policy forms, legal copy, QA matrix, release automation.

### Decoupling mechanisms
- Contract-first development with mocked/stubbed backends for browse/artwork.
- Feature flags per surface to isolate unfinished capabilities.
- Versioned dependency interfaces with backward-compatible grace windows.
- Surface-level release candidates and independent go/no-go decisions.

### Milestone strategy
1. **M0 (Contract Freeze):** shared interfaces finalized, mocks available.
2. **M1 (Surface Alpha):** each surface demonstrates end-to-end playback + browse on mocks.
3. **M2 (Integration Beta):** each surface integrates live shared services independently.
4. **M3 (Gate Review):** platform-specific review checklists completed per surface.
5. **M4 (Staggered Launch):** release surfaces as each clears gates; lagging surface does not block others.

### Risk controls
- Weekly cross-track dependency review with explicit owner/ETA per blocker.
- “No single thread” policy: every shared dependency must have fallback behavior in clients.
- Freeze window before each surface launch for regression burn-down.
- Post-launch hardening backlog maintained separately from MVP scope.
