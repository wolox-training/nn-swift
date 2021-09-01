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
        logoImage.kf.setImage(with: URL(string: book.image), completionHandler:  { [weak self] response in
            switch response {
            case .success:
                self?.logoImage.contentMode = .scaleAspectFill
            case .failure:
                print("error")
            }
        })
    }
}
