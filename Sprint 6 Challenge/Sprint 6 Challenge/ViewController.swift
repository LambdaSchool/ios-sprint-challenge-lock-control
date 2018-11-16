import UIKit

class ViewController: UIViewController {

    var isLocked = true
    
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    @IBAction func reset(_ sender: Any) {
        
        isLocked.toggle()
        
        if isLocked {
            UIView.animate(withDuration: 2.0) {
                self.resetButton.tintColor?.withAlphaComponent(1.0)
                self.lockImage.image = UIImage(named: "Unlocked")
            }
        } else {
            UIView.animate(withDuration: 2.0) {
                self.resetButton.tintColor?.withAlphaComponent(0.0)
                self.lockImage.image = UIImage(named: "Locked")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

