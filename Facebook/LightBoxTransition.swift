//
//  LightBoxTransition.swift
//  Facebook
//
//  Created by Sumit Kohli on 6/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
        toViewController.view.transform = CGAffineTransformMakeScale(1, 0.8)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        fromViewController.view.transform = CGAffineTransformMakeScale(1, 0.8)
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
        fromViewController.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

}
