# 📁 Assets Organization Guide

## Current Assets Structure

```
assets/
├── animations/                    # Lottie animation files
│   └── splashscreen.json         # Splash screen animation
│
├── icons/                         # Subject icons
│   ├── english.png               # English subject icon
│   ├── math.png                  # Math subject icon
│   └── science.png               # Science subject icon
│
├── sounds/                        # Audio files
│   └── (empty - ready for letter sounds, music, effects)
│
├── drawables/
│   ├── icons/                    # App icons and UI icons (88 files)
│   └── images/                   # Images and illustrations
│
├── fonts/                         # Custom fonts
│   ├── inter_tight/              # Inter Tight font family
│   ├── poppins/                  # Poppins font family
│   ├── sacramento/               # Sacramento font family
│   ├── jost/                     # Jost font family
│   └── comic_neue/               # Comic Neue font family (if exists)
│
├── language/                      # Localization files
│
└── country_dial_info.json        # Country/dial code data

```

## 📋 Assets in pubspec.yaml

### ✅ Properly Configured Assets:

```yaml
assets:
  # Animations (Lottie files)
  - assets/animations/
  
  # Icons (Subject icons)
  - assets/icons/
  
  # Sounds (Letter pronunciation, music, effects)
  - assets/sounds/
  
  # Drawable resources
  - assets/drawables/icons/
  - assets/drawables/images/
  
  # Language/Country data
  - assets/language/
  - assets/country_dial_info.json
```

## 🎨 How to Use Assets in Code

### 1. **Lottie Animations**
```dart
import 'package:lottie/lottie.dart';

// In your widget:
Lottie.asset('assets/animations/splashscreen.json', width: 200)
```

### 2. **Images/Icons**
```dart
// PNG/JPG images
Image.asset('assets/icons/english.png', width: 32, height: 32)

// From drawables
Image.asset('assets/drawables/icons/icon_name.png')
Image.asset('assets/drawables/images/image_name.png')
```

### 3. **SVG Images** (if you add SVGs)
```dart
import 'package:flutter_svg/flutter_svg.dart';

SvgPicture.asset('assets/icons/icon_name.svg', width: 24, height: 24)
```

### 4. **Audio Files** (when you add sounds)
```dart
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer();
await player.play(AssetSource('sounds/letter_a.mp3'));
```

### 5. **JSON Data**
```dart
import 'package:flutter/services.dart';
import 'dart:convert';

// Load JSON
final String jsonString = await rootBundle.loadString('assets/country_dial_info.json');
final data = json.decode(jsonString);
```

### 6. **Fonts** (Already configured in pubspec.yaml)
```dart
Text(
  'Hello',
  style: TextStyle(
    fontFamily: 'Inter Tight',
    fontWeight: FontWeight.w600,
  ),
)

// Available fonts:
// - Inter Tight (weights: 300, 400, 500, 600, 700, 800)
// - Poppins (weights: 300, 400, 500, 600, 700, 800)
// - Sacramento (weight: 400)
// - Jost (weights: 400, 600, 700)
// - ComicNeue (weights: 400, 700)
```

## 📝 Adding New Assets

### To Add New Images:
1. Place file in appropriate folder:
   - Subject icons → `assets/icons/`
   - UI icons → `assets/drawables/icons/`
   - Images → `assets/drawables/images/`

2. No need to update `pubspec.yaml` (folders are already included)

3. Use in code:
   ```dart
   Image.asset('assets/icons/your_new_icon.png')
   ```

### To Add New Sounds:
1. Place audio files in `assets/sounds/`
   - Recommended formats: MP3, WAV
   - Example: `A.mp3`, `B.mp3`, etc. for letter sounds

2. No need to update `pubspec.yaml` (folder already included)

3. Use in code:
   ```dart
   await player.play(AssetSource('sounds/A.mp3'));
   ```

### To Add New Animations:
1. Place Lottie JSON files in `assets/animations/`

2. No need to update `pubspec.yaml` (folder already included)

3. Use in code:
   ```dart
   Lottie.asset('assets/animations/your_animation.json')
   ```

## 🎯 Recommended Assets to Add

### For English Learning Screen:
```
assets/sounds/
├── A.mp3
├── B.mp3
├── C.mp3
...
└── Z.mp3
```

### For Math Learning Screen:
```
assets/sounds/
├── number_1.mp3
├── number_2.mp3
...
└── number_10.mp3

assets/animations/
├── counting.json
└── addition.json
```

### For Science Learning Screen:
```
assets/drawables/images/
├── animals/
├── plants/
└── space/

assets/sounds/
├── animal_sounds/
└── nature_sounds/
```

## ✅ Asset Optimization Tips

1. **Image Sizes**:
   - Icons: 24x24, 48x48, 96x96 (use appropriate size)
   - Images: Optimize for mobile (max 1024x1024 for most cases)

2. **Audio Files**:
   - Use MP3 for smaller file sizes
   - Bitrate: 128kbps is usually sufficient for voice
   - Keep files short (< 5 seconds for letter sounds)

3. **Lottie Animations**:
   - Keep file size < 100KB when possible
   - Use simple animations for better performance

4. **Fonts**:
   - Only include weights you actually use
   - Consider using variable fonts if available

## 🔧 Troubleshooting

### Asset Not Found Error:
```
Unable to load asset: assets/...
```

**Solutions**:
1. Run `flutter clean && flutter pub get`
2. Check file path spelling (case-sensitive!)
3. Verify file exists in the folder
4. Restart your IDE/editor

### Image Not Showing:
1. Check if asset path is correct
2. Verify `pubspec.yaml` has the folder listed
3. Run `flutter pub get`
4. Hot restart (not just hot reload)

## 📦 Current Dependencies for Assets

- ✅ `lottie: ^2.6.0` - For Lottie animations
- ✅ `flutter_svg: ^2.2.2` - For SVG images
- ✅ `cached_network_image: ^3.4.1` - For network images with caching
- ⚠️ `audioplayers` - **NOT INCLUDED** (add if you need audio)

### To Add Audio Support:
```yaml
dependencies:
  audioplayers: ^5.2.1
```

Then run:
```bash
flutter pub get
```

---

## 🎉 Summary

✅ **All asset folders properly configured in `pubspec.yaml`**
✅ **Organized structure for easy management**
✅ **Ready to add new assets without updating pubspec**
✅ **Clear guidelines for usage in code**

Your assets are now properly organized and ready to use! 🚀
