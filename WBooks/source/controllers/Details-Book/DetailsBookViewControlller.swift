//
//  DetailsBookViewControlller.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import UIKit

class DetailsBookViewControlller: WBooksViewController {
    
    var imageName: String!
    var titleB: String!
    private let detailsBookView = DetailsBookView()
    
    let titles = ["A Little Bird Told Me", "When the Doves Disappeared", "The Best Book in the World", "Be Creative", "Redesign the Web" ]
    
    let subTitles = ["Timothy Cross", "Sofi Oksanen", "Peter Sjernstrom", "Tony Alcazar","Liliana Castilla"]
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view = detailsBookView
    }
}

