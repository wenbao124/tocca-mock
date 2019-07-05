//
//  AppDelegate.swift
//  Tocca Mock
//
//  Created by Wenyuan Bao on 7/4/19.
//  Copyright © 2019 Wenyuan Bao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

//         In an actual version, this will be loaded with a profile stored in the network or coreData.  
        Profile.currentProfile = Profile("Tanya Ofek", "UX Designer at Tocca.io", UIImage(named: "tanya") ?? UIImage(), "Sasha Sasha, Shshshs, sashavel11@gmail.com")

        let contactsVC = ContactsViewController()
        let myCardVC = MyCardViewController(profile: Profile.currentProfile)
        let settingsVC = SettingsViewController()
        let tabbar = UITabBarController()

        tabbar.addChild(contactsVC)
        tabbar.addChild(myCardVC)
        tabbar.addChild(settingsVC)
        tabbar.selectedIndex = 1

        window = UIWindow()
        window?.rootViewController = tabbar
        window?.makeKeyAndVisible()

        return true
    }
}

