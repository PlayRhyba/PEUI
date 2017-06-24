//
//  TopMainAreaMenu.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


protocol TopMainAreaMenuDelegate: NSObjectProtocol {
    func topMainAreaMenu(_ topMainAreaMenu: TopMainAreaMenu, didSelectItem item: TopMainAreaMenuItem)
}


class TopMainAreaMenu: UIView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private struct Constants {
        static let expandedHeight: CGFloat = 120.0
        static let collapsedHeight: CGFloat = 20.0
    }
    
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var heightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet var collapseExpandButton: UIButton!
    
    var structure = TopMainAreaMenuItem.mainAreaTopMenuItems()
    
    weak var delegate: TopMainAreaMenuDelegate?
    
    var expanded: Bool = false {
        didSet {
            collapseExpandButton.setTitle(expanded ? "Collapse" : "Expand", for: .normal)
        }
    }
    
    
    //MARK: Public Methods
    
    
    func expand() {
        if !expanded {
            heightLayoutConstraint.constant = Constants.expandedHeight
            collectionView.isHidden = false
            expanded = true
        }
    }
    
    
    func collapse() {
        if expanded {
            heightLayoutConstraint.constant = Constants.collapsedHeight
            collectionView.isHidden = true
            expanded = false
        }
    }
    
    
    //MARK: Lifecycle
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        TopMainAreaMenuCell.register(for: collectionView)
        
        expand()
        collectionView.reloadData()
    }
    
    
    //MARK: IBAction
    
    
    @IBAction func collapseExpandButtonClicked(sender: UIButton) {
        if expanded {
            collapse()
        }
        else {
            expand()
        }
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
        let item = structure[indexPath.row]
        delegate?.topMainAreaMenu(self, didSelectItem: item)
    }
}
