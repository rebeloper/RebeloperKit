//
//  UIView+.swift
//  RebeloperKit
//
//  Created by Alex Nagy on 20/05/2019.
//

import UIKit
import Foundation

typealias Spacer = UIView

public enum RKViewSafeArea {
    case top, leading, trailing, bottom, vertical, horizontal, all, none
}

extension UIView {
    
    public func edgeTo(_ view: UIView, safeArea: RKViewSafeArea = .none) {
        translatesAutoresizingMaskIntoConstraints = false
        
        switch safeArea {
        case .top:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .leading:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .trailing:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .bottom:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .vertical:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .horizontal:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        case .all:
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        case .none:
            topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        
    }
    
    public func setHeight(to height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public func setWidth(to width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    @discardableResult
    public func withBackground(color: UIColor) -> UIView {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    public func withBackground(image: UIImage, contentMode: ContentMode = .scaleAspectFit) -> UIView {
        let imageView = UIImageView(image: image.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = contentMode
        self.addSubview(imageView)
        imageView.edgeTo(self)
        return self
    }
    
    @discardableResult
    public func addStatusBarCover(backgroundColor: UIColor = .white) -> UIView {
        let cover = UIView().withBackground(color: backgroundColor)
        addSubview(cover)
        
        cover.translatesAutoresizingMaskIntoConstraints = false
        
        cover.topAnchor.constraint(equalTo: topAnchor).isActive = true
        cover.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        cover.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        cover.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        
        return self
    }
    
    public func addScrollView(_ scrollView: RKScrollView, withSafeArea: RKViewSafeArea = .none, hasStatusBarCover: Bool = false, statusBarBackgroundColor: UIColor = .white, container: RKScrollViewContainer, elements: [UIView]) {
        addSubview(scrollView)
        scrollView.addSubview(container)
        
        if hasStatusBarCover {
            addStatusBarCover(backgroundColor: statusBarBackgroundColor)
        }
        
        scrollView.edgeTo(self, safeArea: withSafeArea)
        container.edgeTo(scrollView)
        
        elements.forEach { (element) in
            container.addArrangedSubview(element)
        }
        
    }
    
    @discardableResult
    open func withSize<T: UIView>(_ size: CGSize) -> T {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
        return self as! T
    }
    
    @discardableResult
    open func withHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    open func withWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
}

extension UIView {
    
    /**
     Rotate a view by specified degrees
     
     - parameter angle: angle in degrees
     */
    public func rotate(by angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
    
    public func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
            let image = renderer.image { ctx in
                self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
            }
            return image
        } else {
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            guard let cgImage = image?.cgImage else { return nil }
            return UIImage(cgImage: cgImage)
        }
    }
    
    /// add multiple subviews
    public func addSubviews(_ views: UIView...) {
        views.forEach { [weak self] eachView in
            self?.addSubview(eachView)
        }
    }
    
    /// remove all subviews
    public func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
}

// MARK: Layer Extensions
extension UIView {
    
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func addShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        if let r = cornerRadius {
            self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath
        }
    }
    
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    
    public func addBorderTop(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: frame.width, radius: size, color: color)
    }
    
    public func addBorderTopWithPadding(size: CGFloat, color: UIColor, padding: CGFloat) {
        addBorderUtility(x: padding, y: 0, width: frame.width - padding*2, radius: size, color: color)
    }
    
    public func addBorderBottom(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: frame.height - size, width: frame.width, radius: size, color: color)
    }
    
    public func addBorderLeft(size: CGFloat, color: UIColor) {
        addBorderUtility(x: 0, y: 0, width: size, radius: frame.height, color: color)
    }
    
    public func addBorderRight(size: CGFloat, color: UIColor) {
        addBorderUtility(x: frame.width - size, y: 0, width: size, radius: frame.height, color: color)
    }
    
    fileprivate func addBorderUtility(x: CGFloat, y: CGFloat, width: CGFloat, radius: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: radius)
        layer.addSublayer(border)
    }
}

// MARK: Transform Extensions
extension UIView {
    public func setScale(x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity
        transform.m34 = 1.0 / -1000.0
        transform = CATransform3DScale(transform, x, y, 1)
        self.layer.transform = transform
    }
}

// MARK: Animation Extensions
private let UIViewAnimationDuration: TimeInterval = 1
private let UIViewAnimationSpringDamping: CGFloat = 0.5
private let UIViewAnimationSpringVelocity: CGFloat = 0.5

extension UIView {
    
    public func spring(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        spring(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    public func spring(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: UIViewAnimationDuration,
            delay: 0,
            usingSpringWithDamping: UIViewAnimationSpringDamping,
            initialSpringVelocity: UIViewAnimationSpringVelocity,
            options: UIView.AnimationOptions.allowAnimatedContent,
            animations: animations,
            completion: completion
        )
    }
    
    public func animate(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: animations, completion: completion)
    }
    
    public func animate(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        animate(duration: UIViewAnimationDuration, animations: animations, completion: completion)
    }
    
    public func pop() {
        setScale(x: 1.1, y: 1.1)
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1)
        })
    }
    
    public func popBig() {
        setScale(x: 1.25, y: 1.25)
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1)
        })
    }
    
    public func reversePop() {
        setScale(x: 0.9, y: 0.9)
        UIView.animate(withDuration: 0.05, delay: 0, options: .allowUserInteraction, animations: {[weak self] in
            self?.setScale(x: 1, y: 1)
            }, completion: { (_) in })
    }
}

extension UIView {
    /// Shakes the view for as many number of times as given in the argument.
    public func shakeViewForTimes(_ times: Int) {
        let anim = CAKeyframeAnimation(keyPath: "transform")
        anim.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(-5, 0, 0 )),
            NSValue(caTransform3D: CATransform3DMakeTranslation( 5, 0, 0 ))
        ]
        anim.autoreverses = true
        anim.repeatCount = Float(times)
        anim.duration = 7/100
        
        self.layer.add(anim, forKey: nil)
    }
}

// MARK: Fade Extensions
public let UIViewDefaultFadeDuration: TimeInterval = 0.4

extension UIView {
    /// Fade in with duration, delay and completion block.
    public func fadeIn(_ duration: TimeInterval? = UIViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        fadeTo(1.0, duration: duration, delay: delay, completion: completion)
    }
    
    public func fadeOut(_ duration: TimeInterval? = UIViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        fadeTo(0.0, duration: duration, delay: delay, completion: completion)
    }
    
    /// Fade to specific value with duration, delay and completion block.
    public func fadeTo(_ value: CGFloat, duration: TimeInterval? = UIViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration ?? UIViewDefaultFadeDuration, delay: delay ?? UIViewDefaultFadeDuration, options: .curveEaseInOut, animations: {
            self.alpha = value
        }, completion: completion)
    }
}

