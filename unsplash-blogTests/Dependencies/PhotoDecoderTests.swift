//
//  PhotoDecoderTests.swift
//  unsplash-blogTests
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import XCTest
@testable import unsplash_blog

final class PhotoDecoderTests: XCTestCase {
    func testPhotoDataDecoding() throws {
        let data = Helper.loadFile(named: "sample_photos")
        
        let photos = try  JSONPhotoDecoder().decode(from: data)
        XCTAssertEqual(photos.count, 3)
        
        for i in 0..<3 {
            XCTAssertEqual(photos[i].id, "\(i)")
            // TODO: Add test for other props
        }
    }
}
