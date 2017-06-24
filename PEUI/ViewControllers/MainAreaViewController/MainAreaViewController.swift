//
//  MainAreaViewController.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class MainAreaViewController: PEViewController, TopMainAreaMenuDelegate, LeftMainAreaMenuDelegate {
    
    @IBOutlet var topMenu: TopMainAreaMenu!
    @IBOutlet var leftMenu: LeftMainAreaMenu!
    
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Main"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login",
                                                           style: UIBarButtonItemStyle.plain,
                                                           target: self,
                                                           action: #selector(backToLogin))
        topMenu.delegate = self
        leftMenu.delegate = self
    }
    
    
    //MARK: TopMainAreaMenuDelegate
    
    
    func topMainAreaMenu(_ topMainAreaMenu: TopMainAreaMenu, didSelectItem item: TopMainAreaMenuItem) {
        leftMenu.topMenuItem = item
    }
    
    
    //MARK: LeftMainAreaMenuDelegate
    
    
    func leftMainAreaMenu(_ leftMainAreaMenu: LeftMainAreaMenu, didSelectItem item: LeftMainAreaMenuItem) {
        
        
        //TODO: left menu selection
        
        
    }
    
    
    //MARK: Internal Logic
    
    
    @objc private func backToLogin() {
        Router.shared.transitToLogin()
    }
}
