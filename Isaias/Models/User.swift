//
//  User.swift
//  Isaias
//
//  Created by Luis Martinez on 02/08/2025.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var email: String
}
