//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Cameron Dunn on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class CustomControl : UIControl{
    var amountDragged : CGFloat = 0
    let VC = ViewController()
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch : AnyObject in touches{
            sendActions(for: [.valueChanged, .touchDragInside])
            let pointOfTouch = touch.location(in: self)
            let previousTouch = touch.previousLocation(in: self)
            amountDragged = pointOfTouch.x - previousTouch.x
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        sendActions(for: .touchUpInside)
    }
}
