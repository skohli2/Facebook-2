//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Sumit Kohli on 6/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var photoImage: UIImage!
    var originalCenter: CGPoint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = photoImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onDoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onPhotoPan(sender: UIPanGestureRecognizer) {
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            originalCenter = scrollView.center
            print("Gesture began")
        } else if sender.state == UIGestureRecognizerState.Changed {
            scrollView.center = CGPoint(x: originalCenter.x, y: originalCenter.y + translation.y)
            if translation.y > 100 {
                dismissViewControllerAnimated(true, completion: nil)
            }

            print("Gesture is changing")
        } else if sender.state == UIGestureRecognizerState.Ended {
            if translation.y > 50 {
             dismissViewControllerAnimated(true, completion: nil)
            } else {
            scrollView.center = originalCenter

            }
            print("Gesture ended")
        }
    }
}
