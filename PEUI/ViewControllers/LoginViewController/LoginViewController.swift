//
//  LoginViewController.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit

class LoginViewController: PEViewController {
    
    
    //MARK: Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
    }
    
    
    //MARK: IBAction
    
    
    @IBAction func loginButtonClicked(sender: UIButton) {
        Router.shared.transitToMainArea()
    }
    
    
    @IBAction func networkOptionsButtonClicked(sender: UIButton) {
        Router.shared.transitToNetworkOptions()
    }
}
