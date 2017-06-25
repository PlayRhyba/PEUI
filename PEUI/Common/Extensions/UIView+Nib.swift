//
//  UIView+Nib.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/25/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


extension UIView {
    
    class func fromNib<T : UIView>() -> T {
        return Bundle.main.loadNibNamed(T.className, owner: nil, options: nil)![0] as! T
        
        
//        let myCustomView: CustomView = UIView.fromNib()
//        ..or even:
//        
//        let myCustomView: CustomView = .fromNib()
    }
}
