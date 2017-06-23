//
//  MainAreaViewController.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class MainAreaViewController: PEViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Login",
                                                           style: UIBarButtonItemStyle.plain,
                                                           target: self,
                                                           action: #selector(backToLogin))
    }
    
    
    //MARK: Internal Logic
    
    
    @objc private func backToLogin() {
        Router.shared.transitToLogin()
    }
}
