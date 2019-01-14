import Foundation
import UIKit

class CustomLockSlider: UISlider {
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint){
            sendActions(for: [.touchDragInside, .valueChanged])
            self.setValue(Float(touchPoint.x), animated: false) // because the UISlider is overridden, we have to implement
                                                                // this to have thumbRect position track along with touch
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer { super.endTracking(touch, with: event) } // makes sure super is called in EVERY code path
        guard let touch = touch else {return}
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
}
