//
//  BookModel.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import Foundation

/*class Book{
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
    
    
}*/

public struct Book: Codable {
    let id: Int
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
}

enum BookKey: String, CodingKey {
    case id = "id"
    case title = "title"
    case author = "author"
    case genre = "genre"
    case year = "year"
    case image = "image"
}

