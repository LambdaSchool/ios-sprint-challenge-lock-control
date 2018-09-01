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
  }
  
  @IBAction func reset(_ sender: Any) {
    imageView.image = #imageLiteral(resourceName: "Locked")
    slider.reset()
  }
  
  @IBAction func unlock(_ slider: SliderControl) {
    self.imageView.image = #imageLiteral(resourceName: "Unlocked")
    slider.fade()
  }
  
  @IBOutlet var slider: SliderControl!
  @IBOutlet var imageView: UIImageView!
}

