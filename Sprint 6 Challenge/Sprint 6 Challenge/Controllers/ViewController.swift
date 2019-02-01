import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var lockView: UIImageView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var sliderView: UIView!
    
    @IBAction func reset(_ sender: Any) {
        lockView.image = UIImage(named: "Locked")
        customControl.reset()
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if customControl.isUnlocked == true {
        lockView.image = UIImage(named: "Unlocked")
        customControl.isUserInteractionEnabled = false
        }
    }
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkOrange
    }
}

