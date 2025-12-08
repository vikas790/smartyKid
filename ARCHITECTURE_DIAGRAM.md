# SmartyKids - MVVM + Bloc Architecture Diagram

## 📊 Architecture Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                         USER INTERACTION                         │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    VIEW LAYER (UI Only)                          │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  BaseWidget (Stateful)                                    │   │
│  │  ├── BlocProvider<Cubit>                                 │   │
│  │  └── BlocBuilder<Cubit, State>                           │   │
│  │      └── Scaffold / UI Widgets                           │   │
│  │          └── Calls: cubit.method()                       │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                   │
│  Examples:                                                        │
│  • ui/entry/splash_screen/view/splash_screen.dart                │
│  • ui/age_section/view/age_screen.dart                           │
│  • ui/subject_section/view/subject_screen.dart                   │
│  • ui/subject_section/view/english_screen.dart                   │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                  VIEWMODEL LAYER (Logic Only)                    │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  BaseCubit<ApiRenderState>                               │   │
│  │  ├── Business Logic Methods                              │   │
│  │  ├── emit(State) → Updates UI                            │   │
│  │  ├── navigation.push/go()                                │   │
│  │  ├── storage.get/set()                                   │   │
│  │  └── API calls / Data operations                         │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                   │
│  Examples:                                                        │
│  • ui/entry/splash_screen/view_model/splash_cubit.dart           │
│  • ui/age_section/view_model/age_cubit.dart                      │
│  • ui/subject_section/view_model/subject_cubit.dart              │
│  • ui/subject_section/view_model/english_cubit.dart              │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    STATE LAYER (Data Only)                       │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  ApiRenderState (Base)                                   │   │
│  │  ├── Ideal                                               │   │
│  │  ├── LoadingState                                        │   │
│  │  ├── ApiSuccess<T>                                       │   │
│  │  ├── ApiFailure                                          │   │
│  │  └── Custom States (e.g., AgeSelectedState)             │   │
│  └──────────────────────────────────────────────────────────┘   │
│                                                                   │
│  Examples:                                                        │
│  • ui/entry/splash_screen/view_model/splash_state.dart           │
│  • ui/age_section/view_model/age_state.dart                      │
│  • ui/subject_section/view_model/subject_state.dart              │
│  • ui/subject_section/view_model/english_state.dart              │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      SERVICES LAYER                              │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │  Dependency Injection (GetIt)                            │   │
│  │  ├── NavigationService → Routing                        │   │
│  │  ├── StorageService → Local Data                        │   │
│  │  ├── ToastService → Messages                            │   │
│  │  └── ApiService → Network Calls                         │   │
│  └──────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

## 🔄 Data Flow Example: Age Selection

```
1. USER TAPS AGE BUTTON
   │
   ▼
2. VIEW (age_screen.dart)
   │ onTap: () => _ageCubit.selectAge(context, age)
   │
   ▼
3. CUBIT (age_cubit.dart)
   │ void selectAge(BuildContext context, int age) {
   │   emit(AgeSelectedState(age));        ← Updates State
   │   navigation.push(Routes.subjectScreen, extra: age);
   │ }
   │
   ▼
4. STATE (age_state.dart)
   │ class AgeSelectedState extends AgeState {
   │   final int age;
   │ }
   │
   ▼
5. BLOC BUILDER REBUILDS
   │ BlocBuilder listens to state changes
   │ UI automatically updates
   │
   ▼
6. NAVIGATION SERVICE
   │ Routes to SubjectScreen with age parameter
```

## 📁 Feature Module Structure

```
feature_name/
├── view/                          ← UI LAYER
│   ├── screen_one.dart           ← Extends BaseWidget
│   ├── screen_two.dart           ← Uses BlocProvider
│   └── screen_three.dart         ← Uses BlocBuilder
│
└── view_model/                    ← LOGIC + STATE LAYER
    ├── feature_cubit.dart        ← Extends BaseCubit<ApiRenderState>
    ├── feature_state.dart        ← Extends ApiRenderState
    ├── screen_one_cubit.dart     ← Business logic
    ├── screen_one_state.dart     ← State definitions
    ├── screen_two_cubit.dart
    └── screen_two_state.dart
```

## 🎯 Separation of Concerns

```
┌────────────────────┬────────────────────┬────────────────────┐
│       VIEW         │      CUBIT         │       STATE        │
├────────────────────┼────────────────────┼────────────────────┤
│ • UI Widgets       │ • Business Logic   │ • Data Classes     │
│ • Layout           │ • Navigation       │ • Immutable        │
│ • Styling          │ • API Calls        │ • State Types      │
│ • Animations       │ • Data Processing  │ • No Logic         │
│ • User Input       │ • State Emission   │                    │
│ • BlocBuilder      │ • Service Calls    │                    │
│                    │                    │                    │
│ NO LOGIC HERE!     │ NO UI HERE!        │ NO LOGIC/UI HERE!  │
└────────────────────┴────────────────────┴────────────────────┘
```

## 🔧 Base Classes Hierarchy

```
BaseWidget (StatefulWidget)
├── Mixins: CommonDi, TextStyles
├── Provides: navigation, storage, toast
└── Used by: All Screen Widgets

BaseCubit<T extends ApiRenderState> (Cubit<T>)
├── Mixins: TextStyles
├── Provides: navigation, storage, toast, error handling
├── Methods: showError(), showSuccess()
└── Used by: All Feature Cubits

ApiRenderState (Abstract)
├── Ideal
├── LoadingState
├── ApiSuccess<T>
├── ApiFailure
├── OnChangeState<T>
├── SuccessToast<T>
├── ErrorToast<T>
└── Custom Feature States
```

## 🚀 Complete App Flow

```
main.dart
  │
  ├── Locator.registerDi()        ← Register services
  │   ├── NavigationService
  │   ├── StorageService
  │   ├── ToastService
  │   └── ApiService
  │
  ├── Hive.init()                 ← Initialize storage
  │
  └── MaterialApp.router
      │
      └── GoRouter
          │
          ├── /splashScreen → SplashScreen
          │   └── SplashCubit.initSplash()
          │       └── navigation.go(Routes.ageScreen)
          │
          ├── /ageScreen → AgeScreen
          │   └── AgeCubit.selectAge(age)
          │       └── navigation.push(Routes.subjectScreen)
          │
          ├── /subjectScreen → SubjectScreen
          │   └── SubjectCubit.navigateToSubject(name)
          │       └── navigation.push(Routes.englishScreen)
          │
          ├── /englishScreen → EnglishScreen
          │   └── EnglishCubit.playLetterSound(letter)
          │       └── emit(EnglishSoundPlaying(letter))
          │
          ├── /mathScreen → MathScreen
          └── /scienceScreen → ScienceScreen
```

## 📦 Dependency Graph

```
┌─────────────────────────────────────────────────────────────┐
│                         main.dart                            │
└─────────────────────────────────────────────────────────────┘
                              │
                ┌─────────────┼─────────────┐
                ▼             ▼             ▼
         ┌───────────┐  ┌──────────┐  ┌──────────┐
         │  Locator  │  │  Router  │  │   Hive   │
         └───────────┘  └──────────┘  └──────────┘
                │
        ┌───────┼───────┬───────┬───────┐
        ▼       ▼       ▼       ▼       ▼
    ┌────┐  ┌────┐  ┌────┐  ┌────┐  ┌────┐
    │Nav │  │Stor│  │Toast│ │ API│  │etc │
    └────┘  └────┘  └────┘  └────┘  └────┘
        │       │       │       │       │
        └───────┴───────┴───────┴───────┘
                        │
                        ▼
                ┌──────────────┐
                │  BaseCubit   │
                └──────────────┘
                        │
        ┌───────────────┼───────────────┐
        ▼               ▼               ▼
   ┌────────┐      ┌────────┐      ┌────────┐
   │AgeCubit│      │SubjCub │      │EngCubit│
   └────────┘      └────────┘      └────────┘
        │               │               │
        ▼               ▼               ▼
   ┌────────┐      ┌────────┐      ┌────────┐
   │AgeView │      │SubjView│      │EngView │
   └────────┘      └────────┘      └────────┘
```

---

**This architecture ensures:**
- ✅ Clear separation of concerns
- ✅ Testable code (cubits can be tested independently)
- ✅ Scalable structure (easy to add new features)
- ✅ Maintainable codebase (consistent patterns)
- ✅ Reactive UI (automatic updates via BlocBuilder)
