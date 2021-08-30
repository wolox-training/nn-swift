//
//  DetailsBookView.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import UIKit

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
        detailImage.image = UIImage(named:image)
    }
}
