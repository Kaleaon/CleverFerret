# EPIC: Advanced AI Features

## Feature Matrix Link
- Source row: **Advanced AI features (insights/mind maps/recommendations)** in `CleverFerretV2/docs/v2/feature-matrix.md`.
- Matrix reference: [CleverFerret V2 feature matrix](../../../CleverFerretV2/docs/v2/feature-matrix.md).

## Milestones
- **M1 — Contract**
  - Define provider-agnostic AI service contract for insights, mind maps, and recommendations.
  - Specify prompt template schema, response contract, and safety filter interfaces.
  - Lock fallback behavior for unavailable providers (OpenAI/Gemini/Ollama).
- **M2 — Integration**
  - Implement AI orchestration in `feature/metadata` + `core/network` with pluggable providers.
  - Integrate feature surfaces into relevant reading/library UX entry points.
  - Add observability for latency, error rates, and structured response quality checks.
- **M3 — QA Hardening**
  - Run quality and safety evaluation suite across representative content types.
  - Validate deterministic handling of malformed/unsafe/low-confidence responses.
  - Complete usability and performance regression across devices/theme modes.

## API / Dependency Prerequisites
- Active provider credentials for OpenAI or Gemini; optional local Ollama runtime.
- Prompt/rules repository for versioned templates and safety policy configuration.
- Structured response parser/validator for typed UI consumption.
- Caching/rate-limit layer to manage cost and latency.

## Security / Privacy Requirements
- Require opt-in and transparent disclosure before sending user/library content to external AI providers.
- Support provider-level data minimization and configurable redaction of sensitive fields.
- Encrypt API keys and rotate secrets per environment policy.
- Log only metadata-level telemetry; avoid storing raw prompt/response unless explicitly enabled.
- Enforce policy checks for unsafe content categories and prompt injection resistance.

## Test Strategy
- Unit tests for prompt construction, response parsing, and policy filters.
- Contract tests per provider for request/response schema and error mapping.
- Evaluation tests using curated fixtures to score relevance, factuality proxies, and safety compliance.
- Integration tests for feature workflows (generate insight, create mind map, recommendation refresh).
- Manual UX QA for fallback messaging, retries, and consent/privacy controls.

## UI / KTheme Acceptance
- AI entry points and generated-content cards use standard KTheme components.
- Distinct loading/thinking/error states are consistent with app-wide motion and color tokens.
- Consent and privacy affordances are prominent, readable, and theme-consistent.
- Accessibility pass for generated-content layouts, focus handling, and screen reader labels.
