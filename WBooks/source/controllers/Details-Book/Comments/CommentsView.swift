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
    
    @IBOutlet weak var borderView: UIView!{
        didSet {
            borderView.layer.cornerRadius = 5
            borderView.backgroundColor = .white
            borderView.layer.cornerRadius = 20
            borderView.layer.borderWidth = 1
            borderView.layer.borderColor = UIColor.whiteColor().cgColor
            borderView.clipsToBounds = true
        }
    }
    
    @IBOutlet var backgroundView: UIView!{
        didSet {
            backgroundView.backgroundColor = .backgroundPolar()
        }
    }
}

extension CommentsView: CommentsViewProtocol {
    var commentTable: UITableView { commentsTable }
}
