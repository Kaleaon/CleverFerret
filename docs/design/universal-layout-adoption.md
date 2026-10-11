# Universal layout standards v1 — Android adoption

The authoritative contract is Ktheme's `src/standards/layouts.v1.json`, introduced in
[Ktheme PR #111](https://github.com/Kaleaon/Ktheme/pull/111) and merged at
`b0ec0fd5657cfebd40a4ec10612d47dd1d728712`. This app bundles the identical artifact at
`CleverFerret/src/main/assets/theme/layout-standards.v1.json`, SHA-256
`b97b50d7422fe74e54221e9a7b17dc0fb94930483d2eb7a0c7e5913648e859a3`.
The prototype refinements are merged in [design PR #22](https://github.com/Kaleaon/Cleverferret-design/pull/22).

## Production integration

The manifest launcher is `ui/media/MediaMainActivity`, using the legacy palette registry.
`ui/modern/CFTheme` alone was not the production root. Both paths now provide layout tokens.
`SettingsRepository` persists `layout_id` independently of the existing theme and dark-mode
preferences; `MainViewModel` exposes it; the production Theme Gallery offers seven choices.
Palette changes preserve layout. Unknown IDs default to Compose, and old enum names map to
their stable IDs. Existing palette IDs and saved preferences remain compatible.

| ID | Android behavior |
| --- | --- |
| compose | Material surfaces, pill actions, phone bar and wide rail |
| terminal | Mono typography, 4dp corners, metadata at least 12sp, bar/rail navigation |
| sweep | Black field, opposing concentric sweeps, filled text rail, text transport, playback/feedback docks |
| tiles | Square shapes, lowercase scrollable pivot navigation, preserved media title case, quick actions at most 160dp |
| glass | Soft shapes, bundled Nunito Sans, opaque text surfaces as the safe glass fallback |
| rules | Persistent rail, sharp shapes, quiet surfaces and unbroken media words |
| press | Serif typography, quiet solid actions and shadow-free surfaces |

`CFMediaScaffold` uses the measured window width and the contract's 720dp breakpoint;
immersion routes hide navigation on every width. Safe drawing insets protect the frame from
system bars. Navigation includes reachable overflow destinations and Settings. Playback and
feedback take measured rows rather than overlaying content. Material dialogs, shared media
corner/elevation tokens, canonical artwork/cards, controls and modern components consume
layout shapes. Shared actions have 48dp targets and named play/pause/next/previous semantics.
The full audio player uses text transport in Sweep, keeps shuffle/repeat or speed/timer actions
reachable, names the seek slider and scrolls in constrained windows. Quiet layouts suppress
its decorative blurred artwork.

## LCARS geometry and variants

Rail 76dp, bar 12dp and inner radius 18dp derive outer elliptical radii 94 × 30dp.
The header's inner/outer center is `(94, 86)` and the content's is `(94, 150)`.
The renderer uses elliptical paths and circular cutouts, rather than unrelated rectangles.
The native selection is named LCARS-inspired because it pairs the frame with the user's
existing palette. The web reference also offers the LCARS color pack with Flat effects.
The app's production palette registry remains its existing 22 choices; this change does
not equate those palettes with the prototype's 26 packs or add all eight web effect packs.

Content artwork/pictograms and Android system UI are documented deviations from the console
reference. LCARS text fields and elevated containers use black surfaces; effects and shadows
are disabled for quiet layout families. Text on solid action fills chooses black or white
for at least 4.5:1 contrast. This does not certify every legacy screen or imported artwork.

## Validation and remaining fidelity checks

The contract tests cover all seven IDs, migration/defaults, common targets/breakpoint,
LCARS curve centers, distinctive corners, bounded Metro actions and invalid contracts.
The same contract bytes and web tokens are checked in the prototype's CI.

Native release review must still exercise real devices/emulators at phone/tablet widths,
landscape, large text, TalkBack and reduced motion. The glass fallback deliberately keeps
reading surfaces opaque; actual backdrop blur/wallpaper composition needs a separate contrast
audit before adoption. Roboto uses Android's system face; the other layout families bundle licensed Antonio,
Nunito Sans, JetBrains Mono, Open Sans, Jost and Source Serif 4 resources. Their OFL texts and
source/hash manifest ship in assets/fonts. Fontsource Latin subsets were decoded to TrueType;
Android supplies fallback glyphs outside their coverage. Standalone contract checks cannot substitute
for `detekt`, `testDebugUnitTest`, `assembleDebug`, or device rendering review.

### Current verification record

- Full repository Detekt: passed with existing complexity/MagicNumber rules active.
  Existing unbaselined failures were refactored; Compose naming follows its framework convention.
- Six contract JUnit tests: passed using the bundled artifact and Kotlin 2.1 compiler.
- New theme/scaffold/control API compilation: passed against cached Android/Compose/Material APIs.
  Host navigation, palette binding and resource ID definitions were stubbed in this isolated check;
  it is not a whole-app compilation or rendering test.
- Navigation (135 routes, 156 calls), documentation links/status, widget background rules,
  V2 semantic token checks, and production console checks: passed. Route inventory was regenerated.
- Required `testDebugUnitTest` and `assembleDebug`: blocked by dependency endpoints returning
  HTTP 503. No successful full app build, full suite result, or device screenshot is claimed.
