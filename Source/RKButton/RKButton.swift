//
//  RKButton.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import UIKit

open class RKButton: UIButton {
    
    public init(title: String, titleColor: UIColor, font: UIFont = .systemFont(ofSize: 14), backgroundColor: UIColor = .clear, cornerRadius: CGFloat = 0, borderWith: CGFloat = 0, borderColor: UIColor = .clear, target: Any? = nil, action: Selector? = nil) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWith
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    public init(image: UIImage, tintColor: UIColor? = nil, target: Any? = nil, action: Selector? = nil) {
        super.init(frame: .zero)
        if tintColor == nil {
            setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
            self.tintColor = tintColor
        }
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}