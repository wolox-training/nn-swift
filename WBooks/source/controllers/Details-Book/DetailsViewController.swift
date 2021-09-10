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
        self.navigationItem.title = "BOOK DETAIL"
    }

    override func addChildrenViewControllers(){
        add(DetailsBookViewController(bookViewModel))
        add(CommentsViewController(bookViewModel))
    }
}
