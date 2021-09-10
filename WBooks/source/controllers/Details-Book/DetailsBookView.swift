//
//  DetailsBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//
import UIKit
import Kingfisher

enum DetailsButtons {
    case wish
    case rent
}

protocol DetailsBookViewProtocol: UIView {
    func setTitleValue(_ valor: String)
    func setAuthorValue(_ valor: String)
    func setYearValue(_ valor: String)
    func setEditorialValue(_ valor: String)
    func setAvailableValue(_ valor: String)
    func addButtonAction(_ action: Selector, for button: DetailsButtons, from vc: UIViewController)
    func setImage(_ image: String)
}

class DetailsBookView: NibView {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var available: UILabel!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var editorial: UILabel!

    @IBOutlet weak var rentButton: UIButton!{
        didSet {
            rentButton.layer.cornerRadius = 15
            rentButton.layer.borderWidth = 1
            rentButton.clipsToBounds = true
            rentButton.layer.borderColor = UIColor.cerulean().cgColor
        }
    }
    @IBOutlet weak var wishButton: UIButton! {
        didSet {
            wishButton.layer.cornerRadius = 15
            wishButton.layer.borderWidth = 1
            wishButton.layer.borderColor = UIColor.cerulean().cgColor
            wishButton.setTitleColor(.cerulean(), for: .normal)
        }
    }
}

extension DetailsBookView: DetailsBookViewProtocol {
   
    func setTitleValue(_ valor: String) {
        titleBook.text = valor
    }
    
    func setAuthorValue(_ valor: String) {
        author.text = valor
    }
    
    func setYearValue(_ valor: String) {
        year.text = valor
    }
    
    func setEditorialValue(_ valor: String) {
        editorial.text = valor
    }
    
    func setAvailableValue(_ valor: String) {
        available.text = valor
        if(valor == "Available"){
            available.textColor = .green
            rentButton.blueGradientBackground()
        }else{
            available.textColor = .red
            rentButton.isEnabled = false
            rentButton.layer.backgroundColor = UIColor.grey().cgColor
        }
    }
    
    func setImage(_ image: String) {
        detailImage.kf.setImage(with: URL(string: image), completionHandler:  { [weak self] response in
            switch response {
            case .success:
                self?.detailImage.contentMode = .scaleAspectFill
            case .failure:
                print("error")
            }
        })
    }
    func addButtonAction(_ action: Selector, for button: DetailsButtons, from vc: UIViewController) {
       switch button {
          case .wish:
            wishButton.addTarget(vc, action: action, for: .touchUpInside)
          case .rent:
            rentButton.addTarget(vc, action: action, for: .touchUpInside)
       }
    }
}
