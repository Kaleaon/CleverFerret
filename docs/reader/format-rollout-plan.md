# Reader Format Rollout Plan

This plan stages new document format support by integration risk, parser complexity, and UX confidence.

## Batch A: FB2 / RTF (Lower Integration Risk)

### FB2
- **Parser dependency:** XML-based FB2 parser (`fast-xml-parser` or equivalent) plus optional ZIP handling for `.fb2.zip` containers.
- **UI capabilities:**
  - Open: supported for plain `.fb2` and zipped `.fb2.zip`.
  - Scroll: continuous text flow rendering.
  - Search: full-text search across parsed sections and metadata-aware title extraction.
- **Test sample requirements:**
  - At least 3 files: simple fiction, deeply nested section structure, and `.fb2.zip` variant.
  - Include Unicode/CJK sample and embedded image references.

### RTF
- **Parser dependency:** RTF-to-HTML/text converter library (`rtf.js` or equivalent) with fallback plain-text extraction.
- **UI capabilities:**
  - Open: basic rich-text ingestion with paragraph/bold/italic support.
  - Scroll: normalized flow view after conversion.
  - Search: content search on converted text layer.
- **Test sample requirements:**
  - At least 3 files: baseline RTF, large file (100+ pages), and non-Latin encoding sample.
  - Include table/list formatting and footnotes for regression checks.

## Batch B: MOBI / AZW3 / ODT / DOC (Parser/Library Complexity)

### MOBI
- **Parser dependency:** MOBI parser library (e.g., `mobi-parser`) with HTML extraction adapters.
- **UI capabilities:**
  - Open: parse metadata and body markup from common MOBI variants.
  - Scroll: chapter-aware continuous reading view.
  - Search: searchable extracted text with chapter hit context.
- **Test sample requirements:**
  - At least 4 files: classic MOBI, DRM-free modern MOBI, image-heavy book, malformed-header edge case.
  - Verify TOC/chapter boundary handling.

### AZW3
- **Parser dependency:** Kindle Format 8/AZW3 parser (shared pipeline with MOBI where possible).
- **UI capabilities:**
  - Open: ingest KF8 content documents and metadata.
  - Scroll: HTML/CSS-based pagination fallback to vertical flow.
  - Search: full-text search with section anchors.
- **Test sample requirements:**
  - At least 4 files: text-centric, media-rich, complex CSS layout, and large multi-chapter title.
  - Include sample with internal links and notes.

### ODT
- **Parser dependency:** OpenDocument parser using ZIP + XML (`jszip` + ODF XML parser).
- **UI capabilities:**
  - Open: unpack `.odt`, parse content/styles, render document body.
  - Scroll: layout-normalized flow preserving headings/lists.
  - Search: text search with heading-aware snippet context.
- **Test sample requirements:**
  - At least 3 files: plain prose, style-heavy document, and embedded image/table document.
  - Include multilingual sample for encoding and font fallback checks.

### DOC
- **Parser dependency:** Legacy binary `.doc` extractor (`antiword`/`catdoc` service wrapper or equivalent conversion pipeline).
- **UI capabilities:**
  - Open: best-effort text extraction with metadata fallback.
  - Scroll: plain/normalized flow view (limited style fidelity acceptable in MVP).
  - Search: search over extracted text only.
- **Test sample requirements:**
  - At least 4 files: Word 97-era doc, modern-compatible doc, corrupted-partial doc, and long-form manuscript.
  - Include footnotes/endnotes to validate extraction boundaries.

## Batch C: DJVU / CHM (Bitmap Fallback MVP First)

### DJVU
- **Parser dependency:** DJVU decoder/rendering backend (native bridge or WASM wrapper around `djvulibre`).
- **UI capabilities:**
  - Open: page-level decode and bitmap render (MVP).
  - Scroll: vertical page stack scrolling with lazy page loading.
  - Search: OCR-text search only when embedded text layer exists; otherwise disabled with user notice.
- **Test sample requirements:**
  - At least 4 files: text-layer DJVU, image-only scan, high-resolution scan, and mixed-quality archival sample.
  - Validate memory usage and page decode performance.

### CHM
- **Parser dependency:** CHM container reader + HTML extractor (`libmspack`-based tooling or equivalent).
- **UI capabilities:**
  - Open: extract topic tree and HTML pages from CHM archive.
  - Scroll: per-topic scroll plus topic-to-topic navigation.
  - Search: index-based search if available; fallback full-text over extracted topics.
- **Test sample requirements:**
  - At least 4 files: simple help file, deep TOC hierarchy, asset-heavy CHM (images/scripts), and non-English encoding sample.
  - Include broken-link sample to validate safe navigation fallbacks.

## Cross-Batch Exit Criteria
- Parser failures must surface actionable user errors (unsupported/encrypted/corrupt).
- Open + scroll + search smoke tests required for each format before promotion.
- Golden sample corpus must be versioned under `tests/fixtures/reader-formats/` with manifest metadata.
