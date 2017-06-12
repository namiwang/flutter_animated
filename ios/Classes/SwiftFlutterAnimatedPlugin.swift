import Flutter
import UIKit
    
public class SwiftFlutterAnimatedPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_animated", binaryMessenger: registrar.messenger());
    let instance = SwiftFlutterAnimatedPlugin();
    registrar.addMethodCallDelegate(instance, channel: channel);
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion);
  }
}
