# Setup Guide for Learn App

This guide will help you set up the Learn app on your local machine with the correct Flutter version.

## Prerequisites

- Git installed on your machine
- A code editor (VS Code, Android Studio, or IntelliJ IDEA recommended)
- Android Studio (for Android development) or Xcode (for iOS development on macOS)

## Flutter Version Requirements

This project is built with:
- **Flutter 3.19.0**
- **Dart 3.3.0**

Using a different version may cause compatibility issues. We strongly recommend using the exact version specified above.

## Setup Methods

### Method 1: Using FVM (Recommended) ⭐

FVM (Flutter Version Management) is the easiest way to manage multiple Flutter versions.

#### Step 1: Install FVM

**macOS/Linux:**
```bash
brew tap leoafarias/fvm
brew install fvm
```

**Windows (using Chocolatey):**
```bash
choco install fvm
```

**Using Dart pub (all platforms):**
```bash
dart pub global activate fvm
```

#### Step 2: Clone and Setup Project

```bash
# Clone the repository
git clone https://github.com/VaibhavCodeClub/learn
cd learn

# Install Flutter 3.19.0
fvm install 3.19.0

# Use Flutter 3.19.0 for this project
fvm use 3.19.0

# Install dependencies
fvm flutter pub get
```

#### Step 3: Run the App

```bash
# Run on connected device
fvm flutter run

# Or run on specific device
fvm flutter devices
fvm flutter run -d <device-id>
```

#### IDE Configuration with FVM

**VS Code:**
1. Install the "FVM" extension
2. The extension will automatically detect the FVM configuration
3. Select the FVM Flutter SDK when prompted

**Android Studio/IntelliJ:**
1. Go to Settings/Preferences → Languages & Frameworks → Flutter
2. Set Flutter SDK path to: `<project-root>/.fvm/flutter_sdk`

### Method 2: Manual Flutter Installation

If you prefer not to use FVM:

#### Step 1: Download Flutter 3.19.0

1. Visit the [Flutter SDK Archive](https://docs.flutter.dev/release/archive)
2. Download Flutter 3.19.0 for your operating system
3. Extract the archive to a location on your machine

#### Step 2: Set Up Flutter Path

**macOS/Linux:**
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

Add this to your `.bashrc`, `.zshrc`, or `.bash_profile` to make it permanent.

**Windows:**
1. Add the Flutter bin directory to your PATH environment variable
2. Restart your terminal/command prompt

#### Step 3: Verify Installation

```bash
flutter --version
```

You should see:
```
Flutter 3.19.0 • channel stable
Framework • revision bae5e49bc2
Engine • revision 04817c99c9
Tools • Dart 3.3.0 • DevTools 2.31.1
```

#### Step 4: Clone and Run

```bash
# Clone the repository
git clone https://github.com/VaibhavCodeClub/learn
cd learn

# Install dependencies
flutter pub get

# Run the app
flutter run
```

## Common Issues and Solutions

### Issue: "Flutter version mismatch"

**Solution:** Make sure you're using Flutter 3.19.0. Check with:
```bash
flutter --version
```

If using FVM:
```bash
fvm flutter --version
```

### Issue: "Gradle build failed" (Android)

**Solution:** 
1. Make sure you have Android Studio installed
2. Accept Android licenses:
```bash
flutter doctor --android-licenses
```

### Issue: "CocoaPods not installed" (iOS)

**Solution:**
```bash
sudo gem install cocoapods
cd ios
pod install
cd ..
```

### Issue: "Dependencies conflict"

**Solution:**
```bash
# Clean the project
flutter clean

# Remove pubspec.lock
rm pubspec.lock

# Get dependencies again
flutter pub get
```

## Verifying Your Setup

Run Flutter doctor to check your setup:
```bash
flutter doctor -v
```

All checks should pass (✓) except for platforms you're not targeting (e.g., iOS on Windows).

## Building the App

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle
```bash
flutter build appbundle --release
```

### iOS (macOS only)
```bash
flutter build ios --release
```

## Development Tips

1. **Hot Reload:** Press `r` in the terminal while the app is running
2. **Hot Restart:** Press `R` in the terminal
3. **Quit:** Press `q` in the terminal

## Need Help?

If you encounter any issues:
1. Check the [Flutter documentation](https://docs.flutter.dev/)
2. Visit our [Issues page](https://github.com/VaibhavCodeClub/learn/issues)
3. Create a new issue with details about your problem

## Contributing

Once you have the app running, check out our [Contributing Guidelines](CONTRIBUTING.md) to start contributing!

---

Happy coding! 🚀
