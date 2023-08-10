//
//  PhotoDecoder.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

/// Photo list decoder
protocol PhotoDecoder: DataDecoder where Result == [Photo] {}

/// Photo list decoder for JSON API
struct JSONPhotoDecoder: PhotoDecoder {
    func decode(from data: Data) throws -> Array<Photo> {
        let result = try JSONDecoder().decode([Photo].self, from: data)
        return result
    }
}
