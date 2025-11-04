# Cross-Language Integration Reference

Last updated: 2025-11-04

This reference tracks how CleverFerret currently uses (or plans to use) code written in Kotlin, Java, C#, and C++, and maps external virtual-world projects that we plan to align with. It complements `docs/status/FEATURE_STATUS_2025-11-04.md` by focusing on language interoperability and source locations.

## 1. Language Coverage Snapshot

| Language | In-Repo Presence | Key Paths / References | Integration Status |
|----------|-----------------|------------------------|--------------------|
| Kotlin   | ✅ Primary application language | `CleverFerret/src/main/java/com/universalmedialibrary/**` (Compose UI, services, repositories) | Active
| Java     | ⚠️ Minimal (test stub only) | `CleverFerret/src/test/java/com/universalmedialibrary/PlaceholderTest.java` | Legacy/placeholder
| C#       | ⏳ Planned via LibreMetaverse | External: LibreMetaverse (see §3.1) | Planned
| C++      | ⏳ Planned via Firestorm / RLVa | External: Firestorm & RestrainedLove (see §3.2) | Planned

## 2. Kotlin & Java in CleverFerret

### 2.1 Kotlin Modules

- **MIDI platform** – end-to-end Kotlin implementation under `CleverFerret/src/main/java/com/universalmedialibrary/services/midi/` and `.../ui/midi/`.
- **Reader enhancements** – components in `.../ui/reader/components/` (`ReadingRulerComponent.kt`, `RsvpReader.kt`, `EnhancedAutoScroll.kt`).
- **Advanced effects** – Compose components in `.../ui/components/` with a showcase at `ui/screens/AdvancedEffectsShowcaseScreen.kt`.
- **Screen timeout utilities** – `utils/ScreenTimeoutManager.kt` and Compose effect `utils/ScreenTimeoutEffect.kt`.

> Tip: When documenting new Kotlin modules, cross-link them here so the matrix in §4 stays accurate.

### 2.2 Java Touchpoints

- `CleverFerret/src/test/java/com/universalmedialibrary/PlaceholderTest.java` – placeholder JUnit test kept for Gradle wiring. No production Java code at this time.

If Java interoperability grows (e.g., when integrating legacy Android libraries), add the concrete class paths in this section.

## 3. External Code References

These links point to upstream projects that inform future CleverFerret integrations. Always verify licensing and compatibility before copying code.

### 3.1 LibreMetaverse (C#)

- **Repository:** https://github.com/LibreMetaverse/LibreMetaverse
- **Agent / Avatar control (C#):** `OpenMetaverse/AgentManager.cs` – https://github.com/LibreMetaverse/LibreMetaverse/blob/master/OpenMetaverse/AgentManager.cs
- **Inventory management (C#):** `OpenMetaverse/InventoryManager.cs` – https://github.com/LibreMetaverse/LibreMetaverse/blob/master/OpenMetaverse/InventoryManager.cs

> Action item: when creating a Kotlin interoperability layer, reference the exact LibreMetaverse classes that expose the capabilities you need and note the target commit hash in this document.

### 3.2 Firestorm & RestrainedLove (C++)

- **Firestorm Viewer repository:** https://vcs.firestormviewer.org/phoenix-firestorm/
- **RLVa handler (C++):** `indra/newview/rlvhandler.cpp` – https://vcs.firestormviewer.org/phoenix-firestorm/file/default/indra/newview/rlvhandler.cpp
- **Second Life protocol layers (C++):** `indra/newview/llagent.cpp` – https://vcs.firestormviewer.org/phoenix-firestorm/file/default/indra/newview/llagent.cpp

> RestrainedLove (RLV/RLVa) features are maintained inside Firestorm’s `indra/newview` module. If we depend on specific behaviour, capture the relevant file links (and build instructions) here.

### 3.3 LibreMetaverse-Compatible Clients (C#)

- **OpenMetaverse protocol stack:** https://github.com/LibreMetaverse/LibreMetaverse/tree/master/OpenMetaverse
- **Teleport & region handling:** `OpenMetaverse/SimulatorManager.cs` – https://github.com/LibreMetaverse/LibreMetaverse/blob/master/OpenMetaverse/SimulatorManager.cs

> Many third-party clients (e.g., Radegast) draw from LibreMetaverse. Use this section to log any derivative scripts we mirror.

### 3.4 Lumiya (Android, Kotlin/Java)

- Lumiya is proprietary and closed-source. No publicly accessible scripts are available. For reverse-engineering or interoperability work, document findings (e.g., API contracts extracted from APK analysis) under `docs/testing/APK_DECOMPILATION_REQUIREMENTS.md` and link back here once concrete artefacts exist.

## 4. Cross-Language Feature Matrix

| Feature / Capability | CleverFerret Kotlin Module | Planned External Reference | Status |
|----------------------|----------------------------|-----------------------------|--------|
| Virtual world presence & login | _Pending module_ | LibreMetaverse `AgentManager.cs` (C#) | Not started
| Inventory sync | _Pending module_ | LibreMetaverse `InventoryManager.cs` (C#) | Not started
| Avatar restraint controls | _Pending module_ | Firestorm `rlvhandler.cpp` (C++) | Not started
| Media/MIDI playback | `services/midi/**`, `ui/midi/**` (Kotlin) | N/A | Implemented (Phase 1)
| Reader enhancements | `ui/reader/components/**` (Kotlin) | Lumiya feature parity (documentation only) | In progress

Update this matrix whenever a feature moves forward or gains new dependencies.

## 5. Next Steps

1. **Verify external links:** Confirm the Firestorm URLs and capture commit hashes or tagged releases for reproducibility.
2. **Add interoperability design notes:** For each planned integration (C# / C++), add a short design summary plus API surface expectations.
3. **Track licensing:** Record GPL/AGPL implications (Firestorm, LibreMetaverse) and how they affect CleverFerret distribution.

---

_Maintainer note:_ keep this document ASCII-only and extend the table structures instead of duplicating content elsewhere. This file should be the first stop for anyone researching cross-language integration work.
