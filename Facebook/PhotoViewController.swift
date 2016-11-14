//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Lauren Tindal on 11/13/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var doneButton: UIButton!
    var image: UIImage!
    var fadeTransition: FadeTransition!
    var selectedImageView: UIImageView!
    @IBOutlet weak var photoBar: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        
        photoBar.alpha = 1
        doneButton.alpha = 1
        
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.backgroundColor =
            UIColor(white: 0, alpha: 0.8)
        
        UIView.animate(withDuration: 0.3) { 
            self.photoBar.alpha = 0
            self.doneButton.alpha = 0
        }
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        let offset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y)
        
        if offset.y > 100  {
            dismiss(animated: true, completion: nil)
        }
        }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        self.photoBar.alpha = 1
        self.doneButton.alpha = 1
        return imageView
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.3) {
            self.photoBar.alpha = 1
            self.doneButton.alpha = 1
        }

    }
    
    @IBAction func didPressDone(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        

    }

}
