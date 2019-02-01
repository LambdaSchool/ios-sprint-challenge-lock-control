//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
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

    
    @IBAction func ballValueChanged(_ sender: CustomControl) {
    }
    
    @IBAction func lock(_ sender: UIBarButtonItem) {
    }
    
    
    
    // MARK: - Properties
    
    @IBOutlet weak var overallView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderView: UIView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var lockButton: UIBarButtonItem!
    
}

