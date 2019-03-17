//
//  ViewController.swift
//  ActionSheet
//
//  Created by Roger Prats on 17/03/2019.
//  Copyright © 2019 Roger Prats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    @IBAction func showActionSheet() {
        let controller = ActionSheetController()
        controller.transitioningDelegate = slideInTransitioningDelegate
        controller.modalPresentationStyle = .custom
        present(controller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


