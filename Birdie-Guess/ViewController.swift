//
//  ViewController.swift
//  Birdie-Guess
//
//  Created by doug harper on 11/6/14.
//  Copyright (c) 2014 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue🐦 = 0
    var targetValue = 0
    
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let message = "The value of your Birdie is... \(currentValue🐦)" + "\nThe target value is \(targetValue)."
        
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved🐦(slider: UISlider) {
        currentValue🐦 = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue🐦 = 50
        slider.value = Float(currentValue🐦)
    }
}

