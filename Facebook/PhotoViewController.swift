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
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var doneButton: UIImageView!
    @IBOutlet weak var photoActionsButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        scrollView.delegate = self 
        imageView.image = photoImage
       parentView.backgroundColor = UIColor(white: 0, alpha: 0.3)

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
        scrollView.backgroundColor = UIColor(white: 0, alpha: 0.4)
           // LightBoxTransition
        doneButton.alpha = 0.2
            photoActionsButton.alpha = 0.2
           
            if translation.y > 100 {
                dismissViewControllerAnimated(true, completion: nil)
                
            }

            print("Gesture is changing")
        } else if sender.state == UIGestureRecognizerState.Ended {
         //   if translation.y > 100 {
           //  dismissViewControllerAnimated(true, completion: nil)
         //   } else {
            scrollView.center = originalCenter
            doneButton.alpha = 1
            photoActionsButton.alpha = 1
           // }
            print("Gesture ended")
        }
    }
}
