# SmartyKids Architecture

## Overview
The SmartyKids application follows a **MVVM (Model-View-ViewModel)** architecture pattern combined with **Bloc (Cubit)** for state management. This ensures a clean separation of concerns, testability, and scalability.

## Core Principles
1.  **Separation of Concerns**: UI logic is separated from business logic.
2.  **Unidirectional Data Flow**: State flows down from Cubits to Widgets; Events flow up from Widgets to Cubits.
3.  **Dependency Injection**: `GetIt` is used for service location and dependency injection.

## Folder Structure
The project is organized by feature (vertical slicing) with a core layer for shared functionality.

```
lib/
├── core/                   # Core functionality shared across the app
│   ├── base/               # Base classes (BaseWidget, BaseCubit, ApiRenderState)
│   ├── themes/             # Theme definitions (Colors, Fonts, TextStyles)
│   └── utils/              # Utility classes (ScreenUtil, Constants)
├── data/                   # Data layer
│   ├── di/                 # Dependency Injection setup (Locator)
│   ├── models/             # Data models
│   └── storage/            # Local storage (Hive, SharedPrefs)
├── routing/                # Navigation configuration (GoRouter)
└── ui/                     # UI Layer organized by feature
    ├── entry/              # Entry features (Splash, Onboarding)
    │   └── splash_screen/
    │       ├── view/       # UI Widgets for Splash
    │       └── view_model/ # SplashCubit and SplashState
    ├── age_section/        # Age Selection Feature
    │   ├── view/
    │   └── view_model/
    └── subject_section/    # Subject Selection & Learning Features
        ├── english_subject/
        ├── math_subject/
        └── science_subject/
```

## State Management (Bloc/Cubit)
-   **Cubit**: Extends `BaseCubit<ApiRenderState>`. Handles business logic and emits states.
-   **State**: Extends `ApiRenderState`. Represents the UI state (Loading, Success, Error, Idle).
-   **UI**: Uses `BlocProvider` to provide the Cubit and `BlocBuilder` (or `BaseWidget`) to listen for state changes.

## Navigation
-   **GoRouter**: Used for declarative routing.
-   **NavigationService**: A wrapper around GoRouter to facilitate navigation from business logic if needed (though UI-driven navigation is preferred).

## Base Classes
-   **BaseWidget**: A `StatefulWidget` that provides common functionality like dependency injection and theme access.
-   **BaseCubit**: A generic `Cubit` that manages `ApiRenderState` and provides common methods for safe state emission.
-   **ApiRenderState**: A sealed class hierarchy for standard UI states (`Ideal`, `Loading`, `Success`, `Error`).
