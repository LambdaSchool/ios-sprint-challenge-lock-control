//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wrapperView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var customControlProperties: CustomControl!
    @IBOutlet weak var resetProperties: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func customControlValueChanged(_ sender: CustomControl) {
    }
    
    @IBAction func resetTheView(_ sender: UIBarButtonItem) {
    }
}

