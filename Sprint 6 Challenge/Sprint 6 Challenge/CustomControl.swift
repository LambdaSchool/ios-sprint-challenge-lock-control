//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Diante Lewis-Jolley on 2/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {

    var Xvalue = 0.0
    

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
    }

    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        let x = touchPoint.x / bounds.width
        Xvalue = Double(x)
        sendActions(for: [.valueChanged])
    }


        override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)

        if bounds.contains(touchPoint) {
            //Edit Here
            sendActions(for: [.valueChanged, .touchDragInside])

        } else {
            sendActions(for: [.valueChanged, .touchDragOutside])
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}

        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)

        if bounds.contains(touchPoint) {
            //Edit here

            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.valueChanged, .touchUpOutside])
        }
    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }



}
