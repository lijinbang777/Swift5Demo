//
//  SceneDelegate.swift
//  Swift5Demo
//
//  Created by jinbang.li on 2022/7/4.
//

import UIKit
import SwiftMessages
import ESTabBarController_swift
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScence = (scene as? UIWindowScene) else { return }
        
        let tabVC = settingTabbar(delegate: self as? UITabBarControllerDelegate)
        window = UIWindow(windowScene: windowScence)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = tabVC;
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}
extension SceneDelegate {
    private func settingTabbar(delegate: UITabBarControllerDelegate?) -> ESTabBarController{
        let tabVC = ESTabBarController()
        tabVC.delegate = delegate
        tabVC.title = ""
        tabVC.tabBar.shadowImage = UIImage(named: "")
        tabVC.shouldHijackHandler = {
            tabvc,vc,index in
//            if index == 2 {
//                return true
//            }//控制选中不规则tabbar的是否跳转
            return false
        }
        
        tabVC.didHijackHandler = {
            [weak tabVC] tabbarVC,viewController,index in
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2, execute: {
                let warning = MessageView.viewFromNib(layout: .cardView)
                warning.configureTheme(.warning)
                warning.configureDropShadow()
                warning.configureContent(title: "Present", body: "打开新页面", iconText: "🙄")
                warning.button?.isHidden = true
                var warningConfig = SwiftMessages.defaultConfig
                warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
                SwiftMessages.show(config: warningConfig, view: warning)
            })
        }
        
        let home = TTHomeViewController()
        let message = TTMessageViewController()
        let discover = TTDiscoverViewController()
        let about = TTAboutViewController()
        let my = TTMyViewController()
        
        home.tabBarItem = ESTabBarItem.init(TTTabItemView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_select"))
        message.tabBarItem = ESTabBarItem.init(TTTabItemView(), title: "Message", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_select"))
        discover.tabBarItem = ESTabBarItem.init(TTIrregularTabbarItemView(), title: "Discover", image: UIImage(named: "discover"), selectedImage: UIImage(named: "discover"))
        about.tabBarItem = ESTabBarItem.init(TTTabItemView(), title: "About", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_select"))
        my.tabBarItem = ESTabBarItem.init(TTTabItemView(), title: "My", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_select"))
        
        tabVC.viewControllers = [
            setRoot(viewController: home, title: "Home"),
            setRoot(viewController: message, title: "Message"),
            setRoot(viewController: discover, title: "Discover"),
            setRoot(viewController: about, title: "About"),
            setRoot(viewController: my, title: "My"),
        ]
       
        
       return tabVC
    }
    private func setRoot(viewController: UIViewController,title: String?) -> TTNavigationControllerViewController{
        viewController.title = title
        let vc = TTNavigationControllerViewController.init(rootViewController: viewController)
        return vc
    }
}
