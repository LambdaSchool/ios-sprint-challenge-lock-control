import UIKit

class ThumbSliderLock: UIControl {
    
    var originFrame: CGRect?
    var slider: UIView!
    var thumb: UIView!
    var lockedImageView: UIView!
    var unlockedImageView: UIView!
    var image: UIImage!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        adjustContainerView()
        
        slider = createSlider()
        addSubview(slider)
        
        thumb = createThumb()
        slider.addSubview(thumb)
        
        lockedImageView = createImageView(isUnlocked: false)
        addSubview(lockedImageView)
//
//        unlockedImageView = createImageView(isUnlocked: true)
//        addSubview(unlockedImageView)
//
//        unlockedImageView.isHidden = true
    }
    
    func isLocked(){
        print("Hello world")
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: slider)
        if slider.bounds.contains(location) {
        print("begin Tracking")
        sendActions(for: [.valueChanged, .touchDown ])
        return true
        }
        return false
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: slider)
        if slider.bounds.contains(location) {
            print("continue tracking")
            UIView.animate(withDuration: 0.25) {
                self.thumb.frame = self.moveThumb(Location: location)
            }
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer{super.endTracking(touch, with: event)}
        guard let touch = touch else {return}
        let touchpoint = touch.location(in: self)
        if bounds.contains(touchpoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
            
        }
        
        super.endTracking(touch, with: event)
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    func createSlider() -> UIView {
        slider = UIView(frame: CGRect(x: 8, y: 300, width: frame.width - 16, height: 60))
        originFrame = slider.frame
        slider.layer.cornerRadius = 8
        slider.backgroundColor = .darkGray
        return slider
    }
    func createThumb() -> UIView {
        thumb = UIView(frame: CGRect(x: -5, y: -5, width: 70, height: 70))
        thumb.layer.cornerRadius = thumb.frame.width / 2
        thumb.backgroundColor = .black
        return thumb
    }
    func createImageView(isUnlocked: Bool) -> UIView {
        switch isUnlocked {
        case true:
            let image = UIImage(named: "Unlocked")
            unlockedImageView = UIImageView(image: image)
            unlockedImageView.frame = frame(forAlignmentRect: CGRect(x: 8, y: 8, width: 50, height: 50))
            unlockedImageView.contentMode = .scaleAspectFit
            return unlockedImageView
        case false:
            let image = UIImage(named: "Locked")
            lockedImageView = UIImageView(image: image)
            lockedImageView.frame = frame(forAlignmentRect: CGRect(x: 20, y: 8, width: frame.width - 40, height: 284 ))
            lockedImageView.contentMode = .scaleAspectFit
            return lockedImageView
        }
    }
    func adjustContainerView() {
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.backgroundColor = UIColor.lightGray.cgColor
        frame = frame(forAlignmentRect: CGRect(x: 20, y: 100, width: 370, height: 368))
    }
    func changeLockUnlockImage(isUnlocked: Bool) {
        if isUnlocked {
        }
    }
    func moveThumb(Location: CGPoint) -> CGRect {
        return frame(forAlignmentRect: CGRect(x: Location.x, y: -5, width: 70, height: 70))
    }
}
