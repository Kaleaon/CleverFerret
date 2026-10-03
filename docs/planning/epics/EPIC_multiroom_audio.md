# EPIC: Multi-room Audio

## Feature Matrix Link
- Source row: **Multi-room audio** in `CleverFerretV2/docs/v2/feature-matrix.md`.
- Matrix reference: [CleverFerret V2 feature matrix](../../../CleverFerretV2/docs/v2/feature-matrix.md).

## Milestones
- **M1 — Contract**
  - Define protocol abstraction for group playback, device discovery, and transport controls.
  - Specify synchronization contract (clock source, latency budget, drift correction behavior).
  - Establish device capability model and negotiation rules.
- **M2 — Integration**
  - Implement discovery/control integration with Snapcast-compatible server and LAN/mDNS.
  - Add group management and synchronized playback control in `feature/audio`.
  - Integrate resilience handling for device joins/leaves and network changes.
- **M3 — QA Hardening**
  - Validate sync accuracy/drift across heterogeneous devices over extended sessions.
  - Perform network chaos tests (packet loss, jitter, roaming, temporary disconnects).
  - Complete reliability and recovery regression for dynamic group topology changes.

## API / Dependency Prerequisites
- Snapcast server deployment for dev/CI testing.
- LAN/mDNS discovery support and permissions across target platforms.
- Clock sync/time-source utilities suitable for low-latency group playback.
- Audio pipeline hooks for per-device buffering and latency compensation.

## Security / Privacy Requirements
- Limit device discovery/control traffic to trusted local networks by default.
- Validate and authenticate control commands where protocol support exists.
- Avoid exposing detailed local network topology in telemetry/logging.
- Provide user controls for device trust, revocation, and visibility.
- Guard against malformed discovery packets and command injection.

## Test Strategy
- Unit tests for device registry, group state machine, and drift compensation math.
- Integration tests for discovery, group formation, synchronized play/pause/seek.
- Network resilience tests with simulated latency/jitter/loss and reconnection behavior.
- End-to-end tests across mixed device capabilities and dynamic group modifications.
- Manual audio QA for perceived sync quality and UX responsiveness.

## UI / KTheme Acceptance
- Multi-room device picker and group controls follow KTheme spacing/typography conventions.
- Group state indicators (leader/member/offline/sync issue) use semantic tokenized colors/icons.
- Control surfaces remain consistent with existing audio player patterns.
- Accessible interaction model validated for keyboard/screen-reader and high-contrast modes.
