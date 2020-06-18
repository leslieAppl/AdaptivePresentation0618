//
//  ViewController.swift
//  AdaptivePresentation0618
//
//  Created by leslie on 6/18/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RedVcSegue" {
            print("Red VC")
            let controller = segue.destination as! RedVC
        }
        else if segue.identifier == "BlueVcSegue" {
            print("Blue VC")
            let controller = segue.destination as! BlueVC
            controller.presentationController?.delegate = controller
        }
    }
}

