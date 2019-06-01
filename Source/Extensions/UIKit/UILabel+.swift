//
//  UILabel+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

extension UILabel {
    public func getHeight(for width: CGFloat) -> CGFloat {
        var currentHeight: CGFloat!
        
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        currentHeight = label.frame.height
        label.removeFromSuperview()
        
        return currentHeight
    }
    
    public func getWidth(for height: CGFloat) -> CGFloat {
        
        var currentWidth: CGFloat!
        
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        label.numberOfLines = 1
        label.font = font
        label.text = text
        label.sizeToFit()
        
        currentWidth = label.frame.width
        label.removeFromSuperview()
        
        return currentWidth
    }
}
