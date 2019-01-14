import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppearanceHelper.style(view: controlContainerView) // set container theme
        AppearanceHelper.style(control: lockSlider) // set custom lockSlider theme
        lockSlider.setValue(6.0, animated: false) // set start position of thumbRect
        lockSlider.addTarget(self, action: #selector(snapBackToMin(customControl:)), for: [.touchUpInside]) // add target to lockSlider to handle sendActions
        // from CustomLockSlider class. This is needed for
        // snapBackToMin to be able to respond to ending
        // of touch event before fully unlocked.
    }
    
    
    @IBOutlet weak var controlContainerView: UIView!
    
    @IBOutlet weak var lockIMageView: UIImageView!
    
    @IBOutlet weak var lockSlider: CustomLockSlider!
    
    var isUnlocked: Bool = false
    
    // handles case when user lets go of the slider before it is fully unlocked. Fired
    // when CustomLockSlider sends .touchUpInside
    @objc func snapBackToMin(customControl: CustomLockSlider) {
        //print("user interaction ended")
        if customControl.value < 185.0 {
            customControl.setValue(6.0, animated: true)
            lockIMageView.image = UIImage(named: "Locked")
            navigationItem.rightBarButtonItem?.title = ""
            customControl.isUserInteractionEnabled = true
        }else {
            if isUnlocked == false { customControl.setValue(222.0, animated: false) }
        }
    }
    
    @IBAction func lockControl(_ customControl: CustomLockSlider) {
        
        switch customControl.value {
        case 0.0..<185.0:
            lockIMageView.image = UIImage(named: "Locked")
            navigationItem.rightBarButtonItem?.title = ""
            customControl.isUserInteractionEnabled = true
            
        case 185.001..<227.0:
            //print("unlocked")
            isUnlocked = true
            lockIMageView.image = UIImage(named: "Unlocked")
            navigationItem.rightBarButtonItem?.title = "Reset"
            customControl.setValue(222.0, animated: true)
            customControl.isUserInteractionEnabled = false
            
        default:
            break
        }
        
    }
    
    @IBAction func resetLock(_ sender: CustomLockSlider) {
        lockSlider.setValue(6.0, animated: true)
        if lockSlider.value < 185.0 {
            lockIMageView.image = UIImage(named: "Locked")
            navigationItem.rightBarButtonItem?.title = ""
            isUnlocked = false
            lockSlider.isUserInteractionEnabled = true
        }
    }
}

