//
//  User.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var profileImage: ProfileImage
}

extension User: Stubbable {
    static var stub: User {
        User(id: "TestUser", name: "Test Testerson", profileImage: ProfileImage.stub)
    }
}
