//
//  DataDecoder.swift
//  unsplash-blog
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import Foundation

/// General data decoder protocol
protocol DataDecoder {
    associatedtype Result
    func decode(from data: Data) throws -> Result
}
