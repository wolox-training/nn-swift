//
//  CommentsView.swift
//  WBooks
//
//  Created by noelia.nieres on 13/08/2021.
//
import UIKit
import Kingfisher

class CommentsCellView: UITableViewCell {
        
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var commentUser: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = userImage.frame.size.width/2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(_ comment: Comment,_ username: String,_ image: String) {
        commentUser.text = comment.content
        nameUser.text = username
        if let url = URL(string: image) {
            let resource = ImageResource(downloadURL: url)
            userImage.contentMode = .scaleAspectFill
            userImage.kf.indicatorType = .activity
            userImage.kf.setImage(with: resource)
        } else {
            userImage.image = UIImage(named: "img_user1.png")
        }
    }
}
