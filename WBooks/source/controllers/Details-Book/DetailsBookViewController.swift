//
//  DetailsBookViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//
import UIKit
import SVProgressHUD
import NotificationBannerSwift

class DetailsBookViewController: UIViewController {
    
    private let detailsView: DetailsBookViewProtocol
    private let viewModel: RentedBooksViewModelProtocol
    var book: Book!
    
    // MARK: - Initializer
    init(_ book: Book,
        view: DetailsBookViewProtocol = DetailsBookView(),
        viewModel: RentedBooksViewModelProtocol = RentedBooksViewModel()) {
        self.book = book
        detailsView = view
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden =  true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWith()
        setupActions()
    }
    
    override func loadView() {
        super.loadView()
        view = detailsView
    }
    private func setupActions() {
       // detailsView.addButtonAction(#selector(performWish), for: DetailsButtons.wish, from: self)
        detailsView.addButtonAction(#selector(performRent), for: DetailsButtons.rent, from: self)
    }
    
    @objc private func performRent() {
        SVProgressHUD.show()

        if(self.book.status == "Available"){
           viewModel.addBookRent(self.book.id, onError: errorRent(_:), onSuccess: setRent(_:))
        }else{
            showAlertMessage(message: "El libro no esta disponible")
        }
    }
    
    func setRent(_ rent: Rent) {
        SVProgressHUD.dismiss()
        //self.book.status = "Unavailable"
        print("llego aca!")
    }
    
    func errorRent(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()
    }
    
    func showAlertMessage(message: String) {
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        present(alertController, animated: true, completion: nil)
    }
    
    func configureWith() {
        detailsView.setTitleValue(self.book.title)
        detailsView.setEditorialValue(self.book.genre)
        detailsView.setAuthorValue(self.book.author)
        detailsView.setYearValue(self.book.year)
        detailsView.setAvailableValue(self.book.status)
        detailsView.setImage(self.book.image)
    }
}
