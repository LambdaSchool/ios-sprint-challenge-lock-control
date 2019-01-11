import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AppearanceHelper.style(view: controlContainerView)
        AppearanceHelper.style(slider: lockSlider)
        lockSlider.setValue(0.05, animated: false)
        if isUnlocked == false {
        lockSlider.addTarget(self, action: #selector(onSliderValChanged(slider:event:)), for: .valueChanged)
        }
    }
    

    @IBOutlet weak var controlContainerView: UIView!
    
    @IBOutlet weak var lockIMageView: UIImageView!
    
    @IBOutlet weak var lockSlider: UISlider!
    
    
    @IBAction func controlLock(_ sender: Any) {
        
    }
    var isUnlocked: Bool = false
    
    
    
    @IBAction func resetLock(_ sender: Any) {
        lockSlider.setValue(0.05, animated: true)
        if self.lockSlider.value < 0.95 {
            lockIMageView.image = UIImage(named: "Locked")
            navigationItem.rightBarButtonItem?.title = ""
            isUnlocked = false
            lockSlider.isUserInteractionEnabled = true
        }
    }
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .began:
                //print("drag begun")
                if self.lockSlider.value > 0.95 {
                    isUnlocked = true

                    lockIMageView.image = UIImage(named: "Unlocked")
                    navigationItem.rightBarButtonItem?.title = "Reset"
                    lockSlider.isUserInteractionEnabled = false
                    lockSlider.setValue(0.96, animated: false)
                }
            case .moved:
                //print("slider moved")
                if self.lockSlider.value > 0.95 {
                    isUnlocked = true
                    
                    lockIMageView.image = UIImage(named: "Unlocked")
                    navigationItem.rightBarButtonItem?.title = "Reset"
                    lockSlider.isUserInteractionEnabled = false
                    lockSlider.setValue(0.96, animated: false)
                }
            case .ended:
                //print("user interaction ended")
                if self.lockSlider.value < 0.95 {
                    lockSlider.setValue(0.05, animated: true)
                    lockIMageView.image = UIImage(named: "Locked")
                    navigationItem.rightBarButtonItem?.title = ""
                    lockSlider.isUserInteractionEnabled = true
                }else {
                    lockSlider.setValue(0.96, animated: false)
                }
            default:
                break
            }
        }
    }

    
}

