//
//  BookSuggestionCell.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//
import UIKit

class BookSuggestionCell: UICollectionViewCell {

    @IBOutlet weak var imageBook: UIImageView!
    @IBOutlet weak var viewBackground: UIView!{
        didSet {
            viewBackground.backgroundColor = .backgroundPolar()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
