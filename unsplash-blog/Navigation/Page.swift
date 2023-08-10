//
//  Page.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

enum Page: Identifiable, Hashable {
    case home, photoDetail(photo: Photo)
    var id: String { rawValue }
}

extension Page: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: String) {
        return nil
    }
    
    var rawValue: String {
        switch self {
        case .home: return "home"
        case .photoDetail: return "details"
        }
    }
}
