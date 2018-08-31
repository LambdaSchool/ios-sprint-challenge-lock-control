//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Conner on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SliderControl: UIControl {
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aCoder: NSCoder) {
    super.init(coder: aCoder)
    setup()
  }
  
  private let sliderControl = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 41))
  private var progress = 0.0
  
  private func setup() {
    self.backgroundColor = UIColor.lightGray
    
    sliderControl.textAlignment = .center
    sliderControl.backgroundColor = .black
    
    
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(_:)))
    self.addGestureRecognizer(panGesture)
    self.addSubview(sliderControl)
//    sliderControl.translatesAutoresizingMaskIntoConstraints = false
    let horizontalConstraint = NSLayoutConstraint(item: sliderControl,
                                                  attribute: .leading,
                                                  relatedBy: .equal,
                                                  toItem: sliderControl,
                                                  attribute: .leading,
                                                  multiplier: 1,
                                                  constant: 10)
    
    NSLayoutConstraint.activate([horizontalConstraint])
  }
  
  @objc func pan(_ sender: UIPanGestureRecognizer) {
    let x = sender.location(in: self).x
    print(x)
    
    switch sender.state {
    case .began:
      self.sendActions(for: .editingDidBegin)
    case .changed:
      self.sendActions(for: .valueChanged)
    default:
      break
    }
  }
  
}
