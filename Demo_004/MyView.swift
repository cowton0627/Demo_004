//
//  MyView.swift
//  Demo_004
//
//  Created by 鄭淳澧 on 2021/9/12.
//

import UIKit

@IBDesignable
class MyView: UIView {
    @IBInspectable var enableGradientBackground: Bool = false
    @IBInspectable var gradientStartColor: UIColor = UIColor.black
    @IBInspectable var gradientEndColor: UIColor = UIColor.white

    private var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
//        if enableGradientBackground {
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.frame = self.bounds
//            gradientLayer.colors = [gradientColor1.cgColor,
//                                    gradientColor2.cgColor]
//            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//            self.layer.insertSublayer(gradientLayer, at: 0)
//        }
        
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

