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

  private let sliderControl = UIView(frame: CGRect(x: 0, y: 0, width: 65, height: 41))
  private var progress = 0.0
  private var shouldMove = false

  private func setup() {
    self.backgroundColor = UIColor.lightGray
    sliderControl.clipsToBounds = true
    sliderControl.backgroundColor = .black
    sliderControl.layer.masksToBounds = true

    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.pan(_:)))
    self.addGestureRecognizer(panGesture)
    self.setNeedsLayout()
    self.addSubview(sliderControl)
  }

  @objc func pan(_ sender: UIPanGestureRecognizer) {
    let x = sender.location(in: self).x
    if x <= 0 || x > self.bounds.size.width - self.sliderControl.bounds.size.width {
      return
    }

    switch sender.state {
    case .began:
      shouldMove = x < sliderControl.bounds.size.width + 10
      self.sendActions(for: .editingDidBegin)
    case .changed:
      if shouldMove {
        sliderControl.frame.origin.x = x
        progress = (Double(min(x / self.bounds.size.width, 1)) + 0.1289) * 100
        self.sendActions(for: .valueChanged)
      }
    case .ended: fallthrough
    case .cancelled:
      if progress > 65 && sender.velocity(in: self).x > -1.0 {
        UIView.animate(withDuration: 0.5) {
          self.layoutIfNeeded()
          self.sliderControl.frame.origin.x = self.bounds.size.width - self.sliderControl.bounds.size.width
        }
      } else {
        UIView.animate(withDuration: 0.5) {
          self.layoutIfNeeded()
          self.sliderControl.frame.origin.x = 0
          self.progress = 0.0
        }
      }
    default: break
    }
  }

}
