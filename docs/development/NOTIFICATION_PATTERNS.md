# Notification Patterns (Developer Note)

Use a **Snackbar** for recoverable, non-destructive flow feedback:
- transient async failures (network, parse, fetch, playback startup)
- success confirmations and status updates
- retries that should not block the current screen

Use a **Dialog** for destructive or high-risk decisions:
- permanent delete/remove/reset actions
- security/privacy confirmations (PIN, sensitive content unlock)
- irreversible operations where explicit user confirmation is required

Rule of thumb: if the user can safely continue browsing and retry later, prefer Snackbar. If a wrong tap can cause data loss or a privileged state change, require Dialog confirmation.
