//
//  Configuration.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


enum LeftMainAreaMenuItem: String {
    case current = "Current"
    case recent = "Recent"
    case synchronization = "Synchronization"
    case debug = "Debug"
    case options = "Options"
    
    case projectList = "Project List"
    case globalWelderList = "Global Welder List"
    case globalWPSList = "Global WPS List"
    
    case spreadList = "Spread List"
    
    var title: String {
        return rawValue
    }
    
    
    //MARK: Public Methods
    
    
    static func mainAreaLeftMenuItems(kind: TopMainAreaMenuItem.Kind) -> [LeftMainAreaMenuItem] {
        switch (kind) {
        case .main:
            return [
                current,
                recent,
                synchronization,
                debug,
                options
            ]
            
        case .projects:
            return [
                projectList,
                globalWelderList,
                globalWPSList
            ]
            
        case .spreads:
            return [spreadList]
            
        default:
            return []
        }
    }
}


class TopMainAreaMenuItem {
    
    enum Kind: String {
        case main = "Main"
        case projects = "Projects"
        case spreads = "Spreads"
        case assets = "Assets"
        case welds = "Welds"
        case defects = "Defects"
        case map = "Map"
        case reports = "Reports"
    }
    
    
    let kind: Kind
    let image: UIImage?
    var selected: Bool
    
    var title: String {
        return kind.rawValue
    }
    
    let leftMenuItems: [LeftMainAreaMenuItem]
    
    
    init(kind: Kind, image: UIImage? = nil, selected: Bool = false) {
        self.kind = kind
        self.image = image
        self.selected = selected
        leftMenuItems = LeftMainAreaMenuItem.mainAreaLeftMenuItems(kind: self.kind)
    }
    
    
    //MARK: Public Metods
    
    
    static func mainAreaTopMenuItems() -> [TopMainAreaMenuItem] {
        return [
            TopMainAreaMenuItem(kind: .main),
            TopMainAreaMenuItem(kind: .projects),
            TopMainAreaMenuItem(kind: .spreads),
            TopMainAreaMenuItem(kind: .assets),
            TopMainAreaMenuItem(kind: .welds),
            TopMainAreaMenuItem(kind: .defects),
            TopMainAreaMenuItem(kind: .map),
            TopMainAreaMenuItem(kind: .reports)
        ]
    }
}
