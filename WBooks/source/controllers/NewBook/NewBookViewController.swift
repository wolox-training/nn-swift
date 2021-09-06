//
//  NewBookViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit
import SVProgressHUD
import NotificationBannerSwift

class NewBookViewController: UIViewController {

    // MARK: - Private properties
    private let viewModel: NewBookViewModelProtocol
    private let newView: NewBookViewProtocol
    var bookRequest: BookRequest?
    var imagePicker = UIImagePickerController()
   
    // MARK: - Initializers
    init(viewModel: NewBookViewModelProtocol = NewBookViewModel(),
         view: NewBookViewProtocol = NewBookView()) {
        self.viewModel = viewModel
        newView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        setupActions()
        
    }
    
    override func loadView() {
        super.loadView()
        view = newView
    }
    
    @objc private func setPicture() {
           if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
               imagePicker.delegate = self
               imagePicker.sourceType = .photoLibrary
               imagePicker.allowsEditing = false

               present(imagePicker, animated: true, completion: nil)
           }
    }
    
    private func setupActions() {
        newView.addButtonAction(#selector(setPicture), for: NewButtons.openCamera, from: self)
        newView.addButtonAction(#selector(performSubmit), for: NewButtons.book, from: self)
    }
    
    // MARK: - Actions
    @objc private func performSubmit() {
        let nameBook = newView.getNameBook()
        let authorBook = newView.getAuthorBook()
        let yearBook = newView.getYearBook()
        let topicBook = newView.getTopicBook()
        let descriptionBook = newView.getDescriptionBook()
        //let imageBook =
        
        self.bookRequest = BookRequest(
            title: nameBook,
            author: authorBook,
            genre: descriptionBook,
            year: yearBook,
            image: "",
            status: "Available"
        )
        
        SVProgressHUD.show()
        
        viewModel.addBook(book: bookRequest!, onSuccess: setBook(_:), onError: errorBook(_:))
    }
    func setBook(_ bookRequest: BookRequest) {
        SVProgressHUD.dismiss()
        print("llego aca!")
    }
    
    func errorBook(_ message: String) {
        SVProgressHUD.dismiss()
        NotificationBanner(title: "Error",
                           subtitle: message,
                           style: .warning).show()
    }
    
}
extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard info.keys.contains(.originalImage),
              let image = info[.originalImage] as? UIImage else {
            return
        }
        print("setimage", image)
        newView.setImage(image)
    }
}
