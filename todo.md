# CleverFerret Compilation Fixes

## Issues Identified and Resolved
- [x] KSP version incompatibility with Kotlin version (2.2.20-2.0.4 doesn't match Kotlin 2.0.20)
- [x] Fixed KSP version to 2.0.20-1.0.25 (compatible with Kotlin 2.0.20)
- [x] Created pull request with fixes: https://github.com/Kaleaon/CleverFerret/pull/306
- [x] Discovered Kotlin 2.0.20 incompatible with modern dependencies (missing SpillingKt class)
- [x] Upgraded to Kotlin 2.1.0 with Hilt 2.57 (supports Kotlin 2.1.0+)
- [x] Upgraded KSP to 2.1.0-1.0.29 (compatible with Kotlin 2.1.0)
- [x] Restored original dependency versions (okhttp 5.2.1, jellyfin-core 1.7.1)
- [x] Simplified resolutionStrategy to only force Kotlin stdlib 2.1.0
- [ ] Testing final fix in CI

## Current Status
Using Kotlin 2.1.0 with Hilt 2.57 - this combination should support all modern dependencies

**Pull Request:** https://github.com/Kaleaon/CleverFerret/pull/306