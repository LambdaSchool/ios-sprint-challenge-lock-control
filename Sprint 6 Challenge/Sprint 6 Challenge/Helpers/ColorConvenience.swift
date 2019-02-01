import UIKit

extension UIColor {
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    static let darkOrange = UIColor(166, 64, 41, 1)
    static let cheetos = UIColor(217, 136, 37, 1)
    static let hayYellow = UIColor(217, 187, 37, 1)
}
