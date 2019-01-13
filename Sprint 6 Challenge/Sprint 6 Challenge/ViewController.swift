
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lockUnlockImageView: UIImageView!
    @IBOutlet weak var mainBackraundView: CustomControl!
    @IBOutlet weak var resetButtonOutlet: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lockUnlockImageView.image = UIImage(named: "Locked")
        mainBackraundView.layer.cornerRadius = 35
        navigationItem.title = "Hello!"
        navigationItem.rightBarButtonItem?.title = ""
    }
    @IBAction func CoustomView(_ sender: CustomControl) {
        
       if CustomControl.value >= 210.04 {
            lockUnlockImageView.image = UIImage(named: "Unlocked")
            UIView.animate(withDuration: 1.0) {
                self.resetButtonOutlet.title = "Reset"
                self.resetButtonOutlet.isEnabled = true
   }
        }
    }
    @IBAction func resetButton(_ sender: Any) {
        
        lockUnlockImageView.image = UIImage(named: "Locked")
        CustomControl.blackCircle.frame = CGRect(x: 7, y: 7, width: 37, height: 37)
        resetButtonOutlet.title = ""
        resetButtonOutlet.isEnabled = false
    }
    
}
