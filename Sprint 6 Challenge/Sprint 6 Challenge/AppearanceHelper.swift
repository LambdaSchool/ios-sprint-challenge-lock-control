

import UIKit

struct AppearanceHelper {
    
    // Colors for application
    static let almond = UIColor(red: 0.93, green: 0.88, blue: 0.80, alpha: 1.0)
    static let pastelBlue = UIColor(red: 0.69, green: 0.82, blue: 0.83, alpha: 1.0)
    static let lavender = UIColor(red: 0.75, green: 0.52, blue: 0.59, alpha: 1.0)
    static let wenge = UIColor(red: 0.45, green: 0.34, blue: 0.32, alpha: 1.0)
    
    // Fonts for application
    static let customFont = UIFont(name: "NORTHWEST", size: 50)
    
    // Scalable Font to be used if user needs to scale font size
    static func scaledFont(with textStyle: UIFontTextStyle, size: CGFloat) -> UIFont {
        guard let font = customFont else { fatalError() }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    
    static func setCustomAppearance() {
        
        // Navigation bar color
        UINavigationBar.appearance().barTintColor = lavender
        //UINavigationBar.appearance().tintColor = almond
        
        // Navigation titles font & color
        let textAttributes = [NSAttributedStringKey.foregroundColor: AppearanceHelper.almond, NSAttributedStringKey.font: customFont]

        UINavigationBar.appearance().largeTitleTextAttributes = textAttributes
        
        // Bar button color
        UIBarButtonItem.appearance().tintColor = wenge

    
    
    }
    
    
}
