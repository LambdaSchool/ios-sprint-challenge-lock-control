
import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // MARK: - Properties
    
    // Minimum value of slider
    var minimumValue: CGFloat = 0
    
    // Maximinum value of slider
    var maximumValue: CGFloat = 1
    
    // Thumb value's starting point
    var thumbValue: CGFloat = 0.1
    
    // Colors
    var trackColor = UIColor.gray
    var trackTintColor = UIColor.pastelBlue


    
    
    // MARK: - Views
    
    // Layer to hold the track
    private let track = CustomControlTrack()
    
    // Thumb view
    private let thumbView = UIView()
    
    private var previousLocation = CGPoint()
    
    // Sets thumb to be 80% of the height of the Slider View
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        track.customControl = self
        track.contentsScale = UIScreen.main.scale
        
        layer.addSublayer(track)
        
        setupThumb(thumbView)
        
        updateControlFrames()
        
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
        
        // Update the thumbValue
        thumbValue = bound(value: thumbValue + valueChange, to: maximumValue)

        updateControlFrames()

        sendActions(for: .valueChanged)

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
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
    
//    private func updateValue(at touch: UITouch) {
//
//        // Assign the touch point to the current location
//        let touchPoint = touch.location(in: self)
//
//        // Stores the value previously held before movement changes
//        let oldValue = thumbValue
//
//        // Detect whether each touch's location is contained in the thumbView
//        if thumbView.frame.contains(touch.location(in: self)) {
//
//            // set the thumb control's value to the value on slider
//            thumbValue = touchPoint
//        }
//
//    }
    
    private func updateControlFrames() {
        
        // Set to 1/3 of this height and in the middle
        track.frame = bounds.insetBy(dx: 0, dy: bounds.height/3)
        track.setNeedsLayout()
        
        // Set the position of the thumb
        thumbView.frame = thumbFrame(for: thumbValue)
        
    }
    
    // Called when we need to update the position of the thumb and it gives the frame we need to put it in based on a value.
    private func thumbFrame(for value: CGFloat) -> CGRect {
        
        // This gives us the center of the slider to be where the value is
        let x = position(for: value) - thumbWidth/2
        
        let y = (bounds.height - thumbWidth)/2
        
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    // Gives the position based on the value
    func position(for value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    // Make sure that the thumb can't go any lower than the minimum value or higher than the maximum value
    private func bound(value: CGFloat, to thumbValue: CGFloat) -> CGFloat {
        
        // Get the minimum between the value and thumbValue
        return min(value, thumbValue)
    }
    
}
