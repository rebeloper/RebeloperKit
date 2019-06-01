//
//  Double+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import Foundation

extension Double {
    public func rounded(to places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    public func convert(from originalUnit: UnitLength, to convertedUnit: UnitLength) -> Double {
        return Measurement(value: self, unit: originalUnit).converted(to: convertedUnit).value
    }
}
