//
//  ColorizerTextFieldDelegate.swift
//  Text Fields
//
//  Created by Abdelrahman Mohamed on 12/13/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

class ColorizerTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var colors : [String : UIColor]!
    
    override init() {
        super.init()
        
        colors = [
            "red": UIColor.redColor(),
            "orange":  UIColor.orangeColor(),
            "yellow":  UIColor.yellowColor(),
            "green":  UIColor.greenColor(),
            "blue":  UIColor.blueColor(),
            "brown":  UIColor.brownColor(),
            "black":  UIColor.blackColor(),
            "purple":  UIColor.purpleColor(),
            "cyan" : UIColor.cyanColor(),
            "magenta" : UIColor.magentaColor(),
            "white" : UIColor.whiteColor()
        ]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var colorsInTheText = [UIColor]()
        var newText: NSString
        
        newText = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        for (key, color) in self.colors {
            
            if newText.rangeOfString(key, options: NSStringCompareOptions.CaseInsensitiveSearch).location != NSNotFound {
                colorsInTheText.append(color)
            }
        }
        
        if colorsInTheText.count > 0 {
            textField.textColor = self.blendColorArray(colorsInTheText)
        }
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    
    func blendColorArray(colors: [UIColor]) -> UIColor {
        var colorComponents: [CGFloat] = [CGFloat](count: 4, repeatedValue: 0.0)
        
        for color in colors {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0
            
            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            
            colorComponents[0] += red
            colorComponents[1] += green
            colorComponents[2] += blue
            colorComponents[3] += alpha
        }
        
        for i in 0...colorComponents.count - 1 {
            colorComponents[i] /= CGFloat(colors.count)

        }
        
        return UIColor(red: colorComponents[0], green: colorComponents[1], blue: colorComponents[2], alpha: colorComponents[3])
    }
}