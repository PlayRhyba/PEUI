//
//  MainAreaContentView.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/25/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class MainAreaContentView: UIView {
    
    
    //MARK: Public Mehtods
    
    
    func pin(to superview: UIView) {
        superview.subviews.forEach { $0.removeFromSuperview() }
        superview.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0.0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0.0).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0.0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0.0).isActive = true
    }
}
