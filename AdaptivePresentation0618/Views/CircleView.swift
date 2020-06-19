//
//  CircleView.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/19/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //@IBDesignable: showing code directly on Storyboard
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width/2
    }
}
