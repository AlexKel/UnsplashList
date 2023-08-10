//
//  StringError.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
