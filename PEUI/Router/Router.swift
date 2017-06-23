//
//  Router.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class Router: NSObject {
    
    static let shared = Router()
    
    var loginNavigationController: PENavigationController?
    var mainAreaNavigationController: PENavigationController?
    
    
    //MARK: NSObject
    
    
    private override init() {}
    
    
    //MARK: Public Methods
    
    
    func transitToLogin(logout: Bool = false) {
        if loginNavigationController == nil {
            let loginVC = LoginViewController()
            loginNavigationController = PENavigationController(rootViewController: loginVC)
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = loginNavigationController
        
        if logout {
            mainAreaNavigationController = nil
        }
    }
    
    
    func transitToMainArea() {
        if mainAreaNavigationController == nil {
            let mainAreaVC = MainAreaViewController()
            mainAreaNavigationController = PENavigationController(rootViewController: mainAreaVC)
        }
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = mainAreaNavigationController
    }
}
