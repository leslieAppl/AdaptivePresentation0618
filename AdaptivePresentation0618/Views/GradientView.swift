//
//  GradientView.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/19/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    let gradientLayer = CAGradientLayer()

    @IBInspectable
    var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable
    var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }

    override func layoutSubviews() {
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

    //@IBDesignable: showing code directly on Storyboard
    override func prepareForInterfaceBuilder() {
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
