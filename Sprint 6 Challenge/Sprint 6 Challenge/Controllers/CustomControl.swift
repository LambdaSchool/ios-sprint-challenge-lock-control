import UIKit

class CustomControl: UIControl {
    
    //MARK: - Properties
    var minimumValue: CGFloat = 0
    var maximumValue: CGFloat = 1
    var thumbValue: CGFloat = 0
    
    let thumb = UIView()
    var thumbWidth: CGFloat {
        return frame.height * 0.8
    }
    
    var pLocation = CGPoint()
    var isUnlocked: Bool = false
    
    //thumb set up
    private func setupThumb(_ thumb: UIView) {
        let thumbFrame = CGRect(x: 0, y: 0, width: thumbWidth, height: thumbWidth)
        thumb.frame = thumbFrame
        thumb.backgroundColor = .cheetos
        thumb.layer.cornerRadius = thumbWidth/2
        thumb.isUserInteractionEnabled = false
        
        addSubview(thumb)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return(bounds.width - thumbWidth - 12) * value
    }
    
    private func thumbFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - thumbWidth)/2
        return CGRect(x: x, y: y, width: thumbWidth, height: thumbWidth)
    }
    
    private func updateControlFrames() {
        thumb.frame = thumbFrame(for: thumbValue)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupThumb(thumb)
        updateControlFrames()
    }
    
    func reset() {
        thumbValue = 0.0
        updateControlFrames()
        isUnlocked = false
        self.isUserInteractionEnabled = true
    }
    
    //MARK: - Touch Handling
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        pLocation = touch.location(in: self)
        if thumb.frame.contains(pLocation) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            return false
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        let locationChange = location.x - pLocation.x
        let valueChange = (maximumValue - minimumValue) * locationChange / bounds.width
        pLocation = location
        thumbValue = min(max((thumbValue + valueChange), minimumValue), maximumValue)
        updateControlFrames()
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        pLocation = touch.location(in: self)
        
        if thumbValue > 0.8 {
            thumbValue = 1
            isUnlocked = true
            sendActions(for: [.touchUpInside, .valueChanged])
            UIView.animate(withDuration: 1.0) {
                self.thumb.frame = self.thumbFrame(for: 1.0)
            }
        } else {
            thumbValue = 0
            isUnlocked = false
            sendActions(for: [.touchUpInside, .valueChanged])
            UIView.animate(withDuration: 2.0) {
                self.thumb.frame = self.thumbFrame(for: 0.0)
            }
        }
        updateControlFrames()
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
    }
}
