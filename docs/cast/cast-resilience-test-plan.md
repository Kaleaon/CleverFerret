# Cast Resilience Test Plan

## Scope
This plan validates cast playback resilience across disruptive events and verifies expected fallback behavior when cast state or content resolution fails.

## Test Cases

### 1. Cast Mid-Track Handoff
**Objective:** Confirm seamless transition when a track already playing locally is moved to cast output.

**Preconditions:**
- Active local playback at multiple offsets (early: <10s, mid: ~50%, late: >90%).
- Cast target is discoverable and idle.
- Track metadata and stream URI are valid.

**Steps:**
1. Start local playback and seek to each offset test point.
2. Initiate cast to selected receiver while playback is active.
3. Observe playback state during handoff.
4. Verify reported position on receiver.
5. Stop casting and resume local playback.

**Expected Results:**
- Cast starts from the nearest valid position with no duplicate playback sessions.
- Local player transitions to remote-controlled state without user-visible error.
- End-cast returns control to local player at a synchronized position.

---

### 2. Queue Edits During Active Cast
**Objective:** Ensure queue mutations while casting are reflected correctly on receiver and local UI state.

**Preconditions:**
- Active cast session with at least 3 queued items.

**Steps:**
1. Reorder queue items during cast.
2. Remove current-next and tail items.
3. Add single track and bulk-add playlist items.
4. Toggle repeat/shuffle modes (if supported).
5. Skip next/previous rapidly while edits are in-flight.

**Expected Results:**
- Queue order and active item remain consistent between local state and receiver state.
- No orphaned/ghost entries remain after edits.
- Unsupported operations fail gracefully with actionable messaging.

---

### 3. Network Loss and Recovery
**Objective:** Verify behavior under transient and sustained connectivity failures.

**Preconditions:**
- Active cast session on stable network.

**Steps:**
1. Simulate brief network interruption (2-5 seconds).
2. Restore network and observe session recovery.
3. Simulate extended outage (30-60 seconds).
4. Restore network and verify reconnection or fallback behavior.
5. Repeat with receiver-side disconnect (receiver loses network first).

**Expected Results:**
- Brief loss: session recovers automatically without full restart.
- Extended loss: app surfaces disconnected state and offers deterministic recovery path.
- Playback state does not corrupt local queue or crash cast manager.

---

### 4. Session End Scenarios
**Objective:** Validate controlled and uncontrolled cast session termination handling.

**Preconditions:**
- Active cast session with progressing playback.

**Steps:**
1. End session from sender app.
2. End session from receiver device UI.
3. Force-stop receiver app/process.
4. Trigger remote session timeout/idle expiration.

**Expected Results:**
- Sender app returns to local playback-ready state.
- Transport controls update immediately to non-cast state.
- User can resume locally from last known safe position.

## Local Resume Latency Targets

### Target
- **Nominal target:** local resume starts within **500 ms** after cast session end/disconnect is detected.

### Acceptance Threshold
- **P95 acceptance threshold:** local resume starts within **1200 ms**.
- **Hard failure threshold:** any resume taking **>2000 ms** or requiring manual double-action (e.g., user must press play twice) is a fail.

### Measurement Guidance
- Measure from timestamp of session-ended/disconnected callback to first confirmed local playback state `PLAYING`.
- Record at least 30 samples across devices/network profiles.

## Content URI Resolvability and Fallback

### URI Resolvability Checks
Validate before and during cast handoff:
- URI is non-empty, syntactically valid, and supported scheme (e.g., `https`, app-supported content scheme).
- Content is authorized (token/session not expired).
- Receiver can access URI domain/path (CORS/CDN/geo rules as applicable).
- MIME type/codec compatibility is known for receiver profile.

### Fallback Behavior
If URI cannot be resolved:
1. Attempt refresh/regenerate of stream/content URI once.
2. Retry cast load with refreshed URI.
3. If retry fails, continue or resume playback locally at last known position.
4. Show user-facing message with reason category (authorization, network, unsupported format, unavailable content).
5. Emit telemetry event with failure reason and fallback outcome.

## Regression Checklist (Cast Manager Changes)
Use this checklist for every cast manager refactor, dependency upgrade, or state-machine change:

- [ ] Session lifecycle callbacks still fire in correct order (connecting → connected → ending/ended).
- [ ] Local/remote state synchronization remains deterministic under rapid user actions.
- [ ] Queue diff/apply logic handles add/remove/reorder without duplication.
- [ ] Reconnect flow after transient network loss maintains correct active item and position.
- [ ] Session termination path always restores local controls and audio focus handling.
- [ ] Resume latency instrumentation remains intact and dashboard fields unchanged.
- [ ] URI validation + fallback path still executes before user-visible hard failure.
- [ ] Error taxonomy/analytics events remain backward-compatible for monitoring.
- [ ] Existing cast smoke tests and resilience scenarios pass in CI and on one physical device.
