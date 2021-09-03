//
//  NewBookViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 30/08/2021.
//

import UIKit

class NewBookViewController: UIViewController {

    // MARK: - Private properties
    private let viewModel: NewBookViewModelProtocol
    private let newView: NewBookViewProtocol
   
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
    }
    
    override func loadView() {
        super.loadView()
        view = newView
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
        
        //viewModel.setImage(image)
    }
}
