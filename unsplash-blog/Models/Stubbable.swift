//
//  Stubbable.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

protocol Stubbable {
    static var stub: Self { get }
}
