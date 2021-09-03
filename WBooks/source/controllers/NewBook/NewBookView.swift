//
//  NewBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit

protocol NewBookViewProtocol: UIView {
   
}

final class NewBookView: NibView{

    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var nameBook: UITextField! {
        didSet {
            nameBook.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var authorBook: UITextField!{
        didSet {
            authorBook.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var yearBook: UITextField!{
        didSet {
            yearBook.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var topicBook: UITextField!{
        didSet {
            topicBook.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var descriptionBook: UITextField!{
        didSet {
            descriptionBook.layer.cornerRadius = 8
        }
    }
    @IBOutlet weak var submitButton: UIButton!{
        didSet {
            submitButton.layer.cornerRadius = 20
            submitButton.layer.borderWidth = 1
            submitButton.clipsToBounds = true
        }
    }
    @IBOutlet var backgroundView: UIView!{
        didSet {
            backgroundView.backgroundColor = .backgroundPolar()
        }
    }
    @IBOutlet weak var borderView: UIView!{
        didSet {
            borderView.layer.cornerRadius = 5
            borderView.backgroundColor = .white
            borderView.layer.cornerRadius = 20
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1) 
            borderView.clipsToBounds = true
        }
    }
}
extension NewBookView: NewBookViewProtocol {
    
}
