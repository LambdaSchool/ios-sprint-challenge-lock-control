import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locking()
        
    }
    
    @IBAction func lockAction(_ lock: Lock) {
        locking()
        
    }
    
    @IBOutlet var lockingAction: Lock!
    
    @IBAction func reset(_ sender: Any) {
        lockingAction.closed()
    }
    
    private func locking(){
        resetBButton.title = lockingAction.isLocked ? "" : "Reset"
        resetBButton.isEnabled = lockingAction.isLocked ? false : true
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resetBButton: UIBarButtonItem!
}


