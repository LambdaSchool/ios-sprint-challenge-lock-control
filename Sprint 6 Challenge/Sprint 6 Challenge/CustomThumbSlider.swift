import UIKit

class ThumbSlider: UIControl {
    
    var newBounds: CGRect?
    var mainVC: ViewController?
    var boolean = true
    var originFrame: CGRect?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
        layer.backgroundColor = UIColor.black.cgColor
    }
    
    func isLocked(){
        print("Hello world")
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.valueChanged, .touchDown ])
        print("begin tracking")
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: superview)
        if let newBounds = newBounds{
            bounds = newBounds
        }
        if location.x >= 261 {
            ViewController.shared.boolean = true
        }
        if bounds.contains(location) {
            frame.offsetBy(dx: location.x - frame.origin.x, dy: frame.origin.y)
            newBounds = bounds.offsetBy(dx: location.x - bounds.origin.x, dy: bounds.origin.y)
            UIView.animate(withDuration: 0.25) {
                self.center.x = location.x
            }
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
            UIView.animate(withDuration: 0.25) {
                print(self.frame)
                if touchpoint.x <= 261 {
                self.frame = self.frame(forAlignmentRect: CGRect(x: 0.0, y: -5.0, width: 59.0, height: 60.0))
                } else {
                    self.frame = self.frame(forAlignmentRect: CGRect(x: 296.5, y: -5.0, width: 59.0, height: 60.0))
                }
            }
            
            print("Did finish inside")
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            print("did finish outside")
            sendActions(for: [.touchUpOutside])
            
        }
        
        super.endTracking(touch, with: event)
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        super.cancelTracking(with: event)
    }
    
    
}
