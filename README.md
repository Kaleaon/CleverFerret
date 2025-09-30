<p align="center">
  <img src="./logo.png" alt="CleverFerret logo" width="160">
</p>

<h1 align="center">CleverFerret</h1>

<p align="center">A comprehensive Universal Media Library for Android</p>

## 1. High-Level Vision

CleverFerret is a fully self-contained, native Android application for managing a user's complete media library directly on their device. This includes books, comics, music, movies, podcasts, and more. The application features a modern, extensible, and user-friendly interface for organizing, viewing, and consuming all types of media, with powerful tools for metadata management.

---

## 2. Core Principles

*   **On-Device First:** The entire library and its database are managed on the user's device. No external server or desktop application is required.
*   **Extensible by Design:** The database schema and application architecture are designed from the ground up to support a wide variety of media types.
*   **User-Centric Metadata:** The user has full control over their metadata, with powerful tools for manual editing and automatic fetching from multiple online sources.
*   **Modern Native UI:** The application is built with the latest Android technologies (Kotlin, Jetpack Compose, Material You).
*   **Open Source:** The project is developed as a Free and Open Source Software (FOSS) project.

---

## 2.1. Current Status

The project is currently in the early stages of development. The following features are implemented:

*   **Core Database Layer:** A robust database layer built with **Room** to manage libraries, media items, and metadata.
*   **Calibre Import:** A service to import book libraries from an existing Calibre `metadata.db` file.
*   **Basic UI:** A simple user interface built with **Jetpack Compose** that allows users to view their libraries and the books within them.
*   **Dependency Injection:** Using **Hilt** for dependency management.

---

## 2.2. Getting Started (Developers)

### Prerequisites

*   Android Studio (latest version recommended)
*   Java Development Kit (JDK) 17 or higher

### Building the Project

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Kaleaon/CleverFerret.git
    ```
2.  **Open the project in Android Studio.**
3.  **Build the project:**
    *   Use the "Build" menu in Android Studio (Build > Make Project).
    *   Or run the following command in the terminal:
        ```bash
        ./gradlew clean assembleDebug
        ```
4.  **Run the application on an emulator or a physical device.**

### Code Quality and Formatting

The project uses **Spotless** with **ktlint** for code formatting and style enforcement.

**Run formatting checks:**
```bash
./gradlew spotlessCheck
```

**Auto-format code:**
```bash
./gradlew spotlessApply
```

**Run Android Lint:**
```bash
./gradlew lint
```

**Note:** Spotless checks will fail the build if code is not properly formatted. Always run `spotlessApply` before committing code.

### Project Structure

The project is organized into the following main packages:

*   `com.universalmedialibrary.data.local`: Contains all data-related classes for the Room database, including entities, DAOs, and the database definition.
*   `com.universalmedialibrary.di`: Contains the Hilt dependency injection modules.
*   `com.universalmedialibrary.services`: Contains services for background tasks, such as the Calibre import service.
*   `com.universalmedialibrary.ui`: Contains the Jetpack Compose UI code and ViewModels.

---

## 3. Architecture

The project follows a standard Android architecture pattern with a UI layer, a data layer, and a service layer.

### 3.1. Database Layer

The database is built using the **Room Persistence Library**, which provides an abstraction layer over SQLite. This allows for compile-time query validation, easier migrations, and less boilerplate code. The database schema is designed to be extensible to support a wide variety of media types.

### 3.2. Architectural Concerns

During a recent code audit, a significant architectural issue was identified: the presence of two parallel database implementations.
*   A modern Room-based implementation in `com.universalmedialibrary.data.local`.
*   An older, manual `SQLiteOpenHelper`-based implementation in `com.universalmedialibrary.data`.

**It is strongly recommended to consolidate the codebase to use only the Room implementation.** The older implementation should be removed to avoid confusion and potential bugs. For a detailed breakdown of this and other issues, please see the [**BUGS_AND_ISSUES.md**](BUGS_AND_ISSUES.md) file.

---

## 4. Features

### 4.1. Implemented Features
*   **Library Management:** Users can create libraries to organize their media.
*   **Calibre Import:** A robust import feature that allows users to import their existing book library from a Calibre `metadata.db` file. The import runs as a foreground service to handle large libraries without being killed by the OS.
*   **Basic UI:** A functional UI built with Jetpack Compose that allows users to view their libraries and the books within them.

### 4.2. Planned Features
The `README.md` previously contained a large section of planned features and architecture. While the high-level vision remains, the detailed plans are outdated. The following is a summary of the intended direction:

*   **Expanded Media Support:** Add full support for movies, music, comics, and podcasts.
*   **Advanced Metadata:** Implement automatic metadata fetching from online sources (e.g., TMDB, MusicBrainz) and tools for manual editing.
*   **In-App Readers/Players:** Integrate media viewers and players (e.g., `epubj4`, `ExoPlayer`) for a seamless experience.
*   **Content Creation:** Features to download and format content from external sources (e.g., news, fanfiction) into epub files.

For more detailed planning, please refer to the project's issue tracker.

---

## 5. Documentation & Planning

*   **[BUGS_AND_ISSUES.md](BUGS_AND_ISSUES.md)**: A summary of identified bugs, architectural concerns, and potential improvements.
*   **[PROJECT_ROADMAP.md](PROJECT_ROADMAP.md)**: For development status and issue tracking.
*   **[docs/README.md](docs/README.md)**: Complete documentation index.
*   **[issues/](issues/)**: Structured development issues.

---

## 6. Current Build Status

**BUILD STATUS**: 🚨 **Failing** - As noted in the architectural concerns, the project has critical dependency and compilation issues that need resolution before development can continue. See [PROJECT_ROADMAP.md](PROJECT_ROADMAP.md#-known-issues) for details.
![CodeRabbit Pull Request Reviews](https://img.shields.io/coderabbit/prs/github/Kaleaon/CleverFerret?utm_source=oss&utm_medium=github&utm_campaign=Kaleaon%2FCleverFerret&labelColor=171717&color=FF570A&link=https%3A%2F%2Fcoderabbit.ai&label=CodeRabbit+Reviews)