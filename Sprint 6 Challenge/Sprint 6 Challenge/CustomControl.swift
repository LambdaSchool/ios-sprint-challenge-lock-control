//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Michael Flowers on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    //we want to set the value of the x position equal to that of the control's value changed value
    var xValue = 0.0
    
    //create your uiView inside the custom control
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
 
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
       updateValue(for: touch)
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            updateValue(for: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(for touch: UITouch){
        let touch = touch.location(in: self)
        let xRange = touch.x / bounds.width
        xValue = Double(xRange)
        sendActions(for: .valueChanged)
    }
    
    func setup(){
        let thumbnail = UIView()
        //origin: the x and y position
        let origin = CGPoint(x: 19, y: 0)
        //size: the width and height
        let size = CGSize(width: 40, height: bounds.height)
        //set the frame of the view or the cgrect
        thumbnail.frame = CGRect(origin: origin, size: size)
        thumbnail.backgroundColor = .black
        thumbnail.layer.borderColor = UIColor.white.cgColor
        thumbnail.layer.borderWidth = 2.0
        thumbnail.layer.cornerRadius = bounds.width / 2
        //add it inside of the control
        addSubview(thumbnail)
    }

}
