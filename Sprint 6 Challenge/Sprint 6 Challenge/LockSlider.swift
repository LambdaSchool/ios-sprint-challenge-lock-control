import UIKit

@IBDesignable class LockSlider: UIControl {
    
/* Todo list
     - Animate the slider
     - Animate the bar button item to only appear after the slider has reached a certain threshold
     - The slider should unlock at 80% displacement
     - The color of the thumb is black and the color of the slider is grey
     
     What happens:
     - Locking
     - Unlocking
     - Changing of the image
     - Visibility of the bar button item
     - Ability to move the slider must be disabled at some point
     - The ability to move the slider must be re-enabled at some point
     
 Bonus Todo List
     - Change the navigation title based on the lock state
*/
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: .touchDown)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}


