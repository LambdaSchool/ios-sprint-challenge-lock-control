// See RangeSlider by Dillon McElhinney as reference

import UIKit

@IBDesignable class CustomControl: UIControl {
    
    // Slider Track and Lock Key Properties
    var lhs: CGFloat = 0.0
    var rhs: CGFloat = 0.0
    
    var startingPoint: CGFloat = 0.0
    
    // Draw materialize the key
    var key = UIView()
    // Give it a width and height
    var keyDimensions: CGFloat {
        return frame.height * 0.8
    }
    
    func keySetup(_ key: UIView) {
        let keyFrame = CGRect(x: 0, y: 0, width: keyDimensions, height: keyDimensions)
        key.frame = keyFrame
        key.backgroundColor = .green
        key.layer.cornerRadius = keyDimensions/2
        key.layer.borderColor = UIColor.yellow.cgColor
        key.layer.borderWidth = 1
        key.isUserInteractionEnabled = false
        addSubview(key)
    }
    
    func position(for value: CGFloat) -> CGFloat {
        return(bounds.width - keyDimensions - 12) * value
    }
    
    func keyFrame(for value: CGFloat) -> CGRect {
        let x = position(for: value) + 6
        let y = (bounds.height - keyDimensions)/2
        let keyFrame = CGRect(x: x, y: y, width: keyDimensions, height: keyDimensions)
        return keyFrame
    }
    
    // Variables for triggering and reseting the lock state
    var keyPosition = CGPoint()
    var lockState: Bool = true
    static var lockStateImage: UIImage = UIImage(named: "Locked")!
    static var thresholdValue = 0
    
    
    func changeImage() {
        if Int(startingPoint) < CustomControl.thresholdValue {
            CustomControl.lockStateImage = LockState.lockedImage
        } else if Int(startingPoint) >= CustomControl.thresholdValue {
            CustomControl.lockStateImage = LockState.unlockedImage
        }
    }
    
    func updateControlFrames() {
        key.frame = keyFrame(for: startingPoint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        keySetup(key)
        updateControlFrames()
    }
    
    func reset() {
        startingPoint = 0.0
        updateControlFrames()
        lockState = true
    }
    
    
    
}
