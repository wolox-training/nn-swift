//
//  BookModel.swift
//  WBooks
//
//  Created by noelia.nieres on 10/08/2021.
//

import Foundation

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


struct BookViewModel {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var bookId: String {
        return String(book.id)
    }
    
    var bookTitle: String {
        return book.title
    }
    
    var bookAuthor: String {
        return book.author
    }
    
    var bookGenre: String {
        return book.genre
    }
    
    var bookYear: String {
        return book.year
    }
    
    var bookImage: String {
        return book.image
    }
    
    var wished: Bool = false
    var rented: Bool = false
    
}

