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
    @IBOutlet var contentContainer: UIView!
    
    
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
        
        topMenu.selectItem(atIndex: 0)
    }
    
    
    //MARK: TopMainAreaMenuDelegate
    
    
    func topMainAreaMenu(_ topMainAreaMenu: TopMainAreaMenu, didSelectItem item: TopMainAreaMenuItem) {
        leftMenu.topMenuItem = item
        leftMenu.selectItem(atIndex: 0)
    }
    
    
    //MARK: LeftMainAreaMenuDelegate
    
    
    func leftMainAreaMenu(_ leftMainAreaMenu: LeftMainAreaMenu, didSelectItem item: LeftMainAreaMenuItem) {
        switch item {
        case .current:
            let view = MainAreaCurrentView.loadFromNib() as! MainAreaCurrentView
            view.pin(to: contentContainer)
            
        case .synchronization:
            let view = MainAreaSynchronizationView.loadFromNib() as! MainAreaSynchronizationView
            view.pin(to: contentContainer)
            
        default:
            contentContainer.subviews.forEach { $0.removeFromSuperview() }
        }
    }
    
    
    //MARK: Internal Logic
    
    
    @objc private func backToLogin() {
        Router.shared.transitToLogin()
    }
}
