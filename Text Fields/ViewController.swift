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
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    
    @IBOutlet weak var editingSwitch: UISwitch!
    
    @IBOutlet weak var characterCountLabel: UILabel!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterCountLabel.hidden = true
        
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = randomColorDelegate
        self.textField4.delegate = self
        self.textField5.delegate = self.zipCodeDelegate
        self.textField6.delegate = cashDelegate
        
        self.editingSwitch.setOn(false, animated: false)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var newText: NSString = textField.text!
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        self.characterCountLabel.hidden = (newText.length == 0)
        
        self.characterCountLabel.text = String(newText.length)
        
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return self.editingSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    @IBAction func toggleTheTextEditor(sender: AnyObject) {
        if !(sender as! UISwitch).on {
            self.textField4.resignFirstResponder()
        }
    }
}

