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
    
    func configureWith(_ comment: Comment, _ user: [User]) {
        print(user, "configureWith")
        for item in user {
            print(item, "item")
            nameUser.text = item.username + " \(item.id)"
            userImage.kf.setImage(with: URL(string: (item.image)), completionHandler:  { [weak self] response in
                switch response {
                case .success:
                    self?.userImage.contentMode = .scaleAspectFill
                case .failure:
                    print("error")
                }
            })
        }
        
        commentUser.text = comment.content
        
    }
}

