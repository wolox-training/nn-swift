//
//  CommentsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import NotificationBannerSwift
import SVProgressHUD
import UIKit

final class CommentsViewController: UIViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let viewModel: CommentsViewModelProtocol
    private let commentView: CommentsViewProtocol
    
    var comments: [Comment] = []
    
    // MARK: - Initializers
    init(viewModel: CommentsViewModelProtocol = CommentsViewModel(),
         view: CommentsViewProtocol = CommentsView()) {
        self.viewModel = viewModel
        commentView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        getComments()
    }
    
    override func loadView() {
        super.loadView()
        view = commentView
    }
    
    // MARK: - Public methods
    func updateDataWith(_ comment: Comment) {
        comments.insert(comment, at: 0)
        commentView.commentTable.reloadData()
    }
    
    // MARK: - Private methods
    private func configureTable() {
        commentView.commentTable.dataSource = self
        commentView.commentTable.delegate = self
        commentView.commentTable.separatorStyle = .none
        commentView.commentTable.showsVerticalScrollIndicator = false
        commentView.commentTable.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        commentView.commentTable.rowHeight = 120
        
        let nib = UINib(nibName: "CommentsCellView", bundle: nil)
        commentView.commentTable.register(nib, forCellReuseIdentifier: "CommentsCellView")
    }

}

private extension CommentsViewController {
    // MARK: - Posts methods
    func getComments() {
        SVProgressHUD.show()
        viewModel.getComments("2", onError: errorComments(_:) , onSuccess: setComments(_:))

    }
    func setComments(_ comments: [Comment]) {
        SVProgressHUD.dismiss()
        self.comments = comments
        commentView.commentTable.reloadData()
    }
    
    func errorComments(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()

    }
}

extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentsCellView", for: indexPath)
        
        guard let commentCell = cell as? CommentsCellView,
              comments.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        
        commentCell.configureWith(comments[indexPath.row])
        return commentCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
