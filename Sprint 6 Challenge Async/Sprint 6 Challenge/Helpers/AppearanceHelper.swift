
import UIKit

struct Appearance {
    
    // Custom Font
    static let customFont = UIFont(name: "NORTHWEST", size: 50)
    
    // Scalable font
    static func scaledFont(with textStyle: UIFontTextStyle, size: CGFloat) -> UIFont {
        guard let font = customFont else { fatalError() }
        
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        
    }
    
    static func setupTheme() {
        
        // Navigation Bar
        UINavigationBar.appearance().barTintColor = .lavender
        //UIBarButtonItem.appearance().tintColor = .wenge
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.almond, NSAttributedStringKey.font: customFont]
        
        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        
    }
}
