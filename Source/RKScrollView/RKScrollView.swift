//
//  RKScrollView.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 20/05/2019.
//

import UIKit

public class RKScrollView: UIScrollView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardDismissMode = .interactive
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
