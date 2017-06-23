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
                layer.borderWidth = item.selected ? 2.0 : 0.0
            }
        }
    }
}
