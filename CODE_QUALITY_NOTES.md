# Code Quality Notes

This file tracks potential code quality issues, duplicates, and errors found during the documentation process.

## Data Layer

### `data/settings` Package
- **Duplicate Class Definitions**: The file `UserSettings.kt` redefines several data classes (`ReaderSettings`, `SecuritySettings`, `GeneralSettings`, `AppSettings`) and enums (`AutoScrollMode`) that are also defined in other files within the same package. This creates ambiguity and could lead to maintenance issues.
  - `data/settings/ReaderSettings.kt` vs. `data/settings/UserSettings.kt` (class `ReaderSettings`)
  - `data/settings/SecuritySettings.kt` vs. `data/settings/UserSettings.kt` (class `SecuritySettings`)
  - `data/settings/GeneralSettings.kt` vs. `data/settings/UserSettings.kt` (class `GeneralSettings`)
  - `data/settings/GeneralSettings.kt` vs. `data/settings/UserSettings.kt` (class `AppSettings`)

### `di` Package
- **Duplicate Hilt Module Providers**: The `ServicesModule.kt` duplicates all the DAO and `AppDatabase` providers from `DatabaseModule.kt`. This is redundant and could be consolidated into a single `DatabaseModule`.
