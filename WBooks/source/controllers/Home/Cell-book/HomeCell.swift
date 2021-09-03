//
//  HomeCell.swift
//  WBooks
//
//  Created by noelia.nieres on 09/08/2021.
//

import UIKit
import Kingfisher

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    @IBOutlet weak var borderView: UIView!{
        didSet {
            borderView.layer.cornerRadius = 5
            borderView.backgroundColor = .white
            borderView.layer.cornerRadius = 20
            borderView.layer.borderWidth = 1
            borderView.clipsToBounds = true
            borderView.layer.borderColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
    @IBOutlet weak var cellBackground: UIView!{
        didSet {
            cellBackground.backgroundColor = .backgroundPolar()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(_ book: Book) {
        titleLabel.text = book.title
        subLabel.text = book.genre
        
        if let url = URL(string: book.image) {
            let resource = ImageResource(downloadURL: url)
            self.logoImage.contentMode = .scaleAspectFill
            logoImage.kf.indicatorType = .activity
            logoImage.kf.setImage(with: resource)
        } else {
            logoImage.image = UIImage(named: "img_book6.png")
        }
    }
}
