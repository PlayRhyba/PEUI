//
//  PECollectionViewCell.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


class PECollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return self.className
    }
    
    
    static var size: CGSize {
        return CGSize.zero
    }
    
    
    static func register(for collectionView: UICollectionView) {
        let nib = UINib(nibName: self.className, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
