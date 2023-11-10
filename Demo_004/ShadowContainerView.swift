//
//  ShadowContainerView.swift
//  Demo_004
//
//  Created by Chun-Li Cheng on 2023/11/10.
//

import UIKit

@IBDesignable
class ShadowContainerView: UIView {
    
    // Initialize the button
//    let button = RoundedCornerButton()
    
    // Shadow properties
    @IBInspectable var shadowColor: UIColor = .clear {
        didSet { updateShadow() }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet { updateShadow() }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet { updateShadow() }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet { updateShadow() }
    }
    
    // The rest of your inspectable properties...
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Configure the container view's shadow
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: button.cornerRadius).cgPath
        layer.masksToBounds = false
        
        // Configure the button
//        button.frame = bounds
//        button.layer.cornerRadius = button.cornerRadius
//        button.layer.masksToBounds = true
//        addSubview(button)
    }
    
    private func updateShadow() {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
}

