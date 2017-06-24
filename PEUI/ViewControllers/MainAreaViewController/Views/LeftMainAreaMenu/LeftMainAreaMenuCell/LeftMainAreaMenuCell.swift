//
//  LeftMainAreaMenuCell.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/24/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class LeftMainAreaMenuCell: PETableViewCell {
    
    @IBOutlet var label: UILabel!
    
    var item: LeftMainAreaMenuItem? {
        didSet {
            if let item = item {
                label.text = item.title
            }
        }
    }
    
    
    //MARK: UITableViewCell
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        layer.borderWidth = selected ? 2.0 : 0.0
    }
}
