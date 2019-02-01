import UIKit

struct AppearanceHelper {
    
    static func setCustomAppearance() {
        
        UINavigationBar.appearance().barTintColor = .red
        
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        // Animate bar button item from red to black or something else
        UIBarButtonItem.appearance().tintColor = .red
    }
    
}
