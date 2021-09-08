//
//  Rent.swift
//  WBooks
//
//  Created by noelia.nieres on 07/09/2021.
//

import Foundation

public struct Rent: Codable {
    let id: Int
    let user_id: Int
    let book_id: Int
    let from: String
    let to: String
}

enum RentKey: String, CodingKey {
    case id = "id"
    case user_id = "user_id"
    case book_id = "book_id"
    case from
    case to
}
