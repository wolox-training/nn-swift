//
//  HomeCell.swift
//  WBooks
//
//  Created by noelia.nieres on 09/08/2021.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: self)
    }
}


class HomeCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        //let margins = UIEdgeInsets(top: 8, left:15, bottom: 8, right: 50)
        //contentView.frame = contentView.frame.inset(by: margins)
        
        let padding = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 50)
        contentView.frame = bounds.inset(by: padding)
        
        self.contentView.layer.borderColor = UIColor.white.cgColor
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.cornerRadius = 8
        //self.contentView.clipsToBounds = true
        
        self.contentView.backgroundColor = .white
        self.backgroundColor = .clear
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(_ book: Book) {
        print("configureWith")
        logoImage.image = UIImage(named: book.image)
        titleLabel.text = book.title
        subLabel.text = book.genre
        
    }
    func commonInit(_ imageName: String, title: String, sub: String){
        logoImage.image = UIImage(named: imageName)
        titleLabel.text = title
        subLabel.text = sub
    }
}
