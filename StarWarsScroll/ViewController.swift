//
//  ViewController.swift
//  StarWarsScroll
//
//  Created by Danny Luong on 6/22/17.
//  Copyright © 2017 dnylng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Reference to the scroll view
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Takes the scroll view's gesture recognizer and applies it to the main view
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Check the scroll view width
        print("Scroll View Width: \(scrollView.frame.size.width)")
        
        // Init a var that determines scrolling content width
        var contentWidth: CGFloat = 0.0
        
        // Scroll view's width
        let scrollWidth = scrollView.frame.size.width
        
        // Populate the images array
        for i in 0...14 {
            // Create an image taken from our assets
            let image = UIImage(named: "Individual-\(i).png")
            
            // Create an image view out of previous image
            let imageView = UIImageView(image: image)
            
            // Init a new variable to calc position of images when scrolling
            var newX: CGFloat = 0.0
            
            // Start in middle, add frame width depending on the index
            newX = (scrollWidth / 2) + scrollWidth * CGFloat(i)
            
            // Everytime we add a new image, increase content width
            contentWidth += scrollWidth
            
            // Add the image view under the scroll view
            scrollView.addSubview(imageView)
            
            // Center the image
            imageView.frame = CGRect(x: newX - 75, y: (scrollView.frame.size.height / 2) - 125, width: 150, height: 150)
        }
        
        // Don't clip the images ot the edges of the scroll view
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollView.frame.size.height)
        
        // Checking the size of the content should be 15 * scroll width
        print("Estimated Content Width: \(scrollWidth * 15)")
        print("Actual Content Width: \(contentWidth)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

