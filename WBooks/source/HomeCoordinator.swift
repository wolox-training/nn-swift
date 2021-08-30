//
//  HomeCoordinator.swift
//  WBooks
//
//  Created by noelia.nieres on 20/08/2021.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

final class HomeCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = HomeViewController()
        vc.coordinator = self
        vc.title = "Discover"
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.viewControllers = [vc]
    }
    
    func details() {
        let vc = DetailsViewController()
        vc.coordinator = self
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
    
    /*func newPost() {
        let vc = NewPostViewController()
        vc.coordinator = self
        vc.modalPresentationStyle = .automatic
        navigationController.present(vc, animated: true)
    }
    
    func finishPost(_ post: Post? = nil) {
        guard let post = post,
              let vc = navigationController.viewControllers.first as? HomeViewController else {
            navigationController.dismiss(animated: true)
            return
        }
        
        vc.updateDataWith(post)
        navigationController.dismiss(animated: true)
    }
    
    func openCamera(from vc: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.cameraFlashMode = .off
        imagePicker.cameraCaptureMode = .photo
        imagePicker.allowsEditing = true
        imagePicker.delegate = vc
        
        navigationController.present(imagePicker, animated: true, completion: nil)
    }*/
}

