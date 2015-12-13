//
//  EmojiTextFieldDelegate.swift
//  Text Fields
//
//  Created by Abdelrahman Mohamed on 12/13/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import Foundation
import UIKit

class EmojiTextFieldDelegate: NSObject, UITextFieldDelegate {
    var translations = [String : String]()
    
    override init() {
        super.init()
        
        translations["heart"] = "💖"
        translations["fish"] = "🐠"
        translations["bird"] = "🐤"
        translations["frog"] = "🐸"
        translations["bear"] = "🐨"
        translations["dog"] = "🐶"
        translations["cat"] = "😸"
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var replacedAnEmoji = false
        var emojiStringRange: NSRange
        
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        for (emojiString, emoji) in translations {
            repeat {
                emojiStringRange = newText.rangeOfString(emojiString, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
                if emojiStringRange.location != NSNotFound {
                    newText = newText.stringByReplacingCharactersInRange(emojiStringRange, withString: emoji)
                    replacedAnEmoji = true
                }
            } while emojiStringRange.location != NSNotFound
        }
        
        if replacedAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
}