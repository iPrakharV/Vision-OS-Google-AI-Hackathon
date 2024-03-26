import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private var lidarHandler = LiDARHandler()

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller = window?.rootViewController as! FlutterViewController
    let lidarChannel = FlutterMethodChannel(name: "com.yourcompany.visionpro/lidar",
                                              binaryMessenger: controller.binaryMessenger)
    lidarChannel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      // Handle the 'startLiDARSession' method
      if call.method == "startLiDARSession" {
        self?.lidarHandler.startLiDARSession(result: result)
      } else if call.method == "stopLiDARSession" {
        self?.lidarHandler.stopLiDARSession()
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
