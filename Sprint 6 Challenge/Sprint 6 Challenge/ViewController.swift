//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK :- Properties
    
    let rangeSlider = SwipeUnlocker(frame: CGRect.zero)
    let imageView = UIImageView(image: UIImage(named: "Locked")!)
    @IBOutlet weak var resetButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        resetButton.isEnabled = false
        resetButton.tintColor = .clear
        rangeSlider.backgroundColor = UIColor.red
        
        view.addSubview(rangeSlider)
        
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 64),
            imageView.heightAnchor.constraint(equalToConstant: 64),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
        imageView.contentMode = .center
        
        rangeSlider.addTarget(self, action: #selector(self.rangeSliderValueChanged(rangeSlider:)), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider.frame = CGRect(x: margin, y: margin + view.frame.width,
                                   width: width, height: 31.0)
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: SwipeUnlocker){
        print("Range slider value changed: (\(rangeSlider.lowerValue))")
        
        if rangeSlider.isUnlocked {
            DispatchQueue.main.async {
                UIView.animate(withDuration: 1.0) {
                    self.imageView.image = UIImage(named: "Unlocked")!
                    self.rangeSlider.backgroundColor = .green
                    self.resetButton.isEnabled = true
                    self.resetButton.tintColor = .white
                }
            }
        }
    }
    
    @IBAction func resetLock(_ sender: Any) {
        
        rangeSlider.goBack()
        DispatchQueue.main.async {
            UIView.animate(withDuration: 1.0) {
                self.imageView.image = UIImage(named: "Locked")!
                self.rangeSlider.backgroundColor = .red
                self.resetButton.isEnabled = false
                self.resetButton.tintColor = .clear
            }
        }
    }
    
    
    
}




