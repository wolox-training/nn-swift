//
//  CommentsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import NotificationBannerSwift
import SVProgressHUD
import Kingfisher
import UIKit


final class CommentsViewController: UIViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let viewModel: CommentsViewModelProtocol
    private let commentView: CommentsViewProtocol
    
    var comments: [Comment] = []
    var users: [User] = []
   

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
        //commentView.commentTable.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        commentView.commentTable.rowHeight = 120
        commentView.commentTable.backgroundColor = .backgroundPolar()
    
        commentView.commentTable.isScrollEnabled = false
        
        let nib = UINib(nibName: "CommentsCellView", bundle: nil)
        commentView.commentTable.register(nib, forCellReuseIdentifier: "CommentsCellView")
    }

}

extension CommentsViewController {
    // MARK: - Posts methods
    func getBookComments(_ bookId: Int) {
        SVProgressHUD.show()
        viewModel.getBookComments(bookId, onError: errorComments(_:) , onSuccess: setComments(_:))

    }
    func setComments(_ comments: [Comment]) {
        SVProgressHUD.dismiss()
        self.comments = comments
        print(self.comments, "self.commests")
        
        commentView.commentTable.reloadData()
        
        for item in self.comments {
            getUser(item.user_id)
        }
    }
    
    func errorComments(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()

    }
    
    func getUser(_ comments: Int) {
        SVProgressHUD.show()
        viewModel.getUserComment(comments, onError: errorUser(_:) , onSuccess: setUser(_:))

    }
    func setUser(_ user: User) {
        SVProgressHUD.dismiss()
        self.users.append(user)
        viewModel.setUsuarios(user)
       

        commentView.commentTable.reloadData()
    }
    
    func errorUser(_ message: String) {
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
              comments.indices.contains(indexPath.row) else { return UITableViewCell()}
        guard let username = users.first(where: { $0.id == comments[indexPath.row].user_id })?.username else { return UITableViewCell() }
        guard let image = users.first(where: { $0.id == comments[indexPath.row].user_id })?.image else { return UITableViewCell() }
        
        commentCell.configureWith(self.comments[indexPath.row],username,image)
        
        return commentCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return users.count
    }
    
}
