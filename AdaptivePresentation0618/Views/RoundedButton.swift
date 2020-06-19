//
//  RoundedButton.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/19/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat = 0.3 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    //@IBDesignable: showing code directly on Storyboard
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupButton()
    }
    
    func setupButton() {
        self.layer.cornerRadius = cornerRadius
    }
}
