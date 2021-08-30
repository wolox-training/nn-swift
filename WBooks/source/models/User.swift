//
//  User.swift
//  WBooks
//
//  Created by noelia.nieres on 29/08/2021.
//

import Foundation

struct User {
    var id: Int?
    var username: String?
    var password: String?
    var image: String?
}

enum UserKey: String, CodingKey {
    case id = "id"
    case username = "username"
    case password = "password"
    case image
}
