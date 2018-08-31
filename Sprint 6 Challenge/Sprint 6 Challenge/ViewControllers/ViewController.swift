//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let containerView: UIView =
    {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let lockImageView: UIImageView =
    {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Locked"))
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    lazy var lockSlider: LockSlider =
    {
        let ls = LockSlider(frame: CGRect(x: view.frame.midX - 150, y: view.frame.midY + 90, width: 300, height: 50))
        ls.backgroundColor = .lightGray
        ls.dotColor = .black
        ls.allowDraggingOutside = true
        ls.translatesAutoresizingMaskIntoConstraints = false
        ls.addTarget(self, action: #selector(handleLockUnlocked), for: .valueChanged)
            
        return ls
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupViews()
    }
    
    @objc private func handleLockUnlocked()
    {
        if !lockSlider.isLocked
        {
            lockImageView.image = #imageLiteral(resourceName: "Unlocked")
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.tintColor = .white
        }
        else
        {
            lockImageView.image = #imageLiteral(resourceName: "Locked")
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.tintColor = .clear
        }
    }
    
    @objc func handleReset()
    {
        lockSlider.reset()
    }
    
    private func setupNavBar()
    {
        title = "Lock Slider"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(handleReset))
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.tintColor = .clear
    }
    
    private func setupViews()
    {
        view.addSubview(containerView)
        containerView.addSubview(lockImageView)
        view.addSubview(lockSlider)
        view.bringSubview(toFront: lockSlider)
        
        containerView.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingRight: 20, paddingBottom: 0, width: 0, height: 400)
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lockImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingRight: 50, paddingBottom: -100, width: 0, height: 0)
    }
}


























