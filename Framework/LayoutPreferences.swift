//
//  LayoutPreferences.swift
//  Framework
//
//  Created by Miguel Pimentel on 31/05/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class LayoutPreferences: NSObject {
    
    public static func setStatusBarColor(color: UIColor) {
        
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
    
    public static func setStatusBarTextColorToBlack() {
        
        UIApplication.shared.statusBarStyle = .default
    }
    
    
    public static func setStatusBarToWhite() {
        
        UIApplication.shared.statusBarStyle = .lightContent
    }

}


extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    public convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
