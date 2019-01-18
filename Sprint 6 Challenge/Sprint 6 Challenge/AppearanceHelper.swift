import UIKit

struct AppearanceHelper {
    
    static func setCustomAppearance() {
        
        // navbar background color
        UINavigationBar.appearance().barTintColor = .red
        
        //TODO: Check bar button item 'text' color
        UIBarButtonItem.appearance().tintColor = .blue

        //TODO: Refactor whatever affects the title text, if possible.
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
    }
    
}
