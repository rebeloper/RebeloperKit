//
//  ViewController.swift
//  RebeloperKit
//
//  Created by rebeloper on 05/20/2019.
//  Copyright (c) 2019 rebeloper. All rights reserved.
//

import UIKit
import RebeloperKit

class ViewController: UIViewController {
    
    let scrollView = RKScrollView()
    let scrollViewContainer = RKScrollViewContainer(axis: .vertical, spacing: 10)
    let scrollViewElement = RKScrollViewElement(height: 1200)
    let scrollViewElement2 = RKScrollViewElement(height: 600).withBackground(color: .green)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addScrollView(scrollView,
                           withSafeArea: .top,
                           hasStatusBarCover: true,
                           statusBarBackgroundColor: .purple,
                           container: scrollViewContainer,
                           elements: [scrollViewElement, scrollViewElement2])
    }
    
}
