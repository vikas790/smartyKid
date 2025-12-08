# SmartyKids - MVVM + Bloc Architecture Implementation

## ✅ Architecture Overview

The project now follows a clean **MVVM + Bloc** architecture with proper separation of concerns:

### Folder Structure
```
lib/
├── ui/                           # All UI-related code
│   ├── core/                     # Core UI components
│   │   ├── base/                 # Base classes for architecture
│   │   │   ├── api_render_state.dart    # State base classes
│   │   │   ├── base_cubit.dart          # Cubit base class
│   │   │   └── base_widget.dart         # Widget base class
│   │   ├── custom_widget/        # Reusable widgets
│   │   ├── localization/         # Localization
│   │   └── themes/               # Theme & styling
│   │
│   ├── entry/                    # Entry screens
│   │   └── splash_screen/
│   │       ├── view/
│   │       │   └── splash_screen.dart
│   │       └── view_model/
│   │           ├── splash_cubit.dart
│   │           └── splash_state.dart
│   │
│   ├── age_section/              # Age selection feature
│   │   ├── view/
│   │   │   └── age_screen.dart
│   │   └── view_model/
│   │       ├── age_cubit.dart
│   │       └── age_state.dart
│   │
│   └── subject_section/          # Subject selection & learning
│       ├── view/
│       │   ├── subject_screen.dart
│       │   ├── english_screen.dart
│       │   ├── math_screen.dart
│       │   └── science_screen.dart
│       └── view_model/
│           ├── subject_cubit.dart
│           ├── subject_state.dart
│           ├── english_cubit.dart
│           ├── english_state.dart
│           ├── math_cubit.dart
│           ├── math_state.dart
│           ├── science_cubit.dart
│           └── science_state.dart
│
├── data/                         # Data layer
│   ├── di/                       # Dependency Injection
│   │   ├── locator.dart
│   │   ├── common_di.dart
│   │   └── new_locator.dart
│   ├── services/                 # Services (API, local)
│   │   ├── api/
│   │   └── local/
│   └── storage/                  # Local storage
│
├── routing/                      # Navigation
│   └── navigation_services.dart
│
├── utils/                        # Utilities
└── main.dart                     # App entry point
```

## 🎯 Architecture Principles

### 1. **Base Classes**

#### ApiRenderState (State Base)
```dart
abstract class ApiRenderState {}
class Ideal extends ApiRenderState {}
class LoadingState extends ApiRenderState {}
class ApiSuccess<T> extends ApiRenderState { T data; }
class ApiFailure<T> extends ApiRenderState { String error; }
// ... other states
```

#### BaseCubit (Cubit Base)
```dart
class BaseCubit<T extends ApiRenderState> extends Cubit<T> with TextStyles {
  final storage = GetIt.I.get<StorageService>();
  final navigation = GetIt.I.get<NavigationService>();
  final _toast = GetIt.I.get<ToastService>();
  
  BaseCubit([T? initialState]) : super(initialState ?? (Ideal() as T));
  // ... error handling, toast methods
}
```

#### BaseWidget (Widget Base)
```dart
abstract class BaseWidget extends StatefulWidget with CommonDi, TextStyles {
  BaseWidget({super.key});
}
```

### 2. **Feature Structure Pattern**

Each feature follows this pattern:

#### View (UI Layer)
- Extends `BaseWidget`
- Uses `BlocProvider` to provide cubit
- Uses `BlocBuilder` to rebuild on state changes
- **Only contains UI code** - no business logic
- Calls cubit methods for actions

Example:
```dart
class AgeScreen extends BaseWidget {
  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final AgeCubit _ageCubit = AgeCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _ageCubit,
      child: BlocBuilder(
        bloc: _ageCubit,
        builder: (context, state) {
          // UI code here
          return Scaffold(...);
        },
      ),
    );
  }
}
```

#### ViewModel (Cubit Layer)
- Extends `BaseCubit<ApiRenderState>`
- Contains **all business logic**
- Emits states to update UI
- Handles navigation
- Manages data operations

Example:
```dart
class AgeCubit extends BaseCubit<ApiRenderState> {
  AgeCubit() : super(Ideal());

  void selectAge(BuildContext context, int age) {
    emit(AgeSelectedState(age));
    navigation.push(Routes.subjectScreen, extra: age);
  }
}
```

#### State Layer
- Extends `ApiRenderState`
- Defines all possible states for the feature
- Immutable data holders

Example:
```dart
class AgeState extends ApiRenderState {}
class AgeSelectedState extends AgeState {
  final int age;
  AgeSelectedState(this.age);
}
```

## 📋 Implemented Features

### ✅ 1. Splash Screen
- **View**: `splash_screen.dart`
- **Cubit**: `splash_cubit.dart` - Handles navigation delay
- **State**: `splash_state.dart`

### ✅ 2. Age Selection Screen
- **View**: `age_screen.dart` - Displays age options in grid
- **Cubit**: `age_cubit.dart` - Handles age selection & navigation
- **State**: `age_state.dart` - Tracks selected age

### ✅ 3. Subject Selection Screen
- **View**: `subject_screen.dart` - Shows English, Math, Science
- **Cubit**: `subject_cubit.dart` - Handles subject navigation
- **State**: `subject_state.dart`

### ✅ 4. English Learning Screen
- **View**: `english_screen.dart` - A-Z letter grid with animations
- **Cubit**: `english_cubit.dart` - Manages letter sound playback
- **State**: `english_state.dart` - Tracks playing letter

### ✅ 5. Math Screen (Placeholder)
- **View**: `math_screen.dart`
- **Cubit**: `math_cubit.dart`
- **State**: `math_state.dart`

### ✅ 6. Science Screen (Placeholder)
- **View**: `science_screen.dart`
- **Cubit**: `science_cubit.dart`
- **State**: `science_state.dart`

## 🔧 Key Components

### Dependency Injection
- **GetIt** for service locator
- Services registered in `Locator.registerDi()`
- Available services:
  - `NavigationService` - Routing
  - `StorageService` - Local storage
  - `ToastService` - Toast messages
  - `ApiService` - API calls

### Navigation
- **GoRouter** for declarative routing
- Routes defined in `navigation_services.dart`
- Type-safe navigation with `NavigationService`

### State Management
- **Bloc/Cubit** pattern
- Reactive UI updates via `BlocBuilder`
- Centralized state in cubits

## 🎨 UI Features
- Material Design
- Custom fonts (ComicNeue, Poppins, Inter Tight, etc.)
- Responsive layouts
- Animations (AnimatedContainer, Lottie)
- Theme support

## 📝 Best Practices Followed

1. ✅ **Separation of Concerns**: View, ViewModel, State clearly separated
2. ✅ **Single Responsibility**: Each class has one job
3. ✅ **Dependency Injection**: Services injected via GetIt
4. ✅ **Type Safety**: Generic types for states
5. ✅ **Relative Imports**: Used throughout for better maintainability
6. ✅ **Consistent Naming**: `*Screen`, `*Cubit`, `*State` conventions
7. ✅ **Folder Organization**: Feature-based structure

## 🚀 Next Steps

To extend the app:

1. **Add new feature**:
   - Create folder in `ui/` with `view/` and `view_model/` subfolders
   - Create screen in `view/`
   - Create cubit and state in `view_model/`
   - Add route in `navigation_services.dart`

2. **Add business logic**:
   - Always put logic in Cubit, not in View
   - Emit states to update UI
   - Use base cubit services (navigation, storage, toast)

3. **Add new state**:
   - Extend `ApiRenderState`
   - Define in feature's state file
   - Emit from cubit

## 📦 Dependencies Used

- `flutter_bloc` - State management
- `get_it` - Dependency injection
- `go_router` - Navigation
- `hive` - Local storage
- `lottie` - Animations
- `path_provider` - File paths

---

**Architecture Status**: ✅ Complete and properly structured
**All screens**: Following MVVM + Bloc pattern
**Code quality**: Clean, maintainable, scalable
