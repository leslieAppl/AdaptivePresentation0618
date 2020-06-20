//
//  ATypePresentationManager.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ATypePresentationManager: NSObject {

}

extension ATypePresentationManager: UIViewControllerTransitioningDelegate {
    
    //Hooking up Presentation Controller
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentationController = ATypePresentationController(presentedViewController: presented, presenting: presenting)
        
        return presentationController
    }
}
