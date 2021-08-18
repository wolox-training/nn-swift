//
//  DetailsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import UIKit

class DetailsViewController: ScrollStackViewController {
    
    private let image: String
    private let titleBook: String
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ image: String, titleBook: String) {
        self.image = image
        self.titleBook = titleBook
        super.init(nibName: nil, bundle: nil)
    }
    
    override func addChildrenViewControllers(){
        add(DetailsBookViewControlller())
        //add(CommentsViewController())
    }
}
