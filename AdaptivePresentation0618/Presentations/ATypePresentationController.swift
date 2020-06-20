//
//  ATypePresentationController.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ATypePresentationController: UIPresentationController {
    
    private var dimmingView: UIView!
    
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
        guard let dimmingView = self.dimmingView else { return }
        containerView?.addSubview(dimmingView)
        
        dimmingView.topAnchor.constraint(equalTo: containerView!.topAnchor).isActive = true
        dimmingView.bottomAnchor.constraint(equalTo: containerView!.bottomAnchor).isActive = true
        dimmingView.leadingAnchor.constraint(equalTo: containerView!.leadingAnchor).isActive = true
        dimmingView.trailingAnchor.constraint(equalTo: containerView!.trailingAnchor).isActive = true
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        coordinator.animate(alongsideTransition: { _ in
        dimmingView.alpha = 1.0
        })
        
    }
    
    ///dismissing dimming view
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            self.dimmingView.alpha = 0.0
            return
        }
        coordinator.animate(alongsideTransition: { (_) in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
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
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        dimmingView.alpha = 0.0
    }
}
