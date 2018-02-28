//
//  AppDelegate.swift
//  AIM
//
//  Created by Oskar Szydlowski on 28.02.2018.
//  Copyright © 2018 Oskar Szydlowski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var rootConnector: RootConnector!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        connectRoot()
        
        return true
    }
    
    private func configureWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.darkGray
        window?.makeKeyAndVisible()
    }
    
    private func connectRoot() {
        guard let window = window else {
            fatalError("No window available")
        }
        rootConnector = RootConnector(in: window)
    }
}

