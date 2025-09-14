# 🔥 Vibration Fixed

<div align="center">

[![pub package](https://img.shields.io/pub/v/vibration_fixed.svg)](https://pub.dev/packages/vibration_fixed)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20OpenHarmony-blue)](https://flutter.dev)

**A fixed and enhanced Flutter plugin for handling Vibration API across all platforms**

[📖 Documentation](#-documentation) • [🚀 Quick Start](#-quick-start) • [💡 Examples](#-examples) • [🔧 API Reference](#-api-reference) • [🤝 Contributing](#-contributing)

</div>

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎯 **Core Features**
- ✅ **Cross-platform support** - iOS, Android, Web, OpenHarmony
- ✅ **Simple API** - Easy-to-use vibration methods
- ✅ **Custom patterns** - Support for complex vibration patterns
- ✅ **Amplitude control** - Control vibration strength (Android)
- ✅ **Haptic feedback** - iOS haptic feedback integration
- ✅ **Preset patterns** - Pre-defined patterns for common use cases
- ✅ **Device detection** - Check device vibration capabilities
- ✅ **Error handling** - Robust error handling and fallbacks

</td>
<td width="50%">

### 🛠️ **What's Fixed**
- 🔧 **Improved error handling** - Better exception handling
- 🔧 **Enhanced iOS support** - Better haptic feedback
- 🔧 **Web compatibility** - Improved web vibration API
- 🔧 **Android optimization** - Better vibrator management
- 🔧 **Documentation** - Comprehensive docs and examples
- 🔧 **Package naming** - Clear, descriptive names
- 🔧 **Dependencies** - Updated to latest versions

</td>
</tr>
</table>

---

## 🚀 Quick Start

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  vibration_fixed: ^4.0.0
```

### Platform Setup

<details>
<summary><strong>📱 Android Setup</strong></summary>

Add the following permission to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.VIBRATE" />
```

</details>

<details>
<summary><strong>🍎 iOS Setup</strong></summary>

No additional setup required! The plugin uses the native iOS haptic feedback system.

</details>

<details>
<summary><strong>🌐 Web Setup</strong></summary>

No additional setup required! The plugin uses the Web Vibration API.

</details>

---

## 💡 Examples

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
await Vibration.vibrate(preset: VibrationPreset.singleShortBuzz);
await Vibration.vibrate(preset: VibrationPreset.doubleBuzz);
await Vibration.vibrate(preset: VibrationPreset.tripleBuzz);
```

### Cancel Vibration

```dart
// Start a long vibration
await Vibration.vibrate(duration: 10000);

// Cancel it
await Vibration.cancel();
```

---

## 🔧 API Reference

### Vibration Class

#### Static Methods

| Method | Description | Returns |
|--------|-------------|---------|
| `hasVibrator()` | Check if device has vibrator | `Future<bool>` |
| `hasAmplitudeControl()` | Check if device supports amplitude control | `Future<bool>` |
| `hasCustomVibrationsSupport()` | Check if device supports custom vibrations | `Future<bool>` |
| `vibrate({...})` | Vibrate with specified parameters | `Future<void>` |
| `cancel()` | Cancel ongoing vibration | `Future<void>` |

#### Vibration Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `duration` | `int` | Vibration duration in milliseconds | `500` |
| `pattern` | `List<int>` | Custom vibration pattern | `[]` |
| `repeat` | `int` | Number of times to repeat pattern (-1 for infinite) | `-1` |
| `intensities` | `List<int>` | Intensity values for pattern (iOS) | `[]` |
| `amplitude` | `int` | Vibration amplitude 1-255 (Android) | `-1` |
| `sharpness` | `double` | Vibration sharpness 0.0-1.0 (iOS) | `0.5` |
| `preset` | `VibrationPreset?` | Use predefined pattern | `null` |

### VibrationPreset Enum

<details>
<summary><strong>📋 Available Presets</strong></summary>

| Preset | Description | Use Case |
|--------|-------------|----------|
| `quickSuccessAlert` | Quick success notification | Success feedback |
| `singleShortBuzz` | Single short buzz | Simple alerts |
| `doubleBuzz` | Double buzz pattern | Double confirmation |
| `tripleBuzz` | Triple buzz pattern | Triple confirmation |
| `longAlarmBuzz` | Long alarm buzz | Alarms |
| `pulseWave` | Pulse wave pattern | Heartbeat simulation |
| `progressiveBuzz` | Progressive buzz | Countdown timers |
| `rhythmicBuzz` | Rhythmic pattern | Music sync |
| `gentleReminder` | Gentle reminder | Soft notifications |
| `zigZagAlert` | Zig-zag pattern | Attention grabbing |
| `softPulse` | Soft pulse | Subtle feedback |
| `emergencyAlert` | Emergency alert | Critical alerts |
| `heartbeatVibration` | Heartbeat pattern | Health apps |
| `countdownTimerAlert` | Countdown timer | Timer apps |
| `rapidTapFeedback` | Rapid tap | Quick actions |
| `dramaticNotification` | Dramatic notification | Important events |
| `urgentBuzzWave` | Urgent buzz wave | Urgent alerts |

</details>

---

## 📊 Platform Support

| Platform | Basic Vibration | Amplitude Control | Custom Patterns | Haptic Feedback | Status |
|----------|----------------|-------------------|-----------------|-----------------|--------|
| **Android** | ✅ | ✅ | ✅ | ❌ | Fully Supported |
| **iOS** | ✅ | ❌ | ✅ | ✅ | Fully Supported |
| **Web** | ✅ | ❌ | ❌ | ❌ | Fully Supported |
| **OpenHarmony** | ✅ | ✅ | ✅ | ❌ | Fully Supported |

---

## 🎨 Usage Examples

### Notification App

```dart
class NotificationService {
  static Future<void> showSuccessNotification() async {
    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.notificationSuccess);
    }
  }
  
  static Future<void> showErrorNotification() async {
    if (await Vibration.hasVibrator()) {
      await Vibration.vibrate(preset: VibrationPreset.notificationError);
    }
  }
}
```

### Game Feedback

```dart
class GameController {
  static Future<void> onPlayerHit() async {
    await Vibration.vibrate(
      duration: 200,
      amplitude: 150,
    );
  }
  
  static Future<void> onLevelComplete() async {
    await Vibration.vibrate(preset: VibrationPreset.quickSuccessAlert);
  }
}
```

### Timer App

```dart
class TimerService {
  static Future<void> startCountdown() async {
    for (int i = 5; i > 0; i--) {
      await Vibration.vibrate(preset: VibrationPreset.countdownTimerAlert);
      await Future.delayed(Duration(seconds: 1));
    }
  }
}
```

---

## 🔍 Troubleshooting

<details>
<summary><strong>❓ Common Issues</strong></summary>

### Vibration not working on Android
- Ensure `VIBRATE` permission is added to `AndroidManifest.xml`
- Check if device has a vibrator: `await Vibration.hasVibrator()`

### No haptic feedback on iOS
- Haptic feedback only works on physical devices, not simulators
- Ensure device supports haptic feedback

### Web vibration not working
- Web Vibration API requires user interaction (button click, etc.)
- Some browsers may not support the API

### Custom patterns not working
- Check device support: `await Vibration.hasCustomVibrationsSupport()`
- Ensure pattern format is correct: `[delay, vibrate, delay, vibrate]`

</details>

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🐛 Bug Reports
1. Check existing [issues](https://github.com/boughdiri-dorsaf/vibration_fixed/issues)
2. Create a new issue with detailed information
3. Include device info, Flutter version, and steps to reproduce

### 💡 Feature Requests
1. Open an issue with the "enhancement" label
2. Describe the feature and its use case
3. Provide examples if possible

### 🔧 Code Contributions
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Original vibration plugin by [Benjamin Dean](https://github.com/benjamindean/flutter_vibration)
- Flutter team for the excellent platform
- Community contributors and testers
- All the developers who reported issues and suggested improvements

---

## 📞 Support

<div align="center">

**Need help? Have questions?**

[![GitHub Issues](https://img.shields.io/badge/GitHub-Issues-blue?logo=github)](https://github.com/boughdiri-dorsaf/vibration_fixed/issues)
[![Email](https://img.shields.io/badge/Email-boughdiri.dorsaf@gmail.com-red?logo=gmail)](mailto:boughdiri.dorsaf@gmail.com)

**Made with ❤️ by [Boughdiri Dorsaf](https://github.com/boughdiri-dorsaf)**

[⭐ Star this repo](https://github.com/boughdiri-dorsaf/vibration_fixed) • [🐛 Report Bug](https://github.com/boughdiri-dorsaf/vibration_fixed/issues) • [💡 Request Feature](https://github.com/boughdiri-dorsaf/vibration_fixed/issues)

</div>

---

<div align="center">

**If this plugin helped you, please give it a ⭐ star!**

</div>