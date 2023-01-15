import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let surveyVC = InsertTextViewController()
        let navController = UINavigationController(rootViewController: surveyVC)
        window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

