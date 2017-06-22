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
    
    // An array of images to display and scroll through
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var contentWidth: CGFloat = 0.0 // Init a var that determines scrolling content width
        
        // Populate the images array
        for i in 0...14 {
            let image = UIImage(named: "Individual-\(i).png") // Create an image taken from our assets
            let imageView = UIImageView(image: image) // Create an image view out of previous image
            images.append(imageView) // Add the image view into the array
            
            var newX: CGFloat = 0.0 // Init a new variable to calc position of images when scrolling
            newX = view.frame.midX + view.frame.size.width * CGFloat(i) // Start in middle, add frame width depending on the index
            contentWidth += view.frame.size.width // Everytime we add a new image, increase content width
            
            scrollView.addSubview(imageView) // Add the image view under the scroll view
            
            imageView.frame = CGRect(x: newX - 75, y: view.frame.midY - 150, width: 150, height: 150) // Center the image
        }
        
        // Checking the size of the array there should be 15
        print("Images Count: \(images.count)")
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        // Checking the size of the content should be 15 * frame
        print("Frame Width: \(view.frame.size.width)")
        print("Estimated Content Width: \(view.frame.size.width * 15)")
        print("Actual Content Width: \(contentWidth)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

