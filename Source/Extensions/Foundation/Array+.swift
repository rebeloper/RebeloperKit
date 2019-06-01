//
//  Array+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import Foundation

extension Array {
    
    // example: filter array of contacts where names and phone are equal (contacts are struct with name and phone properties)
    // let filteredContacts = myContacts.filterDuplicates { $0.name == $1.name && $0.phone == $1.phone }

    public func filterDuplicates(includeElement: @escaping (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element]{
        var results = [Element]()
        
        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        
        return results
    }
}

