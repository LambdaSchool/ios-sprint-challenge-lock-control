
import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // MARK: - Properties
    
    // Minimum value
    var minimumValue: CGFloat = 0
    
    // Maximinum value
    var maximumValue: CGFloat = 1
    
    // Thumb value
    var thumbValue: CGFloat = 0.0
    
    // Colors
    var trackColor = UIColor.gray
    var trackTintColor = UIColor.pastelBlue {
        didSet {
            updateControlFrames()
        }
    }
   
    
    
    
    // MARK: - Views
    
    // Layer to hold the track
    private let track = CustomControlTrack()
    
    // Thumb view
    private let thumbView = UIView()
    
    private var previousLocation = CGPoint()
    
    // However high the slider is, I want it to be 80% of that
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        track.customControl = self
        track.contentsScale = UIScreen.main.scale
        
        layer.addSublayer(track)
        
        setupThumbs(thumbView)
        
        updateControlFrames()
        
        // Customize thumb view
        
//        clipsToBounds = true
//        let radius = frame.width / 2.0
//        layer.cornerRadius = radius
//        layer.borderWidth = 1.0
//        layer.borderColor = UIColor.white.cgColor
    }
    
    
    
    
    // MARK: - Touch Tracking
    
//    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//
//        // Get location of touch
//        let touchPoint = touch.location(in: self)
//
//        if thumbView.frame.contains(previousLocation) {
//
//        }
//
////        if bounds.contains(touchPoint) {
////            return true
////        }
//    }
//
//    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        let location = touch.location(in: self)
//
//        let locationChange = location.x - previousLocation.x
//
//        // Calculate how far the touch is moving
//        // How much has the location changed divided by the overall width
//        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
//
//        previousLocation = location
//
//        updateControlFrames()
//
//        sendActions(for: .valueChanged)
//
//        return true
//    }
//
//    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
//        super.endTracking(touch, with: event)
//    }
//
//    override func cancelTracking(with event: UIEvent?) {
//        super.cancelTracking(with: event)
//    }
    
    
    
    // MARK: - Utility Methods
    
    // Set up the thumbs
    private func setupThumbs( _ thumb: UIView) {
        
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
//        // Stores the value previously held before movement changes
//        let oldValue = value
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
    
    
    
}
