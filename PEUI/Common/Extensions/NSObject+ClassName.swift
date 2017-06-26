//
//  NSObject+Utilities.swift
//  PEUI
//
//  Created by Alexander Snigurskyi on 2017-06-23.
//  Copyright © 2017 Alexander Snegursky. All rights reserved.
//


import Foundation


public extension NSObject {
    
    class var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    
    var className: String {
        return NSStringFromClass(self as! AnyClass).components(separatedBy: ".").last!
    }
}
