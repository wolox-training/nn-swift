//
//  CommentsView.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import Foundation
import UIKit

protocol CommentsViewProtocol: UIView {
    var commentTable: UITableView { get }

}

class CommentsView: NibView {
    @IBOutlet weak var commentsTable: UITableView!
}


extension CommentsView: CommentsViewProtocol {
    var commentTable: UITableView { commentsTable }
    
}
