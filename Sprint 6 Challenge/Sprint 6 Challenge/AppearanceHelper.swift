import UIKit

enum AppearanceHelper {
    
    static var lipstickRed = UIColor(named: "lipstickRed")
    static var darkGray = UIColor(named: "darkGray")
    
    static func setDarkAppearance() {
        UINavigationBar.appearance().barTintColor = lipstickRed
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedStringKey: Any]
        UIBarButtonItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.black,], for: .normal)
    }
}
