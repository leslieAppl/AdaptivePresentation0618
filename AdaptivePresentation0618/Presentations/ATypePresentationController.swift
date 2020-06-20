//
//  ATypePresentationController.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ATypePresentationController: UIPresentationController {
    
//    private var isThis: Bool = false
    
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        
        
        return frame
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
        
        presentedView?.center = CGPoint(x: containerView!.center.x, y: containerView!.center.y)
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width*(2.0/3.0), height: parentSize.height*(2.0/3.0))
    }
}
