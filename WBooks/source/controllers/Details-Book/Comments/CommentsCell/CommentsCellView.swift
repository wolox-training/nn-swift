//
//  CommentsView.swift
//  WBooks
//
//  Created by noelia.nieres on 13/08/2021.
//

import UIKit

class CommentsCellView: UITableViewCell {
        
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var commentUser: UILabel!
    
    var comment: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func commonInit(_ imageName: String, title: String, sub: String){
        userImage.image = UIImage(named: imageName)
        nameUser.text = title
        commentUser.text = sub
        //self.comment = sub
    }
}

