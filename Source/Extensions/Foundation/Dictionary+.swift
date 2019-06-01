//
//  Dictionary+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import Foundation

extension Dictionary {
    public mutating func update(with other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
