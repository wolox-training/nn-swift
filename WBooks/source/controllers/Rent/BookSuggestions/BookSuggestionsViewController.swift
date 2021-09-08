//
//  RentedBooksViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//

import NotificationBannerSwift
import SVProgressHUD
import Kingfisher
import UIKit

final class BookSuggestionsViewController: UIViewController {
    
    // MARK: - Private properties
     let viewModel: BookSuggestionsViewModelProtocol
     let suggestionsView: BookSuggestionsViewProtocol

    var books: [Suggestion] = []
    
    // MARK: - Initializers
    init(viewModel: BookSuggestionsViewModelProtocol = BookSuggestionsViewModel(),
         view: BookSuggestionsViewProtocol = BookSuggestionsView()) {
        self.viewModel = viewModel
        suggestionsView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        configureTable()
        getBooks()
    }
    
    override func loadView() {
        super.loadView()
        view = suggestionsView
    }
    
    // MARK: - Public methods
    func updateDataWith(_ book: Suggestion) {
        books.insert(book, at: 0)
        suggestionsView.collectionBooks.reloadData()
    }
    
    // MARK: - Private methods
    private func configureTable() {
        suggestionsView.collectionBooks.dataSource = self
        suggestionsView.collectionBooks.delegate = self
        suggestionsView.collectionBooks.backgroundColor = .backgroundPolar()
        suggestionsView.collectionBooks.showsHorizontalScrollIndicator = false

        let nib = UINib(nibName: "BookSuggestionCell", bundle: nil)
        suggestionsView.collectionBooks.register(nib, forCellWithReuseIdentifier: "BookSuggestionCell")
    }
    
    func getBooks() {
        SVProgressHUD.show()
        viewModel.getSuggestions(onError: errorBooks(_:), onSuccess: setBooks(_:))
    }
    func setBooks(_ books: [Suggestion]) {
        SVProgressHUD.dismiss()
        self.books = books
        suggestionsView.collectionBooks.reloadData()
    }
    func errorBooks(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()
    }
}

extension BookSuggestionsViewController : UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookSuggestionCell", for: indexPath) as! BookSuggestionCell
        
        if let url = URL(string: books[indexPath.item].link) {
            let resource = ImageResource(downloadURL: url)
            //cell.imageBook.contentMode = .scaleAspectFill
            cell.imageBook.kf.indicatorType = .activity
            cell.imageBook.kf.setImage(with: resource)
        }
       
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
extension BookSuggestionsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 55, height: 80)
    }
}
