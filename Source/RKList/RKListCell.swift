//
//  RKListCell.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 31/05/2019.
//

import UIKit

/// ListCell represents a cell that ListHeaderController registers and dequeues for list rendering. T represents the Class Type, usually a model or view model object, this cell should render visually.
open class RKListCell<T>: UICollectionViewCell {
    
    /// item is fed in automatically from ListHeaderController
    open var item: T!
    
    /// parentController is set to the ListHeaderController that is rendering this cell.  This is useful for scenarios where a cell contains a UIButton and you want to use addTarget(...) to trigger an action in the controller.
    open weak var parentController: UIViewController?
    
    /// 90% of lists need a separator line
    public let separatorView = UIView().withBackground(color: UIColor(white: 0.6, alpha: 0.5))
    
    /// This convenience method sets up the separate line with some left padding
    open func addSeparatorView(leftPadding: CGFloat = 0) {
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: leftPadding).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    /// This sets up the separator to be anchored to some leading anchor
    open func addSeparatorView(leadingAnchor: NSLayoutXAxisAnchor) {
        addSubview(separatorView)
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: topAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
    }
    
    /// In your custom ListCell classes, just override setupViews() to provide custom behavior.  We do this to avoid overriding init methods.
    open func setupViews() {}
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
