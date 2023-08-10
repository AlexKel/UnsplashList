//
//  UnsplashJSONDecoder.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

class UnsplashJSONDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
        dateDecodingStrategy = .iso8601
    }
}
