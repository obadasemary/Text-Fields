//
//  ViewController.swift
//  Text Fields
//
//  Created by Abdelrahman Mohamed on 12/13/15.
//  Copyright © 2015 Abdelrahman Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    
    @IBOutlet weak var characterCountLabel: UILabel!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterCountLabel.hidden = true
        
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        self.textField4.delegate = randomColorDelegate
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        self.characterCountLabel.hidden = (newText.length == 0)
        
        self.characterCountLabel.text = String(newText.length)
        
        return true
    }
}

