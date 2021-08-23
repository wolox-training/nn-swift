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
    weak var coordinator: HomeCoordinator?
    
    // MARK: - Private properties
    private let viewModel: HomeViewModelProtocol
    private let homeView: HomeViewProtocol
    private var tableDataSource = BookDataSource()
    
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
        tableDataSource.books.insert(book, at: 0)
        homeView.bookTable.reloadData()
    }
    
    // MARK: - Private methods
    private func configureTable() {
        homeView.bookTable.dataSource = tableDataSource
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
        tableDataSource.books = books
        homeView.bookTable.reloadData()
    }
    
    func errorBooks(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()

    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (_, _, completionHandler) in
            //self?.deletePostAt(indexPath)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}


/*class HomeViewController: WBooksViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let titles = ["A Little Bird Told Me", "When the Doves Disappeared", "The Best Book in the World", "Be Creative", "Redesign the Web" ]
    
    let subTitles = ["Timothy Cross", "Sofi Oksanen", "Peter Sjernstrom", "Tony Alcazar","Liliana Castilla"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        let nibName = UINib(nibName: "HomeCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "HomeCell")
                
    }
}


extension ListBooksController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.commonInit("img_book\(indexPath.item+1)", title: titles[indexPath.item], sub: subTitles[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = DetailsViewController("img_book\(indexPath.item+1)", titleBook: titles[indexPath.item])
        self.navigationController?.pushViewController(details, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
*/










