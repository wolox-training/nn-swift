//
//  Suggestion.swift
//  WBooks
//
//  Created by noelia.nieres on 08/09/2021.
//
import Foundation

public struct Suggestion: Codable {
    let id: Int
    let user_id: Int
    let link: String
    let title: String
    let author: String
}

enum SuggestionKey: String, CodingKey {
    case id = "id"
    case user_id = "user_id"
    case link = "link"
    case title = "title"
    case author = "author"
}
