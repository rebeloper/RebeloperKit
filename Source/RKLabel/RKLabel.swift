//
//  RKLabel.swift
//  Pods
//
//  Created by Alex Nagy on 31/05/2019.
//

import UIKit

open class RKLabel: UILabel {
    
    public init(text: String?, font: UIFont? = UIFont.systemFont(ofSize: 14), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        super.init(frame: .zero)
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
