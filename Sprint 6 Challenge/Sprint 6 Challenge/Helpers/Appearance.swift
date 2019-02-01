import UIKit

enum Appearance {
    
    static func championshipFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Robotronica", size: pointSize) else { fatalError("Font is nil. Check the name of the font.") }
        return UIFontMetrics(forTextStyle: .callout).scaledFont(for: font)
    }
    
    static func setAppearance() {
        //navigation bar
        UINavigationBar.appearance().barTintColor = .cheetos
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkOrange, NSAttributedStringKey.font: UIFont(name: "Robotronica", size: 55)!]
        
        //bar button item
        UIBarButtonItem.appearance().tintColor = .darkOrange
//        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Robotronica", size: 14)!, NSAttributedStringKey.foregroundColor: UIColor.darkOrange], for: .normal)
        
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Robotronica", size: 14)!], for: .normal)
    }
}
