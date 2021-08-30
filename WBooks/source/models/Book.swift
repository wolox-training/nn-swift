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



