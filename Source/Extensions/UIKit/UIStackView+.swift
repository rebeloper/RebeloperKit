//
//  UIStackView+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

extension UIStackView {
    
    @discardableResult
    public func addBackground(color: UIColor) -> UIStackView {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
        return self
    }
    
}
