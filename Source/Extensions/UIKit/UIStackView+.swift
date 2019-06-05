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
    
    @discardableResult
    public func addBackground(image: UIImage, contentMode: UIView.ContentMode = .scaleAspectFill) -> UIStackView {
        let subview = UIImageView(frame: bounds)
        subview.image = image
        subview.contentMode = contentMode
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
        return self
    }
    
    @discardableResult
    public func debug() -> UIStackView {
        let subview = UIView(frame: bounds)
        let randomColor = UIColor.random
        subview.backgroundColor = randomColor.withAlphaComponent(0.3)
        subview.addBorder(width: 1, color: randomColor)
        subview.setCornerRadius(radius: 3)
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
        return self
    }
    
}

extension UIStackView {
    
    @discardableResult
    open func pad(_ margins: RKPadding..., amount: CGFloat) -> UIStackView {
        isLayoutMarginsRelativeArrangement = true
        
        margins.forEach { (padding) in
            switch padding {
            case .top:
                layoutMargins.top = amount
            case .left:
                layoutMargins.left = amount
            case .right:
                layoutMargins.right = amount
            case .bottom:
                layoutMargins.bottom = amount
            case .verticalMargins:
                layoutMargins.top = amount
                layoutMargins.bottom = amount
            case .horizontalMargins:
                layoutMargins.left = amount
                layoutMargins.right = amount
            case .allMargins:
                layoutMargins = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
            }
        }
        
        return self
    }
    
}

