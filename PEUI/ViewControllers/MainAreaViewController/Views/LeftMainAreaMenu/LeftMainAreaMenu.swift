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
    
    
    //MARK: Lifecycle
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = topMenuItem?.leftMenuItems[indexPath.row]
        delegate?.leftMainAreaMenu(self, didSelectItem: item!)
    }
}
