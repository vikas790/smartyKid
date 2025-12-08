# Flutter 3.29.2 SDK Bug Fix Script
# This script automatically fixes the missing imports in sliver.dart

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Flutter 3.29.2 SDK Bug Fix Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$flutterSdkPath = "E:\Flutter Setup\flutter_windows_3.29.2-stable\flutter\packages\flutter\lib\src\rendering\sliver.dart"

# Check if file exists
if (-not (Test-Path $flutterSdkPath)) {
    Write-Host "ERROR: Flutter SDK file not found at:" -ForegroundColor Red
    Write-Host $flutterSdkPath -ForegroundColor Red
    Write-Host ""
    Write-Host "Please update the path in this script to match your Flutter installation." -ForegroundColor Yellow
    pause
    exit 1
}

Write-Host "Found Flutter SDK file at:" -ForegroundColor Green
Write-Host $flutterSdkPath -ForegroundColor Gray
Write-Host ""

# Create backup
$backupPath = $flutterSdkPath + ".backup"
Write-Host "Creating backup..." -ForegroundColor Yellow
Copy-Item $flutterSdkPath $backupPath -Force
Write-Host "Backup created at: $backupPath" -ForegroundColor Green
Write-Host ""

# Read the file
Write-Host "Reading file..." -ForegroundColor Yellow
$content = Get-Content $flutterSdkPath -Raw

# Check if already fixed
if ($content -match "import 'dart:ui' show Offset, Rect, clampDouble;") {
    Write-Host "File is already fixed! No changes needed." -ForegroundColor Green
    Write-Host ""
    pause
    exit 0
}

# Add the missing import
Write-Host "Adding missing import..." -ForegroundColor Yellow
$importLine = "import 'dart:ui' show Offset, Rect, clampDouble;"

# Find the position to insert (after other dart imports)
if ($content -match "import 'dart:math' as math;") {
    $content = $content -replace "(import 'dart:math' as math;)", "`$1`r`n$importLine"
} elseif ($content -match "import 'dart:collection';") {
    $content = $content -replace "(import 'dart:collection';)", "`$1`r`n$importLine"
} else {
    # Insert at the beginning
    $content = $importLine + "`r`n" + $content
}

# Write the fixed content
Write-Host "Writing fixed content..." -ForegroundColor Yellow
try {
    Set-Content $flutterSdkPath -Value $content -Force
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "SUCCESS! Flutter SDK has been fixed!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Run: flutter clean" -ForegroundColor White
    Write-Host "2. Run: flutter pub get" -ForegroundColor White
    Write-Host "3. Run: flutter run" -ForegroundColor White
    Write-Host ""
} catch {
    Write-Host ""
    Write-Host "ERROR: Could not write to file. You may need to:" -ForegroundColor Red
    Write-Host "1. Run this script as Administrator" -ForegroundColor Yellow
    Write-Host "2. Or manually edit the file (see HOW_TO_FIX_FLUTTER_SDK.md)" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Error details: $_" -ForegroundColor Red
    Write-Host ""
    pause
    exit 1
}

Write-Host "Press any key to run 'flutter clean' and 'flutter pub get'..." -ForegroundColor Cyan
pause

# Navigate to project and clean
Set-Location "e:\Self Startup Projects\Flutter Project\Source Code\SmartyKids"
Write-Host ""
Write-Host "Running flutter clean..." -ForegroundColor Yellow
flutter clean

Write-Host ""
Write-Host "Running flutter pub get..." -ForegroundColor Yellow
flutter pub get

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "All done! You can now run your app with:" -ForegroundColor Green
Write-Host "flutter run" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
pause
