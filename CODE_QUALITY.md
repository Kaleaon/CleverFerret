# Code Quality Tools and Guidelines

## Overview

This document describes the code quality tools and processes in place for the CleverFerret project.

## Formatting with Spotless

### What is Spotless?

Spotless is an automated code formatting tool that ensures consistent code style across the project. It's configured to:

- Trim trailing whitespace
- Ensure files end with a newline
- Maintain consistent indentation (4 spaces)

### Running Spotless

**Check if code is properly formatted:**
```bash
./gradlew spotlessCheck
```

**Auto-format code:**
```bash
./gradlew spotlessApply
```

**Important:** Always run `spotlessApply` before committing code. The CI pipeline will fail if code is not properly formatted.

### Configuration

Spotless is configured in `CleverFerret/build.gradle.kts` and applies to:
- Kotlin source files (`src/main/**/*.kt`)
- Kotlin Gradle scripts (`*.gradle.kts`)
- XML resource files (`src/main/res/**/*.xml`)

Additional style guidelines are defined in `.editorconfig` at the project root.

## Android Lint

### What is Android Lint?

Android Lint is a code scanning tool that checks for potential bugs, security vulnerabilities, performance issues, and code quality problems.

### Running Lint

**Run lint checks:**
```bash
./gradlew lint
```

**View results:**
Lint reports are generated in `CleverFerret/build/reports/lint-results-*.html`

### Configuration

Lint is configured in `CleverFerret/build.gradle.kts` with the following settings:
- `abortOnError = false` - Warnings won't fail the build
- Common non-critical checks are disabled
- Results are generated in HTML and XML formats

## Continuous Integration

### GitHub Actions

The project uses GitHub Actions to automatically check code quality on every pull request and push to main/develop branches.

The workflow (`.github/workflows/static-analysis.yml`) runs:

1. **Spotless Check** - Verifies code formatting
   - ❌ **Fails build** if code is not formatted correctly
   
2. **Android Lint** - Scans for potential issues
   - ⚠️ **Continues on error** but uploads results as artifacts
   
3. **Detekt** - Additional static analysis
   - Uploads SARIF results to GitHub Code Scanning

### Pre-Commit Checklist

Before submitting a pull request:

1. ✅ Run `./gradlew spotlessApply` to format code
2. ✅ Run `./gradlew spotlessCheck` to verify formatting
3. ✅ Run `./gradlew lint` and review warnings
4. ✅ Address any critical lint issues
5. ✅ Ensure all tests pass

## Editor Configuration

The project includes an `.editorconfig` file that defines:
- Character encoding (UTF-8)
- Line endings (LF)
- Indentation (4 spaces)
- Max line length guidelines
- Trailing whitespace handling

Many IDEs and editors automatically respect these settings.

## Known Issues

### Build Compilation Errors

The project currently has some compilation errors that are being addressed separately. These are documented in `BUGS_AND_ISSUES.md` and do not affect the code quality tools themselves.

### Lint Configuration

Android Lint may report warnings in areas that are still under development. These warnings should be reviewed but don't necessarily block merging of pull requests. The team can decide which warnings to address based on priority.

## Future Improvements

Potential enhancements to the code quality system:

1. Add ktlint rules for more comprehensive Kotlin style checking
2. Enable more granular lint rules as code quality improves
3. Add code coverage reporting
4. Integrate additional static analysis tools
5. Add pre-commit hooks for local validation

## Related Files

- `.editorconfig` - Editor configuration
- `.github/workflows/static-analysis.yml` - CI workflow
- `CleverFerret/build.gradle.kts` - Build configuration with Spotless and Lint setup
- `README.md` - General project documentation
- `CONTRIBUTING.md` - Contribution guidelines including code quality requirements
