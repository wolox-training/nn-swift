//
//  Comment.swift
//  WBooks
//
//  Created by noelia.nieres on 27/08/2021.
//

import Foundation

public struct Comment: Codable {
    var id: Int?
    var content: String?
    var book: Int?
    var user: Int?
}

enum CommentKey: String, CodingKey {
    case id = "id"
    case content = "content"
    case book
    case user
}




