//
//  LightBoxTransition.swift
//  Facebook
//
//  Created by Sumit Kohli on 6/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    var blackView = UIView()
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
//         let newsFeedController = fromViewController as! NewsFeedViewController
//         let photoViewController = toViewController as! PhotoViewController
        
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.8)
        blackView.frame.size = containerView.frame.size
        blackView.alpha = 0
        containerView.insertSubview(blackView, belowSubview: toViewController.view)
        
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(1, 0.8)
            self.blackView.alpha = 1
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        fromViewController.view.transform = CGAffineTransformMakeScale(1, 0.8)
        UIView.animateWithDuration(duration, animations: {
            self.blackView.alpha = 0
            fromViewController.view.alpha = 0
        fromViewController.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

}
