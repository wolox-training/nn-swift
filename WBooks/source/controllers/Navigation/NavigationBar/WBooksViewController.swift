//
//  WBooksViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 11/08/2021.
//

import UIKit

class WBooksViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            setNavigationBar()
    }
    
    private func setNavigationBar() {
        guard let navigationController = navigationController else { return }
        let navBar = navigationController.navigationBar
        guard let image = UIImage(named: "bc_nav_bar") else { return }
        navBar.tintColor = .white
        navBar.barTintColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        navBar.shadowImage = UIImage()
        navBar.setBackgroundImage(image, for: .default)
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setBackgroundImageSize(image)
    }
    
    private func setBackgroundImageSize(_ image: UIImage) {
        navigationController!.navigationBar.isTranslucent = true
        navigationController!.navigationBar.barStyle = .default
        let logoImageView = UIImageView(image: image)
        view.insertSubview(logoImageView, belowSubview: navigationController!.navigationBar)
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.clipsToBounds = true
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let height: CGFloat = UIScreen.main.bounds.width * (image.size.height) / (image.size.width)
        NSLayoutConstraint.activate([
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: height)
        ])
    }
}
