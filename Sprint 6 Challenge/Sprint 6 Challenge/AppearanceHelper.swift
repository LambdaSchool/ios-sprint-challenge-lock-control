//
//  AppearanceHelper.swift
//  Sprint 6 Challenge
//
//  Created by Jocelyn Stuart on 2/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//
import UIKit

enum AppearanceHelper {
    
    static var lambdaRed = UIColor(red: 212.0/255.0, green: 87.0/255.0, blue: 80.0/255.0, alpha: 1.0)
    static var backgroundGray = UIColor(red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    
  
    
    static func setAppearance() {
        UINavigationBar.appearance().barTintColor = lambdaRed
        UIBarButtonItem.appearance().tintColor = backgroundGray
        
        let textAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
        
        
        
        /* UITextField.appearance().font = UIFont(name: "RM Typerighter medium", size: 30)! //font is not marked as something that can be styled with UIAppearance, even tho this works, we should not use it*/
        
    }
    
  /*  static func style(button: UIButton) {
        button.titleLabel?.font = typerighterFont(with: .callout, pointSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = lambdaRed
        button.layer.cornerRadius = 8
    }
    */
    
}
