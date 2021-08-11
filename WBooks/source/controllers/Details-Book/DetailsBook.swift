//
//  DetailsBook.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import UIKit

class DetailsBook: WBooksViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var available: UILabel!
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var editorial: UILabel!
    var imageName: String!
    var titleB: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.image = UIImage(named: self.imageName)
        self.titleBook.text = self.titleB
        self.title = "BOOK DETAIL"
    }
    
    func commonInit(_ imageName: String, titleBook: String) {
        self.imageName = imageName
        self.titleB = titleBook
    }


}
