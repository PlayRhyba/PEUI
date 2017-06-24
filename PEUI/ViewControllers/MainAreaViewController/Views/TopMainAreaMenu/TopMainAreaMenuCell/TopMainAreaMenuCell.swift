//
//  TopMainAreaMenuCell.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class TopMainAreaMenuCell: PECollectionViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var item: TopMainAreaMenuItem? {
        didSet {
            if let item = item {
                imageView.image = item.image
                label.text = item.title
            }
        }
    }
    
    
    //MARK: UICollectionViewCell
    
    
    override var isSelected: Bool {
        didSet {
            layer.borderWidth = isSelected ? 2.0 : 0.0
        }
    }
}
