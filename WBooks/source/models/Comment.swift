//
//  Comment.swift
//  WBooks
//
//  Created by noelia.nieres on 27/08/2021.
//

import Foundation

public struct Comment: Codable {
    let id: Int
    let content: String
    let book_id: Int
    let user_id: Int
}

enum CommentKey: String, CodingKey {
    case id = "id"
    case content = "content"
    case book_id = "book_id"
    case user_id = "user_id"
}




