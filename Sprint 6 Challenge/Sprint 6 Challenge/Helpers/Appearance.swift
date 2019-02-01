import UIKit

enum Appearance {
    
    static func championshipFont(with textStyle: UIFontTextStyle, pointSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: "Championship", size: pointSize) else { fatalError("Font is nil. Check the name of the font.") }
        return UIFontMetrics(forTextStyle: .callout).scaledFont(for: font)
    }
    
    static func setAppearance() {
        //navigation bar
        UINavigationBar.appearance().barTintColor = .cheetos
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.darkOrange, NSAttributedStringKey.font: UIFont(name: "Championship", size: 30)!]
        
        //bar button item
        UIBarButtonItem.appearance().tintColor = .hayYellow
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Championship", size: 14)!, NSAttributedStringKey.foregroundColor: UIColor.hayYellow], for: .normal)
    }
}
