//
//  ATypePresentationController.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ATypePresentationController: UIPresentationController {
    
    ///Resizing and re-allocating presented view
    override var frameOfPresentedViewInContainerView: CGRect {
        var frame: CGRect = .zero
        
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerView!.bounds.size)
        
        return frame
    }
    
    ///Override Inisializer
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        setupDimmingView()
    }
    
    ///Adding dimming view
    override func presentationTransitionWillBegin() {
        
    }
    
    ///dismissing dimming view
    override func dismissalTransitionWillBegin() {
        
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
        
        ///Centering subView to its superView
        presentedView?.center = CGPoint(x: containerView!.center.x, y: containerView!.center.y)
    }
    
    ///Resizing and re-allocating presented view
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width*(2.0/3.0), height: parentSize.height*(2.0/3.0))
    }
}

extension ATypePresentationController {
    func setupDimmingView() {
        print("Setting up Dimming View")
    }
}
