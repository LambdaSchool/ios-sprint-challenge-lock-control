
import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // MARK: - Properties
        
    // Minimum value of slider
    var minimumValue: CGFloat = 0
    
    // Maximinum value of slider
    var maximumValue: CGFloat = 1
    
    // Thumb value's starting point
    var thumbValue: CGFloat = 0.0
    
    // Colors
    var trackTintColor = UIColor.pastelBlue

    var isUnlocked: Bool = false

    // MARK: - Views
    
    // Thumb view
    private var thumbView = UIView()
    
    private var previousLocation = CGPoint()
    
    // Sets thumb to be 80% of the height of the Slider View
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupThumb(thumbView)
        
        updateControlFrames()
        
    }
    
    func reset() {
        // Move the thumb back
        thumbView.frame = thumbFrame(for: 0.0)
        
    }
    
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

        // Begin tracking if user touches the thumb
        
        // Get location of touch
        previousLocation = touch.location(in: self)

        // Check to see if the touch is inside the thumbView
        if thumbView.frame.contains(previousLocation) {
            
            // Tapping down, dragging around
            sendActions(for: [.touchDown, .valueChanged])
            
        } else {
            return false
        }
        
        // Continue tracking
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let location = touch.location(in: self)
        
        let locationChange = location.x - previousLocation.x

        // Calculate how far the touch is moving
        // How much has the location changed divided by the overall width
        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
        
        // Reset current location
        previousLocation = location
        
        // Update the thumbValue so it can't go lower or higher than the min and max
        thumbValue = min(max((thumbValue + valueChange), minimumValue), maximumValue)

        updateControlFrames()

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        // Call super before the function ends
        defer { super.endTracking(touch, with: event) }
        
        // Touch is optional because you may or may not get a touch
        guard let touch = touch else { return }
        
        // Get current location
        previousLocation = touch.location(in: self)
        
        // Write some logic to see if the user has slid far enough
        // If so, set is Unlocked and sendActions(for: .valueChanged)
        
        if thumbValue > 0.8 {
            thumbValue = 1
            
            isUnlocked = true
            
            sendActions(for: [.touchUpInside, .valueChanged])

            
        } else {
            sendActions(for: [.touchUpInside, .valueChanged])
            isUnlocked = false
            thumbValue = 0
            
            UIView.animate(withDuration: 2.0) {
                //self.thumbValue = 0
                //self.thumbFrame(for: 0.0)
                //self.thumbView.frame = CGRect(x: (self.bounds.width - self.thumbWidth) * 0, y: (self.bounds.height - self.thumbWidth)/2, width: self.thumbWidth, height: self.thumbWidth)
                self.thumbView.frame = self.thumbFrame(for: 0.0)

            }
        }
        
        updateControlFrames()

    }

    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
    
    
    
    // MARK: - Utility Methods
    
    // Set up the thumb
    private func setupThumb( _ thumb: UIView) {
        
        // Give initial frame
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        // Give it to the thumb
        thumb.frame = thumbFrame
        
        thumb.backgroundColor = .white
        thumb.layer.cornerRadius = thumbWidth / 2
        thumb.layer.borderColor = trackTintColor.cgColor
        thumb.layer.borderWidth = 1
        
        // Makes it possible to move the thumb around
        thumb.isUserInteractionEnabled = false
        
        // Add as a subview
        addSubview(thumb)
    }
    

    private func updateControlFrames() {
        
        // Set the position of the thumb
        thumbView.frame = thumbFrame(for: thumbValue)
    }
    
    
    // Called when we need to update the position of the thumb and it gives the frame we need to put it in based on a value.
    private func thumbFrame(for value: CGFloat) -> CGRect {
        
        // This gives us the center of the slider to be where the value is
        // Offset it by 6 pixels in from the leading
        let x = position(for: value) + 6
        
        let y = (bounds.height - thumbWidth)/2
        
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    
    // Gives the position based on the value
    func position(for value: CGFloat) -> CGFloat {
        // Put the thumb in a position in the view based on the value I'm giving it from 0 to 1
        // Reduce it by the width of the thumb, and an extra 12 pixels of padding
        return (bounds.width - thumbWidth - 12) * value
    }

}










