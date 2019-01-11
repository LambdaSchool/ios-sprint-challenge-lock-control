import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //gray square
        let graySquare = UIView()
        graySquare.translatesAutoresizingMaskIntoConstraints = false
        graySquare.backgroundColor = .lightGray
        graySquare.layer.cornerRadius = 20
        view.addSubview(graySquare)
        //v2 = m + v1 + c
        
        let widthConstraintSq = NSLayoutConstraint(item: graySquare, // view you are trying to constrain
                                                 attribute: .width, //attribute you want to constrain of the item
                                                 relatedBy: .equal, //operator can be greater than or less than
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0, // most often unless aspect ratio, constraining width
                                                 constant: 200.0) //space between, width or height of two things
        //graySquare = 1.0 + .notAnAttribute + 200
        
        let heightConstraintSq = NSLayoutConstraint(item: graySquare,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: graySquare,
                                                  attribute: .width,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        //gray square height equal to gray square width
        
        let centerYConstraintSq = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerY,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        let centerXConstraintSq = NSLayoutConstraint(item: graySquare,
                                                   attribute: .centerX,
                                                   relatedBy: .equal,
                                                   toItem: view,
                                                   attribute: .centerX,
                                                   multiplier: 1.0,
                                                   constant: 0.0)
        
        //cylinder
        let cylinder = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        cylinder.translatesAutoresizingMaskIntoConstraints = false
        cylinder.backgroundColor = .black
        cylinder.layer.cornerRadius = 20
        view.addSubview(cylinder)
        
        let topConstraintCy = NSLayoutConstraint(item: cylinder,
                                                 attribute: .top,
                                                 relatedBy: .lessThanOrEqual,
                                                 toItem: graySquare,
                                                 attribute: .centerY,
                                                 multiplier: 1.0,
                                                 constant: 45.0)
        
        let bottomConstraintCy = NSLayoutConstraint(item: cylinder,
                                                    attribute: .centerX,
                                                    relatedBy: .equal,
                                                    toItem: graySquare,
                                                    attribute: .centerX,
                                                    multiplier: 1.0,
                                                    constant: 0.0)
        

        let widthCenterConstraintCy = NSLayoutConstraint(item: cylinder,
                                                 attribute: .width,
                                                 relatedBy: .lessThanOrEqual,
                                                 toItem: graySquare,
                                                 attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: -14.0)

        let heightConstraintCy = NSLayoutConstraint(item: cylinder,
                                                  attribute: .height,
                                                  relatedBy: .lessThanOrEqual,
                                                  toItem: graySquare,
                                                  attribute: .height,
                                                  multiplier: 1.0,
                                                  constant: -160.0)

        

        
        NSLayoutConstraint.activate([heightConstraintSq, widthConstraintSq, centerYConstraintSq, centerXConstraintSq, heightConstraintCy, widthCenterConstraintCy, topConstraintCy, bottomConstraintCy])
        
    }
}

