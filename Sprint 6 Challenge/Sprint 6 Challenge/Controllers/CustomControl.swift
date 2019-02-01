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
    
    
}
