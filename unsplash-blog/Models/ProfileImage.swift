//
//  ProfileImage.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

struct ProfileImage: Codable {
    var small: String
    var medium: String
    var large: String
}

extension ProfileImage: Stubbable {
    static var stub: Self {
        ProfileImage(
            small: "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3\\u0026crop=faces\\u0026fit=crop\\u0026w=32\\u0026h=32",
            medium: "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3\\u0026crop=faces\\u0026fit=crop\\u0026w=64\\u0026h=64",
            large: "https://images.unsplash.com/profile-1679489218992-ebe823c797dfimage?ixlib=rb-4.0.3\\u0026crop=faces\\u0026fit=crop\\u0026w=128\\u0026h=128"
        )
    }
}
