//
//  NewBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//
import UIKit

enum NewButtons {
    case book
    case openCamera
}

protocol NewBookViewProtocol: UIView {
    func getNameBook() -> String
    func getAuthorBook() -> String
    func getYearBook() -> String
    func getTopicBook() -> String
    func getDescriptionBook() -> String
    func addButtonAction(_ action: Selector, for button: NewButtons, from vc: UIViewController)
    func setImage(_ valor: UIImage)
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
            submitButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
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
    func getNameBook() -> String { nameBook.text! }
    func getAuthorBook() -> String { authorBook.text! }
    func getYearBook() -> String { yearBook.text! }
    func getTopicBook() -> String { topicBook.text! }
    func getDescriptionBook() -> String { descriptionBook.text! }
    func addButtonAction(_ action: Selector, for button: NewButtons, from vc: UIViewController) {
       switch button {
          case .book:
            submitButton.addTarget(vc, action: action, for: .touchUpInside)
          case .openCamera:
            addImage.addTarget(vc, action: action, for: .touchUpInside)
       }
    }
    
    func setImage(_ valor: UIImage) {
        addImage.setBackgroundImage(valor, for: .normal)
    }
}
