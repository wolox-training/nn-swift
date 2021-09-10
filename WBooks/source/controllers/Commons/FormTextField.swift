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
    
    override init(frame: CGRect) {
            super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setBottomLine()
    }
    
    func setBottomLine() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }

    @objc func checkSendButton(_ sender: UITextField) {
        if((sender.text?.count)! > 0 && !(sender.text!.trimmingCharacters(in: .whitespaces)).isEmpty){
            //self.sendButton.isEnabled = true
        }
        else{
            //self.sendButton.isEnabled = false
        }
    }
    
}
