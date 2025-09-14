# Vibration Fixed

A fixed and improved Flutter plugin for handling Vibration API on iOS, Android, web and OpenHarmony.

[![pub package](https://img.shields.io/pub/v/vibration_fixed.svg)](https://pub.dev/packages/vibration_fixed)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

- ✅ **Cross-platform support**: iOS, Android, Web, and OpenHarmony
- ✅ **Simple API**: Easy-to-use vibration methods
- ✅ **Custom patterns**: Support for custom vibration patterns and intensities
- ✅ **Amplitude control**: Control vibration strength (Android)
- ✅ **Haptic feedback**: iOS haptic feedback support
- ✅ **Preset patterns**: Pre-defined vibration patterns for common use cases
- ✅ **Device capability detection**: Check if device supports vibration features
- ✅ **Fixed issues**: Resolves common problems from the original vibration plugin

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  vibration_fixed: ^3.1.4
```

### Platform-specific setup

#### Android

Add the following permission to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.VIBRATE" />
```

#### iOS

No additional setup required. The plugin uses the native iOS haptic feedback system.

#### Web

No additional setup required. The plugin uses the Web Vibration API.

## Usage

### Basic Vibration

```dart
import 'package:vibration_fixed/vibration_fixed.dart';

// Simple vibration
await Vibration.vibrate();

// Vibration with custom duration
await Vibration.vibrate(duration: 1000);

// Check if device has vibrator
if (await Vibration.hasVibrator()) {
  await Vibration.vibrate();
}
```

### Advanced Vibration

```dart
// Vibration with amplitude control (Android)
if (await Vibration.hasAmplitudeControl()) {
  await Vibration.vibrate(
    duration: 1000,
    amplitude: 128, // 1-255
  );
}

// Custom vibration pattern
await Vibration.vibrate(
  pattern: [0, 500, 200, 500], // [delay, vibrate, delay, vibrate]
  repeat: 1, // repeat once
);

// Vibration with intensities (iOS)
await Vibration.vibrate(
  pattern: [0, 500, 200, 500],
  intensities: [0, 1.0, 0, 0.5], // 0.0 to 1.0
);
```

### Preset Patterns

```dart
// Use predefined patterns
await Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
await Vibration.vibrate(preset: VibrationPreset.lightImpact);
await Vibration.vibrate(preset: VibrationPreset.mediumImpact);
await Vibration.vibrate(preset: VibrationPreset.heavyImpact);
```

### Cancel Vibration

```dart
// Start a long vibration
await Vibration.vibrate(duration: 10000);

// Cancel it
await Vibration.cancel();
```

## API Reference

### Vibration Class

#### Static Methods

- `Future<bool> hasVibrator()` - Check if device has vibrator
- `Future<bool> hasAmplitudeControl()` - Check if device supports amplitude control
- `Future<bool> hasCustomVibrationsSupport()` - Check if device supports custom vibrations
- `Future<void> vibrate({...})` - Vibrate with specified parameters
- `Future<void> cancel()` - Cancel ongoing vibration

#### Vibration Parameters

- `int duration` - Vibration duration in milliseconds (default: 500)
- `List<int> pattern` - Custom vibration pattern
- `int repeat` - Number of times to repeat pattern (-1 for infinite)
- `List<int> intensities` - Intensity values for pattern (iOS)
- `int amplitude` - Vibration amplitude 1-255 (Android)
- `double sharpness` - Vibration sharpness 0.0-1.0 (iOS)
- `VibrationPreset? preset` - Use predefined pattern

### VibrationPreset Enum

- `VibrationPreset.quickSuccessAlert`
- `VibrationPreset.lightImpact`
- `VibrationPreset.mediumImpact`
- `VibrationPreset.heavyImpact`
- `VibrationPreset.selectionClick`
- `VibrationPreset.notificationSuccess`
- `VibrationPreset.notificationWarning`
- `VibrationPreset.notificationError`

## Platform Support

| Platform | Basic Vibration | Amplitude Control | Custom Patterns | Haptic Feedback |
|----------|----------------|-------------------|-----------------|-----------------|
| Android  | ✅             | ✅                | ✅              | ❌              |
| iOS      | ✅             | ❌                | ✅              | ✅              |
| Web      | ✅             | ❌                | ❌              | ❌              |
| OpenHarmony | ✅          | ✅                | ✅              | ❌              |

## What's Fixed

This package addresses several issues found in the original vibration plugin:

1. **Improved error handling** - Better exception handling and fallbacks
2. **Enhanced iOS support** - Better haptic feedback integration
3. **Web compatibility** - Improved web vibration API usage
4. **Android optimization** - Better vibrator management
5. **Documentation** - Comprehensive documentation and examples
6. **Package naming** - Clear, descriptive package names
7. **Dependency updates** - Updated to latest compatible versions

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Original vibration plugin by [Benjamin Dean](https://github.com/benjamindean/flutter_vibration)
- Flutter team for the excellent platform
- Community contributors and testers

## Support

If you encounter any issues or have questions, please:

1. Check the [Issues](https://github.com/boughdiri-dorsaf/vibration_fixed/issues) page
2. Create a new issue with detailed information
3. Contact the maintainer at boughdiri.dorsaf@gmail.com

---

Made with ❤️ by [Boughdiri Dorsaf](https://github.com/boughdiri-dorsaf)