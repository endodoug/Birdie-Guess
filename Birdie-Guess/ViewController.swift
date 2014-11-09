//
//  ViewController.swift
//  Birdie-Guess
//
//  Created by doug harper on 11/6/14.
//  Copyright (c) 2014 Doug Harper. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var currentValue🐦 = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = UIImage(named: "Bird-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "Bird-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable =
            trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable =
            trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue🐦)
        var points = 100 - difference
        
        var title: String
        if difference == 0 {
            title = "Bird-i-rific!"
            points += 100
        }else if difference < 5 {
            title = "Egg-celent"
            if difference == 1 {
                points += 51
            }
            if difference == 2 {
                points += 27
            }
        }else if difference < 10 {
            title = "So-So Bird"
        }else {
            title = "Dead Duck"
        }
        
        score += points
        
        let message = "The value of your Birdie is \(currentValue🐦)" + "\nThe target value was...  \(targetValue)" + "\nThe differnce is \(difference)" + "\nYou scored \(points) points!"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: {
            action in
                    self.startNewRound()
                    self.updateLabels()
        })
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved🐦(slider: UISlider) {
        currentValue🐦 = lroundf(slider.value)
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
        
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue🐦 = 50
        slider.value = Float(currentValue🐦)
    }
    
    func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

