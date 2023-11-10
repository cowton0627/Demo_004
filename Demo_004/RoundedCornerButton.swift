//
//  CornerRadius.swift
//  Demo_004
//
//  Created by 鄭淳澧 on 2021/9/12.
//

import Foundation
import UIKit

@IBDesignable
class RoundedCornerButton: UIButton {
    
    @IBInspectable var localizationKey: String? {
        didSet {
            setTitle(localizationKey?.localized, for: .normal)
        }
    }
    
    private var gradientLayer: CAGradientLayer?

    
    // setup cornerRadius
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    // setup borderWidth & borderColer
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet { layer.borderWidth = borderWidth }
    }
    @IBInspectable var borderColor: UIColor = .black {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    
    // setup title padding
    @IBInspectable var titleLeftPadding: CGFloat = 0.0 {
        didSet { titleEdgeInsets.left = titleLeftPadding }
    }
    @IBInspectable var titleRightPadding: CGFloat = 0.0 {
        didSet { titleEdgeInsets.right = titleRightPadding }
    }
    @IBInspectable var titleTopPadding: CGFloat = 0.0 {
        didSet { titleEdgeInsets.top = titleTopPadding }
    }
    @IBInspectable var titleBottomPadding: CGFloat = 0.0 {
        didSet { titleEdgeInsets.bottom = titleBottomPadding }
    }
    
    // setup image padding
    @IBInspectable var imageLeftPadding: CGFloat = 0.0 {
        didSet { imageEdgeInsets.left = imageLeftPadding }
    }
    @IBInspectable var imageRightPadding: CGFloat = 0.0 {
        didSet { imageEdgeInsets.right = imageRightPadding }
    }
    @IBInspectable var imageTopPadding: CGFloat = 0.0 {
        didSet { imageEdgeInsets.top = imageTopPadding }
    }
    @IBInspectable var imageBottomPadding: CGFloat = 0.0 {
        didSet { imageEdgeInsets.bottom = imageBottomPadding }
    }
    
    // setup gradient background
    @IBInspectable var enableGradientBackground: Bool = false
    @IBInspectable var gradientStartColor: UIColor = UIColor.black
    @IBInspectable var gradientEndColor: UIColor = UIColor.white
    
    @IBInspectable var gradientStartPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
        didSet { gradientLayer?.startPoint = gradientStartPoint }
    }
    @IBInspectable var gradientEndPoint: CGPoint = CGPoint(x: 0.5, y: 1.0) {
        didSet { gradientLayer?.endPoint = gradientEndPoint }
    }

    
//    @IBInspectable var highlightedBackgroundColor: UIColor?
//    @IBInspectable var highlightedTitleColor: UIColor?
//    @IBInspectable var normalBackgroundColor: UIColor?
////    = .systemBlue
//    @IBInspectable var normalTitleColor: UIColor?
////    = .systemRed
//    override var isHighlighted: Bool {
//        didSet {
//            backgroundColor = isHighlighted ? highlightedBackgroundColor : normalBackgroundColor
//            setTitleColor(isHighlighted ? highlightedTitleColor : normalTitleColor, for: .normal)
//        }
//    }


    override func layoutSubviews() {
        super.layoutSubviews()
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.bounds
//        gradientLayer.colors = [gradientStartColor.cgColor,
//                                gradientEndColor.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        self.layer.insertSublayer(gradientLayer, at: 0)

        // Gradient background
        if enableGradientBackground {
            if gradientLayer == nil {
                let gradient = CAGradientLayer()
                gradient.name = "customGradient"
                gradient.frame = bounds
                gradient.colors = [gradientStartColor.cgColor, gradientEndColor.cgColor]
                layer.insertSublayer(gradient, at: 0)
                gradientLayer = gradient
            } else {
                gradientLayer?.frame = bounds
            }
        } else {
            gradientLayer?.removeFromSuperlayer()
            gradientLayer = nil
        }
                
        
    }
    
    
}

