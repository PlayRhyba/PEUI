//
//  PENavigationController.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit
import os.log


class PENavigationController: UINavigationController {
    
    
    //MARK: Lifecycle
    
    
    deinit {
        os_log("%@: DEALLOCED", "\(type(of: self))")
    }
}
