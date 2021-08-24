//
//  ClassNameProtocol.swift
//  CollectionApp
//
//  Created by Oleksandr Lukashuk on 23.08.2021.
//

import Foundation
extension NSObject: ClassNameProtocol {}
public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
