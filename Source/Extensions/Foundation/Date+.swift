//
//  Date+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import Foundation

extension Date {
    
    public func asString(_ dateFormat: String = RKDateFormatter.MMM_d.rawValue) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
    
}
