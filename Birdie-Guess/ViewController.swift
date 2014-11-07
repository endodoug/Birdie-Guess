//
//  ViewController.swift
//  Birdie-Guess
//
//  Created by doug harper on 11/6/14.
//  Copyright (c) 2014 Doug Harper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "My first App with GitHub", preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "Awesome", style: .Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
}

