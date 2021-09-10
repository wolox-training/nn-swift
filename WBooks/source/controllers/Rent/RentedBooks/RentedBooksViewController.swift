//
//  BookSuggestionsView.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//
import NotificationBannerSwift
import SVProgressHUD
import UIKit

final class RentedBooksViewController: UIViewController {
    
    // MARK: - Private properties
    private let viewModel: RentedBooksViewModelProtocol
    private let homeView: HomeViewProtocol
    private let homeViewModel: HomeViewModelProtocol
     
    var books: [Book] = []
    var rents: [Rent] = []
    var filter: [Book] = []
    // MARK: - Initializers
    init(viewModel: RentedBooksViewModelProtocol = RentedBooksViewModel(),
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
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        configureTable()
        getRents()
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

private extension RentedBooksViewController {
    // MARK: - Posts methods
    
    func getRents() {
        SVProgressHUD.show()
        viewModel.getBookRent(onError: errorRents(_:), onSuccess: setRents(_:))
    }
    
    func setRents(_ rents: [Rent]) {
        SVProgressHUD.dismiss()
        self.rents = rents
    }
    
    func errorRents(_ message: String) {
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
        listaFilter()
    }
    
    func errorBooks(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()
    }
    func listaFilter(){
        self.books = self.books.filter { item in rents.contains (where: { $0.book_id == item.id }) }
        homeView.bookTable.reloadData()
    }
}

extension RentedBooksViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as? HomeCell
        cell!.configureWith(books[indexPath.row])
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var valor = homeViewModel.getCellViewModel(at: indexPath)
        valor.status = "In your hands"
        let vc = DetailsViewController(valor)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
