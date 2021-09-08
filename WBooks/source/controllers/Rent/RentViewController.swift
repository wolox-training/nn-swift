//
//  RentViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 08/09/2021.
//
import UIKit

class RentViewController: ScrollStackViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func addChildrenViewControllers(){
        add(RentedBooksViewController())
        add(BookSuggestionsViewController())
    }
}
