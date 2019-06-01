//
//  RKImageView.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

open class RKImageView: UIImageView {
    
    public init(image: UIImage? = nil, contentMode: UIView.ContentMode = .scaleAspectFill, cornerRadius: CGFloat = 0) {
        super.init(image: image)
        self.layer.cornerRadius = cornerRadius
        self.contentMode = contentMode
        clipsToBounds = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
