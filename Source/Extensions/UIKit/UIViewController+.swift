//
//  UIViewController+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 01/06/2019.
//

import UIKit

extension UIViewController {
    
    public func setTabBarVisible(visible: Bool, animated: Bool, offsetY: CGFloat = 0) {
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        if (isTabBarVisible == visible) { return }
        
        // get a frame calculation ready
        guard let frame = self.tabBarController?.tabBar.frame else { return }
        let height = frame.size.height + offsetY
        let offsetY = (visible ? -height : height)
        
        // zero duration means no animation
        let duration: TimeInterval = (animated ? 0.3 : 0.0)
        
        //  animate the tabBar
        UIView.animate(withDuration: duration) {
            self.tabBarController?.tabBar.frame = frame.offsetBy(dx: 0, dy: offsetY)
            return
        }
    }
    
    public var isTabBarVisible: Bool {
        return (self.tabBarController?.tabBar.frame.origin.y ?? 0) < self.view.frame.maxY
    }
    
    public func presentInNavController(viewController: UIViewController, animated: Bool = false, completion: (() -> Void)? = nil) {
        let navController = UINavigationController(rootViewController: viewController)
        self.present(navController, animated: animated, completion: completion)
    }
}

