# Navigation Surface Audit (Phase 1)

## Current Navigation Surfaces

### Primary surfaces in production flow
- **Home**: `home` route, start destination in `MediaAppNavHost`.
- **My Library / Library family**:
  - Canonical typed route: `library/{mediaType}`.
  - Per-type aliases: `library/book`, `library/audiobook`, `library/music`, `library/podcast`, etc.
  - Legacy aliases: `library_details/{typeId}` mapping to typed routes.
- **Per-type destinations outside typed library**:
  - Dedicated music screen: `music`.
  - Dedicated podcast screen: `podcasts`.
  - Web fiction manager and radio routes with separate entry points.

### Entry points that exposed overlap
- Mobile bottom bar (`MediaNavDestinations.primaryDestinations`) previously listed multiple library-type tabs directly (`Books`, `Audiobooks`, `Comics`, `Movies`, `TV Shows`, `Music`, `Podcasts`, `Radio`).
- Legacy bottom bar preference IDs map to those same per-type routes.
- Navigation graph supports both typed library routes and legacy numeric type routes.

## Confusion-causing overlap

1. **Competing “Library” affordances**
   - Users could enter “Library” concepts from many peer-level tabs (Books, Music, Podcasts, etc.) instead of one obvious Library home.
2. **Duplicate taxonomy**
   - Media-type categories appeared as top-level nav items and also as in-screen content concepts.
3. **Legacy + modern route coexistence**
   - `library_details/{typeId}` and `library/{mediaType}` both active, which complicates mental model and test coverage.

## Phase-one refactor scope (implemented)

- Added one **primary Library destination** (`library`) for bottom-bar first navigation.
- Kept existing typed routes (`library/{mediaType}`) as data/viewmodel contract entry points.
- Added media-type chips in library UI composition so users switch between books/audiobooks/music/etc. from within library context.
- Preserved legacy route compatibility by mapping old bottom-bar preference IDs to the new primary `library` destination.

## Explicit non-goals (phase one)

- No repository schema/model redesign.
- No media repository contract migration.
- No removal of existing specialized screens (music/podcast/radio) in this phase.
