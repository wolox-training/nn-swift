//
//  WBooksViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 11/08/2021.
//

import UIKit

class WBooksViewController: UIViewController {

    var imageView: UIImageView = {
          let imageView = UIImageView(frame: .zero)
          imageView.image = UIImage(named: "bc_nav bar")
          imageView.contentMode = .scaleToFill
          imageView.translatesAutoresizingMaskIntoConstraints = false
          return imageView
      }()

      override func viewDidLoad() {
          super.viewDidLoad()

          view.insertSubview(imageView, at: 0)
          NSLayoutConstraint.activate([
              imageView.topAnchor.constraint(equalTo: view.topAnchor),
              imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
          ])
      }
}
