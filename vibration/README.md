# Vibration Fixed Plugin

A fixed and improved Flutter plugin for handling Vibration API on iOS, Android, web and OpenHarmony.

## Features

- Cross-platform vibration support
- Custom vibration patterns
- Amplitude control (Android)
- Haptic feedback (iOS)
- Preset vibration patterns
- Device capability detection

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  vibration_fixed: ^3.1.4
```

## Usage

```dart
import 'package:vibration_fixed/vibration_fixed.dart';

// Basic vibration
await Vibration.vibrate();

// Custom duration
await Vibration.vibrate(duration: 1000);

// Check device support
if (await Vibration.hasVibrator()) {
  await Vibration.vibrate();
}
```

## API

### Methods

- `hasVibrator()` - Check if device has vibrator
- `hasAmplitudeControl()` - Check amplitude support
- `hasCustomVibrationsSupport()` - Check custom vibration support
- `vibrate({...})` - Vibrate with parameters
- `cancel()` - Cancel ongoing vibration

### Parameters

- `duration` - Vibration duration (ms)
- `pattern` - Custom pattern array
- `repeat` - Pattern repeat count
- `intensities` - Intensity values (iOS)
- `amplitude` - Amplitude 1-255 (Android)
- `sharpness` - Sharpness 0.0-1.0 (iOS)
- `preset` - Predefined pattern

## Platform Support

| Platform | Basic | Amplitude | Patterns | Haptic |
|----------|-------|-----------|----------|--------|
| Android  | ✅    | ✅        | ✅       | ❌     |
| iOS      | ✅    | ❌        | ✅       | ✅     |
| Web      | ✅    | ❌        | ❌       | ❌     |

## License

MIT License - see LICENSE file for details.