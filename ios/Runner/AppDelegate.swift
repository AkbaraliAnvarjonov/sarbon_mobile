import UIKit
import Flutter
import YandexMapsMobile

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    YMKMapKit.setLocale("ru_RU")
    YMKMapKit.setApiKey("15ec72ea-b4d0-4923-b3a6-3d4735e40a34")
       if #available(iOS 10.0, *) {
             UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
         }
         application.registerForRemoteNotifications()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
