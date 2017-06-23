//
//  Configuration.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import UIKit


enum LeftMainAreaMenuItem: String {
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


struct TopMainAreaMenuItem {
    
    enum Kind: String {
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
    
    var title: String {
        return kind.rawValue
    }
    
    let leftMenuItems: [LeftMainAreaMenuItem]
    
    
    init(kind: Kind, image: UIImage? = nil) {
        self.kind = kind
        self.image = image
        leftMenuItems = LeftMainAreaMenuItem.mainAreaLeftMenuItems(kind: self.kind)
    }
    
    
    //MARK: Public Metods
    
    
    static func mainAreaTopMenuItems() -> [TopMainAreaMenuItem] {
        return [
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
