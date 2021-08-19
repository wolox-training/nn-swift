//
//  DetailsBookViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import UIKit

class DetailsBookViewController: WBooksViewController {
    
    private let detailsBookView = DetailsBookView()
    private let image: String
    private let titleBook: String
        
    init(_ image: String, titleBook: String) {
        self.image = image
        self.titleBook = titleBook
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func loadView() {
        super.loadView()
        view = detailsBookView
    }
    func setupView(){
        detailsBookView.titleBook.text = titleBook
        detailsBookView.detailImage.image = UIImage(named: image)
    }
}

