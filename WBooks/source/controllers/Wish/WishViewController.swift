//
//  WishViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 10/09/2021.
//
import NotificationBannerSwift
import SVProgressHUD
import UIKit

final class WishViewController: UIViewController {
    
    // MARK: - Private properties
    private let viewModel: WishViewModelProtocol
    private let homeView: HomeViewProtocol
    private let homeViewModel: HomeViewModelProtocol
     
    var books: [Book] = []
    var wishes: [Wish] = []
    
    // MARK: - Initializers
    init(viewModel: WishViewModelProtocol = WishViewModel(),
         view: HomeViewProtocol = HomeView(),
         homeViewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.viewModel = viewModel
        self.homeViewModel = homeViewModel
        homeView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MY WISHES"
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        configureTable()
        getWishes()
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
        homeView.bookTable.rowHeight = 120
        homeView.bookTable.backgroundColor = .backgroundPolar()
        homeView.bookTable.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        let nib = UINib(nibName: "HomeCell", bundle: nil)
        homeView.bookTable.register(nib, forCellReuseIdentifier: "HomeCell")
    }
}

private extension WishViewController {
    // MARK: - Posts methods
    
    func getWishes() {
        SVProgressHUD.show()
        viewModel.getWishes(onError: errorWishes(_:), onSuccess: setWishes(_:))
    }
    
    func setWishes(_ wishes: [Wish]) {
        SVProgressHUD.dismiss()
        self.wishes = wishes
        homeView.bookTable.reloadData()
    }
    
    func errorWishes(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()
    }
    
    func getBooks() {
        SVProgressHUD.show()
        homeViewModel.getBooks(onError: errorBooks(_:), onSuccess: setBooks(_:))
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

extension WishViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books.filter { item in wishes.contains (where: { $0.book_id == item.id }) }.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath)
        
        guard let bookCell = cell as? HomeCell,
              books.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        bookCell.configureWith(books[indexPath.row])
        
        return bookCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
