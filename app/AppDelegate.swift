//
//  AppDelegate.swift
//  Poseidon
//
//  Created by Alex Motor on 08.06.17.
//  Copyright © 2017 Alex Motor. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static let navigator = Navigator(NavigatingMap(["Main"], "Main"))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = AppDelegate.navigator.navigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

}

