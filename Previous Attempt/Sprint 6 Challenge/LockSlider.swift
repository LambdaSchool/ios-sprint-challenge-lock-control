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
        let touchPoint = touch.location(in: self)
        sendActions(for: .touchDown)
        if keyThumb.bounds.contains(touchPoint) {
            sendActions(for: .touchDown)
            
            return true
        } else {
            return false
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        let locationChange = touchPoint.x - previousLocation.x
        
        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
        
        previousLocation = touchPoint
        
        thumbProgress = bound(value: thumbProgress + valueChange, to: maximumValue)
        
        updateControlFrames()
        
        sendActions(for: .valueChanged)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        resetkeyThumbPosition()
    }
    
    // Replace the thumb at the beginning of the track.
    func resetkeyThumbPosition() {
        isLocked = false
        presentLockImage.image = lockedImage
        thumbProgress = 0.0
    }
    
    // Is the padlock locked?
    // Is  the slider > 80% of the way there?
    // All things padlock related
    var isLocked: Bool = true
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    // Whose is present at all times and whose value to modify
    // Force unwrap to avoid the need for initializers
    var presentLockImage: UIImageView!
    
    func changeLockState() {
        if thumbProgress >= 0.8 {
            presentLockImage.image = unlockedImage
        } else {
            presentLockImage.image = lockedImage
        }
    }
    
    
    // Thumb positions
    
    func lockSetup() {
        
    }
    
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 1
    var thumbProgress: CGFloat = 0.1
    var trackColor = UIColor(white: 0.9, alpha: 1)
    // Mostly blue
    var customTintColor = UIColor.green.cgColor
    
    // Private Constants
    private let keyThumb = UIView()
    private var previousLocation = CGPoint()
    
    // 80% of the height of the slider
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupThumb(keyThumb)
        
        // Track implementation
        track.lockSlider = self
        track.contentsScale = UIScreen.main.scale
        layer.addSublayer(track)
        
        updateControlFrames()
        
    }
    
    // MARK: - Utility Methods
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        thumb.frame = thumbFrame
        thumb.backgroundColor = .white
        thumb.layer.cornerRadius = thumbWidth/2
        thumb.layer.borderColor = customTintColor
        thumb.layer.borderWidth = 1
        changeLockState()
        if thumbProgress >= 0.8 {
            thumb.isUserInteractionEnabled = false
            addSubview(presentLockImage)
        }
        
        addSubview(thumb)
    }
    
    private func updateControlFrames() {
        // No long needed since we're not using a custom track
        // Edit, it's needed since it's not visible.
        track.frame = bounds.insetBy(dx: 0, dy: bounds.height/3)
        track.setNeedsLayout()
        
        keyThumb.frame = thumbFrame(for: thumbProgress)
    }
    
    private func thumbFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) - thumbWidth/2
        let y = (bounds.height - thumbWidth)/2
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    private func bound(value: CGFloat, to lowerValue: CGFloat) -> CGFloat {
        return max(value, lowerValue)
    }
    
    // Add in the track properties
    
    let track = LockSliderTrack()
    
}


