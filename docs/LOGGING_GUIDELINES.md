# Logging Guidelines

## Required logging abstraction

- **Do not** use raw `console.log` / `console.error` / `println` in production application paths.
- Android app code should use `AppLogger` (`com.universalmedialibrary.core.logging.AppLogger`) so severity, context, and redaction are consistently applied.
- Development-only verbose logs must stay behind environment guards (`BuildConfig.DEBUG` for Android).

## Severity and context

`AppLogger` supports:

- `debug(...)` for development diagnostics (debug builds only).
- `info(...)` for normal operational milestones.
- `warn(...)` for recoverable failures.
- `error(...)` for user-impacting or unrecoverable failures.

Attach structured context with `context = mapOf(...)` rather than embedding sensitive or unstructured values directly in message strings.

## Redaction rules (enforced in logger adapter)

The logger adapter automatically redacts:

- Auth and API credentials (Bearer/JWT-like tokens, API keys, passwords, secrets, authorization headers).
- Emails.
- Phone numbers.
- File-system-like absolute paths.

When adding new log fields, assume values may be sent to a remote sink and keep context minimal.

## Optional remote sink

`AppLogger` can forward sanitized entries to an optional `RemoteSink` via `AppLogger.setRemoteSink(...)`.

- The sink receives redacted messages and redacted context.
- In release builds, throwable payloads are sanitized to avoid raw stack trace leakage.

## Checks to prevent regressions

- Run `./scripts/check-no-raw-console.sh` locally or in CI to block new raw console/println calls in application source paths.
- CI (`.github/workflows/static-analysis.yml`) executes the same check before Android lint.
