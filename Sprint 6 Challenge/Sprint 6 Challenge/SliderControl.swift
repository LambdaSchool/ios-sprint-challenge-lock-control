//
//  SliderControl.swift
//  Sprint 6 Challenge
//
//  Created by Conner on 8/31/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class SliderControl: UIControl {

  required init?(coder aCoder: NSCoder) {
    super.init(coder: aCoder)
    setup()
  }

  private let sliderControl = UIView(frame: CGRect(x: 0, y: 0, width: 41, height: 41))
  public var progress = 0.0
  private var shouldMove = false

  private func setup() {
    self.backgroundColor = UIColor.lightGray
    sliderControl.backgroundColor = .black

    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(_:)))
    self.addGestureRecognizer(panGesture)
    self.addSubview(sliderControl)
  }
  
  public func fade() {
    UIView.animate(withDuration: 0.25, animations: {
      self.alpha = 0.0
    }) { (success) in
      self.progress = 0.0
      self.sliderControl.frame.origin.x = 0
    }
  }
  
  public func reset() {
    UIView.animate(withDuration: 0.25, animations: {
      self.alpha = 1.0
    }) { (success) in
      self.progress = 0.0
      self.sliderControl.frame.origin.x = 0
    }
  }

  @objc func pan(_ sender: UIPanGestureRecognizer) {
    let x = sender.location(in: self).x
    if x <= 0 || x > self.bounds.size.width - self.sliderControl.bounds.size.width {
      return
    }

    switch sender.state {
    case .began:
      shouldMove = x < sliderControl.bounds.size.width
      self.sendActions(for: .editingDidBegin)
    case .changed:
      if shouldMove {
        sliderControl.frame.origin.x = x - 20
        progress = (Double(min(x / self.bounds.size.width, 1)) + 0.1289) * 100
        self.sendActions(for: .valueChanged)
      }
    case .ended: fallthrough
    case .cancelled:
      shouldMove = false
      sliderControl.layoutIfNeeded()
      self.layoutIfNeeded()
      if progress > 65 && sender.velocity(in: self).x > -1.0 {
        UIView.animate(withDuration: 0.25, animations: {
          self.sliderControl.frame.origin.x = self.bounds.size.width - self.sliderControl.bounds.size.width
        }) { (success) in
          self.sendActions(for: .primaryActionTriggered)
        }
      } else {
        UIView.animate(withDuration: 0.25) {
          self.sliderControl.frame.origin.x = 0
          self.progress = 0.0
        }
      }
    default: break
    }
  }

}
