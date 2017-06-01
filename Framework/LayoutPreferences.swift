//
//  LayoutPreferences.swift
//  Framework
//
//  Created by Miguel Pimentel on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit


public class LayoutPreferences: NSObject {
    
    public static func setStatusBarColor(color: UIColor) {
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
    
    public static func setStatusBarTextColorToBlack() {
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    
    public static func setStatusBarTextColorToWhite() {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    public static func navigationControllerProperties(color: UIColor, textColor: UIColor, iconColor: UIColor) {
        
        navigationControllerColor(color: color)
        textColorToNavbar(color: textColor)
        iconColorToNavbar(color: iconColor)
    }
    
    
    public static func navigationControllerColor(color: UIColor) {
        
        UINavigationBar.appearance().barTintColor = color
    }
    
    public static func textColorToNavbar(color: UIColor) {
        
        UINavigationBar.appearance().titleTextAttributes =  [NSForegroundColorAttributeName: color]
    }
    
    
    public static func iconColorToNavbar(color: UIColor) {
        
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}

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
