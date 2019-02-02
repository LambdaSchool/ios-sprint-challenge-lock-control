// See RangeSlider by Dillon McElhinney as reference

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // Slider Track and Lock Key Properties
    var lhs: CGFloat = 0.0
    var rhs: CGFloat = 1.0
    
    var currentKeyPosition: CGFloat = 0.0
    
    // Draw materialize the key
    var key = UIView()
    // Give it a width and height
    var keyDimensions: CGFloat {
        return frame.height * 0.8
    }
    
    func keySetup(_ key: UIView) {
        let keyFrame = CGRect(x: 0, y: 0, width: keyDimensions, height: keyDimensions)
        key.frame = keyFrame
        key.backgroundColor = .green
        key.layer.cornerRadius = keyDimensions/2
        key.layer.borderColor = UIColor.yellow.cgColor
        key.layer.borderWidth = 1
        key.isUserInteractionEnabled = false
        addSubview(key)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return(bounds.width - keyDimensions - 12) * value
    }
    
    func keyFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - keyDimensions)/2
        let keyFrame = CGRect(x: x, y: y, width: keyDimensions, height: keyDimensions)
        return keyFrame
    }
    
    // Variables for triggering and reseting the lock state
    var keyPosition = CGPoint()
    var lockState: Bool = true
    
    func updateControlFrames() {
        key.frame = keyFrame(for: currentKeyPosition)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        keySetup(key)
        updateControlFrames()
    }
    
    func reset() {
        currentKeyPosition = 0.0
        updateControlFrames()
        lockState = true
        self.isUserInteractionEnabled = true
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        keyPosition = touch.location(in: self)
        
        if key.frame.contains(keyPosition) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            return false
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let position = touch.location(in: self)
        let keyDisplacement = position.x - keyPosition.x
        let positionValueDelta = (rhs - lhs) * keyDisplacement / bounds.width
        
        keyPosition = position
        currentKeyPosition = min(max((currentKeyPosition + positionValueDelta), lhs), rhs)
        updateControlFrames()
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        keyPosition = touch.location(in: self)
        
        if currentKeyPosition > 0.8 {
            
            currentKeyPosition = 1
            
            lockState = false
            
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 1.0) {
                self.key.frame = self.keyFrame(for: 1.0)
            }
        
        } else {
            
            currentKeyPosition = 0
            
            lockState = true
            
            sendActions(for: [.touchUpInside, .valueChanged])
            
            UIView.animate(withDuration: 1.0) {
                self.key.frame = self.keyFrame(for: 0.0)
            }
        }
        updateControlFrames()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
    
}
