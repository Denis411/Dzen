import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let tabBarController = UITabBarController()
        let tabViewController1 = StarRateViewController(
            nibName: "StarRateViewController",
            bundle: nil)
        let tabViewController2 = WriteRightViewController(
            nibName:"WriteRightViewController",
            bundle: nil)
        let tabViewController3 = SurveyViewController(
            nibName:"SurveyViewController",
            bundle: nil)
        let tabViewController4 = InsertTextViewController(
            nibName:"InsertTextViewController",
            bundle: nil)
        let tabViewController5 = CompareViewController(
            nibName:"CompareViewController",
            bundle: nil)
        
        tabViewController1.tabBarItem = UITabBarItem(
            title: "Рейтинг",
            image: UIImage(systemName: "pencil") ,
            tag:1)
        tabViewController2.tabBarItem = UITabBarItem(
            title: "Заполни",
            image: UIImage(systemName: "pencil") ,
            tag:2)
        tabViewController3.tabBarItem = UITabBarItem(
            title: "Опрос",
            image: UIImage(systemName: "pencil") ,
            tag:3)
        tabViewController4.tabBarItem = UITabBarItem(
            title: "Вставь",
            image: UIImage(systemName: "pencil") ,
            tag:4)
        tabViewController5.tabBarItem = UITabBarItem(
            title: "Сопоставление",
            image: UIImage(systemName: "pencil") ,
            tag:5)
        
        let controllers = [tabViewController1, tabViewController2, tabViewController3, tabViewController4, tabViewController5]
        tabBarController.viewControllers = controllers
        let navigationController = UINavigationController(rootViewController: tabBarController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

