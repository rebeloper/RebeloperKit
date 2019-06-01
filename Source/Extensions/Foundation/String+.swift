//
//  String+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import Foundation

extension String {
    public func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
    
    public func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
}

extension StringProtocol {
    
    public subscript(offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }
    
    public subscript(_ range: CountableRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    public subscript(range: CountableClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count)
            .suffix(range.count)
    }
    
    public subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        return prefix(range.upperBound.advanced(by: 1))
    }
    
    public subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        return prefix(range.upperBound)
    }
    
    public subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        return suffix(Swift.max(0, count - range.lowerBound))
    }
}
extension Substring {
    public var string: String { return String(self) }
}
extension BidirectionalCollection {
    public subscript(safe offset: Int) -> Element? {
        guard !isEmpty, let i = index(startIndex, offsetBy: offset, limitedBy: index(before: endIndex)) else { return nil }
        return self[i]
    }
}
//let test = "Hello USA 🇺🇸!!! Hello Brazil 🇧🇷!!!"
//test[safe: 10]   // "🇺🇸"
//test[11]   // "!"
//test[10...]   // "🇺🇸!!! Hello Brazil 🇧🇷!!!"
//test[10..<12]   // "🇺🇸!"
//test[10...12]   // "🇺🇸!!"
//test[...10]   // "Hello USA 🇺🇸"
//test[..<10]   // "Hello USA "
//test.first   // "H"
//test.last    // "!"
//
//// Subscripting the Substring
//test[...][...3]  // "Hell"
//
//// Note that they all return a Substring of the original String.
//// To create a new String you need to add .string as follow
//test[10...].string  // "🇺🇸!!! Hello Brazil 🇧🇷!!!"

