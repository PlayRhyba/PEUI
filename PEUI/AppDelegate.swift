//
//  AppDelegate.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/21/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    //MARK: Lifecycle
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        Router.shared.transitToLogin()
        
        return true
    }
    
    
    //MARK: Internal Logic
    
    
    func configureWindow() {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
    }
}

