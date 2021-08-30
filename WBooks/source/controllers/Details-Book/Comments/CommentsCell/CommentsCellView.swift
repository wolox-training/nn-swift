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
    
    func configureWith(_ comment: Comment) {
        nameUser.text = "PRUEBA"
        commentUser.text = comment.content
        /*userImage.kf.setImage(with: URL(string: comment.user.imageURL), completionHandler:  { [weak self] response in
            switch response {
            case .success:
                self?.userImage.contentMode = .scaleAspectFill
            case .failure:
                print("error")
            }
        })*/
    }
}

