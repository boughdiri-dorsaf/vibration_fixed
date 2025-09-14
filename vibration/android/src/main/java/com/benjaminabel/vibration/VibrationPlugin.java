package com.boughdiridorsaf.vibration_fixed;

import android.content.Context;
import android.os.Vibrator;
import android.os.Build;
import android.os.VibratorManager;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodChannel;

public class VibrationPlugin implements FlutterPlugin {
    private static final String CHANNEL = "vibration";
    private MethodChannel methodChannel;

    @SuppressWarnings("deprecation")
    public Vibrator getVibrator(@NonNull FlutterPluginBinding flutterPluginBinding) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            return (Vibrator) flutterPluginBinding.getApplicationContext().getSystemService(Context.VIBRATOR_SERVICE);
        } else {
            final VibratorManager vibratorManager = (VibratorManager) flutterPluginBinding.getApplicationContext().getSystemService(Context.VIBRATOR_MANAGER_SERVICE);

            return vibratorManager.getDefaultVibrator();
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        final Vibrator vibrator = this.getVibrator(flutterPluginBinding);
        final VibrationMethodChannelHandler methodChannelHandler = new VibrationMethodChannelHandler(new Vibration(vibrator));

        this.methodChannel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
        this.methodChannel.setMethodCallHandler(methodChannelHandler);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        this.methodChannel.setMethodCallHandler(null);
        this.methodChannel = null;
    }
}