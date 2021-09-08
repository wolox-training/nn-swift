//
//  BookRequest.swift
//  WBooks
//
//  Created by noelia.nieres on 05/09/2021.
//
import Foundation

public struct BookRequest: Codable {
    let title: String
    let author: String
    let genre: String
    let year: String
    let image: String
    let status: String
}

enum BookRequestKey: String, CodingKey {
    case title = "title"
    case author = "author"
    case genre = "genre"
    case year = "year"
    case image = "image"
    case status = "status"
}
