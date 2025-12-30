# Pure Kotlin Conversion Plan

## Overview
Converting all parsers to pure Kotlin implementation, eliminating the need for JNI wrappers and C/C++ code.

## Strategy

### For MOBI/AZW/AZW3
- Use existing Kotlin/Java MOBI libraries
- Alternative: Implement MOBI parser in pure Kotlin based on format specification
- Fallback: Use Calibre conversion to EPUB

### For DJVU
- Use existing Kotlin/Java DJVU libraries if available
- Alternative: Implement basic DJVU text extraction in Kotlin
- Fallback: Use external DJVU tools

### For Legacy Formats (LIT, SNB, RB, PDB)
- Research pure Kotlin/Java implementations
- Implement based on format specifications
- Use Apache Tika where possible

## Implementation Plan

1. Research existing Kotlin/Java libraries for each format
2. Implement pure Kotlin parsers
3. Remove JNI placeholder code
4. Update documentation
5. Test all implementations