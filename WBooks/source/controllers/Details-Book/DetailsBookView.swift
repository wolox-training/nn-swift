//
//  DetailsBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import UIKit
import Kingfisher

extension UIColor {
    static func cerulean() -> UIColor {
        return UIColor(red: 0.00, green: 0.68, blue: 0.93, alpha: 1)
    }
    static func backgroundPolar() -> UIColor {
        return UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
    }
    static func backgroundNav() -> UIColor {
        return UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
    }
}


protocol DetailsBookViewProtocol: UIView {
    func setTitleValue(_ valor: String)
    func setAuthorValue(_ valor: String)
    func setYearValue(_ valor: String)
    func setEditorialValue(_ valor: String)
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
            rentButton.layer.cornerRadius = 20
            rentButton.layer.borderWidth = 1
            rentButton.clipsToBounds = true
            rentButton.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    @IBOutlet weak var wishButton: UIButton! {
        didSet {
            wishButton.layer.cornerRadius = 20
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
    func setImage(_ image: String) {
        //detailImage.isHidden = false
        detailImage.kf.setImage(with: URL(string: image), completionHandler:  { [weak self] response in
            switch response {
            case .success:
                self?.detailImage.contentMode = .scaleAspectFill
            case .failure:
                print("error")
            }
        })
    }
}
