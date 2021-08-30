//
//  DetailsViewController.swift
//  WBooks
//
//  Created by noelia.nieres on 18/08/2021.
//

import UIKit

class DetailsViewController: ScrollStackViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addChildrenViewControllers(){
        add(DetailsBookViewController())
        add(CommentsViewController())
    }
}
