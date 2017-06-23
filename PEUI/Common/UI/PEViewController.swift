//
//  PEViewController.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit
import os.log


class PEViewController: UIViewController {
    
    
    //MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = []
    }
    
    
    deinit {
        os_log("%@: DEALLOCED", "\(type(of: self))")
    }
}
