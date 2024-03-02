//
//  AppDelegate.swift
//  SpaceXApp
//
//  Created by Захар Литвинчук on 01.03.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: PageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal))
        window?.backgroundColor = .systemBackground
        
        return true
    }

}
