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
    
    var names: [String] = ["Finn",
                           "BB8",
                           "Maz Kanata",
                           "Poe Dameron",
                           "Rey",
                           "Chewbacca",
                           "Princess Leia",
                           "Kylo Ren",
                           "Han Solo",
                           "R2D2",
                           "Luke Skywalker",
                           "C3PO",
                           "Stormtrooper",
                           "General Hux",
                           "Captain Phasma"]
    
    var charDescription: [String] = ["FN-2187 was trained since birth to serve the First Order as a stormtrooper, but a skirmish on Jakku awakened his conscience and drove him down a different path, one that proved both heroic and dangerous.",
                                     "A skittish but loyal astromech, BB-8 accompanied Poe Dameron on many missions for the Resistance, helping keep his X-wing in working order.",
                                     "Maz Kanata is more than a thousand years old, a diminutive being with vast experience at surviving in the underworld.",
                                     "Poe Dameron is a commander in the Resistance’s Starfighter Corps and one of Leia Organa’s most-trusted operatives. The son of a rebel fighter pilot and a rebel commando, Poe grew up on stories of Alliance campaigns.",
                                     "Rey is a Jakku scavenger, a survivor toughened by life on a harsh desert planet. When the fugitive droid BB-8 appeals to her for help, Rey finds herself drawn into a galaxy-spanning conflict.",
                                     "A legendary Wookiee warrior and Han Solo’s co-pilot aboard the Millennium Falcon, Chewbacca was part of a core group of Rebels who restored freedom to the galaxy.",
                                     "Princess Leia Organa was one of the Rebel Alliance’s greatest leaders, fearless on the battlefield and dedicated to ending the tyranny of the Empire.",
                                     "A dark warrior strong with the Force, Kylo Ren commands First Order missions with a temper as fiery as his unconventional lightsaber.",
                                     "Smuggler. Scoundrel. Hero. Han Solo, captain of the Millennium Falcon, was one of the great leaders of the Rebel Alliance.",
                                     "A resourceful astromech droid, R2-D2 served Padmé Amidala, Anakin Skywalker and Luke Skywalker in turn, showing great bravery in rescuing his masters and their friends from many perils.",
                                     "Luke Skywalker was a Tatooine farmboy who rose from humble beginnings to become one of the greatest Jedi the galaxy has ever known.",
                                     "C-3PO is a droid programmed for etiquette and protocol, built by the heroic Jedi Anakin Skywalker, and a constant companion to astromech R2-D2.",
                                     "Stormtroopers are elite shock troops fanatically loyal to the Empire and impossible to sway from the Imperial cause. They wear imposing white armor, which offers a wide range of survival equipment and temperature controls to allow the soldiers to survive in almost any environment.",
                                     "A young, ruthless officer in the First Order, General Hux has complete confidence in his troops, training methods and weapons.",
                                     "Clad in distinctive armor of salvaged chromium, Captain Phasma commands the First Order’s legions of stormtroopers."]
    
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
            
            // Add text under each image describing the character
            let textView = UITextView(frame: CGRect(x: newX - 100, y: scrollView.frame.size.height / 2 + 25, width: 200.0, height: 200.0))
            textView.text = names[i].uppercased() + "\n\n" + charDescription[i]
            scrollView.addSubview(textView)
            
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

