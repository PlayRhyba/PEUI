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
    
    var isExpanded: Bool = false {
        didSet {
            collapseExpandButton.setTitle(isExpanded ? "Collapse" : "Expand", for: .normal)
        }
    }
    
    var selectedItem: TopMainAreaMenuItem? {
        let indexPath = collectionView.indexPathsForSelectedItems?.first
        
        if let indexPath = indexPath {
            return structure[indexPath.row]
        }
        
        return nil
    }
    
    
    //MARK: Public Methods
    
    
    func selectItem(atIndex index: Int) {
        if index >= 0 && index < structure.count {
            let indexPath = IndexPath(row: index, section: 0)
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionViewScrollPosition.centeredHorizontally)
            collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }
    
    
    func expand() {
        if !isExpanded {
            heightLayoutConstraint.constant = Constants.expandedHeight
            collectionView.isHidden = false
            isExpanded = true
        }
    }
    
    
    func collapse() {
        if isExpanded {
            heightLayoutConstraint.constant = Constants.collapsedHeight
            collectionView.isHidden = true
            isExpanded = false
        }
    }
    
    
    //MARK: Lifecycle
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = false
        
        TopMainAreaMenuCell.register(for: collectionView)
        
        expand()
        collectionView.reloadData()
    }
    
    
    //MARK: IBAction
    
    
    @IBAction func collapseExpandButtonClicked(sender: UIButton) {
        if isExpanded {
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
    
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return collectionView.indexPathsForSelectedItems?.first != indexPath
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = structure[indexPath.row]
        delegate?.topMainAreaMenu(self, didSelectItem: item)
    }
}
