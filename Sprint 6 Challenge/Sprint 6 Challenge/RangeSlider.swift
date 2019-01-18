import UIKit

class RangeSlider: UIControl {
    //properties
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 1
    var lowerValue: CGFloat = 0.2
    var upperValue: CGFloat = 0.8
    var trackColor = UIColor(white: 0.9, alpha: 1)
    var customTintColor = UIColor(red: 0, green: 0.45, blue: 9.94, alpha: 1) {
        didSet {
            updateControlFrames()
        }
    }
    
    private let track = RangeSliderTrack()
    private let thumb = UIView()
    private var previousLocation = CGPoint()
    private var activeThumb: UIView?
    
    private var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        track.rangeSlider = self
        track.contentsScale = UIScreen.main.scale
        layer.addSublayer(track)
        
        setupThumb(thumb)
        updateControlFrames()
        
    }
    //touch handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previousLocation = touch.location(in: self)
        
        if thumb.frame.contains(previousLocation) {
            activeThumb = thumb
        } else {
            return activeThumb != nil
        }
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if location = touch.locaiton(in: self)
        let locationChange = location.x - previousLocation.x
        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
        
        previousLocation = location
        
        guard let activeThumb = activeThumb else { return false }
        let activeThumb = bound(value:(lowerValue + valueChange), to: minimumValue, and: upperValue)
        
        updateControlFrames()
        sendActions(for: .valueChanged)
        return true
            
        }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        activeThumb = nil
        super.endTracking(touch, with: event)
    }
    
    override func cancelTracking(with event: UIEvent?) {
        activeThumb = nil
        super.cancelTracking(with: event)
    }
    
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidt)
        thumb.frame = thumbFrame
        thumb.backgroundColor = .white
        thumb.layer.cornerRadius = thumbWidth/2
        thumb.isUserInteractionEnabled = false
        
        addSubview(thumb)
    }

}
