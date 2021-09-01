//
//  User.swift
//  WBooks
//
//  Created by noelia.nieres on 29/08/2021.
//

import Foundation

public struct User: Codable {
    let id: Int
    let username: String
    let password: String
    let image: String

}

enum UserKey: String, CodingKey {
    case id = "id"
    case username = "username"
    case password = "password"
    case image = "image"
}
