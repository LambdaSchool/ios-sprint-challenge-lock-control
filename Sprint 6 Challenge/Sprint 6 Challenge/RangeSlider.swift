import UIKit

class RangeSlider: UIControl {
    //properties
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 100

    var isLocked: Bool = true
    var lockImage = UIImageView()
    var lockedImage = UIImage(named: "Locked")
    var unlockedImage = UIImage(named: "Unlocked")
    
    var trackColor = UIColor.red
    var customTintColor = UIColor.green
    
    private let track = CALayer()
    private let thumb = UIView()
    private var previousLocation = CGPoint()
    private var activeThumb: UIView?
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //track.rangeSlider = self
        track.contentsScale = UIScreen.main.scale
        layer.addSublayer(track)
        
        setupThumb(thumb)
        updateControlFrames()
        
    }
    //set reset func
    
    
    //touch handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        if thumb.bounds.contains(location) {
            sendActions(for: .touchDown)
            return true
        }
        return false
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let locationChange = location.x - previousLocation.x
        
        previousLocation = location
        
        guard let activeThumb = activeThumb else { return false }
        
        updateControlFrames()
        sendActions(for: .valueChanged)
        return true
            
        }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        activeThumb = nil
        super.endTracking(touch, with: event)
        // add isLocked
        // add logic for if more than 80

    }
    
    override func cancelTracking(with event: UIEvent?) {
        activeThumb = nil
        super.cancelTracking(with: event)
    }
    
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        thumb.frame = thumbFrame
        thumb.backgroundColor = .black
        thumb.layer.cornerRadius = thumbWidth/2
        thumb.isUserInteractionEnabled = false
        
        addSubview(thumb)
    }
    
    private func updateControlFrames() {
        track.frame = bounds.insetBy(dx: 0, dy: bounds.height/3)
        track.setNeedsDisplay()
        
    }
    
    private func thumbFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) - thumbWidth/2
        let y = (bounds.height - thumbWidth)/2
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return bounds.width * value
    }
    
    private func bound(value: CGFloat, to lowerValue: CGFloat, and upperValue: CGFloat) -> CGFloat {
        return min(max(value, lowerValue), upperValue)
    }
}
