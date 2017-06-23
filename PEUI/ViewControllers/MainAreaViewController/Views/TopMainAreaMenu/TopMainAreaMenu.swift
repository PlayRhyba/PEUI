//
//  TopMainAreaMenu.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


protocol TopMainAreaMenuDelegate: NSObjectProtocol {
    func topMainAreaMenu(_ topMainAreaMenu: TopMainAreaMenu, didSelectItem item: TopMainAreaMenuItem);
}


class TopMainAreaMenu: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewHeightHeightLayoutConstraint: NSLayoutConstraint!
    
    let structure = TopMainAreaMenuItem.mainAreaTopMenuItems()
    
    private(set) var selectedItem: TopMainAreaMenuItem?
    weak var delegate: TopMainAreaMenuDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        TopMainAreaMenuCell.register(for: collectionView)
        collectionView.reloadData()
    }
    
    
    //MARK: UICollectionViewDataSource
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return structure.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopMainAreaMenuCell.reuseIdentifier, for: indexPath) as! TopMainAreaMenuCell
        cell.item = structure[indexPath.row]
        return cell
    }
    
    
    //MARK: UICollectionViewDelegate
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = structure[indexPath.row]
        delegate?.topMainAreaMenu(self, didSelectItem: selectedItem!)
    }
}
