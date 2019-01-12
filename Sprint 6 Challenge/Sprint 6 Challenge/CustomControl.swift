

import UIKit

class CustomControl: UIControl {
    
    let viewController = ViewController()
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Respond to the start of user's touch
        //updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Assign the touch point to the location
        let touchPoint = touch.location(in: self)
        
        // If contained within the view, send the actions
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            
            // Update the value
            //updateValue(at: touch)
        }
        
        // Continue tracking the touch event
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
//    func updateValue(at touch: UITouch) {
//        if bounds.contains(touch.location(in: self)) {
//            viewController.shouldReset = !viewController.shouldReset
//        }
    
        
    //}
    
}
