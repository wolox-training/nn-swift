//
//  HomeViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 09/08/2021.
//

import NotificationBannerSwift
import SVProgressHUD
import UIKit

struct System {
    static func clearNavigationBar(forBar navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
}

final class HomeViewController: UIViewController {
    // MARK: - Public properties
    
    // MARK: - Private properties
    private let viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    //private var tableDataSource = BookDataSource()
    
    var books: [Book] = []
    
    // MARK: - Initializers
    init(viewModel: HomeViewModelProtocol = HomeViewModel(),
         view: HomeViewProtocol = HomeView()) {
        self.viewModel = viewModel
        homeView = view
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        getBooks()
    }
    
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    // MARK: - Public methods
    func updateDataWith(_ book: Book) {
        books.insert(book, at: 0)
        homeView.bookTable.reloadData()
    }
    
    // MARK: - Private methods
    private func configureTable() {
        homeView.bookTable.dataSource = self
        homeView.bookTable.delegate = self
        homeView.bookTable.separatorStyle = .none
        homeView.bookTable.showsVerticalScrollIndicator = false
        homeView.bookTable.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        homeView.bookTable.rowHeight = 120
        
        let nib = UINib(nibName: "HomeCell", bundle: nil)
        homeView.bookTable.register(nib, forCellReuseIdentifier: "HomeCell")
    }

}

private extension HomeViewController {
    // MARK: - Posts methods
    func getBooks() {
        SVProgressHUD.show()
        viewModel.getBooks(onError: errorBooks(_:), onSuccess: setBooks(_:))
    }
    func setBooks(_ books: [Book]) {
        SVProgressHUD.dismiss()
        self.books = books
        homeView.bookTable.reloadData()
    }
    
    func errorBooks(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()

    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        
        guard let bookCell = cell as? HomeCell,
              books.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        print(bookCell, "bookCell")
        
        bookCell.configureWith(books[indexPath.row])
        return bookCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailBookViewController = DetailsBookViewController()
        detailBookViewController.configureWith(books[indexPath.row])

        let vc = DetailsViewController()
        //present( vc, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

