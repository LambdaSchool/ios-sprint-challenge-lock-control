import UIKit

enum AppearanceHelper {
    
    static func setDarkAppearance() {
        UINavigationBar.appearance().barTintColor = .red
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UIBarButtonItem.appearance().tintColor = .black
    }
}
