import UIKit

@IBDesignable class CustomControl: UIControl {
    var startingPoint: CGFloat = 0.0
    
    // static variables
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
    
    func reset() {

    }
    
}
