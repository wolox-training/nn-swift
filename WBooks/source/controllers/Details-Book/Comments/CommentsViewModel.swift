//
//  CommentsViewModel.swift
//  WBooks
//
//  Created by noelia.nieres on 19/08/2021.
//

import UIKit

class CommentsViewModel: ScrollStackViewController {

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

}
