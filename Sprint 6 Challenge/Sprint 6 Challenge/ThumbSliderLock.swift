import UIKit

class ThumbSliderLock: UIControl {
    
    var originFrame: CGRect?
    var slider: UIView!
    var thumb: UIView!
    var lockedImageView: UIView!
    var unlockedImageView: UIView!
    var image: UIImage!
    var eightyPercentSliderWidth: CGFloat!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        eightyPercentSliderWidth = (slider.frame.width * 80 / 100)
    }
    
    func isLocked(){
        print("Hello world")
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        // Only begin tracking if the user touches down inside of the thumb
        let location = touch.location(in: thumb)
        if thumb.bounds.contains(location) {
            print(thumb.frame)
            sendActions(for: .touchDown)
            return true
        }
        return false
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: slider)
        if slider.bounds.contains(location) {
            UIView.animate(withDuration: 0.25) {
                self.thumb.center.x = location.x
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
        let location = touch.location(in: slider)
        if slider.bounds.contains(location) {
            UIView.animate(withDuration: 0.25) {
                if location.x >= self.eightyPercentSliderWidth {
                    self.thumb.center.x = 314
                    self.unlockLock(shouldUnlock: true)
                    self.sendActions(for: [.valueChanged])
                }
                if location.x < self.eightyPercentSliderWidth {
                    self.thumb.center.x = 30
                }
            }
            sendActions(for: [.touchUpInside])
        } else {
            unlockLock(shouldUnlock: false)
            print("end tracking outside")
            sendActions(for: [.touchUpOutside])
            
        }
        
        super.endTracking(touch, with: event)
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    func setup() {
        createSlider()
        createThumb()
        createImageView(isUnlocked: true)
        createImageView(isUnlocked: false)
        adjustContainerView()
    }
    
    func createSlider() {
        slider = UIView(frame: CGRect(x: 8, y: 300, width: frame.width - 16, height: 60))
        slider.layer.cornerRadius = 8
        slider.backgroundColor = .darkGray
        slider.isUserInteractionEnabled = false
        addSubview(slider)
    }
    func createThumb() {
        thumb = UIView(frame: CGRect(x: -5, y: -5, width: 70, height: 70))
        originFrame = thumb.frame
        thumb.layer.cornerRadius = thumb.frame.width / 2
        thumb.backgroundColor = .black
        thumb.isUserInteractionEnabled = false
        slider.addSubview(thumb)
        
    }
    func createImageView(isUnlocked: Bool) {
        switch isUnlocked {
        case true:
            let image = UIImage(named: "Unlocked")
            unlockedImageView = UIImageView(image: image)
            unlockedImageView.frame = frame(forAlignmentRect: CGRect(x: 20, y: 8, width: frame.width - 40, height: 284 ))
            unlockedImageView.contentMode = .scaleAspectFit
            unlockedImageView.isHidden = true
            addSubview(unlockedImageView)
        case false:
            let image = UIImage(named: "Locked")
            lockedImageView = UIImageView(image: image)
            lockedImageView.frame = frame(forAlignmentRect: CGRect(x: 20, y: 8, width: frame.width - 40, height: 284 ))
            lockedImageView.contentMode = .scaleAspectFit
            addSubview(lockedImageView)
        }
    }
    func adjustContainerView() {
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.backgroundColor = UIColor.lightGray.cgColor
        frame = frame(forAlignmentRect: CGRect(x: 20, y: 100, width: 370, height: 368))
    }
    func unlockLock(shouldUnlock: Bool) {
        
        switch shouldUnlock {
        case true:
            lockedImageView.isHidden = true
            unlockedImageView.isHidden = false
        case false:
            lockedImageView.isHidden = false
            unlockedImageView.isHidden = true
        }
        
    }
    func moveThumb(Location: CGPoint) -> CGRect {
        return frame(forAlignmentRect: CGRect(x: Location.x, y: -5, width: 70, height: 70))
    }
    func reset() {
        thumb.frame = originFrame!
        unlockLock(shouldUnlock: false)
    }
}
