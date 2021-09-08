//
//  BookSuggestionsView.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//

import Foundation
import UIKit

protocol BookSuggestionsViewProtocol: UIView {
    var collectionBooks: UICollectionView { get }
}

class BookSuggestionsView: NibView{
    @IBOutlet weak var collectionBook: UICollectionView!
    
    @IBOutlet weak var backgroundView: UIView!{
        didSet {
            backgroundView.backgroundColor = .backgroundPolar()
        }
    }
    
}

extension BookSuggestionsView: BookSuggestionsViewProtocol {
    var collectionBooks: UICollectionView { collectionBook }
    
}
