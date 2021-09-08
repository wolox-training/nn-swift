//
//  FormTextField.swift
//  WBooks
//
//  Created by noelia.nieres on 06/09/2021.
//

import UIKit

@IBDesignable
class FormTextField: UITextField, UITextFieldDelegate {
    
    private var characterLimit: Int?

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var maxLength: Int {
        get {
            guard let length = characterLimit else {
                return Int.max
            }
            return length
        }
        set {
            characterLimit = newValue
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

  /*  @objc func checkLength(textField: UITextField) -> Bool {
        guard let prospectiveText = self.text,
          if (prospectiveText.trimmingCharacters(in: .whitespaces).isEmpty){
                  return false

          }else{
              return true
         }
        
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {
           if textfield1.text == "" {
               //loginbttn.isEnabled = false;
           }else{
                //loginbttn.isEnabled = true;
           }
       }*/

}
