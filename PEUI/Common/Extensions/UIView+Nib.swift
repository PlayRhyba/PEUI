//
//  UIView+Nib.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/25/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


extension UIView {
    
    class func loadFromNib(nibName: String? = nil, owner: Any? = nil) -> Any? {
        guard let objects = Bundle.main.loadNibNamed(nibName ?? self.className,
                                                     owner: owner,
                                                     options: nil)
            else { return nil }
        
        for obj in objects {
            if (obj as! UIView).isMember(of: self) {
                return obj
            }
        }
        
        return nil
    }
}
