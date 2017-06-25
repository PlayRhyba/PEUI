//
//  LeftMainAreaMenu.swift
//  PEUI
//
//  Created by Alexander Snegursky on 6/24/17.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


protocol LeftMainAreaMenuDelegate: NSObjectProtocol {
    func leftMainAreaMenu(_ leftMainAreaMenu: LeftMainAreaMenu, didSelectItem item: LeftMainAreaMenuItem)
}


class LeftMainAreaMenu: UIView, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var topMenuItem: TopMainAreaMenuItem? {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: LeftMainAreaMenuDelegate?
    
    var selectedItem: LeftMainAreaMenuItem? {
        let indexPath = tableView.indexPathForSelectedRow
        
        if let indexPath = indexPath,
            let topMenuItem = topMenuItem {
            return topMenuItem.leftMenuItems[indexPath.row]
        }
        
        return nil
    }
    
    
    //MARK: Public Methods
    
    
    func selectItem(atIndex index: Int) {
        if let topMenuItem = topMenuItem {
            if index >= 0 && index < topMenuItem.leftMenuItems.count {
                let indexPath = IndexPath(row: index, section: 0)
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.top)
                tableView(tableView, didSelectRowAt: indexPath)
            }
        }
    }
    
    
    //MARK: Lifecycle
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = false
        
        LeftMainAreaMenuCell.register(for: tableView)
    }
    
    
    //MARK: UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topMenuItem?.leftMenuItems.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LeftMainAreaMenuCell.reuseIdentifier) as! LeftMainAreaMenuCell
        cell.item = topMenuItem?.leftMenuItems[indexPath.row]
        return cell
    }
    
    
    //MARK: UITableViewDelegate
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath != tableView.indexPathForSelectedRow {
            return indexPath
        }
        
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = topMenuItem?.leftMenuItems[indexPath.row]
        delegate?.leftMainAreaMenu(self, didSelectItem: item!)
    }
}
