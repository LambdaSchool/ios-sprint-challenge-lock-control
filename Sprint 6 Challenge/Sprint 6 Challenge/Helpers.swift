import UIKit

// Subclass for using the correct status bar style
class NavController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
