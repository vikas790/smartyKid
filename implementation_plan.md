# Implementation Plan - MVVM with Cubit (User's Style)

Refactoring the SmartyKids app to match the user's provided sample architecture.

## Architecture Pattern
- **Base Classes**: `BaseWidget`, `BaseCubit`, `ApiRenderState`.
- **Folder Structure**:
    ```
    lib/
      core/
        base/
          api_render_state.dart
          base_cubit.dart
          base_widget.dart
      view/
        age_section/
          view/
            age_screen.dart
          view_model/
            age_cubit.dart
            age_state.dart
        subject_section/
          view/
            subject_screen.dart
            english_screen.dart
          view_model/
            subject_cubit.dart
            subject_state.dart
            english_cubit.dart
            english_state.dart
    ```

## Implementation Steps

1.  **Core Setup**: Ensure `BaseWidget`, `BaseCubit`, `ApiRenderState` are correctly implemented (already started).
2.  **Age Feature**:
    -   Create `AgeCubit` extending `BaseCubit`.
    -   Create `AgeState` extending `ApiRenderState`.
    -   Refactor `AgeScreen` to extend `BaseWidget` and use `BlocProvider`/`BlocBuilder` with `AgeCubit`.
3.  **Subject Feature**:
    -   Create `SubjectCubit` to manage subject selection logic.
    -   Refactor `SubjectScreen`.
4.  **English Feature**:
    -   Create `EnglishCubit` to manage audio playing.
    -   Refactor `EnglishScreen`.

## Verification
-   Check if folder structure matches the request.
-   Verify `BlocBuilder` and `BlocProvider` usage matches the sample.
-   Ensure `BaseWidget` usage.
