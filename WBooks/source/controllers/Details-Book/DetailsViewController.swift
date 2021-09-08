//
//  DetailsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//
import UIKit

class DetailsViewController: ScrollStackViewController {
    
    var bookViewModel: Book!

    init(_ viewModel: Book) {
        self.bookViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func addChildrenViewControllers(){
        let details = DetailsBookViewController()
        details.configureWith(bookViewModel)
        
        let comment = CommentsViewController()
        comment.getBookComments(bookViewModel.id)
        add(details)
        add(comment)
    }
}
