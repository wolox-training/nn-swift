//
//  Wish.swift
//  WBooks
//
//  Created by noelia.nieres on 10/09/2021.
//
import Foundation

public struct Wish: Codable {
    let id: Int
    let user_id: Int
    let book_id: Int
}

enum WishKey: String, CodingKey {
    case id = "id"
    case user_id = "user_id"
    case book_id = "book_id"
}

