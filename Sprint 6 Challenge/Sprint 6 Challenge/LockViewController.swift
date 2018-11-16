import UIKit

class LockViewController: UIViewController {
    
    // MARK:- View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        handleLockState()
    }
    
    private func handleLockState() {
        title = lockControl.isLocked ? "Locked" : "Unlocked!"
        resetBarButton.isEnabled = lockControl.isLocked ? false : true
        resetBarButton.title = lockControl.isLocked ? "" : "Reset"
    }
    
    
    // MARK:- IBActions
    @IBAction func lockValueChanged(_ lockControl: LockControl) {
        handleLockState()
    }
    
    @IBAction func resetBarButtonItem(_ sender: Any) {
        lockControl.lock()
    }
    
    
    // MARK:- IBOutlets
    @IBOutlet weak var lockControl: LockControl!
    @IBOutlet weak var resetBarButton: UIBarButtonItem!
    
}

