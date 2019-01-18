
import UIKit

@IBDesignable class CustomControl: UIControl {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Customize thumb view
        
        clipsToBounds = true
        let radius = frame.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.white.cgColor
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        // Get location of touch
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            return true
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        <#code#>
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        <#code#>
    }
    
    override func cancelTracking(with event: UIEvent?) {
        <#code#>
    }
    
    
    
    
}
