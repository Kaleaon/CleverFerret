# Fanfiction EPUB Conversion Architecture

## Unified provider flow

`FanfictionEpubConversionService` is now the only fanfiction EPUB conversion entry point used by app callers.

1. **Primary provider: FicHub API**
   - The service first calls `https://fichub.net/api/v0/epub?q=<encoded-story-url>`.
   - On success, it downloads the generated EPUB directly and maps metadata into the service `Story` model.
2. **Fallback provider: Native site scraping + local EPUB generation**
   - If FicHub is unavailable, returns an error, or does not provide an EPUB URL, the service falls back to internal HTML scraping.
   - Supported fallback site scrapers: AO3, FanFiction.net, Wattpad, and Royal Road.
   - The scraped chapters are then packaged with the built-in EPUB writer.

## API surface

The unified public API surface is the `FanfictionEpubConversionService` class, with:

- `convertStoryToEpub(...)` for file-only conversion.
- `convertStoryToEpubWithDetails(...)` for callers that need story metadata plus file output.

## Deprecated/removed implementations

The following redundant classes were removed:

- `FanfictionToEPUBConverter`
- `FanfictionToEpubConverter`
- `FanfictionToEpubConverterBasic`

Callers and DI wiring should reference `FanfictionEpubConversionService` only.
