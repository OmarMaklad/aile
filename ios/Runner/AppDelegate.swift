import UIKit
import Flutter
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//      configureFirebaseNotifications()
      GeneratedPluginRegistrant.register(with: self)
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    func configureFirebaseNotifications() -> Void {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        }
        FirebaseApp.configure()
    }
}
