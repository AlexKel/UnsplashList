//
//  PhotoURLs.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

struct PhotoURLs: Codable {
    var raw: String
    var full: String
    var regular: String
    var small: String
    var thumb: String
}

extension PhotoURLs: Stubbable {
    static var stub: PhotoURLs {
        PhotoURLs(
            raw: "https://images.unsplash.com/photo-1683009427513-28e163402d16?ixid=M3wzNzYyMzV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY5MTYwMjUyNXw\\u0026ixlib=rb-4.0.3",
            full: "https://images.unsplash.com/photo-1683009427513-28e163402d16?crop=entropy\\u0026cs=srgb\\u0026fm=jpg\\u0026ixid=M3wzNzYyMzV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY5MTYwMjUyNXw\\u0026ixlib=rb-4.0.3\\u0026q=85",
            regular: "https://images.unsplash.com/photo-1683009427513-28e163402d16?crop=entropy\\u0026cs=tinysrgb\\u0026fit=max\\u0026fm=jpg\\u0026ixid=M3wzNzYyMzV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY5MTYwMjUyNXw\\u0026ixlib=rb-4.0.3\\u0026q=80\\u0026w=1080",
            small: "https://images.unsplash.com/photo-1683009427513-28e163402d16?crop=entropy\\u0026cs=tinysrgb\\u0026fit=max\\u0026fm=jpg\\u0026ixid=M3wzNzYyMzV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY5MTYwMjUyNXw\\u0026ixlib=rb-4.0.3\\u0026q=80\\u0026w=400",
            thumb: "https://images.unsplash.com/photo-1683009427513-28e163402d16?crop=entropy\\u0026cs=tinysrgb\\u0026fit=max\\u0026fm=jpg\\u0026ixid=M3wzNzYyMzV8MXwxfGFsbHwxfHx8fHx8Mnx8MTY5MTYwMjUyNXw\\u0026ixlib=rb-4.0.3\\u0026q=80\\u0026w=200"
        )
    }
}
