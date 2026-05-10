# Language Tools Policy

## Purpose and Scope

This policy defines how language-assistance features behave in Reader mode, including:

- offline word definitions,
- on-device translation models,
- supported/unsupported language handling, and
- privacy and security controls for optional cloud fallback.

The policy applies to all clients (mobile, desktop, and embedded) that ship Reader language tools.

---

## 1) Offline Definition Source Behavior and Dataset Update Strategy

### 1.1 Offline-first behavior

- Definitions must be available without network access for all languages marked as "supported for definitions" in the language matrix.
- The app must query local definition datasets first.
- If a local definition is unavailable:
  - return a clear "no local definition found" state,
  - provide related lemmas/stems when available,
  - do not silently call cloud services unless cloud fallback is explicitly enabled by user or admin policy.

### 1.2 Dataset packaging

- Definition datasets are versioned artifacts containing:
  - lemma entries,
  - morphological metadata (where available),
  - part-of-speech labels,
  - licensing metadata and attribution notes.
- Datasets must be cryptographically signed by the release pipeline.
- Clients must verify signature and version manifest before activation.

### 1.3 Update cadence and channels

- Standard cadence: monthly dataset refresh.
- Emergency cadence: out-of-band hotfix for critical data errors, legal takedowns, or security concerns.
- Channels:
  - stable (default),
  - preview (opt-in).
- Clients must not auto-switch channels without explicit user/admin action.

### 1.4 Update policy on device

- Check for dataset updates no more than once every 24 hours.
- Download updates only on unmetered networks by default; users may opt in to metered updates.
- Apply updates atomically:
  1. download to temp storage,
  2. verify checksum/signature,
  3. swap active pointer,
  4. garbage-collect old versions.
- If validation fails, retain the current active dataset and emit telemetry with non-content error metadata only.

### 1.5 Retention and rollback

- Keep current + previous dataset versions to enable rollback.
- Rollback can be triggered by:
  - remote kill-switch policy, or
  - local integrity failure after activation.
- Never delete active dataset before replacement is fully validated.

---

## 2) On-device Translation Model Lifecycle (Download, Storage, Retries)

### 2.1 Model acquisition

- Translation models are optional packages downloaded on demand when a user first requests a supported language pair.
- Before download, show estimated model size and storage impact.
- Allow users/admins to prefetch selected language pairs.

### 2.2 Storage and encryption

- Store models in app-private storage only.
- Use platform encryption-at-rest facilities where available.
- Separate model binaries from runtime caches to simplify cache eviction.
- Do not store source text in model files or persistent cache by default.

### 2.3 Activation and versioning

- Model packages must include:
  - semantic version,
  - compatible runtime version range,
  - hash/signature,
  - language-pair metadata.
- A model is activated only after integrity verification and compatibility checks.
- If incompatible with runtime, the app must retain the prior compatible model and request a compatible package.

### 2.4 Retry and failure handling

- Download retries use exponential backoff with jitter.
- Retry limits:
  - foreground-triggered downloads: up to 3 attempts,
  - background downloads: up to 5 attempts over 24 hours.
- On repeated failure:
  - present actionable error messaging,
  - allow manual retry,
  - provide fallback options (e.g., defer, use original text).

### 2.5 Eviction and cleanup

- Evict least-recently-used inactive models when storage pressure exceeds threshold.
- Never evict a model currently in use.
- Preserve user-pinned models unless explicitly unpinned.
- Clear partial downloads automatically after terminal failure.

---

## 3) Supported Language Matrix and Unsupported-language UX

### 3.1 Language matrix definition

Maintain a published matrix with per-language capabilities:

- definitions (offline),
- translation source support,
- translation target support,
- morphology/grammar enhancements,
- text-to-speech availability (if applicable).

Each entry must include availability tier:

- **GA** (fully supported),
- **Beta** (known limitations),
- **Experimental** (opt-in; no SLA).

### 3.2 Language pair rules

- Translation support is defined by language pair, not just single language presence.
- UI must validate selected source/target pair before download or inference.
- If only pivot translation is available, UI must explicitly label quality/latency tradeoffs.

### 3.3 Unsupported-language user experience

When a language or pair is unsupported:

- show a deterministic, non-ambiguous message: "This language is not currently supported offline."
- offer nearest supported alternatives (for example, regional variant mapping).
- keep core reading flow uninterrupted; language tools fail gracefully without blocking content access.
- provide a "Notify me when supported" option where account messaging exists.

### 3.4 Accessibility and localization requirements

- Unsupported-state messages must be localized in app UI language.
- Error states must be screen-reader friendly and keyboard navigable.
- Avoid color-only signals for support status.

---

## 4) Privacy and Security Notes for Optional Cloud Fallback Mode

### 4.1 Default posture

- Cloud fallback is **off by default**.
- Enabling cloud fallback requires explicit user consent or organization policy.
- Enterprise policy can disable cloud fallback permanently.

### 4.2 Data minimization

If cloud fallback is enabled:

- send only minimum required text span for requested operation,
- strip or hash local document identifiers,
- avoid sending surrounding context unless required for quality and explicitly disclosed.

### 4.3 Transport and service controls

- All requests must use TLS in transit.
- Requests must target approved service endpoints only.
- Apply request authentication and anti-replay protections.
- Log access to cloud fallback services with least-privilege operational access.

### 4.4 Retention and deletion

- Cloud fallback payload retention must follow published retention schedule.
- Provide user-visible retention summary in privacy docs.
- Honor account-level deletion requests and legal deletion obligations.

### 4.5 Sensitive content safeguards

- Provide warnings when users enable cloud fallback for potentially sensitive documents.
- Respect system-level data-loss-prevention (DLP) and managed-device restrictions.
- When policy forbids external transfer, block cloud fallback and surface policy reason without exposing document content.

### 4.6 Auditability

- Record non-content telemetry for:
  - fallback enabled/disabled state changes,
  - request counts by feature,
  - error classes and latency buckets.
- Do not include full user text in telemetry.
- Maintain internal audit logs for security investigations with strict retention and access controls.

---

## Compliance and Change Management

- This policy is reviewed quarterly by Product, Security, and Privacy.
- Any change to default data flow (especially cloud behavior) requires:
  1. privacy review,
  2. security review,
  3. release note update.
- Exceptions must be documented with expiration date and risk owner.
