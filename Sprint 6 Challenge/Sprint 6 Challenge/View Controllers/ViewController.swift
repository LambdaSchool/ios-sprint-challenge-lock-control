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
    title = "Locked"
    self.navigationItem.rightBarButtonItem = nil
  }

  @IBAction func reset(_ sender: Any) {
    title = "Locked"
    imageView.image = #imageLiteral(resourceName: "Locked")
    slider.reset()
    self.navigationItem.rightBarButtonItem = nil
  }

  @IBAction func unlock(_ slider: SliderControl) {
    title = "Unlocked!"
    self.imageView.image = #imageLiteral(resourceName: "Unlocked")
    slider.fade()
    self.navigationItem.rightBarButtonItem = resetButton
  }

  @IBOutlet var resetButton: UIBarButtonItem!
  @IBOutlet var slider: SliderControl!
  @IBOutlet var imageView: UIImageView!
}

