//
//  PresentationController.swift
//  ActionSheet
//
//  Created by Roger Prats on 17/03/2019.
//  Copyright © 2019 Roger Prats. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    fileprivate var dimmingView: UIView!
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    override func presentationTransitionWillBegin() {
        
        // Add a custom dimming view behind the presented view controller's view
        self.containerView?.addSubview(dimmingView)
        dimmingView.frame = presentingViewController.view.frame
        dimmingView.addSubview(self.presentedViewController.view)
        
        // Use the transition coordinator to set up the animations.
        let transitionCoordinator = self.presentingViewController.transitionCoordinator
        
        // Fade in the dimming view during the transition.
        dimmingView.alpha = 0.0
        transitionCoordinator?.animate(alongsideTransition: { (context) in
            self.dimmingView.alpha = 1.0
        }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        // Remove the dimming view if the presentation was aborted.
        if !completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    @objc dynamic func handleTap(recognizer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true)
        dimmingView.alpha = 0.0
    }
    
    override func size(forChildContentContainer container: UIContentContainer,
                       withParentContainerSize parentSize: CGSize) -> CGSize {
        
        return CGSize(width: parentSize.width, height: parentSize.height*0.5)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        //1
        var frame: CGRect = .zero
        frame.size = size(forChildContentContainer: presentedViewController,
                          withParentContainerSize: containerView!.bounds.size)
        //2
        //        frame.origin = .zero
        frame.origin = CGPoint(x: 0, y: containerView!.bounds.height / 2)
        return frame
    }
}

class SlideInPresentationManager: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController,
                                presenting: UIViewController?,
                                source: UIViewController) -> UIPresentationController? {
        let presentationController = PresentationController(presentedViewController: presented,
                                                            presenting: presenting)
        return presentationController
    }
}
