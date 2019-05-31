//
//  RKScrollViewElement.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 20/05/2019.
//

import UIKit

public class RKScrollViewElement: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(size: CGSize, backgroundColor: UIColor = .white) {
        self.init()
        setWidth(to: size.width)
        setHeight(to: size.height)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(width: CGFloat, height: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        setWidth(to: width)
        setHeight(to: height)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(width: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        setWidth(to: width)
        self.backgroundColor = backgroundColor
    }
    
    public convenience init(height: CGFloat, backgroundColor: UIColor = .white) {
        self.init()
        setHeight(to: height)
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

