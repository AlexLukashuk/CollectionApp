//
//  NibLoadable.swift
//  CollectionApp
//
//  Created by Oleksandr Lukashuk on 23.08.2021.
//

import UIKit

// Conform this protocol if it's necessary to instantiate a view in code directly from .fromNib
public protocol NibLoadable {
}

public extension NibLoadable where Self: UIView {
    static func fromNib<T: UIView>() -> T  {
        let nibBundle = Bundle(for: Self.self).loadNibNamed(String(describing: self), owner: nil, options: nil)
        return nibBundle![0] as! T
    }
}
