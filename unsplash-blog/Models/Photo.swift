//
//  Photo.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: String
    var createdAt: Date
    var updatedAt: Date
    var likes: Int
    var likedByUser: Bool
    var description: String?
    var user: User
    var urls: PhotoURLs
}
