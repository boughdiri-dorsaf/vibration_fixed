import 'package:flutter/material.dart';
import 'package:vibration_fixed/vibration_fixed.dart';

void main() {
  runApp(const VibrationFixedApp());
}

class VibrationFixedApp extends StatelessWidget {
  const VibrationFixedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vibration Fixed Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const VibrationDemo(),
    );
  }
}

class VibrationDemo extends StatefulWidget {
  const VibrationDemo({super.key});

  @override
  State<VibrationDemo> createState() => _VibrationDemoState();
}

class _VibrationDemoState extends State<VibrationDemo> {
  bool _hasVibrator = false;
  bool _hasAmplitudeControl = false;
  bool _hasCustomVibrations = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkCapabilities();
  }

  Future<void> _checkCapabilities() async {
    final hasVibrator = await Vibration.hasVibrator();
    final hasAmplitudeControl = await Vibration.hasAmplitudeControl();
    final hasCustomVibrations = await Vibration.hasCustomVibrationsSupport();

    setState(() {
      _hasVibrator = hasVibrator;
      _hasAmplitudeControl = hasAmplitudeControl;
      _hasCustomVibrations = hasCustomVibrations;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vibration Fixed Demo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildCapabilities(),
                  const SizedBox(height: 24),
                  _buildBasicVibration(),
                  const SizedBox(height: 24),
                  _buildPresetVibrations(),
                  const SizedBox(height: 24),
                  _buildCustomVibrations(),
                  const SizedBox(height: 24),
                  _buildAdvancedVibrations(),
                ],
              ),
            ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple.shade400, Colors.deepPurple.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.vibration, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              const Text(
                'Vibration Fixed',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'A fixed and enhanced Flutter plugin for handling Vibration API across all platforms',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCapabilities() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Device Capabilities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildCapabilityItem('Vibrator Available', _hasVibrator),
            _buildCapabilityItem('Amplitude Control', _hasAmplitudeControl),
            _buildCapabilityItem('Custom Vibrations', _hasCustomVibrations),
          ],
        ),
      ),
    );
  }

  Widget _buildCapabilityItem(String title, bool available) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            available ? Icons.check_circle : Icons.cancel,
            color: available ? Colors.green : Colors.red,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(title),
        ],
      ),
    );
  }

  Widget _buildBasicVibration() {
    return _buildSection(
      title: 'Basic Vibration',
      icon: Icons.play_arrow,
      children: [
        _buildVibrationButton(
          'Simple Vibration',
          Icons.vibration,
          () => Vibration.vibrate(),
        ),
        _buildVibrationButton(
          'Long Vibration (2s)',
          Icons.timer,
          () => Vibration.vibrate(duration: 2000),
        ),
        _buildVibrationButton(
          'Short Vibration (200ms)',
          Icons.touch_app,
          () => Vibration.vibrate(duration: 200),
        ),
      ],
    );
  }

  Widget _buildPresetVibrations() {
    final presets = [
      (VibrationPreset.quickSuccessAlert, 'Quick Success', Icons.check_circle),
      (VibrationPreset.singleShortBuzz, 'Light Impact', Icons.touch_app),
      (VibrationPreset.doubleBuzz, 'Medium Impact', Icons.pan_tool),
      (VibrationPreset.tripleBuzz, 'Heavy Impact', Icons.handyman),
      (VibrationPreset.softPulse, 'Success Notification', Icons.notifications),
      (VibrationPreset.emergencyAlert, 'Error Notification', Icons.error),
      (VibrationPreset.heartbeatVibration, 'Heartbeat', Icons.favorite),
      (VibrationPreset.urgentBuzzWave, 'Emergency Alert', Icons.warning),
    ];

    return _buildSection(
      title: 'Preset Patterns',
      icon: Icons.music_note,
      children: presets.map((preset) {
        return _buildVibrationButton(
          preset.$2,
          preset.$3,
          () => Vibration.vibrate(preset: preset.$1),
        );
      }).toList(),
    );
  }

  Widget _buildCustomVibrations() {
    if (!_hasCustomVibrations) {
      return _buildSection(
        title: 'Custom Patterns',
        icon: Icons.tune,
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Custom vibrations not supported on this device',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      );
    }

    return _buildSection(
      title: 'Custom Patterns',
      icon: Icons.tune,
      children: [
        _buildVibrationButton(
          'Double Tap Pattern',
          Icons.touch_app,
          () => Vibration.vibrate(
            pattern: [0, 100, 50, 100],
            intensities: [0, 255, 0, 255],
          ),
        ),
        _buildVibrationButton(
          'Pulse Wave Pattern',
          Icons.waves,
          () => Vibration.vibrate(
            pattern: [0, 100, 100, 100, 100, 100],
            intensities: [0, 200, 0, 200, 0, 200],
          ),
        ),
        _buildVibrationButton(
          'Rhythmic Pattern',
          Icons.music_note,
          () => Vibration.vibrate(
            pattern: [0, 200, 100, 300, 100, 200],
            intensities: [0, 150, 0, 255, 0, 200],
          ),
        ),
      ],
    );
  }

  Widget _buildAdvancedVibrations() {
    if (!_hasAmplitudeControl) {
      return _buildSection(
        title: 'Advanced Controls',
        icon: Icons.settings,
        children: [
          const Card(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Amplitude control not supported on this device',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      );
    }

    return _buildSection(
      title: 'Advanced Controls',
      icon: Icons.settings,
      children: [
        _buildVibrationButton(
          'Low Amplitude (50)',
          Icons.volume_down,
          () => Vibration.vibrate(duration: 1000, amplitude: 50),
        ),
        _buildVibrationButton(
          'Medium Amplitude (128)',
          Icons.volume_up,
          () => Vibration.vibrate(duration: 1000, amplitude: 128),
        ),
        _buildVibrationButton(
          'High Amplitude (255)',
          Icons.volume_up,
          () => Vibration.vibrate(duration: 1000, amplitude: 255),
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildVibrationButton(
      String title, IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _hasVibrator ? onPressed : null,
          icon: Icon(icon),
          label: Text(title),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
