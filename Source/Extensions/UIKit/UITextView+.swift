//
//  UITextView+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

extension UITextView {
    public func getHeight(for width: CGFloat) -> CGFloat {
        
        var currentHeight: CGFloat!
        
        let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        textView.font = font
        textView.text = text
        textView.sizeToFit()
        
        currentHeight = textView.frame.height
        textView.removeFromSuperview()
        
        return currentHeight
    }
    
    public func getWidth(for height: CGFloat) -> CGFloat {
        
        var currentWidth: CGFloat!
        
        let textView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        textView.font = font
        textView.text = text
        textView.sizeToFit()
        
        currentWidth = textView.frame.width
        textView.removeFromSuperview()
        
        return currentWidth
    }
}
