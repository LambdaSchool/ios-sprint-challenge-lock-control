import UIKit

class ThumbSliderLock: UIControl {
    
    var originFrame: CGRect?
    var slider: UIView!
    var thumb: UIView!
    var imageView: UIView!
    var image: UIImage!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        adjustContainerView()
        
        slider = createSlider()
        addSubview(slider)
        
        thumb = createThumb()
        slider.addSubview(thumb)
        
        imageView = createImageView()
        addSubview(imageView)
    }
    
    func isLocked(){
        print("Hello world")
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchpoint = touch.location(in: self)
        sendActions(for: [.valueChanged, .touchDown ])
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        if bounds.contains(location) {
            sendActions(for: [.valueChanged, .touchDragInside])
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
        slider = UIView(frame: CGRect(x: 8, y: frame.height + 98, width: frame.width + 20, height: 60))
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
    func createImageView() -> UIView {
        let image = UIImage(named: "Locked")
        imageView = UIImageView(image: image)
        imageView.frame = frame(forAlignmentRect: CGRect(x: 23, y: 8, width: frame.width - 8, height: frame.height + 78))
        return imageView
    }
    func adjustContainerView() {
        clipsToBounds = true
        layer.cornerRadius = 25
        layer.backgroundColor = UIColor.lightGray.cgColor
    }
}
