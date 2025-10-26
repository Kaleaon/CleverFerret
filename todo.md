# CleverFerret Compilation Fixes

## Issues Identified and Resolved
- [x] KSP version incompatibility with Kotlin version (2.2.20-2.0.4 doesn't match Kotlin 2.0.20)
- [x] Fixed KSP version to 2.0.20-1.0.25 (compatible with Kotlin 2.0.20)
- [x] Created pull request with fixes: https://github.com/Kaleaon/CleverFerret/pull/306
- [x] CI revealed Kotlin 2.1.0 incompatible with Hilt 2.52 (metadata version 2.1.0 not supported)
- [x] Reverted to Kotlin 2.0.20 and upgraded Hilt to 2.53 (supports Kotlin 2.0.20)
- [x] Downgraded dependencies compiled with Kotlin 2.2.0:
  - okhttp logging-interceptor: 5.2.1 → 4.12.0
  - jellyfin-core: 1.7.1 → 1.5.3
- [ ] Testing final fix in CI

## Current Status
Working on final fix - using Kotlin 2.0.20 with Hilt 2.53 and compatible dependency versions

**Pull Request:** https://github.com/Kaleaon/CleverFerret/pull/306