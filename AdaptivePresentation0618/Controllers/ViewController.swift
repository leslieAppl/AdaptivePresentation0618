//
//  ViewController.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/18/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var aTypeTransitioningDelegate = ATypePresentationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Image Pattern
        if let myPattern = UIImage(named: "fiveRings") {        
            view.backgroundColor = UIColor(patternImage: myPattern)
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RedVcSegue" {
            print("Red VC")
            let controller = segue.destination as! RedVC
                        
            //TODO: Resizing the presented view
            controller.transitioningDelegate = aTypeTransitioningDelegate
            controller.modalPresentationStyle = .custom
            
            //TODO: Inserting and dismissing custom subView (a dimming view) during the custom presentation
        }
        else if segue.identifier == "BlueVcSegue" {
            print("Blue VC")
            let controller = segue.destination as! BlueVC
            controller.presentationController?.delegate = controller
        }
    }
}

