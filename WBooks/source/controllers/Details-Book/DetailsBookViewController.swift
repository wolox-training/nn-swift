//
//  DetailsBookViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import UIKit

class DetailsBookViewController: WBooksViewController {
    
    private let detailsView: DetailsBookViewProtocol
    
    // MARK: - Initializer
    init(view: DetailsBookViewProtocol = DetailsBookView()) {
        detailsView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }
    
    func configureWith(_ book: Book) {
        detailsView.setTitleValue(book.title)
        detailsView.setEditorialValue(book.genre)
        detailsView.setAuthorValue(book.author)
        detailsView.setYearValue(book.year)
        detailsView.setImage(book.image)
    }
}
