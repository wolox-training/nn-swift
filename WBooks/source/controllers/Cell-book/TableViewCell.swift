//
//  TableViewCell.swift
//  WBooks
//
//  Created by noelia.nieres on 09/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15))
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
    
    func commonInit(_ imageName: String, title: String, sub: String){
        logoImage.image = UIImage(named: imageName)
        titleLabel.text = title
        subLabel.text = sub
    }
}
