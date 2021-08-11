//
//  BookModel.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import Foundation

class BookModel {
    // MARK: - Properties
    
    var title: String?
    var author: String?
    var editorial: String?
    var year: String?
    var comments: String?
    
    // MARK: - Init
    init() {}
    
    init?(title: String, author: String, editorial: String, year: String, comments: String) {
        // Initialize stored properties
        self.title = title
        self.author = author
        self.editorial = editorial
        self.year = year
        self.comments = comments
    }
    
    
}
