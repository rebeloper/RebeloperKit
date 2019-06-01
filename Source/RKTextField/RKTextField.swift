//
//  RKTextField.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

open class RKTextField: UITextField {
    
    public init(placeholder: String? = nil, cornerRadius: CGFloat, keyboardType: UIKeyboardType = .default, backgroundColor: UIColor = .clear, isSecureTextEntry: Bool = false) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

