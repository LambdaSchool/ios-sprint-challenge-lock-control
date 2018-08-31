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
  
  func setup() {
    self.backgroundColor = UIColor.red
    
    sliderControl.textAlignment = .center
    sliderControl.backgroundColor = .black
    
    self.addSubview(sliderControl)
  }
}
