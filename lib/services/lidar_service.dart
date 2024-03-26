import 'package:flutter/services.dart';

class LiDARService {
  static const MethodChannel _channel = MethodChannel('com.yourcompany.visionpro/lidar');

  Future<String> startLiDARSession() async {
    try {
      // Assuming 'startLiDARSession' is the method implemented in the native code
      final String sessionResult = await _channel.invokeMethod('startLiDARSession');
      return sessionResult; // This could be a confirmation message or initial LiDAR data
    } on PlatformException catch (e) {
      return "Failed to start LiDAR session: '${e.message}'.";
    }
  }

  Future<void> stopLiDARSession() async {
    try {
      // Assuming 'stopLiDARSession' is the method implemented in the native code
      await _channel.invokeMethod('stopLiDARSession');
    } on PlatformException catch (e) {
      print("Failed to stop LiDAR session: '${e.message}'.");
    }
  }

  Future<String> getLiDARData() async {
    try {
      final String lidarData = await _channel.invokeMethod('getLiDARData');
      return lidarData;
    } on PlatformException catch (e) {
      return "Failed to get LiDAR data: '${e.message}'.";
    }
  }
}
