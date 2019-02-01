import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var lockView: UIImageView!
    @IBOutlet weak var customControl: CustomControl!
    @IBOutlet weak var sliderView: UIView!
    
    @IBAction func reset(_ sender: Any) {
        reset.tintColor = UIColor.clear
        lockView.image = UIImage(named: "Locked")
        customControl.reset()
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        if customControl.isUnlocked == true {
        navigationItem.rightBarButtonItem?.tintColor = .darkOrange
        lockView.image = UIImage(named: "Unlocked")
        customControl.isUserInteractionEnabled = false
        }
    }
    
    //MARK: - Override funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderView.backgroundColor = UIColor.hayYellow.withAlphaComponent(0.15)
        sliderView.layer.cornerRadius = 15
        view.backgroundColor = .darkOrange
        
        lockView.image = UIImage(named: "Locked")
    }
}

