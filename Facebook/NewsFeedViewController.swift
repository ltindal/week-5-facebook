//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImageView: UIImageView!
    
    var fadeTransition: FadeTransition!
    var lightBoxTransition: LightBoxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSize(width: 320, height: feedImageView.image!.size.height)
        scrollView.delegate = self
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }

    @IBAction func didTapPhoto(_ sender: UITapGestureRecognizer) {
        
        selectedImageView = sender.view as! UIImageView
        performSegue(withIdentifier: "expandPhoto", sender: nil)
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination as! PhotoViewController
        
        //destinationViewController.image = self.imageView.image
        destinationViewController.image = selectedImageView.image
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        //lightBoxTransition = LightBoxTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 1.0
        
        UIView.animate(withDuration: 0.3, animations: {
            let window = UIApplication.shared.keyWindow
            let frame = window!.convert(self.selectedImageView.frame, from: destinationViewController.imageView)
            window!.addSubview(self.selectedImageView)
            self.selectedImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 420)
            
        }) { (Bool) in
            UIView.animate(withDuration: 0.5, animations: {
                //self.selectedImageView.removeFromSuperview()
                self.selectedImageView.alpha = 0
            })
        }

        
        
    }
    
    }

    

