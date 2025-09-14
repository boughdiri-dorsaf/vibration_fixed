# 🔥 Vibration Fixed Plugin

<div align="center">

[![pub package](https://img.shields.io/pub/v/vibration_fixed.svg)](https://pub.dev/packages/vibration_fixed)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)

**A fixed and enhanced Flutter plugin for handling Vibration API across all platforms**

</div>

---

## ✨ Features

- 🎯 **Cross-platform support** - iOS, Android, Web, OpenHarmony
- 🎨 **Custom patterns** - Support for complex vibration patterns
- 📱 **Amplitude control** - Control vibration strength (Android)
- 🍎 **Haptic feedback** - iOS haptic feedback integration
- 🎵 **Preset patterns** - Pre-defined patterns for common use cases
- 🔍 **Device detection** - Check device vibration capabilities
- 🛡️ **Error handling** - Robust error handling and fallbacks

---

## 🚀 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  vibration_fixed: ^4.0.0
```

---

## 💡 Quick Usage

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

// Use presets
await Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
```

---

## 🔧 API Reference

### Methods

| Method | Description | Returns |
|--------|-------------|---------|
| `hasVibrator()` | Check if device has vibrator | `Future<bool>` |
| `hasAmplitudeControl()` | Check amplitude support | `Future<bool>` |
| `hasCustomVibrationsSupport()` | Check custom vibration support | `Future<bool>` |
| `vibrate({...})` | Vibrate with parameters | `Future<void>` |
| `cancel()` | Cancel ongoing vibration | `Future<void>` |

### Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `duration` | `int` | Vibration duration (ms) | `500` |
| `pattern` | `List<int>` | Custom pattern array | `[]` |
| `repeat` | `int` | Pattern repeat count | `-1` |
| `intensities` | `List<int>` | Intensity values (iOS) | `[]` |
| `amplitude` | `int` | Amplitude 1-255 (Android) | `-1` |
| `sharpness` | `double` | Sharpness 0.0-1.0 (iOS) | `0.5` |
| `preset` | `VibrationPreset?` | Predefined pattern | `null` |

---

## 📊 Platform Support

| Platform | Basic | Amplitude | Patterns | Haptic |
|----------|-------|-----------|----------|--------|
| **Android** | ✅ | ✅ | ✅ | ❌ |
| **iOS** | ✅ | ❌ | ✅ | ✅ |
| **Web** | ✅ | ❌ | ❌ | ❌ |
| **OpenHarmony** | ✅ | ✅ | ✅ | ❌ |

---

## 🎨 Examples

### Basic Vibration
```dart
await Vibration.vibrate();
await Vibration.vibrate(duration: 1000);
```

### Custom Patterns
```dart
await Vibration.vibrate(
  pattern: [0, 500, 200, 500],
  repeat: 1,
);
```

### Preset Patterns
```dart
await Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
await Vibration.vibrate(preset: VibrationPreset.lightImpact);
```

### Amplitude Control (Android)
```dart
if (await Vibration.hasAmplitudeControl()) {
  await Vibration.vibrate(
    duration: 1000,
    amplitude: 128,
  );
}
```

---

## 🔍 Troubleshooting

### Android
- Add `VIBRATE` permission to `AndroidManifest.xml`
- Check device support: `await Vibration.hasVibrator()`

### iOS
- Haptic feedback only works on physical devices
- Ensure device supports haptic feedback

### Web
- Requires user interaction (button click, etc.)
- Some browsers may not support the API

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ by [Boughdiri Dorsaf](https://github.com/boughdiri-dorsaf)**

[⭐ Star this repo](https://github.com/boughdiri-dorsaf/vibration_fixed) • [🐛 Report Bug](https://github.com/boughdiri-dorsaf/vibration_fixed/issues)

</div>