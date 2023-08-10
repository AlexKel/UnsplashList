//
//  APIIntegrationTests.swift
//  unsplash-blogTests
//
//  Created by Aleksandr Kelbas on 10/08/2023.
//

import XCTest
@testable import unsplash_blog

final class APIIntegrationTests: XCTestCase {
    
    let TestAccessKey = "5-vEGT0LaLHeKZhed1Hi-ZHq3S_fm3id318lKcDVyLE"
    
    func testPhotosAPIResponse() async throws {
        let client = URLSession.shared
        let decoder = JSONPhotoDecoder()
        let endpoint = Endpoint.photos(clientID: TestAccessKey)
        let photos = try await client.loadData(from: endpoint, decoder: decoder)
        XCTAssertEqual(photos.count, 10)
    }
}
