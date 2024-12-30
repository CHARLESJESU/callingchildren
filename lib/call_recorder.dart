// lib/call_recorder.dart
import 'package:flutter/services.dart';

class CallRecorder {
  static const MethodChannel _channel = MethodChannel('com.example.call_recorder/recording');

  // Start recording
  Future<void> startRecording() async {
    try {
      await _channel.invokeMethod('startRecording');
      print("Recording started.");
    } on PlatformException catch (e) {
      print("Failed to start recording: ${e.message}");
    }
  }

  // Stop recording
  Future<void> stopRecording() async {
    try {
      await _channel.invokeMethod('stopRecording');
      print("Recording stopped.");
    } on PlatformException catch (e) {
      print("Failed to stop recording: ${e.message}");
    }
  }

  bool _isRecording = false;

  // Toggle recording status
  void toggleRecording() {
    if (_isRecording) {
      stopRecording();
    } else {
      startRecording();
    }
    _isRecording = !_isRecording;
  }
}
