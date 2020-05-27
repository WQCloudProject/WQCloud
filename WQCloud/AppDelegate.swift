//
//  AppDelegate.swift
//  WQCloud
//
//  Created by chenweiqiang on 2020/5/25.
//  Copyright © 2020 chenweiqiang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
        addTestData()
//        let transtion = CATransition()
//        transtion.type = CATransitionType(rawValue: "cube")
//        transtion.duration = 0.35
        
//        transtion.subtype = .fromRight
//        self.window?.layer.add(transtion, forKey: "animation")
//        self.window?.rootViewController = NYCustomTabbarController()
        // Override point for customization after application launch.
        
        let vc = WQCustomTabbarController()
        self.window?.rootViewController = vc
        return true
    }

    func addTestData() {
        let arry = NSArray(objects: "stev","baidu.com","com","12344","robinson")
        let filePath:String = NSHomeDirectory() + "/Documents/" + "1234" + ".plist"
        
        arry.write(toFile: filePath, atomically: true)
    }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

