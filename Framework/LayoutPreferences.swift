//
//  LayoutPreferences.swift
//  Framework
//
//  Created by Miguel Pimentel on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit


public class LayoutPreferences: NSObject {
    
   
    // Set background color to status bar
    public static func setStatusBarColor(color: UIColor) {
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
            

        }
    }
    
    // Set status bar text color to black
    public static func setStatusBarTextColorToBlack() {
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    // Set status bar text colot to white
    public static func setStatusBarTextColorToWhite() {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    // Set navigation bar background color, text colot e color for icons
    public static func navigationControllerProperties(color: UIColor, textColor: UIColor, iconColor: UIColor) {
        
        navigationControllerColor(color: color)
        textColorToNavbar(color: textColor)
        iconColorToNavbar(color: iconColor)
    }
    
    // Set navigation controller background color
    public static func navigationControllerColor(color: UIColor) {
        
        UINavigationBar.appearance().barTintColor = color
    }
    
    
    // Set text color in navbar
    public static func textColorToNavbar(color: UIColor) {
        
        UINavigationBar.appearance().titleTextAttributes =  [NSForegroundColorAttributeName: color]
    }
    
    // Set navbar icon color
    public static func iconColorToNavbar(color: UIColor) {
        
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    // Hide navbarColor
    public static func hideNavigationBar(navigationController: UINavigationController) {
        
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
   
    // Set view background color
    public static func changeViewBackgroundColor(view: UIView, color: UIColor) {
        
        view.backgroundColor = color
    }
}

// Set possibility to hide keyboard when tapped around
extension UIViewController {
    
    public func hideKeyboardWhenTappedAround() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
    
        view.endEditing(true)
    }
}



// Set possibility to use hexadecimal colors in UIColor
extension UIColor {
    convenience public init(red: Int, green: Int, blue: Int) {
        
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience public init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
