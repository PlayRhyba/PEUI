//
//  PETableViewCell.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/24/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class PETableViewCell: UITableViewCell {
    
    
    //MARK: Public Methods
    
    
    static var reuseIdentifier: String {
        return self.className
    }
    
    
    static var height: CGFloat {
        return 0.0
    }
    
    
    static func register(for tableView: UITableView) {
        let nib = UINib(nibName: self.className, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
}
