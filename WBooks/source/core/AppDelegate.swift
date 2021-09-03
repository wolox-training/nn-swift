//
//  AppDelegate.swift
//  WBooks
//
//  Created by noelia.nieres on 30/07/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        let image = UIImage(named: "bc_nav bar.png")
        UINavigationBar.appearance().setBackgroundImage(image!.resizableImage(withCapInsets: UIEdgeInsets(top: 0,left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.white
        
        let navigationController = UINavigationController(rootViewController: TabBarController())
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }
}

