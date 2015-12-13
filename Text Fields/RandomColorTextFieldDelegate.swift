//
//  RandomColorTextFieldDelegate.swift
//  Text Fields
//
//  Created by Abdelrahman Mohamed on 12/13/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    var colors: [UIColor]!
    
    override init() {
        super.init()

        colors = [UIColor.redColor(),
            UIColor.orangeColor(),
            UIColor.yellowColor(),
            UIColor.greenColor(),
            UIColor.blueColor(),
            UIColor.purpleColor(),
            UIColor.brownColor()
        ]
    }
    
    
    func randomColor() -> UIColor {
        
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        textField.textColor = self.randomColor()
        return true
    }
}
