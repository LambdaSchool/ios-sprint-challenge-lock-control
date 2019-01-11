import UIKit

enum AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    
    static func setDarkAppearance() {
        UINavigationBar.appearance().barTintColor = lambdaRed
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedStringKey: Any]
    }
}
